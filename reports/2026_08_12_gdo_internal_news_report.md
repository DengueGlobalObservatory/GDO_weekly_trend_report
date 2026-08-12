# GDO Internal News Report — 2026-08-12

**Source:** Global Dengue Observatory (accessed 2026-08-12)
**Snapshot:** `snapshots/2026_08_12/` — sourced from `Output/2026_08_04` (target render date 2026-08-04), commit `730dc62fe2598ec475cbdb19a1c6ae1a39024f37` of `DENV_global_observatory`. **First pull ever** for this report — no prior snapshot exists to diff against.
**Coverage:** 84 countries/territories.

---

## 1. This week's snapshot

First live pull, so this section is a baseline picture rather than a week-on-week read. A quick health warning before the numbers: `latest_observed_date` varies a lot by country in this pull — most (51 of 84) sit at June or July 2026, inside or just outside GDO's validated 1–2 month nowcast sweet spot, but a handful reach back to April, December 2025, or earlier. Any figure below built on an older observation window is flagged inline; treat those as a slower-moving picture, not this week's state.

**Current-season severity** (`current_season_severity`, all 84 countries):

| Band | Countries |
|---|---|
| Extremely High | 4 |
| Normal | 17 |
| Low | 33 |
| Extremely Low | 25 |
| Unknown | 5 |

**Cumulative severity** (`severity`, full season to date) tells a broader story — 8 countries at Extremely High and 11 at High, a wider tail than the current-season snapshot alone suggests:

- **Extremely High (cumulative):** Cuba, Guyana, Kenya, Sudan (all also 100th cumulative percentile), plus Maldives, Timor-Leste, Cook Islands and Afghanistan (all ≥95th percentile).
- **High (cumulative):** Sri Lanka, Cambodia, Bangladesh, China, Senegal, Ecuador, Bolivia, Guatemala, Saint Kitts and Nevis, Nepal, Suriname.

Regionally, the 84-country panel skews Caribbean- and Pacific-heavy (21 and 15 countries respectively), with the four current-season Extremely High readings spread one apiece across the Caribbean (Cuba), Pacific Islands (Cook Islands), South America (Guyana) and Sub-Saharan Africa (Kenya) — a genuinely global spread rather than one region driving the picture.

Worth flagging on data quality: several of the most severe-looking readings (Cook Islands, Kiribati, Suriname) sit on very small case counts — a handful of reported cases against an even smaller seasonal baseline, which is exactly the small-baseline/large-ratio combination GDO's own convention says to treat as statistically unstable. Cuba's Extremely High reading, meanwhile, is built on data last observed 2025-12-01 — eight months old, well outside the nowcast sweet spot — even though on-the-ground reporting (see §2) suggests the outbreak has continued to evolve since.

---

## 2. News — targeted (top 10 by current-season severity)

`movers.csv` is empty on this first pull (nothing to diff against), so per the agent prompt's first-pull rule, this list is the 10 countries ranked highest on `current_season_percentile` in `latest_status.csv` — the most severe current seasons in this snapshot — not a week-over-week move.

