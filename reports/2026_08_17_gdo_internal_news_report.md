# GDO Internal News Report — 2026-08-17

*Source: Global Dengue Observatory (accessed 2026-08-17).*

## 1. Header

- **Report date:** 2026-08-17 (Monday routine run)
- **Active snapshot:** `snapshots/2026_08_12/` — **unchanged since the 2026-08-12 pull**. Source data vintage (`target_render_date`): 2026-08-04. Source commit: `730dc62f` (DENV_global_observatory `Output/2026_08_04/`).
- **Pull status this week:** **news-only week.** The public site's next scheduled render is 2026-08-18 (i.e. tomorrow, not yet live at the time of this run); the current live vintage is still the same 2026-08-04 render used in last week's pull. No fetch/diff was run — Step 1 of the pipeline was skipped per the routine's own rule.
- **Countries covered:** 84 (unchanged).

## 2. This week's snapshot

Global picture across the 84 tracked countries/territories, from `latest_status.csv` only.

**Cumulative severity band** (percentile_cumulative, current position vs. seasonal-to-date expectation):

| Band | Countries |
|---|---|
| Extremely High | 8 |
| High | 11 |
| Normal | 30 |
| Low | 27 |
| Extremely Low | 5 |
| Unknown | 3 |

The 8 at **Extremely High** cumulative severity: Cuba, Kenya, Sudan, Maldives, Timor-Leste, Guyana, Afghanistan, Cook Islands — all "running well above" on the monthly ratio descriptor bar Cook Islands ("running well below" — see caveat under Kiribati/Pacific below).

**Current-season severity band** (current_season_percentile, i.e. how this season is tracking overall):

| Band | Countries |
|---|---|
| Low | 33 |
| Extremely Low | 25 |
| Normal | 17 |
| Unknown | 5 |
| Extremely High | 4 |

Only four countries sit at **current-season Extremely High**: Cuba (percentile 100), Kenya (99.7), Cook Islands (97.8) and Guyana (96.3). These four, plus six more from the upper end of the current-season ranking, form this week's targeted list (Section 3) — country selection there is explained below.

**Caveat — data recency.** None of today's ten targeted countries have a nowcast gap inside GDO's validated 1–2 month sweet spot; gaps range from 2.5 months (Kenya, Guyana, Cambodia, Guatemala) to 4.5 months (Cook Islands, Maldives, Kiribati) up to **8.5 months for Cuba** (latest observed data point: 2025-12-01). Treat the Cuba figure in particular as a stale, lower-confidence estimate rather than a current read. Sudan's monthly ratio (110x) is driven by a very small seasonal baseline (≈27 cases/month) against 2,965 observed cases in a single month — a classic small-baseline/large-ratio instability, not necessarily a 110-fold real change in transmission.

## 3. News — targeted (10 countries)

**Country selection note:** `movers.csv` for the active snapshot is empty — this was GDO's first-ever pull (2026-08-12), so there is no prior snapshot to compute week-over-week band-crossings against. Per the routine's first-pull fallback, the ten countries below are instead the current top 10 by `current_season_percentile` (i.e. the most severe current seasons in the dataset), not a week-over-week move.

