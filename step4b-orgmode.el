;;; packages

(use-package org)
(use-package org-capture)
(use-package org-agenda)
(use-package org-clock)

(use-package org-latex) ;; enable new classes 
(use-package ox-latex) ;; enable new classes 
(use-package ox-md) ;; communicate with markdown
(add-to-list 'load-path (expand-file-name "packages/orgmode-accessories" path-emacs-config))
(require 'ox-ravel)
(use-package ox-beamer)
(use-package ox-bibtex)

;;; options
(setq org-babel-hash-show-time t)
(setq org-export-babel-evaluate t)
(add-to-list 'org-babel-default-header-args '(:eval . "never-export"))
(add-to-list 'org-babel-default-header-args '(:tangle . "yes"))
(add-to-list 'org-babel-tangle-lang-exts '("R" . "R"))

;; enable to execute other languages in orgmode
(if(string-equal system-type "windows-nt")
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
(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
	 (calc . t)
	 (ditaa . t)
	 (R . t)
	 (C . t)
	 (gnuplot . t)
	 (shell . t)
	 (ledger . t)
	 (org . t)
	 (picolisp . t)
	 (clojure . t)
	 (lilypond . t)
	 (plantuml . t)
	 (latex . t)
	 ))
   )
)

;; dont ask confirmation before executing block
(setq org-confirm-babel-evaluate nil)

;; highlight latex code in orgmode
(eval-after-load 'org
  '(setf org-highlight-latex-and-related '(latex)))

;; ;; tell org to use listings (instead of verbatim) for source code
(setq org-latex-listings t)
;; automatically indent lists and similar structures of Org buffers 
(setq org-startup-indented t)
;; indent code blocks using TAB
(setq org-src-tab-acts-natively t)

;;;; keywords

(setq org-todo-keyword-faces
      '(
        ("WAITING" . (:foreground "#666600" :background "#ffffcc" :weight bold)) ;; yellow
        ("INPROGRESS" . (:foreground "#cc3300" :background "#ffcc66" :weight bold)) ;; orange
        ("DELEGATED" . (:foreground "#66004d" :background "#ffccf2" :weight bold)) ;; purple
	("INACTIVE" . (:foreground "#734d26" :background "#e6ccb3" :weight bold)) ;;brown
	("SENT" . (:foreground "blue" :background "#6699ff" :weight bold)) ;; blue
	("TOBRING" . (:foreground "black" :background "#b3b3b3" :weight bold)) ;; black
	("DONE" . (:foreground "#008000" :background "#99ff99" :weight bold)) ;; green
        )
      )
;; colors
;; https://www.w3schools.com/colors/colors_picker.asp 

(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "INPROGRESS" "DELEGATED" "INACTIVE" "SENT" "TOBRING" "DONE")))