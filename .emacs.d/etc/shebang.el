(defun insert-shebang-perl ()
  (interactive)
  (insert "#!/usr/bin/env perl\n#-*- mode: cperl -*-\n\nuse warnings;\nuse strict;\n\n"))

(defun insert-shebang-ruby ()
  (interactive)
  (insert "#!/usr/bin/env ruby\n#-*- mode: ruby -*-\n\nrequire 'rubygems'\n\n"))

(defun insert-shebang-python ()
  (interactive)
  (insert "#!/usr/bin/env python\n#-*- mode: python -*-\n\n"))

