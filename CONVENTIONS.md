# Conventions — GDO Internal News Report

Self-contained excerpt for a routine that cannot read `GDO_context.md` live
(that file lives in a sibling repo with no remote). This file is the
authority for language and tone in this report. If it ever drifts from
`GDO_context.md`, that file wins — but nobody currently syncs them
automatically, so treat drift as a known risk (see README).

## Language rules

- **British English** throughout (harmonise, normalise, modelling, programme).
- **"Estimated"** for anything nowcast-derived; **"reported"/"observed"** for
  raw counts. This distinction is load-bearing for credibility — never blur it.
- Cite the site as: *"Source: Global Dengue Observatory (accessed YYYY-MM-DD)."*
- Never compute, estimate, or eyeball a case count, ratio, or percentile.
  Every numeric claim must be copied verbatim from `latest_status.csv` or
  `movers.csv`. If a number isn't in those files, don't state it.

## Severity ratio descriptor (monthly, and current-season)

Ratio = observed (or estimated) cases ÷ seasonally expected cases for the
same period. This is the **only** descriptor function this report ports —
`ratio_descriptor()` in `R/lib_severity_text.R`, taken from `monthly_phrase()`
in the main site's `pages/country/_country-template.qmd` and
`ratio_phrase()` in `Scripts/V1_Dashboard_setup.R`. Do not invent your own
wording or thresholds — these are hard-coded into the live site's text and
must match exactly.

| Ratio | Descriptor |
|---|---|
| ≥ 1.30 | running well above |
| 1.10 – < 1.30 | running slightly above |
| ≤ 0.70 | running well below |
| 0.70 – 0.90 | running slightly below |
| otherwise (~0.90 – 1.10) | tracking near |
| NA | tracking close to (the seasonal baseline) |

(Evaluated in this order — ≥1.30, then ≥1.10, then ≤0.70, then ≤0.90, else
"tracking near" — matching `ratio_descriptor()`'s exact `case_when` order in
`R/lib_severity_text.R`. The boundary values 0.70/0.90 themselves are a hair
different between the site's two "identical" phrase functions; this order
is the one GDO_context.md §3 cites as canonical.)

There are two other, visually similar badge functions on the live site
(`season_phrase()`, thresholds 1.20/0.85; `relative_level_phrase()`,
thresholds 1.40/1.10/0.90/0.70) — these are **different site badges**, not
used here. Don't conflate them with the table above.

## Severity band / percentile (already computed — quote, don't derive)

`latest_status.csv` carries `severity`, `severity_interpretation`,
`percentile_cumulative`, and the current-season equivalents
(`current_season_severity`, `current_season_percentile`,
`current_season_interpretation`), all computed upstream from a negative-
binomial percentile model in `Scripts/V1_Pipeline.R`. These are authoritative
strings — copy them verbatim, do not re-derive or rephrase the classification:

| Percentile | Severity |
|---|---|
| ≤ 5 | Extremely Low |
| ≤ 25 | Low |
| < 75 | Normal |
| < 95 | High |
| ≥ 95 | Extremely High |

## Uncertainty language

GDO's validated nowcast sweet spot is **1–2 month gap-fills**. Caveat any
number you highlight that comes from a longer gap or late-season estimate —
say plainly that it's less reliable. Also flag small-baseline/large-ratio
numbers as unstable (a tiny expected count makes the ratio swing wildly on
a handful of cases).

## House tone — science communication register

This report is read by a researcher on Monday afternoon who drafts social
posts from it (LinkedIn/Bluesky, published Tuesday). Write for that
audience, not for a manuscript:

- Focuses on interpretation and broadly understood language, not technical
  method detail.
- Deep enough to be informative, but not overwhelming.
- Conversational but precise.
- Not overly narrative, but with some element of story — dengue trends
  connected to real-world events (weather, travel, outbreaks, policy), not
  just numbers in isolation.
- Exception: Section 5 ("Trend since last update") is bullets/a small table
  only — no narrative prose there, regardless of the tone rule above.

## What this report is (and isn't)

Internal input to a human-reviewed social-media workflow — not a public
document. Don't soften findings, but flag uncertainty clearly. GDO itself is
monitoring/situational awareness, not outbreak declaration or individual
medical advice — keep that framing when connecting a trend to news.
