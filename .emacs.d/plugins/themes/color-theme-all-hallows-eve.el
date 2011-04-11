(eval-when-compile
  (require 'color-theme))

(defun color-theme-all-hallows-eve ()
  "Color theme by Joshua Peek, based off the TextMate All Hallow's Eve theme, created 2009-01-31."
  (interactive)
  (color-theme-install
   '(color-theme-all-hallows-eve
     ; Text base
     ; ((foreground-color . "white")
     ; (background-color . "#434242")
     ; (background-mode . dark))

     ; Source
     ((foreground-color . "white")
      (background-color . "black")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "white"))

     (all-hallows-eve-default ((t (:foreground "#FFFFFF" :background "#000000"))))
     (all-hallows-eve-selection ((t (:background "#72597e"))))
     (all-hallows-eve-text ((t (:foreground "#FFFFFF" :background "#434242"))))
     (all-hallows-eve-source ((t (:foreground "#FFFFFF" :background "#000000"))))
     (all-hallows-eve-comment ((t (:foreground "#9933CC"))))
     (all-hallows-eve-constant ((t (:foreground "#3387CC"))))
     (all-hallows-eve-keyword ((t (:foreground "#CC7833"))))
     (all-hallows-eve-meta-preprocessor-c ((t (:foreground "#D0D0FF"))))
     (all-hallows-eve-keyword-control-import ((t (nil))))
     (all-hallows-eve-entity-name-function ((t (nil))))
     (all-hallows-eve-variable-parameter ((t (:italic t))))
     (all-hallows-eve-comment-block ((t (:foreground "#FFFFFF" :background "#9B9B9B"))))
     (all-hallows-eve-string ((t (:foreground "#66CC33"))))
     (all-hallows-eve-string-constant-character-escape ((t (:foreground "#AAAAAA"))))
     (all-hallows-eve-string-interpolated ((t (:foreground "#000000" :background "#CCCC33"))))
     (all-hallows-eve-string-regexp ((t (:foreground "#CCCC33"))))
     (all-hallows-eve-string-literal ((t (:foreground "#CCCC33"))))
     (all-hallows-eve-string-interpolated-constant-character-escape ((t (:foreground "#555555"))))
     (all-hallows-eve-entity-name-type ((t (:underline t))))
     (all-hallows-eve-entity-other-inherited-class ((t (:italic t :underline t))))
     (all-hallows-eve-entity-name-tag ((t (:underline t))))
     (all-hallows-eve-entity-other-attribute-name ((t (nil))))
     (all-hallows-eve-support-function ((t (:foreground "#C83730"))))

     (default ((t (:inherit all-hallows-eve-default))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (italic ((t (:italic t))))
     (underline ((t (:underline t))))

     (fringe ((t (:background "#121212"))))
     (modeline ((t (:background "#eeeeee" :foreground "black"))))

     (highlight ((t (:background "#72597e"))))
     (region ((t (:foreground "#888888" :background "#72597e"))))

     (font-lock-builtin-face ((t (:foreground "red")))) ; TODO
     (font-lock-comment-face ((t (:inherit all-hallows-eve-comment))))
     (font-lock-comment-delimiter-face ((t (:inherit all-hallows-eve-comment))))
     (font-lock-constant-face ((t (:inherit all-hallows-eve-constant))))
     (font-lock-doc-face ((t (:foreground "red")))) ; TODO
     (font-lock-function-name-face ((t (:inherit all-hallows-eve-entity-name-function))))
     (font-lock-keyword-face ((t (:inherit all-hallows-eve-keyword))))
     (font-lock-preprocessor-face ((t (:inherit all-hallows-eve-meta-preprocessor-c))))
     (font-lock-reference-face ((t (:foreground "red")))) ; TODO
     (font-lock-string-face ((t (:inherit all-hallows-eve-string))))
     (font-lock-type-face ((t (:inherit all-hallows-eve-entity-name-type))))
     (font-lock-variable-name-face ((t (:inheirt all-hallows-eve-source))))
     (font-lock-warning-face ((t (:foreground "red")))) ; TODO
     (font-lock-syntactic-keywords ((t (:inherit all-hallows-eve-keyword)))))))
