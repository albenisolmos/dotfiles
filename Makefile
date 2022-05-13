HOMEPATH = ~/
CONFIGPATH = $(HOMEPATH).config
LINKCMD = ln -fs

FILES_TO_HOME = tmux.conf xprofile zshrc zshenv
FILES_TO_CONFIG = zsh nvim lf
ALL = $(FILES_TO_HOME) $(FILES_TO_CONFIG)

.SILENT:
.PHONY: $(ALL)

install: $(ALL)

$(FILES_TO_CONFIG):
	@echo "$(CURDIR)/$@ -> $(CONFIGPATH)/$@"
	$(LINKCMD) $(CURDIR)/$@ $(CONFIGPATH)/$@

$(FILES_TO_HOME):
	@echo "$(CURDIR)/$@ -> $(HOMEPATH).$@"
	$(LINKCMD) $(CURDIR)/$@  $(HOMEPATH).$@
