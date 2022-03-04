CONFIGPATH = ~/.config
HOMEPATH = ~/
LINKCMD = ln -s

FILES_TO_HOME = zshrc zshenv zprofile
FILES_TO_CONFIG = ranger
ALL = ${FILES_TO_HOME} ${FILES_TO_CONFIG}

.SILENT:
.PHONY: ${ALL}

install: ${ALL}

${FILES_TO_CONFIG}:
	@echo "${CURDIR}/$@ -> ${CONFIGPATH}/$@"
	${LINKCMD} ${CURDIR}/$@ -> ${CONFIGPATH}/$@

${FILES_TO_HOME}:
	@echo "${CURDIR}/$@ -> ${HOMEPATH}.$@"
	${LINKCMD} ${CURDIR}/$@  ${HOMEPATH}/$@
