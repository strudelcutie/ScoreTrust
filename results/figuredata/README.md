# Figure source data

Frozen tables from which Figures 2–5 of the manuscript were plotted. The plotting
scripts are not distributed with this repository; these tables are provided so
that every value shown in the figures can be traced and re-plotted independently.

## Contents

| Path | Used for |
|---|---|
| `Figure5source.csv` | Assembled per-setting matrix plotted in Figure 5: AUROC, Brier skill score, calibration slope, and low-score enrichment for the 12 evaluation settings, grouped by domain |
| `dili/audit/` | DILI baseline metrics and recomputed conformal outputs |
| `dili/canonical/` | Frozen HistGB predictions and triage assignments for the 388-compound external cohort and the three internal settings |
| `dili/supplementarytables/` | Bootstrap confidence intervals and conformal coverage tables |
| `dili/secondaryanalyses/`, `dili/stage2/` | High-score metrics and chemical-distance stratified metrics |
| `tox21/` | NR-AR and NR-ER task tables (ranking, probability, triage) for the cross-domain panels |
| `nasa/` | KC1, PC1, JM1, and KC2 task tables (ranking, probability, triage) for the cross-domain panels |

## Figure-to-data map

| Figure | Source tables |
|---|---|
| Figure 2 | `dili/audit/baselinemetrics.csv`, `dili/supplementarytables/S8bootstrapcifull.csv`, `dili/canonical/predictions/histgbpredictions.csv` |
| Figure 3 | `dili/canonical/predictions/histgbpredictions.csv`, `dili/supplementarytables/S7conformalcoverage.csv`, `dili/audit/conformalrecomputed.csv` |
| Figure 4 | `dili/canonical/triage/histgbtriage.csv`, `dili/secondaryanalyses/highscore/highscoremetricsbysplit.csv` |
| Figure 5 | `Figure5source.csv`, with the cross-domain rows built from `tox21/*/tables/` and `nasa/tables/` |

Values in `Figure5source.csv` are rounded only by the plotting step; the CSV
carries full precision.
