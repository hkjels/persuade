EMACS:="$(shell type -p emacs)"
ORGMODE=--batch --no-init-file --eval "(require 'org)"
LL=ls -1
GREPV=grep -v
RM=rm -rf

SRC:=Readme.org

.PHONY: clean tangle

tangle: $(SRC)
	@$(EMACS) $(ORGMODE) --visit "$<" --funcall org-babel-tangle > /dev/null 2>&1
	@echo "$^ was successfully tangled"

clean:
	$(LL) | $(GREPV) "Readme.org\|Makefile\|.git*\|reveal.js\|LICENSE" | xargs $(RM)
