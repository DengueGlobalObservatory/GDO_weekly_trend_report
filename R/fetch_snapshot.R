# Fetch step — runs only on data-pull days. See planning/GDO_internal_news_report_plan.md
# ("Fetch step") in the sibling DENV_dashboard project for the full rationale.
#
# The public site (globaldengueobservatory.org) only re-renders on the 4th
# and 18th of each month, but DENV_global_observatory/Output/ is committed
# to daily. "Take the newest Output/ folder" would routinely pull data that
# is AHEAD of what's actually live on the public site — wrong for a report
# whose numbers a reader may click through to verify against the site. So
# this script targets the specific Output/ folder dated to the most
# recently completed render, never anything newer.

suppressPackageStartupMessages({
  library(httr)
  library(jsonlite)
})

GDO_REPO <- "DengueGlobalObservatory/DENV_global_observatory"
GDO_BRANCH <- "main"

gh_headers <- function() {
  token <- Sys.getenv("GITHUB_TOKEN", unset = "")
  h <- c("User-Agent" = "GDO-internal-news-report")
  if (nzchar(token)) h <- c(h, "Authorization" = paste("token", token))
  httr::add_headers(.headers = h)
}

#' Most recent of {this month's 4th, this month's 18th, last month's 18th}
#' strictly before `today` — the data vintage currently live on the site.
compute_target_render_date <- function(today = Sys.Date()) {
  this_month_4th  <- as.Date(sprintf("%s-04", format(today, "%Y-%m")))
  this_month_18th <- as.Date(sprintf("%s-18", format(today, "%Y-%m")))
  last_month_date <- seq(today, length.out = 2, by = "-1 month")[2]
  last_month_18th <- as.Date(sprintf("%s-18", format(last_month_date, "%Y-%m")))

  candidates <- c(this_month_4th, this_month_18th, last_month_18th)
  candidates <- candidates[candidates < today]
  if (length(candidates) == 0) {
    stop("compute_target_render_date(): no candidate render date is strictly before today (",
         today, ") — check the system clock.")
  }
  max(candidates)
}

#' List Output/ subfolder dates from the GitHub Contents API.
#' Filters to `^\d{4}_\d{2}_\d{2}$` (drops non-date entries like RF/validation).
list_output_folder_dates <- function(repo = GDO_REPO) {
  url <- sprintf("https://api.github.com/repos/%s/contents/Output", repo)
  resp <- httr::GET(url, gh_headers())
  if (httr::status_code(resp) != 200) {
    stop("list_output_folder_dates(): GitHub Contents API returned ",
         httr::status_code(resp), " for ", url)
  }
  listing <- jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"))
  names <- listing$name[listing$type == "dir"]
  date_names <- names[grepl("^\\d{4}_\\d{2}_\\d{2}$", names)]
  if (length(date_names) == 0) {
    stop("list_output_folder_dates(): no date-formatted folders found under Output/ — ",
         "listing may have changed shape or the repo is unreachable.")
  }
  as.Date(date_names, format = "%Y_%m_%d")
}

#' Resolve which Output/ folder to use: exact match to target_render_date,
#' or the nearest EARLIER available date. Never falls forward.
resolve_snapshot_folder <- function(available_dates, target_render_date) {
  if (target_render_date %in% available_dates) {
    return(list(
      resolved_date = target_render_date,
      fallback_used = FALSE,
      fallback_reason = NA_character_
    ))
  }
  earlier <- available_dates[available_dates < target_render_date]
  if (length(earlier) == 0) {
    stop("resolve_snapshot_folder(): no Output/ folder on or before target_render_date (",
         target_render_date, ") exists — cannot resolve a snapshot without falling forward.")
  }
  resolved <- max(earlier)
  list(
    resolved_date = resolved,
    fallback_used = TRUE,
    fallback_reason = sprintf(
      "Output/%s missing (pipeline or render failure that day) — fell back to nearest earlier folder Output/%s",
      format(target_render_date, "%Y_%m_%d"), format(resolved, "%Y_%m_%d")
    )
  )
}

#' Most recent commit SHA touching Output/<folder>/ — the provenance record
#' for manifest.json.
get_path_commit_sha <- function(folder_name, repo = GDO_REPO, branch = GDO_BRANCH) {
  url <- sprintf("https://api.github.com/repos/%s/commits", repo)
  resp <- httr::GET(url, gh_headers(), query = list(
    path = sprintf("Output/%s", folder_name),
    sha = branch,
    per_page = 1
  ))
  if (httr::status_code(resp) != 200) {
    warning("get_path_commit_sha(): API returned ", httr::status_code(resp),
            " — manifest will record commit_sha as NA")
    return(NA_character_)
  }
  commits <- jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"))
  if (length(commits) == 0 || is.null(commits$sha) || length(commits$sha) == 0) {
    return(NA_character_)
  }
  commits$sha[[1]]
}

#' Download the nowcast CSV verbatim from raw.githubusercontent.com.
download_raw_csv <- function(folder_name, dest_path, repo = GDO_REPO, branch = GDO_BRANCH) {
  url <- sprintf(
    "https://raw.githubusercontent.com/%s/%s/Output/%s/DENV_cases_nowcast_output.csv",
    repo, branch, folder_name
  )
  resp <- httr::GET(url, gh_headers(), httr::write_disk(dest_path, overwrite = TRUE))
  if (httr::status_code(resp) != 200) {
    stop("download_raw_csv(): failed to download ", url, " (status ", httr::status_code(resp), ")")
  }
  invisible(dest_path)
}

#' Full fetch step. Returns the manifest list (also written to manifest.json
#' by the caller, once n_countries/prior_snapshot_folder are known).
fetch_snapshot <- function(today, snapshot_dir) {
  target_render_date <- compute_target_render_date(today)
  available_dates <- list_output_folder_dates()
  resolution <- resolve_snapshot_folder(available_dates, target_render_date)
  resolved_date <- resolution$resolved_date

  if (resolved_date > today + 7) {
    stop("fetch_snapshot(): resolved folder date (", resolved_date,
         ") is more than 7 days in the future relative to today (", today, ") — refusing to proceed.")
  }

  folder_name <- format(resolved_date, "%Y_%m_%d")
  dir.create(snapshot_dir, recursive = TRUE, showWarnings = FALSE)
  raw_csv_path <- file.path(snapshot_dir, "nowcast_raw.csv")
  download_raw_csv(folder_name, raw_csv_path)
  commit_sha <- get_path_commit_sha(folder_name)

  list(
    source_output_folder = folder_name,
    target_render_date = format(target_render_date, "%Y-%m-%d"),
    source_commit_sha = commit_sha,
    fetched_at = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
    fallback_used = resolution$fallback_used,
    fallback_reason = resolution$fallback_reason,
    raw_csv_path = raw_csv_path
  )
}
