;; mode.el
;;

(add-to-list
 'load-path
 (expand-file-name "~/.emacs.d/mode/"))

(autoload 
  'css-mode
  "css-mode" 
  "http://www.emacswiki.org/emacs/css-mode.el"
  t)

(autoload 
  'javascript-mode
  "javascript-mode" 
  "http://www.emacswiki.org/emacs/JavaScriptMode"
  t)

(autoload
  'cperl-mode
  "cperl-mode"
  nil
  t)

(autoload 
  'sgml-mode
  "sgml-mode" 
  nil
  t)

(autoload
  'applescript-mode
  "applescript-mode"
  "http://github.com/ieure/applescript-mode"
  t)

(autoload
  'erlang-mode
  "erlang"
  "http://www.erlang.org/download/contrib/erlang.el"
  t)

(add-to-list
 'load-path
 (expand-file-name "~/.emacs.d/mode/yaml-mode/"))
(autoload
  'yaml-mode
  "yaml-mode"
  "YAML Major Mode"
  t)

(add-to-list
 'load-path
 (expand-file-name "~/.emacs.d/mode/ruby-mode/"))
(autoload
  'ruby-mode
  "ruby-mode"
  nil
  t)

(add-to-list
 'load-path
 (expand-file-name "~/.emacs.d/mode/rhtml-mode/"))
(autoload
  'rhtml-mode
  "rhtml-mode" 
  "http://github.com/eschulte/rhtml"
  t)

;; provide symbol
(provide 'mode)
