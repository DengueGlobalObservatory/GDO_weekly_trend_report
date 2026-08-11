# Per-iso3 "current status" extraction from a verbatim nowcast_raw.csv.
# Rule (planning/GDO_internal_news_report_plan.md, "Repo structure to build"):
#   from nowcast_raw.csv, take the row with the max `date` where
#   `Data_status != "Unobserved"`, per iso3.

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
})

# Depends on ratio_descriptor() from lib_severity_text.R — the orchestrator
# (run_weekly_pipeline.R) sources that file before this one.

#' @param raw_csv_path path to a verbatim copy of DENV_cases_nowcast_output.csv
#' @return one row per iso3: current status + descriptor text inputs
extract_latest_status <- function(raw_csv_path) {
  raw <- readr::read_csv(raw_csv_path, show_col_types = FALSE)

  required_cols <- c(
    "iso3", "country", "Region", "date", "Data_status", "cases",
    "Ave_season_monthly_cases", "severity", "severity_interpretation",
    "percentile_cumulative", "current_season_severity",
    "current_season_percentile", "current_season_interpretation",
    "Predicted_total_seasonal_cases"
  )
  missing_cols <- setdiff(required_cols, names(raw))
  if (length(missing_cols) > 0) {
    stop("extract_latest_status(): nowcast_raw.csv is missing expected column(s): ",
         paste(missing_cols, collapse = ", "),
         " — upstream CSV schema may have changed.")
  }

  latest <- raw %>%
    dplyr::filter(.data$Data_status != "Unobserved", !is.na(.data$date)) %>%
    dplyr::group_by(.data$iso3) %>%
    dplyr::filter(.data$date == max(.data$date)) %>%
    dplyr::slice(1) %>%  # tie-break: keep one row per iso3 if duplicates exist
    dplyr::ungroup() %>%
    dplyr::transmute(
      iso3 = .data$iso3,
      country = .data$country,
      region = .data$Region,
      latest_observed_date = .data$date,
      data_status = .data$Data_status,
      cases = .data$cases,
      ave_season_monthly_cases = .data$Ave_season_monthly_cases,
      monthly_ratio = dplyr::if_else(
        .data$Ave_season_monthly_cases > 0,
        .data$cases / .data$Ave_season_monthly_cases,
        NA_real_
      ),
      severity = .data$severity,
      severity_interpretation = .data$severity_interpretation,
      percentile_cumulative = .data$percentile_cumulative,
      current_season_severity = .data$current_season_severity,
      current_season_percentile = .data$current_season_percentile,
      current_season_interpretation = .data$current_season_interpretation,
      predicted_total_seasonal_cases = .data$Predicted_total_seasonal_cases
    ) %>%
    dplyr::mutate(
      monthly_ratio_descriptor = ratio_descriptor(.data$monthly_ratio)
    ) %>%
    dplyr::arrange(.data$iso3)

  latest
}
