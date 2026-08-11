# Ported from the live site's ratio_phrase() (phrasing) / monthly_phrase()
# (thresholds), which match GDO_context.md §3:
#   DENV_global_observatory/Scripts/V1_Dashboard_setup.R:212-232
#   DENV_global_observatory/pages/country/_country-template.qmd:122-129
# The two source functions disagree by a hair at the exact boundary values
# 0.70 and 0.90 (>= vs <= ordering) — a difference that can't matter for real
# case-count ratios. This port follows ratio_phrase()'s case_when order
# exactly, since that's the function GDO_context.md §3 cites as matching its
# published table.
# season_phrase() (1.20/0.85) and relative_level_phrase() (1.40/1.10/0.90/0.70)
# are different site badges and are deliberately NOT ported here.

ratio_descriptor <- function(ratio) {
  vapply(ratio, function(r) {
    if (is.na(r)) return("tracking close to")
    if (r >= 1.30) return("running well above")
    if (r >= 1.10) return("running slightly above")
    if (r <= 0.70) return("running well below")
    if (r <= 0.90) return("running slightly below")
    "tracking near"
  }, character(1))
}
