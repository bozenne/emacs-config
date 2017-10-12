;;; bibliography

(use-package gscholar-bibtex :ensure t)
(setq gscholar-bibtex-default-source "Google Scholar")
;;; C++
(define-key c++-mode-map (kbd "\M-q") 'indent-region)

;;; docview
;; continuous scrolling over pages in doc view
(setq doc-view-continuous t)

;;; git
;;(use-package git-emacs :ensure t)
(use-package magit :ensure t)

;; https://www.masteringemacs.org/article/introduction-magit-emacs-mode-git
;; https://magit.vc/manual/magit/Getting-started.html

;;; github

(use-package magithub
  :after magit
  :ensure t
  :config (magithub-feature-autoinject t))

;;; latex


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

;; dont ask confirmation before executing block
(setq org-confirm-babel-evaluate nil)

;; highlight latex code in orgmode
(eval-after-load 'org
  '(setf org-highlight-latex-and-related '(latex)))

;; automatically indent lists and similar structures of Org buffers 
(setq org-startup-indented t)
;; indent code blocks using TAB
(setq org-src-tab-acts-natively t)

;;; stan
(use-package stan-mode :ensure t)
(use-package stan-snippets :ensure t)
(add-hook 'stan-mode-hook '(lambda () (yas-minor-mode)))

;;; Unison

;(custom-set-variables' (superman-unison-cmd "unison"))
;(custom-set-variables' (superman-unison-switches "\"-ignore \"Regex .*(~|te?mp|rda)$\" -ignore \"Regex ^(\\.|#).*\""))


;;; putty
(use-package tramp :ensure t)
(setq tramp-default-method "plink")

;; http://etherealmind.com/putty-command-line/
;; putty.exe -load Biostat_Bayes
;; ok but open a new window outside emacs.

;; solution: plink
;; check that plink is installed: plink -V
;; start plink: plink -v Biostat_Bayes
;; disconnect: exit
;; C-x C-f /remotehost:Biostat_Bayes

