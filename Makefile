
FILES=.emacs .emacs.d .emacs_bash

.PHONY: all 

all:
	for file in ${FILES}; do \
		ln -s ${PWD}/$${file} ${HOME}/$${file}; \
	done;

########ln -s ${PWD}/.emacs ${HOME}/.emacs
########ln -s ${PWD}/.emacs.d ${HOME}/.emacs.d
########ln -s ${PWD}/.emacs_bash ${HOME}/.emacs_bash

