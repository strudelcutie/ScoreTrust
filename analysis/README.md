# Revision analyses

Code and output tables for the three methodological points in the resubmission.
Every path resolves inside this repository; nothing outside it is read.

## Run

```
pip install pandas numpy scikit-learn
python runchecks.py
python runproblem1.py
python runproblem2.py
python runproblem3.py
python runproblem3supp.py
```

Outputs are written to `analysis/outputtables/`, overwriting the committed copies.

## Inputs

| File | Source |
|---|---|
| `analysis/inputs/dilivalidation/*HistGBlockedcalibratedpredictions.csv` | calibration predictions on the DILI validation partitions |
| `results/figuredata/dili/canonical/predictions/histgbpredictions.csv` | DILI held-out test predictions |
| `results/predictions/predictionscores388.csv` | out-of-domain flags for the DILI cohorts |
| `results/predictions/crossdomain/tox21*/predictions/` | Tox21 test, validation and applicability-domain files |
| `results/predictions/crossdomain/nasa/predictions/` | NASA test, validation and applicability-domain files |

The published locked parameters for all 12 settings are constants in `core.CONFIG`,
so no external threshold tables are needed.

## Environment variables

`DILITRUST_DATA` points at a different checkout of this repository.
`DILITRUST_OUT` changes the output directory.

## What each script tests

| Script | Question | Tables |
|---|---|---|
| `runchecks.py` | do the locked parameters reproduce from the validation partitions? | `parameterreproduction.csv` |
| `runproblem1.py` | which low-score groups justify exclusion under prespecified criteria? | `Table5revisedeligibility.csv`, `S8Deligibilitysensitivitygrid.csv` |
| `runproblem2.py` | does separating the calibrator from the conformal quantile change coverage? | `S7Aconformalvalidationseparation.csv`, `S7Bsplitrepeatdistribution.csv` |
| `runproblem3.py` | what does each protocol component contribute? | `S17A` to `S17D` |
| `runproblem3supp.py` | what does each added component buy? | `S17E`, `S17F` |

## Pairing rule in `runproblem2.py`

Each estimator pairs its quantile with a matching test calibration:

- `shared`: quantile and test probabilities from the full validation fit.
- `cross`: quantile from out-of-fold validation scores, test probabilities from the
  full validation fit, the standard cross-conformal construction.
- `split60_median`: for each of 50 repeats the calibrator is fitted on 60% of
  validation, the quantile is read from the remaining 40%, and the test probabilities
  come from that same 60% fit. Every reported metric is the median of the paired
  per-repeat values. The `test_calibrator` column records the pairing.

## Reproduction check

`runchecks.py` rebuilds the quantile, both thresholds and the uncertainty cutoff from
each validation partition and compares them with `core.CONFIG`. The reconstructed
quantile matches the published value to within 0.003, the specificity and sensitivity
thresholds reproduce the published values exactly, and the uncertainty cutoff matches
to four decimals, in all 12 settings. `runproblem3.py` uses the locked parameters for
the calibrated cells and re-derives them only for the uncalibrated ones, so the
all-components-on cell of `S17A` reproduces the high-score and low-score counts of
Table 5 in the main text.
