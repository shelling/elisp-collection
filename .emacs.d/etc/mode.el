;; mode.el
;;

(add-to-list
 'load-path
 (expand-file-name "~/.emacs.d/mode/"))

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

(autoload
  'yaml-mode
  "yaml-mode"
  "YAML Major Mode"
  t)

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

(autoload
  'puppet-mode
  "puppet-mode"
  "Puppet Major Mode"
  t)

(autoload
  'scss-mode
  "scss-mode"
  "SCSS Major Mode"
  t)

(autoload
  'haml-mode
  "haml-mode"
  "HAML Major Mode"
  t)
