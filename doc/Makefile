DOCNAME := paper

include ${DOCNAME}-deps.mk

ifneq (${MAKELEVEL}, 0)

.PHONY: doc clean

.SECONDEXPANSION:

*.tkz: %.tkz.tex

klein-arch-path.tex: ${SRCDIR}/klein-arch-spiral.scm
	guile $< > $@

${DOCNAME}.aux: ${INCLUDES} ${FIGS} ${DOCNAME}.tex ${DOCNAME}.bib
	pdflatex --shell-escape ${DOCNAME}
	bibtex8 -B ${DOCNAME}

${DOCNAME}.pdf: ${DOCNAME}.aux
	pdflatex --shell-escape ${DOCNAME}
	pdflatex --shell-escape ${DOCNAME}

${DOCNAME}-deps.mk: ${DOCNAME}.tex ${INCLUDES}
	texdepend -o $@ -print=if $<

doc: ${DOCNAME}.pdf

clean:
	@rm -frv `hg status --unknown --no-status`

endif