
PDFS = main.pdf

.PHONY: all clean presentation FORCE

all: main.pdf

%.pdf: %.tex FORCE
	../latexrun/latexrun $*

races.tex: src/races.dat src/results.gp
	src/results.gp

clean:
	../latexrun/latexrun --clean-all
	-rm -f $(PDFS)

$(PDFS): races.tex

FORCE:
	