#!/usr/bin/env bash
# Render the CV.
#   ./render.sh                 -> public HTML + PDF (no phone), what GitHub Pages serves
#   ./render.sh private FILE    -> private PDF using contact details in FILE (_quarto-private.yml kept outside the repo)
set -euo pipefail
cd "$(dirname "$0")"
if [[ "${1:-}" == "private" ]]; then
  cp "${2:?path to _quarto-private.yml}" _quarto-private.yml
  trap 'rm -f _quarto-private.yml' EXIT
  quarto render CV.qmd --profile private --to pdf -o davide-luzzini-cv-private.pdf
else
  quarto render CV.qmd
fi
