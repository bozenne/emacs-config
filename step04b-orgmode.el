;; Pretty fontification of source code blocks
;; needs to be defined before requiring Org (http://orgmode.org/worg/org-contrib/babel/examples/fontify-src-code-blocks.html)
(defface org-block-begin-line		;
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
;; (add-to-list 'load-path (expand-file-name "packages/org-plus-contrib" path-emacs-config))
(use-package org)
(use-package org-agenda)
(use-package org-clock)

;;;; dynamic reference (e.g. citep:xx)
(use-package org-ref :ensure t)

;;;; figure labels
;; setting variable org-latex-prefer-user-labels
;; will mâle the exporter export
;; #+NAME: fig:1 and #+LABEL: fig:1
;; to \label{fig:1} instead of \label{orgparagraph1}
(setq org-latex-prefer-user-labels t)

;;;; export to latex
(use-package ox-latex)

;;;; export to beamer
(use-package ox-beamer)

;;;; export to markdown
(use-package ox-md)
;; (add-to-list 'load-path (expand-file-name "packages/orgmode-accessories" path-emacs-config))
;; (require 'ox-ravel)

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

;;; keywords


(setq org-todo-keyword-faces
      '(
        ("TOBRING" . (:foreground "#cc0000" :background "#ffb3b3" :weight bold)) ;; red
        ("TOSEND" . (:foreground "#cc0000" :background "#ffb3b3" :weight bold)) ;; red
        ("TODO" . (:foreground "#cc0000" :background "#ffb3b3" :weight bold)) ;; red

	("WAITING" . (:foreground "#666600" :background "#ffffcc" :weight bold)) ;; yellow
        ("INPROGRESS" . (:foreground "#cc3300" :background "#ffcc66" :weight bold)) ;; orange
        ("DELEGATED" . (:foreground "#66004d" :background "#ffccf2" :weight bold)) ;; purple
	("INACTIVE" . (:foreground "#734d26" :background "#e6ccb3" :weight bold)) ;;brown

	("SENT" . (:foreground "blue" :background "#6699ff" :weight bold)) ;; blue
	("DONE" . (:foreground "#008000" :background "#99ff99" :weight bold)) ;; green

	("TASK" . (:foreground "#000000" :background "#b3b3b3" :weight bold)) ;; black
	("EVENT" . (:foreground "#000000" :background "#b3b3b3" :weight bold)) ;; black
	("METTING" . (:foreground "#000000" :background "#b3b3b3" :weight bold)) ;; black
        )
      )
;; colors
;; https://www.w3schools.com/colors/colors_picker.asp 

;; NOTE: the keywords needs to be written in org-todo-keywords to be active
(setq org-todo-keywords
      '((sequence "TODO" "WAITING" "INPROGRESS" "DELEGATED" "INACTIVE" "DONE")
	(sequence "TOBRING" "DONE")
	(sequence "TOSEND" "SENT" "DONE")
	(sequence "TASK")
	(sequence "EVENT")
	(sequence "MEETING")
	))

(setq org-tags-exclude-from-inheritance '("prj")
      org-stuck-projects '("+prj/DONE"
                           ("TODO" "TASK") ()))



;;; manage tasks
;; If you want to keep track of stuck projects you should tag your
;; projects with :prj:, and define:

(setq org-tags-exclude-from-inheritance '("prj")
      org-stuck-projects '("+prj/-MAYBE-DONE"
                           ("TODO" "TASK") ()))

;; Define a tag that marks TASK entries as yours:

(setq org-sec-me user-full-name)

;; Finally, you add the special views to your org-agenda-custom-commands:

(setq org-agenda-custom-commands
      '(("h" "Work todos" tags-todo
         "-personal-doat={.+}-dowith={.+}/!-TASK"
         ((org-agenda-todo-ignore-scheduled t)))
        ("H" "All work todos" tags-todo "-personal/!-TASK-MAYBE"
         ((org-agenda-todo-ignore-scheduled nil)))
        ("A" "Work todos with doat or dowith" tags-todo
         "-personal+doat={.+}|dowith={.+}/!-TASK"
         ((org-agenda-todo-ignore-scheduled nil)))
        ("j" "TODO dowith and TASK with"
         ((org-sec-with-view "TODO dowith")
          (org-sec-where-view "TODO doat")
          (org-sec-assigned-with-view "TASK with")
          (org-sec-stuck-with-view "STUCK with")))
        ("J" "Interactive TODO dowith and TASK with"
         ((org-sec-who-view "TODO dowith"))))
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

;;; link with latex
;; https://github.com/jkitchin/org-ref/blob/master/org-ref.org (section latex export)
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

;; file that are automatically removed at the end of the compilation
;; do not remove .bbl because needed when submitting latex files to arXiv
;; do not remove .aux  because needed when using the xr package to refer to external tex file
(setq org-latex-logfiles-extensions (quote ("bcf" "blg" "soc" "fdb_latexmk" "fff" "fls" "figlist" "idx" "lof" "nav" "out" "ptc" "run.xml")))

;;; export *txt* as bold instead of alert
;; https://orgmode.org/worg/exporters/beamer/ox-beamer.html#export-filters
(defun my-beamer-bold (contents backend info)
  (when (eq backend 'beamer)
    (replace-regexp-in-string "\\`\\\\[A-Za-z0-9]+" "\\\\textbf" contents)))

(add-to-list 'org-export-filter-bold-functions 'my-beamer-bold)

;;; lisp
(org-babel-do-load-languages 'org-babel-load-languages '((lisp . t)))


