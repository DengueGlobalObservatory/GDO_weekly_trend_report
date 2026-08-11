# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is for

`GDO_weekly_trend_report` (org: `DengueGlobalObservatory`, remote
`git@github.com:DengueGlobalObservatory/GDO_weekly_trend_report.git`) is a
satellite repo to the main **Global Dengue Observatory (GDO)** project. It
produces the **GDO Internal News Report** — a weekly, internal, human-
reviewed input to the GDO's semi-automated social-media pipeline (posts go
out Tuesday, drafted from Monday's report). It is not a public document, and
its output is not the same thing as the public site.

Read `/Users/lshks26/Dropbox/DMMG/DENV_dashboard/GDO_context.md` before doing
substantive work here — it documents the GDO's data sources, methods
vocabulary, headline figures, and conventions. This repo's own
`CONVENTIONS.md` is a self-contained excerpt of the parts that matter for
report-writing (severity descriptors, British English, "estimated" vs.
"reported", house tone) — read `CONVENTIONS.md` for day-to-day work; treat
`GDO_context.md` as the upstream source of truth if the two ever disagree.

## Architecture

Runs as an Anthropic **Claude Code scheduled cloud routine** (`AGENT_PROMPT.md`
is the task prompt), cron `0 8 * * 1` (Monday 08:00 UTC), fresh checkout, no
memory of previous runs, no local machine access. Delivery is via a
committed report file plus a GitHub Issue (no email step in the routine
itself).

Two moving parts:
1. **Deterministic R data pipeline** (`R/`) — fetches the GDO nowcast CSV
   from `DENV_global_observatory` (public repo, unauthenticated), but only
   on a genuine data-pull week: the underlying snapshot advances only when
   the public site itself has re-rendered (4th/18th of the month), not on
   every daily pipeline commit. See `R/fetch_snapshot.R` for the exact
   `target_render_date` rule — this is the part most likely to be gotten
   wrong by intuition ("just take the newest folder" is wrong). Output:
   `snapshots/YYYY_MM_DD/{nowcast_raw.csv, latest_status.csv, movers.csv,
   manifest.json}`.
2. **Agentic report-writing step** — reads `latest_status.csv`/`movers.csv`
   as the *only* permitted source of numbers, runs targeted + general news
   search and a light literature search, and writes
   `reports/YYYY_MM_DD_gdo_internal_news_report.md` in the house tone
   defined in `CONVENTIONS.md`.

## R project conventions (from `GDO_weekly_trend_report.Rproj`)

- 2-space indentation, spaces (not tabs)
- UTF-8 encoding
- No `renv.lock` yet — if dependencies are introduced, follow the main GDO
  repo's pattern of pinning via `renv`

## Working in this repo

- `R/` scripts should run standalone via `Rscript`, not just interactively —
  the cloud routine has no RStudio session.
- Never hand-write numbers into a report — every figure must trace back to
  `snapshots/*/latest_status.csv` or `movers.csv`.
- `snapshots/` folders are an audit trail (`nowcast_raw.csv` is a verbatim
  copy of the upstream CSV) — don't prune them without a reason.
- See `README.md` for the full repo layout and local dry-run commands, and
  `/Users/lshks26/Dropbox/DMMG/DENV_dashboard/planning/GDO_internal_news_report_plan.md`
  (sibling `DENV_dashboard` project, not part of this repo) for the full
  design rationale.
