#!/usr/bin/env bash
set -euo pipefail

SRC="${1:-F:/Tox21 NR-AR/tox21.csv}"
PY="${PYTHON:-python}"

"$PY" -P scripts/01preparenrardata.py "$SRC"
"$PY" -P scripts/02buildsplits.py
"$PY" -P scripts/03features.py
"$PY" -P scripts/04modelready.py
"$PY" -P scripts/05trainpredict.py
"$PY" -P scripts/06calibrateandlock.py
"$PY" -P scripts/07conformal.py
"$PY" -P scripts/08applicabilitydomain.py
"$PY" -P scripts/09metricsandtriage.py
"$PY" -P scripts/10figures.py
"$PY" -P scripts/12calibrationcollapsecheck.py
"$PY" -P scripts/11finalreport.py

echo "done - see reports/FINAL_REPORT_tox21nrarvalidation.md"
