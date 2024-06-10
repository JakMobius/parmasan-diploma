cd "$(dirname "$0")"

for fig in tikzpictures/races.tex; do
  export INPUT_IMAGE="$fig"
  pdflatex fig-extractor.tex "$fig.pdf"
  pdfcrop "fig-extractor.pdf" "$fig.pdf"
  rm fig-extractor.pdf
done