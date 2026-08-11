# Orchestrator: pull-day check -> (fetch + extract + diff) | reuse latest snapshot.
# Run from the repo root: `Rscript R/run_weekly_pipeline.R`
# Local dry run: `Rscript R/run_weekly_pipeline.R --simulate-date=YYYY-MM-DD`
#
# See planning/GDO_internal_news_report_plan.md ("Non-pull weeks — what
# happens instead") in the sibling DENV_dashboard project for the full rule.

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(jsonlite)
})

source(file.path("R", "lib_severity_text.R"))
source(file.path("R", "fetch_snapshot.R"))
source(file.path("R", "extract_latest_status.R"))
source(file.path("R", "diff_snapshot.R"))

#' Existing snapshot folder names (YYYY_MM_DD), most recent last.
list_existing_snapshots <- function(snapshots_root = "snapshots") {
  if (!dir.exists(snapshots_root)) return(character(0))
  entries <- list.dirs(snapshots_root, recursive = FALSE, full.names = FALSE)
  dated <- entries[grepl("^\\d{4}_\\d{2}_\\d{2}$", entries)]
  dated[order(as.Date(dated, format = "%Y_%m_%d"))]
}

environment_probe <- function() {
  list(
    r_version = R.version.string,
    platform = R.version$platform,
    probed_at = format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  )
}

#' @param today Date to treat as "today" — overridable for local dry runs.
#' @return list(pull_week = logical, active_snapshot_dir = character,
#'   target_render_date = Date)
run_weekly_pipeline <- function(today = Sys.Date(), snapshots_root = "snapshots") {
  target_render_date <- compute_target_render_date(today)
  existing <- list_existing_snapshots(snapshots_root)

  first_pull_ever <- length(existing) == 0
  prior_folder <- if (first_pull_ever) NA_character_ else utils::tail(existing, 1)

  prior_manifest <- NULL
  if (!first_pull_ever) {
    manifest_path <- file.path(snapshots_root, prior_folder, "manifest.json")
    if (file.exists(manifest_path)) {
      prior_manifest <- jsonlite::fromJSON(manifest_path)
    }
  }

  # Pull week if: first pull ever, OR the target render date has advanced
  # since the last pull's recorded target render date.
  pull_week <- first_pull_ever ||
    is.null(prior_manifest) ||
    !identical(prior_manifest$target_render_date, format(target_render_date, "%Y-%m-%d"))

  if (!pull_week) {
    message(sprintf(
      "News-only week: target_render_date (%s) unchanged since last pull (snapshots/%s). Reusing that snapshot.",
      format(target_render_date, "%Y-%m-%d"), prior_folder
    ))
    return(list(
      pull_week = FALSE,
      active_snapshot_dir = file.path(snapshots_root, prior_folder),
      target_render_date = target_render_date
    ))
  }

  message(sprintf("Pull week: target_render_date = %s. Fetching...", format(target_render_date, "%Y-%m-%d")))

  today_folder <- format(today, "%Y_%m_%d")
  snapshot_dir <- file.path(snapshots_root, today_folder)

  fetch_result <- fetch_snapshot(today, snapshot_dir)

  current_status <- extract_latest_status(fetch_result$raw_csv_path)
  readr::write_csv(current_status, file.path(snapshot_dir, "latest_status.csv"))

  prior_status <- NULL
  if (!first_pull_ever) {
    prior_status_path <- file.path(snapshots_root, prior_folder, "latest_status.csv")
    if (file.exists(prior_status_path)) {
      prior_status <- readr::read_csv(prior_status_path, show_col_types = FALSE)
    }
  }
  movers <- diff_snapshot(current_status, prior_status)
  readr::write_csv(movers, file.path(snapshot_dir, "movers.csv"))

  manifest <- list(
    source_output_folder = fetch_result$source_output_folder,
    target_render_date = fetch_result$target_render_date,
    source_commit_sha = fetch_result$source_commit_sha,
    fetched_at = fetch_result$fetched_at,
    prior_snapshot_folder = prior_folder,
    n_countries = nrow(current_status),
    fallback_used = fetch_result$fallback_used,
    fallback_reason = fetch_result$fallback_reason,
    environment_probe = environment_probe()
  )
  jsonlite::write_json(manifest, file.path(snapshot_dir, "manifest.json"),
                        auto_unbox = TRUE, pretty = TRUE, na = "null")

  message(sprintf(
    "Snapshot written to %s (%d countries, %d mover rows, fallback_used=%s)",
    snapshot_dir, nrow(current_status), nrow(movers), fetch_result$fallback_used
  ))

  list(
    pull_week = TRUE,
    active_snapshot_dir = snapshot_dir,
    target_render_date = target_render_date
  )
}

if (!interactive() && length(grep("--file=", commandArgs(trailingOnly = FALSE))) > 0) {
  args <- commandArgs(trailingOnly = TRUE)
  sim_arg <- args[startsWith(args, "--simulate-date=")]
  today <- if (length(sim_arg) > 0) as.Date(sub("--simulate-date=", "", sim_arg[1])) else Sys.Date()

  result <- run_weekly_pipeline(today)
  cat(sprintf("ACTIVE_SNAPSHOT_DIR=%s\nPULL_WEEK=%s\n", result$active_snapshot_dir, result$pull_week))
}
