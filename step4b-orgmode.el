;;; orgmode

(use-package org)
(use-package org-capture)
(use-package org-agenda)
(use-package org-clock)

(use-package org-latex) ;; enable new classes 
(use-package ox-latex) ;; enable new classes 
(use-package ox-beamer)
(use-package ox-bibtex)

(setq org-babel-hash-show-time t)
(setq org-export-babel-evaluate t)
(add-to-list 'org-babel-default-header-args '(:eval . "never-export"))
(add-to-list 'org-babel-default-header-args '(:tangle . "yes"))
(add-to-list 'org-babel-tangle-lang-exts '("R" . "R"))

;; enable to execute other languages in orgmode
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
	 (calc . t)
	 (ditaa . t)
	 (R . t)
	 (C . t)
	 (gnuplot . t)
	 (sh . t)
	 (ledger . t)
	 (org . t)
	 (picolisp . t)
	 (clojure . t)
	 (lilypond . t)
	 (plantuml . t)
	 (latex . t)
	 ))
 )

;; dont ask confirmation before executing block
(setq org-confirm-babel-evaluate nil)

;; highlight latex code in orgmode
(eval-after-load 'org
  '(setf org-highlight-latex-and-related '(latex)))

;; automatically indent lists and similar structures of Org buffers 
(setq org-startup-indented t)
;; indent code blocks using TAB
(setq org-src-tab-acts-natively t)

(setq org-todo-keyword-faces
      '(
        ("WAITING" . (:foreground "#666600" :background "#ffffcc" :weight bold)) ;; yellow
        ("INPROGRESS" . (:foreground "#cc3300" :background "#ffcc66" :weight bold)) ;; orange
        ("DELEGATED" . (:foreground "#66004d" :background "#ffccf2" :weight bold)) ;; purple
	("SENT" . (:foreground "blue" :background "#6699ff" :weight bold)) ;; blue
	("BUG" . (:foreground "black" :background "#b3b3b3" :weight bold)) ;; black
	("DONE" . (:foreground "#008000" :background "#99ff99" :weight bold)) ;; green
        )
      )

(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "INPROGRESS" "DELEGATED" "SENT" "BUG" "DONE")))
