# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository status

This repo is currently an empty scaffold: an RStudio project (`GDO_weekly_trend_report.Rproj`) with a standard R `.gitignore` and a placeholder `README.md`. No source code, dependencies, or tests exist yet — there is nothing to build, lint, or run.

## What this repo is for

`GDO_weekly_trend_report` (org: `DengueGlobalObservatory`, remote `git@github.com:DengueGlobalObservatory/GDO_weekly_trend_report.git`) is a satellite repo to the main **Global Dengue Observatory (GDO)** project. It is a standalone R project, separate from the main site repo `DENV_global_observatory`, intended to produce a weekly dengue trend report.

Read `/Users/lshks26/Dropbox/DMMG/DENV_dashboard/GDO_context.md` before doing substantive work here — it documents the GDO's data sources, methods vocabulary (severity ratios, reporting-delay correction, nowcasting, seasonal profiles), headline figures, and conventions (British English, "estimated" vs. "reported", severity descriptors) that any trend report should reuse rather than redefine. In particular, any weekly report built here should stay consistent with the severity ratio thresholds and terminology already hard-coded into the main site's text-generation functions.

## R project conventions (from `GDO_weekly_trend_report.Rproj`)

- 2-space indentation, spaces (not tabs)
- UTF-8 encoding
- No `renv.lock` yet — if dependencies are introduced, follow the main GDO repo's pattern of pinning via `renv`

## Next steps for whoever builds this out

Once real content lands (R scripts, Quarto/R Markdown report, data pipeline), update this file with actual build/run/test commands and the report's architecture. Don't guess at structure in the meantime.
