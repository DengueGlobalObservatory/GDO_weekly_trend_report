# Trend-since-last-pull diff. Three categories (planning/GDO_internal_news_report_plan.md,
# "Diff step"):
#   A — severity band crossed:  severity_interpretation differs from the prior pull
#   B — ratio descriptor crossed: monthly_ratio_descriptor differs from the prior pull
#   C — biggest movers: top 10 by abs(delta current_season_percentile), regardless
#       of whether a band was crossed
#
# Output is one row per (iso3, category) — a country can appear more than once
# if it qualifies for multiple categories. First pull ever: empty movers.csv
# (zero rows, correct columns), not an error.

suppressPackageStartupMessages({
  library(dplyr)
})

MOVERS_TOP_N <- 10

empty_movers <- function() {
  tibble::tibble(
    iso3 = character(0),
    country = character(0),
    region = character(0),
    category = character(0),
    field = character(0),
    prior_value = character(0),
    current_value = character(0),
    delta = numeric(0)
  )
}

#' @param current_status data frame from extract_latest_status(), this pull
#' @param prior_status data frame from the previous pull's latest_status.csv,
#'   or NULL/zero-row on the first pull ever
diff_snapshot <- function(current_status, prior_status) {
  if (is.null(prior_status) || nrow(prior_status) == 0) {
    return(empty_movers())
  }

  joined <- current_status %>%
    dplyr::inner_join(
      prior_status,
      by = "iso3",
      suffix = c("_current", "_prior")
    )

  if (nrow(joined) == 0) {
    return(empty_movers())
  }

  band_a <- joined %>%
    dplyr::filter(.data$severity_interpretation_current != .data$severity_interpretation_prior) %>%
    dplyr::transmute(
      iso3 = .data$iso3,
      country = .data$country_current,
      region = .data$region_current,
      category = "A",
      field = "severity_interpretation",
      prior_value = .data$severity_interpretation_prior,
      current_value = .data$severity_interpretation_current,
      delta = NA_real_
    )

  band_b <- joined %>%
    dplyr::filter(.data$monthly_ratio_descriptor_current != .data$monthly_ratio_descriptor_prior) %>%
    dplyr::transmute(
      iso3 = .data$iso3,
      country = .data$country_current,
      region = .data$region_current,
      category = "B",
      field = "monthly_ratio_descriptor",
      prior_value = .data$monthly_ratio_descriptor_prior,
      current_value = .data$monthly_ratio_descriptor_current,
      delta = NA_real_
    )

  movers_c <- joined %>%
    dplyr::mutate(
      delta_pct = .data$current_season_percentile_current - .data$current_season_percentile_prior
    ) %>%
    dplyr::filter(!is.na(.data$delta_pct)) %>%
    dplyr::arrange(dplyr::desc(abs(.data$delta_pct))) %>%
    dplyr::slice_head(n = MOVERS_TOP_N) %>%
    dplyr::transmute(
      iso3 = .data$iso3,
      country = .data$country_current,
      region = .data$region_current,
      category = "C",
      field = "current_season_percentile",
      prior_value = as.character(round(.data$current_season_percentile_prior, 1)),
      current_value = as.character(round(.data$current_season_percentile_current, 1)),
      delta = .data$delta_pct
    )

  dplyr::bind_rows(band_a, band_b, movers_c) %>%
    dplyr::arrange(.data$category, dplyr::desc(abs(.data$delta)), .data$iso3)
}