### Cuba (current-season percentile 100, Extremely High)
- GDO figure: 4,697 reported cases in the latest observed month (2025-12-01 — **8.5 months stale**, well outside the nowcast sweet spot; treat as a low-confidence, dated read). Estimated total seasonal cases: 37,546.
- News: Guantánamo province officials publicly acknowledged rising *Aedes aegypti* numbers and gaps in fever-case detection/reporting, amid an active island-wide dengue/chikungunya situation (2026-08-14). [CiberCuba](https://www.cibercuba.com/noticias/2026-08-14-u1-e209363-s27061-nid337830-guantanamo-admite-incremento-aedes-aegypti-senala)

### Kenya (current-season percentile 99.7, Extremely High)
- GDO figure: 1,102 reported cases (latest observed month 2026-06-01, ~2.5 months stale). Estimated total seasonal cases: 28,289.
- News: US Embassy Nairobi issued a health alert (2026-08-03) flagging active dengue on the Kenyan coast and in Wajir and Garissa counties; CDC's overall Kenya travel advisory stays at Level 1 but with elevated regional risk noted. Widely picked up by Kenyan press by 2026-08-06, tracing the outbreak to a Garissa County upsurge that began in November 2025 and has since spread to Wajir. [US Embassy Nairobi](https://ke.usembassy.gov/health-alert-dengue-fever-on-kenyan-coast-and-in-wajir-and-garissa-counties/) · [The Star](https://www.the-star.co.ke/news/2026-08-06-us-issues-dengue-travel-alert-for-kenya-as-cases-rise)

### Cook Islands (current-season percentile 97.8, Extremely High)
- GDO figure: 8 reported cases (latest observed month 2026-04-01, ~4.5 months stale). Monthly ratio descriptor "running well below" despite an Extremely High current-season band — a sign the current-season classification is being driven by earlier-season case load, not this stale monthly point. Estimated total seasonal cases: 1,649.
- News: no significant dengue-specific news found in the last ~2 weeks. Context: Te Marae Ora (Ministry of Health) declared the Cook Islands dengue-free on 2026-05-25 after the 2025–26 outbreak, and no new cases have been reported since — consistent with GDO's own stale, low-case reading.

### Guyana (current-season percentile 96.3, Extremely High)
- GDO figure: 2,976 reported cases (latest observed month 2026-06-01, ~2.5 months stale). Estimated total seasonal cases: 88,939.
- News: no dengue-specific item could be confirmed within the last ~2 weeks (some Region 6/East Berbice-Corentyne coverage exists but its date could not be reliably pinned to this window).

### Maldives (current-season percentile 73.2, Normal band despite ranking 5th)
- GDO figure: 601 reported cases (latest observed month 2026-04-01, ~4.5 months stale). Estimated total seasonal cases: 9,890.
- News: no item confirmed within the last ~2 weeks; most recent HPA case updates found date to January–May 2026, showing a marked year-on-year rise but nothing datable to this window.

### Cambodia (current-season percentile 72.7, Normal band)
- GDO figure: 8,095 reported cases (latest observed month 2026-06-01, ~2.5 months stale). Estimated total seasonal cases: 62,123.
- News: no item confirmed within the last ~2 weeks; most recent confirmed Ministry of Health figures found are from 2026-07-12 (28,074 cumulative cases, 38 deaths, incidence +58.1% y/y) — just outside the window.

### Kiribati (current-season percentile 70.9, Normal band)
- GDO figure: 0 reported cases in the latest observed month (2026-04-01, ~4.5 months stale) — but flag this against the news below, which shows active regional transmission since. Estimated total seasonal cases: 0.
- News: WHO's Pacific multi-country dengue situation reports (2026-08-03 and 2026-08-14 editions) both list Kiribati among Pacific Island countries/territories currently reporting active outbreaks — a signal GDO's stale April data point does not yet capture. [ReliefWeb, 14 Aug](https://reliefweb.int/report/fiji/dengue-pacific-multicountry-situation-14-august-2026) · [ReliefWeb, 3 Aug](https://reliefweb.int/report/fiji/dengue-pacific-multicountry-situation-3-august-2026)

### Suriname (current-season percentile 70.1, Normal band)
- GDO figure: 2 reported cases (latest observed month 2026-05-01, ~3.5 months stale). Estimated total seasonal cases: 759.
- News: no dengue-specific item found in the last ~2 weeks. Note: Suriname has a separate, active chikungunya outbreak (ongoing since February 2026, a different *Aedes*-borne disease) drawing regional/PAHO attention — do not conflate with dengue.

### Sudan (current-season percentile 66.0, Normal band; Extremely High on cumulative severity)
- GDO figure: 2,965 reported cases (latest observed month 2026-05-01, ~3.5 months stale). Monthly ratio 110x against a very small seasonal baseline (~27 cases/month) — flag as unstable, not a literal 110-fold change. Estimated total seasonal cases: 706,322 (also treat this large projection with caution given the baseline instability above).
- News: no item confirmed within the last ~2 weeks; most recent confirmed reporting (Blue Nile state outbreak, 39 deaths per Sudan Doctors' Union) dates to 2026-07-22/24 — just outside the window.

### Guatemala (current-season percentile 58.4, Normal band)
- GDO figure: 1,401 reported cases (latest observed month 2026-06-01, ~2.5 months stale). Estimated total seasonal cases: 54,327.
- News: no item confirmed within the last ~2 weeks; most recent confirmed MSPAS-sourced update found dates to 2026-07-17, reporting intensified prevention campaigns amid the rainy season.

## 4. News — general scan (5 items)

1. **Philippines (Zamboanga City), 2026-08-04** — City government formally declared a dengue epidemic after cases reached 1,241 with 12 deaths (reported >500% year-on-year rise), concentrated in 39 of 98 barangays, over half in children aged ≤10. Philippines is not in GDO's current top-10 targeted list but is a major endemic country worth flagging. [Inquirer](https://newsinfo.inquirer.net/2277494/dengue-outbreak-declared-in-zamboanga-city-after-12-deaths) · [SunStar](https://www.sunstar.com.ph/zamboanga/zamboanga-city-declares-dengue-epidemic)
2. **United States (Virginia), 2026-08-04** — Virginia Department of Health confirmed the state's first-ever locally acquired dengue case, in a Northern Virginia resident with no recent travel history. Non-endemic, no GDO nowcast coverage. [Washington Post](https://www.washingtonpost.com/dc-md-va/2026/08/04/virginia-reports-its-first-locally-acquired-dengue-case/)
3. **United States (Florida, Tampa Bay area), 2026-08-13/14** — Locally acquired cases rising in Hillsborough County (8 cases, up from 2 in late July) and Pinellas County (2 cases); local mosquito-control operations have been ramped up. [Washington Times](https://www.washingtontimes.com/news/2026/aug/13/cases-rising-mosquito-borne-disease-dengue-tampa-bay-area/) · [WUSF](https://www.wusf.org/health-news-florida/2026-08-14/mosquito-control-ramps-up-dengue-cases-hillsborough-pinellas-rise)
4. **France, 2026-08-05** — Santé publique France reported 9 locally acquired dengue cases across mainland France in 2026, including two unrelated autochthonous clusters in the Tarn and Hérault départements (Occitanie); investigations and vector-control measures under way. Non-endemic, no GDO nowcast coverage. [TravelHealthPro](https://travelhealthpro.org.uk/news/736/locally-acquired-cases-of-dengue-in-france)
5. **Bangladesh (Chattogram district), c. 2026-08-12** — Dengue cases surging, with 41 new cases in a single 24-hour period, bringing the first-11-days-of-August tally to 361; reporting frames this as part of a broader Asia-region upswing also naming Sri Lanka, Vietnam and the Philippines. [The Daily Star](https://www.thedailystar.net/news/healthcare/news/dengue-cases-surge-chattogram-4247926)

## 5. Trend since last update

No new GDO snapshot data this week — this is a **news-only week**. The public site's live data vintage is unchanged at the 2026-08-04 render (last pulled here on 2026-08-12); the next scheduled render is 2026-08-18. No week-over-week A/B/C comparison is possible because `movers.csv` from the last pull was itself empty (that was GDO's first-ever pull, with no prior snapshot to diff against). Next Monday's run should have a genuine week-over-week comparison for the first time.

## 6. Social-media candidate flags

Ranked short-list, 3–5 items, for the researcher drafting Tuesday's posts:

1. **Kenya — US travel health alert amid Extremely High current-season reading.** GDO's model independently flags Kenya at the 99.7th current-season percentile, and a US Embassy health alert (2026-08-03) corroborates active transmission on the coast and in Wajir/Garissa. Strong story: model + independent confirmation align. *Caveat: GDO's Kenya data point is ~2.5 months old, at the edge of the nowcast sweet spot.*
2. **Kiribati/Pacific — WHO situation reports show active outbreak GDO's stale data point misses.** GDO shows 0 cases for Kiribati (April 2026), but WHO's Pacific multi-country situation reports (3 and 14 August) both list Kiribati as an active outbreak country. Good "here's what the numbers don't yet show" angle. *Caveat: GDO figure is ~4.5 months stale — frame as "before this most recent activity," not as a contradiction of GDO's model.*
3. **Philippines (Zamboanga City) — formal epidemic declaration.** Concrete, dated, official government action (not just case counts) makes this a clean, citable story; disproportionate child impact adds a real-world hook. *Caveat: Philippines is outside GDO's current top-10 targeted list this week — this is a general-scan item, not a GDO-flagged country.*
4. **Non-endemic locally acquired transmission cluster (Florida/Virginia/France).** Three separate first-of-season or first-ever locally acquired case stories in non-endemic settings in the same ~10-day window is itself a trend worth a post — "dengue's reach is expanding into new territory." *Caveat: small absolute case numbers (single digits to low tens) in each location; frame as an emerging-geography story, not an outbreak-scale one.*
5. **Sudan — very high modelled ratio, but treat cautiously.** Sudan's 110x monthly ratio and Extremely High cumulative severity are eye-catching, but the ratio is driven by a very small seasonal baseline and the underlying data point is 3.5 months old. *Recommend holding this one back or heavily caveating if used — it's the least numerically reliable figure in this week's flagged set.*

## 7. Scientific literature findings

Lighter-effort pass; a handful of recent items across forecasting, climate drivers, surveillance and vaccine policy.

- **Forecasting/modelling:** M-SDT, a modelling framework combining transmission dynamics, forecasting and intervention-strategy simulation for dengue in Ahmedabad Municipal Corporation, India. arXiv preprint, ~May 2026. [arXiv](https://arxiv.org/pdf/2605.17975)
- **Climate drivers:** Narrative review synthesising dengue transmission, pathogenesis and climate-driven expansion (temperature/humidity/rainfall effects, *Aedes* range shifts). *Zoonotic Diseases* (MDPI), August 2026. [DOI](https://doi.org/10.3390/zoonoticdis6030033)
- **Climate drivers:** Semi-mechanistic modelling study projecting increased dengue transmission suitability in California under climate warming and urban/land-use expansion. ScienceDirect, 2026. [ScienceDirect](https://www.sciencedirect.com/science/article/pii/S2667193X26001390)
- **Vaccine policy:** Brazil suspended its pilot rollout of Butantan-DV (the first single-dose dengue vaccine, targeting ~1.1 million health workers) in early June 2026 after 2 deaths and 42 serious adverse events among recipients. *The Lancet Microbe*, 2026. [The Lancet](https://www.thelancet.com/journals/lanmic/article/PIIS2666-5247(26)00042-X/fulltext)
- **Vaccine policy:** India approved Takeda's Qdenga (two-dose tetravalent dengue vaccine, ages 4–60) — its first dengue vaccine approval, with rollout planned through 2026. Medical Xpress, July 2026. [Medical Xpress](https://medicalxpress.com/news/2026-07-india-dengue-vaccine.html)
- **Surveillance methods:** New method using routine ArboNET traveller-surveillance data (returning US travellers) with regression/percentile thresholds to flag sustained periods of elevated dengue transmission risk by destination country, for pre-/post-travel guidance. *Emerging Infectious Diseases* (CDC), Vol 32 No 2, February 2026. [CDC EID](https://wwwnc.cdc.gov/eid/article/32/2/25-1217_article)

## 8. Appendix

### 8.1 `movers.csv` (active snapshot)

Empty — GDO's first-ever pull (2026-08-12) has no prior snapshot to diff against, so no movers have been computed yet.

```csv
iso3,country,region,category,field,prior_value,current_value,delta
```

### 8.2 Consolidated citation list

1. CiberCuba (2026-08-14) — https://www.cibercuba.com/noticias/2026-08-14-u1-e209363-s27061-nid337830-guantanamo-admite-incremento-aedes-aegypti-senala
2. US Embassy Nairobi (2026-08-03) — https://ke.usembassy.gov/health-alert-dengue-fever-on-kenyan-coast-and-in-wajir-and-garissa-counties/
3. The Star, Kenya (2026-08-06) — https://www.the-star.co.ke/news/2026-08-06-us-issues-dengue-travel-alert-for-kenya-as-cases-rise
4. ReliefWeb / WHO Pacific situation report (2026-08-14) — https://reliefweb.int/report/fiji/dengue-pacific-multicountry-situation-14-august-2026
5. ReliefWeb / WHO Pacific situation report (2026-08-03) — https://reliefweb.int/report/fiji/dengue-pacific-multicountry-situation-3-august-2026
6. Inquirer.net, Philippines (2026-08-04) — https://newsinfo.inquirer.net/2277494/dengue-outbreak-declared-in-zamboanga-city-after-12-deaths
7. SunStar, Philippines (2026-08-04) — https://www.sunstar.com.ph/zamboanga/zamboanga-city-declares-dengue-epidemic
8. Washington Post (2026-08-04) — https://www.washingtonpost.com/dc-md-va/2026/08/04/virginia-reports-its-first-locally-acquired-dengue-case/
9. Washington Times (2026-08-13) — https://www.washingtontimes.com/news/2026/aug/13/cases-rising-mosquito-borne-disease-dengue-tampa-bay-area/
10. WUSF (2026-08-14) — https://www.wusf.org/health-news-florida/2026-08-14/mosquito-control-ramps-up-dengue-cases-hillsborough-pinellas-rise
11. TravelHealthPro / Santé publique France (2026-08-05) — https://travelhealthpro.org.uk/news/736/locally-acquired-cases-of-dengue-in-france
12. The Daily Star, Bangladesh (c. 2026-08-12) — https://www.thedailystar.net/news/healthcare/news/dengue-cases-surge-chattogram-4247926
13. arXiv preprint, M-SDT modelling framework (~2026-05) — https://arxiv.org/pdf/2605.17975
14. Zoonotic Diseases (MDPI), climate/transmission review (2026-08) — https://doi.org/10.3390/zoonoticdis6030033
15. ScienceDirect, California climate suitability study (2026) — https://www.sciencedirect.com/science/article/pii/S2667193X26001390
16. The Lancet Microbe, Butantan-DV vaccine suspension (2026) — https://www.thelancet.com/journals/lanmic/article/PIIS2666-5247(26)00042-X/fulltext
17. Medical Xpress, India Qdenga approval (2026-07) — https://medicalxpress.com/news/2026-07-india-dengue-vaccine.html
18. Emerging Infectious Diseases (CDC), ArboNET traveller-surveillance method (2026-02) — https://wwwnc.cdc.gov/eid/article/32/2/25-1217_article
