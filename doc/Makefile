DOCNAME := paper
PDFLATEX := pdflatex --shell-escape
BIBTEX := bibtex8 -B

include ${DOCNAME}-deps.mk

ifneq (${MAKELEVEL}, 0)

.PHONY: doc clean

.SECONDEXPANSION:

# This will make the whole paper rebuild when any included
# illustration changes
*.tkz: %.tkz.tex

${DOCNAME}.aux: ${INCLUDES} ${FIGS} ${DOCNAME}.tex ${DOCNAME}.bib
	${PDFLATEX} ${DOCNAME}
	${BIBTEX} ${DOCNAME}

${DOCNAME}.pdf: ${DOCNAME}.aux
	${PDFLATEX} ${DOCNAME}
	${PDFLATEX} ${DOCNAME}

${DOCNAME}-deps.mk: ${DOCNAME}.tex ${INCLUDES}
	texdepend -o $@ -print=if $<

doc: ${DOCNAME}.pdf

clean:
	@rm -frv `hg status --unknown --no-status`

endif