
PDFS = main.pdf
INPUT_TEXS = \
	include/preambule.tex\
	include/title.tex\
	parts/Annotation.tex\
	parts/Appendix.tex\
	parts/Chapter0.tex\
	parts/Chapter1.tex\
	parts/Chapter2.tex\
	parts/Chapter3.tex\
	parts/Chapter4.tex\
	parts/Chapter5.tex

.PHONY: all clean

all: main.pdf

%.pdf: %.tex
	latexrun/latexrun $*

main.pdf: $(INPUT_TEXS)

clean:
	latexrun/latexrun --clean-all
	-rm -f $(PDFS)
