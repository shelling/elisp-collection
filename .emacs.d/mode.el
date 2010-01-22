;; mode.el
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/"))


(autoload 'css-mode "css-mode.elc" "Major Mode for CSS" t)
;; http://www.emacswiki.org/emacs/css-mode.el


(autoload 'javascript-mode "javascript-mode.elc" "Major Mode for Javascript" t)
;; http://www.emacswiki.org/emacs/JavaScriptMode


(autoload 'cperl-mode "cperl-mode.elc" "New Perl Major Mode" t)
;; http://www.emacswiki.org/cgi-bin/wiki/CPerlMode
;; http://cpan.perl.org/misc/emacs/
;; http://math.berkeley.edu/~ilya/software/emacs/
;; http://github.com/jrockway/cperl-mode/tree/master


(autoload 'sgml-mode "sgml-mode" "SGML Major Mode" t)
;; http://shallowsky.com/dotfiles/.emacs-lisp/sgml-mode.el

(autoload 'applescript-mode "applescript-mode" "Applescript Major Mode" t)
;; http://github.com/ieure/applescript-mode


(autoload 'erlang-mode "erlang" "Major Mode for erlang" t)
;; http://www.erlang.org/download/contrib/erlang.el


(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/yaml-mode/"))
(autoload 'yaml-mode "yaml-mode" "YAML Major Mode" t)


(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/ruby-mode/"))
(require 'ruby-mode)
(require 'ruby-electric)
(require 'inf-ruby)
(require 'ruby-style)
;; http://svn.ruby-lang.org/repos/ruby/trunk/misc/
;;

(add-to-list 'load-path (expand-file-name "~/.emacs.d/mode/rhtml-mode/"))
(autoload 'rhtml-mode "rhtml-mode" "rhtml Major Mode" t)
;; http://github.com/eschulte/rhtml


;; provide symbol
(provide 'mode)
