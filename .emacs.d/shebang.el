(defun insert-shebang-perl ()
  (interactive)
  (insert "#!/usr/bin/env perl\n\nuse warnings;\nuse strict;\n\n"))

(defun insert-shebang-ruby ()
  (interactive)
  (insert "#!/usr/bin/env ruby\n\nrequire 'rubygems'\n\n"))

(defun insert-shebang-python ()
  (interactive)
  (insert "#!/usr/bin/env python\n\n"))

(provide 'shebang)
