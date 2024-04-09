TEXMF-EXTRA = $(realpath $(PWD)/texmf)
export TEXINPUTS = $(TEXMF-EXTRA)//:
export TEXMFVAR = $(TEXMF-EXTRA)
export TEXMFCONFIG = $(TEXMF-EXTRA)/config
HACKMAP-LOG = $(TEXMFVAR)/web2c/updmap.log

PROJNAME=parmasan

PDFS = $(PROJNAME).pdf $(PROJNAME)-handout.pdf

.PHONY: all handout docker clean

all: $(PROJNAME).pdf

handout: $(PROJNAME)-handout.pdf

fmt.out/%.fmt: %.tex
	mkdir -p fmt.out
	pdflatex -ini -output-directory=fmt.out -jobname=$* "&pdflatex" mylatexformat.ltx $<

races.pdf: src/races.dat src/results.gp
	src/results.gp

$(PDFS): %: $(HACKMAP-LOG) races.pdf \
	fmt.out/fmt.fmt \
    logo_RU_basic.png \
    bib.bib \
    $(wildcard src/*)

$(HACKMAP-LOG):
	updmap -user --enable Map Hack.map

$(PROJNAME)-handout.pdf: $(PROJNAME).tex

%.pdf: %.tex
	../latexrun/latexrun $*

clean:
	../latexrun/latexrun --clean-all
	-rm -f $(PDFS) fmt.out

# Recompile on updates to the source file
watch:
	@while true; do inotifywait $(PROJNAME).tex; sleep 0.01; make all; done

# This is an alternative way. To save setting up proper LaTeX environment on
# your system, do the compilation in a Docker container.
docker:
	./compile.sh
