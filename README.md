# GDO Internal News Report

Weekly internal briefing for the Global Dengue Observatory's social-media
workflow. Runs as an Anthropic Claude Code **scheduled cloud routine** every
Monday morning, connects the latest GDO trend picture to real-world dengue
news, and hands a researcher raw material for Tuesday's LinkedIn/Bluesky
posts. Not a public document.

## How it's triggered

Cron `0 8 * * 1` (Monday 08:00 UTC), via a Claude Code routine with a fresh
checkout of this repo each run and no memory of previous runs. The task
prompt is `AGENT_PROMPT.md` — read that for the full step-by-step. Language
and tone rules live in `CONVENTIONS.md`.

## Architecture

- **Data snapshot** (`R/`, `snapshots/`) — the report's numbers are never
  computed by the agent. A deterministic R pipeline fetches the GDO's
  nowcast CSV from the public `DENV_global_observatory` repo, extracts one
  row per country, and diffs it against the previous pull. The snapshot only
  advances when the public site itself has re-rendered (twice a month, the
  4th and 18th) — see `R/fetch_snapshot.R` for why "newest available data"
  is the wrong rule here. Most Mondays are **news-only weeks**: no new
  snapshot, the existing one is reused, and only the news/literature search
  runs fresh.
- **Report** (`reports/`) — one Markdown file per week, always written,
  always committed, regardless of whether it was a pull week.
- **`CONVENTIONS.md`** — self-contained language/tone rules, duplicated from
  the wider GDO project context because this routine can't read that
  project's files live (see the file for why).

## Repo layout

```
CONVENTIONS.md       language/tone rules (read first, every run)
AGENT_PROMPT.md       the routine's task prompt
R/
  lib_severity_text.R  ratio_descriptor() — ported from the live site
  fetch_snapshot.R      GitHub Contents API fetch (pull weeks only)
  extract_latest_status.R
  diff_snapshot.R        movers.csv, categories A/B/C
  run_weekly_pipeline.R  orchestrator
snapshots/YYYY_MM_DD/   created only on a data-pull day
reports/YYYY_MM_DD_gdo_internal_news_report.md   created every week
```

## Local development

```r
# simulate a pull week
Rscript R/run_weekly_pipeline.R --simulate-date=2026-08-19

# simulate a news-only week (no render since the last snapshot)
Rscript R/run_weekly_pipeline.R --simulate-date=2026-08-12
```

Requires R with `httr`/`curl`, `jsonlite`, `dplyr`, `readr`, `stringr`,
`lubridate`. No `renv.lock` yet — pin dependencies if the routine's cloud
sandbox turns out to need it (see Step 0 of `AGENT_PROMPT.md`, an
environment probe that runs every routine execution).

## Known drift risk

`CONVENTIONS.md` is a manually-maintained excerpt of
`/Users/lshks26/Dropbox/DMMG/DENV_dashboard/GDO_context.md` §3 and §11
(plus this repo's own house-tone note). Nothing keeps them in sync
automatically — if the live site's severity thresholds or language rules
change, update both files by hand.

## Design plan

Full build rationale and open questions:
`/Users/lshks26/Dropbox/DMMG/DENV_dashboard/planning/GDO_internal_news_report_plan.md`
