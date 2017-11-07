;;; Pretty fontification of source code blocks
;; needs to be defined before requiring Org (http://orgmode.org/worg/org-contrib/babel/examples/fontify-src-code-blocks.html)
(defface org-block-begin-line
  '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#FFFFEA")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
  "Face used for the line delimiting the end of source blocks.")

;;; packages
;; IMPORTANT NOTE:
;; this org-plus-contrib seems necessary to obtain correct export 
;; from orgmode to latex 
;; i.e. #BEGIN_EXPORT latex do not export \begin{export}
;;      and <l returns #BEGIN_EXPORT latex and not #BEGIN_LaTeX
;; I have met issue on windows when installing the package this is why it is put in the config
;; originally emacs-genome was using the following code:
;; (use-package org
;;    :ensure org-plus-contrib ;; ensure org's devel
;;    :pin org
;;    :config
;; )
(add-to-list 'load-path (expand-file-name "packages/org-plus-contrib" path-emacs-config))
;; (use-package org)
(use-package org ;; from https://www.reddit.com/r/emacs/comments/5avfin/symbols_function_definition_is_void/
  :ensure org-plus-contrib
  :config
  (org-reload)
  ;; rest of my config
  )

(use-package org-snps)
(use-package org-structure-snps)

(use-package org-capture)
(use-package org-agenda)
(use-package org-clock)

;;;; dynamic reference (e.g. citep:xx)
(use-package org-ref :ensure t)
(use-package org-ref-snps)

;;;; enable new class
(use-package org-latex)
(use-package ox-latex)
(use-package ox-beamer)
(use-package ox-bibtex)

;;;; export to markdown
(use-package ox-md)
(add-to-list 'load-path (expand-file-name "packages/orgmode-accessories" path-emacs-config))
(require 'ox-ravel)

;;; enable to execute languages in orgmode
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

;;; options
(setq org-babel-hash-show-time t)
(setq org-export-babel-evaluate t)
(add-to-list 'org-babel-default-header-args '(:eval . "never-export"))
(add-to-list 'org-babel-default-header-args '(:tangle . "yes"))
(add-to-list 'org-babel-tangle-lang-exts '("R" . "R"))
(setq org-export-allow-BIND t)

;; dont ask confirmation before executing block
(setq org-confirm-babel-evaluate nil)

;; highlight latex code in orgmode
(setq org-highlight-latex-and-related '(latex script entities))

;; syntax coloring in SRC blocks
(setq org-src-fontify-natively t)

;; tell org to use listings (instead of verbatim) for source code
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
