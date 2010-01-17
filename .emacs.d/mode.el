;; mode.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/"))
(require 'css-mode)
;; http://www.emacswiki.org/emacs/css-mode.el
(require 'javascript-mode)
;; http://www.emacswiki.org/emacs/JavaScriptMode
(require 'cperl-mode)
;; http://www.emacswiki.org/cgi-bin/wiki/CPerlMode
;; http://cpan.perl.org/misc/emacs/
;; http://math.berkeley.edu/~ilya/software/emacs/
;; http://github.com/jrockway/cperl-mode/tree/master
(require 'sgml-mode)
;; http://shallowsky.com/dotfiles/.emacs-lisp/sgml-mode.el


(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/yaml-mode/"))
(require 'yaml-mode)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/ruby-mode/"))
(require 'ruby-mode)
(require 'ruby-electric)
(require 'inf-ruby)
(require 'ruby-style)
;; http://svn.ruby-lang.org/repos/ruby/trunk/misc/
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/rhtml-mode/"))
(require 'rhtml-mode)
;; http://github.com/eschulte/rhtml


(require 'erlang)
;; http://www.erlang.org/download/contrib/erlang.el

;; provide symbol
(provide 'mode)
