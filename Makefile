
PDFS = main.pdf

.PHONY: all clean FORCE

all: main.pdf

%.pdf: %.tex FORCE
	latexrun/latexrun $*

clean:
	latexrun/latexrun --clean-all
	-rm -f $(PDFS)

FORCE:
	