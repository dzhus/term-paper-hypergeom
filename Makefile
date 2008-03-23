export ROOT := $(abspath .)

export DOCDIR := ${ROOT}/doc

.PHONY: doc clean

doc:
	${MAKE} -C ${DOCDIR} doc

clean:
	@rm -frv `hg status --unknown --no-status`