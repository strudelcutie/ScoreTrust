#!/usr/bin/env bash
set -euo pipefail

PY="${PYTHON:-python}"

"$PY" -P scripts/00preparetabular.py
"$PY" -P scripts/05trainpredict.py
"$PY" -P scripts/06calibrateandlock.py
"$PY" -P scripts/07conformal.py
"$PY" -P scripts/09metricsandtriage.py
"$PY" -P scripts/13tables42.py

echo "done - see reports/Table_S42_cross_project_generalization.md"