### Cuba (CUB) — Caribbean
GDO: current-season and cumulative percentile both 100 (Extremely High); 4,697 reported cases against a seasonal baseline of ~165 — running well above. **Caveat: `latest_observed_date` is 2025-12-01, eight months old — this reading pre-dates the news below and should be treated as stale, not current.**
News: Cuba is in the middle of an active mosquito-borne disease outbreak. CBS News and Pulmonology Advisor report dengue and chikungunya together have left 33 dead, including 21 children, with multiple provinces affected (accessed 2026-08-12). The outbreak has also raised concern in South Florida given Cuba's proximity and reported local transmission risk to the mainland.
Sources: [CBS News](https://www.cbsnews.com/news/mosquito-borne-illnesses-cuba-chikungunya-dengue/), [Pulmonology Advisor](https://www.pulmonologyadvisor.com/news/chikungunya-and-dengue-outbreak-in-cuba-has-left-33-dead-officials-say/)

### Kenya (KEN) — Sub-Saharan Africa
GDO: current-season percentile 99.7, cumulative 100 (Extremely High); 1,102 reported cases against ~185 expected — running well above. `latest_observed_date` 2026-06-01, a two-month gap — within reach of the nowcast sweet spot, moderate confidence.
News: The US Embassy in Nairobi issued a health alert on 3 August 2026 flagging active dengue on the Kenyan coast and in Wajir and Garissa counties. Garissa County alone has reported roughly 1,583 suspected cases and five deaths, 80% in people under 40. Kenya's Ministry of Health has activated its national public health emergency operations centre.
Sources: [U.S. Embassy in Kenya](https://ke.usembassy.gov/health-alert-dengue-fever-on-kenyan-coast-and-in-wajir-and-garissa-counties/), [The Star](https://www.the-star.co.ke/news/2026-08-06-us-issues-dengue-travel-alert-for-kenya-as-cases-rise)

### Cook Islands (COK) — Pacific Islands
GDO: current-season percentile 97.8 (Extremely High) despite a "running well below" ratio descriptor — only 8 reported cases against a seasonal baseline of ~70. **Small-baseline instability: a handful of cases either side swings this ratio sharply, so treat the percentile with caution.** `latest_observed_date` 2026-04-01 — a four-month gap, outside the sweet spot.
News: This one has moved on from where the GDO snapshot leaves it — the Cook Islands' Ministry of Health officially declared the country dengue-free on 25 May 2026, 26 days after the last positive case (28 April 2026), closing out a 13-month outbreak (Operation Namu25/26) that totalled 1,251 cases and one death. Worth noting in any social post: the "Extremely High" GDO reading reflects data from before the all-clear, not the current state.
Sources: [Te Marae Ora — Cook Islands Ministry of Health](https://www.health.gov.ck/cook-islands-dengue-free/), [PINA](https://pina.com.fj/2026/05/26/cook-islands-declares-end-to-dengue-outbreak-after-more-than-a-year/)

### Guyana (GUY) — South America
GDO: current-season percentile 96.3 (Extremely High); 2,976 reported cases against ~1,380 expected — running well above. `latest_observed_date` 2026-06-01, within the sweet spot.
News: Guyana Times reports rising cases in Region 6 as the rainy season fuels mosquito breeding. A new CDC dengue alert has added Guyana to its high-risk travel destination list, consistent with a season that GDO estimates at roughly 7.7× an average year to date.
Sources: [Guyana Times](https://guyanatimesgy.com/dengue-cases-rising-in-region-6-as-rainy-season-fuels-mosquito-breeding-rho/), [The Traveler](https://www.thetraveler.org/new-cdc-dengue-alert-puts-guyana-on-high-risk-travel-map/)

### Maldives (MDV) — South Asia
GDO: current-season percentile 73.2 (Normal) but cumulative percentile 99.9 (Extremely High) — 601 reported cases against ~144.5 expected, running well above. `latest_observed_date` 2026-04-01, a four-month gap — outside the sweet spot, treat with added caution.
News: Early 2026 saw a sharp surge — 631 cases in January (~6× January 2025), 428 in February (+563% year-on-year), 535 in March (+891% year-on-year) — concentrated in Vaavu, Kaafu and Gaafu Alif atolls. One death was reported on 13 April 2026 following ventilator support for a critical case.
Sources: [edition.mv](https://edition.mv/report/50169), [Travel And Tour World](https://www.travelandtourworld.com/news/article/dengue-fever-cases-skyrocket-in-maldives-but-tourism-boom-continues-heres-what-you-need-to-know/)

### Cambodia (KHM) — East & Southeast Asia
GDO: current-season percentile 72.7 (Normal), cumulative High; 8,095 reported cases against ~2,700 expected — running well above. `latest_observed_date` 2026-06-01, within the sweet spot.
News: WHO's Western Pacific dengue situation updates put Cambodia's 2026 total at 28,074 cases and 38 deaths as of 12 July 2026 (case-fatality rate 0.1%), with incidence up 58.1% year-on-year and running above the epidemic threshold since epidemiological week 24. For context, 2025 closed at 63,016 cases and 79 deaths — already a 232% rise on 2024.
Sources: [WHO WPRO Dengue Situation Update #748](https://cdn.who.int/media/docs/default-source/wpro---documents/emergency/surveillance/dengue/dengue_20260625.pdf), [Outbreak News Today](https://outbreaknewstoday.substack.com/p/cambodia-reports-232-increase-in)

### Kiribati (KIR) — Pacific Islands
GDO: current-season percentile 70.9 (Normal) but with 0 reported cases and a "running well below" descriptor — this is a small-baseline artefact more than a meaningful signal; flag as unstable rather than newsworthy in its own right. `latest_observed_date` 2026-04-01, outside the sweet spot.
News: WHO's Western Pacific regional update (11 June 2026) lists Kiribati as one of six Pacific Island Countries and Territories with active dengue outbreaks, alongside American Samoa, New Caledonia (the worst-affected), Samoa, Tonga and Tuvalu. Region-wide from 1 January to 11 June 2026: over 3,500 confirmed cases, 156 hospitalisations and three deaths, with DENV-1 and DENV-2 co-circulating.
Sources: [WHO Dengue Situation Update #747](https://www.who.int/westernpacific/publications/m/item/dengue-situation-update---747--11-june-2026)

### Suriname (SUR) — South America
GDO: current-season percentile 70.1 (Normal); only 2 reported cases against a small baseline, ratio "running well below" — another small-baseline case, treat the descriptor loosely. `latest_observed_date` 2026-05-01, a three-month gap.
News: No dengue-specific outbreak news surfaced for Suriname this cycle. Notably, a chikungunya outbreak is active in the same Aedes-vector geography — 134 confirmed chikungunya cases reported by 29 January 2026, and PAHO issued a regional advisory in February 2026 on rising chikungunya transmission across Guyana, French Guiana and Suriname after a decade without local transmission. Worth watching as a vector-control story even though it's a different arbovirus.
Sources: [PAHO/WHO](https://www.paho.org/en/news/11-2-2026-chikungunya-cases-increasing-several-countries-americas-paho-recommends-preparedness)

### Sudan (SDN) — Europe, Middle East & North Africa
GDO: current-season percentile 66.0 (Normal) but cumulative percentile 100 (Extremely High) — 2,965 reported cases against a seasonal baseline of only ~27, a very large ratio on a small denominator. **Double caveat: small-baseline instability, and `latest_observed_date` is 2026-05-01, a three-month gap outside the sweet spot.**
News: An outbreak in Sudan's Blue Nile region has left 39 dead and over 300 infected as of 24 July 2026 (350 confirmed cases regionally, 76 in Ed Damazin, the regional capital). Earlier in the year, Sudan's Federal Health Ministry reported over 1,200 cases in a single week in March, concentrated in Khartoum, River Nile, El Gezira and Northern State. Ongoing civil conflict, degraded WASH infrastructure and concurrent cholera/measles outbreaks are compounding the response — a monitoring/situational-awareness story, not one to frame as an isolated dengue event.
Sources: [Sudan Tribune](https://sudantribune.com/article/316569), [Dabanga Radio TV](https://www.dabangasudan.org/en/all-news/article/sudan-records-more-than-1200-dengue-fever-cases-in-a-week-health-ministry-says)

### Guatemala (GTM) — North & Central America
GDO: current-season percentile 58.4 (Normal), ratio "running well below"; 1,401 reported cases. `latest_observed_date` 2026-06-01, within the sweet spot.
News: Guatemala's Ministry of Public Health reports roughly 6,000 cases in 2026 to date — 52% fewer than the same period in 2025 — and has intensified fumigation and vector-control activity ahead of and during the rainy season. This is broadly consistent with the GDO "well below average" read, despite the country's cumulative severity still registering High.
Sources: [Infobae](https://www.infobae.com/guatemala/2026/07/17/el-ministerio-de-salud-de-guatemala-intensifico-las-acciones-para-prevenir-el-dengue/), [Prensa Libre](https://www.prensalibre.com/ahora/guatemala/comunitario/guatemala-registra-mas-de-4800-casos-de-dengue-en-el-2026/)

---

## 3. News — general scan

Independent scan, capped at five items, including non-endemic/no-GDO-data geographies.

1. **Philippines — Zamboanga City declares a dengue epidemic** (not in GDO's current country panel). On 4 August 2026 the city government formally declared an epidemic after recording 1,241 cases and 12 deaths, more than half in children aged 10 or under. [Outbreak News Today](https://outbreaknewstoday.substack.com/p/philippines-dengue-epidemic-announced)
2. **United States — locally acquired transmission spreading beyond the usual hotspots.** Virginia confirmed its first-ever locally acquired dengue case in a resident with no relevant travel history, reported around 4 August 2026, while Florida confirmed its third local transmission cluster of the year in Miami-Dade and Palm Beach counties. [Washington Post](https://www.washingtonpost.com/dc-md-va/2026/08/04/virginia-reports-its-first-locally-acquired-dengue-case/), [WLRN](https://www.wlrn.org/environment/2026-08-03/dengue-palm-beach-county-florida)
3. **Europe — autochthonous transmission trend, not GDO-covered geography.** ECDC and academic reviews note Southern Europe (France, Italy, Spain) is seeing a marked rise in locally acquired dengue since 2023–24, alongside high volumes of imported cases (France recorded 3,938 imported cases and Italy 456 in 2024, the latest year-specific figures available) — a preparedness story rather than a live outbreak. [ECDC](https://www.ecdc.europa.eu/en/dengue), [ScienceDirect](https://www.sciencedirect.com/science/article/pii/S2666776226001705)
4. **India approves its first dengue vaccine.** Takeda's Qdenga (TAK-003) received regulatory approval in India in July 2026, a significant addition to prevention tools in the world's most populous dengue-endemic country. [Medical Xpress](https://medicalxpress.com/news/2026-07-india-dengue-vaccine.html)
5. **Brazil halts its Butantan-DV pilot rollout.** After starting a national rollout of the world's first single-dose dengue vaccine to ~1.1 million primary healthcare workers in February 2026, Brazil's health ministry paused the campaign in early June 2026 following two deaths and 42 serious adverse events (severe abdominal pain, persistent vomiting, bleeding) among recipients. [The Lancet Microbe](https://www.thelancet.com/journals/lanmic/article/PIIS2666-5247(26)00042-X/fulltext)

---

## 4. Trend since last update

First run — no prior snapshot to compare.

| Category | Count |
|---|---|
| A — band-crossing movers | — (no prior pull) |
| B — other movers | — (no prior pull) |
| C — minor movers | — (no prior pull) |

---

## 5. Social-media candidate flags

Ranked short-list, one-line rationale each.

1. **Kenya — Extremely High, US travel alert, fresh data.** Strongest combination this week: current, within-sweet-spot GDO data (June 2026) *and* a live US Embassy health alert (3 Aug 2026) *and* named case/death counts by county. Least caveated of the set.
2. **Cook Islands — outbreak-to-resolution arc.** Good "story" hook (13-month outbreak → declared dengue-free), but flag clearly that the GDO Extremely High reading reflects pre-resolution April data, not the current all-clear state — don't post the percentile without that context.
3. **Cuba — most severe reading in the panel, but stale.** 100th percentile and heavy press coverage (33 deaths, dengue+chikungunya), but the GDO figure is eight months old; if used, caveat prominently that the number predates the current outbreak reporting rather than confirming it.
4. **Vaccine policy split — India approves, Brazil pauses.** Not tied to a GDO number, but a strong contrast story (regulatory green light vs. safety-driven halt) with clear public interest for a social audience; use as a standalone item, not paired with country severity claims.
5. **Sudan — extreme ratio on a tiny baseline, needs care.** Newsworthy (Blue Nile deaths) but the GDO ratio is driven by a small seasonal baseline (~27 expected cases) — if posting, lead with the on-the-ground death toll from reporting, not the GDO ratio, to avoid overstating precision.

---

## 6. Scientific literature findings

Light pass, a handful of citations:

- Vietnam — a 2026 study in the *International Journal of Biometeorology* applies causal, spatiotemporal deep learning to dengue forecasting and extreme-outbreak risk under climate variability. [Springer](https://link.springer.com/article/10.1007/s00484-026-03151-2)
- India — an AI-based early-warning system combining climate and health data offers roughly a two-month forecasting lead time; associated modelling projects dengue-related deaths in India could rise 13% by 2030 and 23–40% by 2050 under current climate trends. [Gavi — VaccinesWork](https://www.gavi.org/vaccineswork/ai-model-predicts-dengue-outbreaks-two-months-they-start)
- Brazil — "NowcastPNN," an attention-based probabilistic neural network, is proposed for nowcasting occurred-but-not-yet-reported dengue cases in São Paulo, addressing the same reporting-lag problem GDO's own nowcast is built to handle (fewer than 50% of cases are typically reported within the first week). [ScienceDirect](https://www.sciencedirect.com/science/article/pii/S1755436525000684)

---

## 7. Appendix

### Full movers table

Empty — first pull, nothing to diff against.

```
iso3,country,region,category,field,prior_value,current_value,delta
```

### Consolidated citations

**Targeted news:**
- CBS News — [Mosquito-borne illnesses in Cuba](https://www.cbsnews.com/news/mosquito-borne-illnesses-cuba-chikungunya-dengue/)
- Pulmonology Advisor — [Chikungunya and dengue outbreak in Cuba](https://www.pulmonologyadvisor.com/news/chikungunya-and-dengue-outbreak-in-cuba-has-left-33-dead-officials-say/)
- U.S. Embassy in Kenya — [Health alert: dengue on the Kenyan coast, Wajir, Garissa](https://ke.usembassy.gov/health-alert-dengue-fever-on-kenyan-coast-and-in-wajir-and-garissa-counties/)
- The Star (Kenya) — [US issues dengue travel alert for Kenya](https://www.the-star.co.ke/news/2026-08-06-us-issues-dengue-travel-alert-for-kenya-as-cases-rise)
- Te Marae Ora, Cook Islands Ministry of Health — [Cook Islands dengue free](https://www.health.gov.ck/cook-islands-dengue-free/)
- PINA — [Cook Islands declares end to dengue outbreak](https://pina.com.fj/2026/05/26/cook-islands-declares-end-to-dengue-outbreak-after-more-than-a-year/)
- Guyana Times — [Dengue cases rising in Region 6](https://guyanatimesgy.com/dengue-cases-rising-in-region-6-as-rainy-season-fuels-mosquito-breeding-rho/)
- The Traveler — [New CDC dengue alert puts Guyana on high-risk travel map](https://www.thetraveler.org/new-cdc-dengue-alert-puts-guyana-on-high-risk-travel-map/)
- edition.mv — [Dengue in Maldives: the spike in cases](https://edition.mv/report/50169)
- Travel And Tour World — [Dengue fever cases skyrocket in Maldives](https://www.travelandtourworld.com/news/article/dengue-fever-cases-skyrocket-in-maldives-but-tourism-boom-continues-heres-what-you-need-to-know/)
- WHO WPRO — [Dengue Situation Update #748, 25 June 2026](https://cdn.who.int/media/docs/default-source/wpro---documents/emergency/surveillance/dengue/dengue_20260625.pdf)
- Outbreak News Today — [Cambodia reports 232% increase in dengue](https://outbreaknewstoday.substack.com/p/cambodia-reports-232-increase-in)
- WHO — [Dengue Situation Update #747, 11 June 2026](https://www.who.int/westernpacific/publications/m/item/dengue-situation-update---747--11-june-2026)
- PAHO/WHO — [Chikungunya cases increasing in the Americas](https://www.paho.org/en/news/11-2-2026-chikungunya-cases-increasing-several-countries-americas-paho-recommends-preparedness)
- Sudan Tribune — [Dengue fever outbreak kills 39 in Sudan's Blue Nile](https://sudantribune.com/article/316569)
- Dabanga Radio TV — [Sudan records more than 1,200 dengue cases in a week](https://www.dabangasudan.org/en/all-news/article/sudan-records-more-than-1200-dengue-fever-cases-in-a-week-health-ministry-says)
- Infobae — [Guatemala health ministry intensifies dengue prevention](https://www.infobae.com/guatemala/2026/07/17/el-ministerio-de-salud-de-guatemala-intensifico-las-acciones-para-prevenir-el-dengue/)
- Prensa Libre — [Guatemala registra más de 4,800 casos de dengue en 2026](https://www.prensalibre.com/ahora/guatemala/comunitario/guatemala-registra-mas-de-4800-casos-de-dengue-en-el-2026/)

**General scan:**
- Outbreak News Today — [Philippines: dengue epidemic announced in Zamboanga City](https://outbreaknewstoday.substack.com/p/philippines-dengue-epidemic-announced)
- Washington Post — [Virginia reports its first locally acquired dengue case](https://www.washingtonpost.com/dc-md-va/2026/08/04/virginia-reports-its-first-locally-acquired-dengue-case/)
- WLRN — [Florida confirms dengue cases in Miami-Dade, Palm Beach](https://www.wlrn.org/environment/2026-08-03/dengue-palm-beach-county-florida)
- ECDC — [Dengue in the EU/EEA](https://www.ecdc.europa.eu/en/dengue)
- ScienceDirect — [Preparing Europe for recurrent autochthonous dengue transmission](https://www.sciencedirect.com/science/article/pii/S2666776226001705)
- Medical Xpress — [India approves first dengue vaccine](https://medicalxpress.com/news/2026-07-india-dengue-vaccine.html)
- The Lancet Microbe — [Brazil's Butantan-DV rollout and pause](https://www.thelancet.com/journals/lanmic/article/PIIS2666-5247(26)00042-X/fulltext)

**Scientific literature:**
- Springer — [Causal and spatiotemporal deep learning for dengue forecasting (Vietnam)](https://link.springer.com/article/10.1007/s00484-026-03151-2)
- Gavi VaccinesWork — [AI model predicts dengue outbreaks two months before they start](https://www.gavi.org/vaccineswork/ai-model-predicts-dengue-outbreaks-two-months-they-start)
- ScienceDirect — [Fast and trustworthy nowcasting of dengue fever (São Paulo)](https://www.sciencedirect.com/science/article/pii/S1755436525000684)
