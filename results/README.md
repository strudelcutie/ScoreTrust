# Results

`Data S1.xlsx` contains the final supplementary tables referenced in the
manuscript:

Content
literature-model adapted probes 
metric glossary, analysis governance, and method positioning 
confidence intervals and permutation tests 
plit sensitivity and attribution 
chemical-space distance and ranking 
calibration selection and prevalence shift 
conformal coverage and prediction-set composition 
operational triage and review burden 
low-risk exclusion sensitivity 
uncertainty, validation reuse, and applicability-domain sensitivity 
decision-curve and prevalence sensitivity 
Tox21 endpoint generalization 
NASA MDP cross-project generalization 
label definition and sensitivity 
data sources, cohort construction, and preprocessing 
model eligibility, negative controls, and leakage checks 

Figure source data:

- `figuredata/` — frozen tables behind Figures 2–5, with a figure-to-data map
  in `figuredata/README.md`. The plotting scripts are not distributed.

Cross-domain summary files:

- `tox21nrartriagesummary.csv` — NR-AR triage counts and low-score tier
  (scaffold and cluster-out splits, HistGB and ExtraTrees).
- `tox21nrertriagesummary.csv` — NR-ER equivalents.
- `task1ranking.csv`, `task2probabilityreliability.csv`,
  `task3decisionutility.csv` — NASA MDP cross-project results.

Frozen predictions:

- `predictions/predictionscores388.csv` — calibrated scores, labels, locked
  thresholds, triage categories, and uncertainty fields for the 388-compound
  external cohort and the scaffold, temporal, and cluster-out settings.
  `code/reproducemaintables.py` recomputes Tables 1-4 from this file.
