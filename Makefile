

.PHONY: all update install

all:
	@echo "all action"

update:
	rm -rf ./.emacs*
	cp ~/.emacs ./
	cp -r ~/.emacs.d ./
	cp ~/.emacs_bash ./
install:
	@echo "install"
