DOCNAME := paper

include ${DOCNAME}-deps.mk

ifneq (${MAKELEVEL}, 0)

.PHONY: doc clean

.SECONDEXPANSION:

*.tkz:

${DOCNAME}.aux: ${INCLUDES} ${FIGS} ${DOCNAME}.tex ${DOCNAME}.bib
	pdflatex ${DOCNAME}
	bibtex8 -B ${DOCNAME}

${DOCNAME}.pdf: ${DOCNAME}.aux
	pdflatex ${DOCNAME}
	pdflatex ${DOCNAME}

${DOCNAME}-deps.mk: ${DOCNAME}.tex
	texdepend -o $@ -print=if $<

doc: ${DOCNAME}.pdf

clean:
	@rm -frv `hg status --unknown --no-status`

endif