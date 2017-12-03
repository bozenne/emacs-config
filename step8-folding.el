;;; orgmode start files with folding 
(setq org-startup-folded "content")

;;; folding package

(use-package folding :ensure t)
(use-package folding-dwim :ensure t)

(folding-add-to-marks-list 'mediawiki-mode "<!-- {{{" "<!-- }}}" t)
(folding-add-to-marks-list 'ess-mode "## {{{" "## }}}" t)
(folding-add-to-marks-list 'latex-mode "% {{{" "% }}}" t)
(folding-add-to-marks-list 'c-mode "// {{{" "// }}}" t)
(folding-add-to-marks-list 'muse-mode "; {{{" "; }}}" t)
(folding-add-to-marks-list 'ESS-mode "## {{{" "## }}}" nil t)
(folding-add-to-marks-list 'css-mode "/* {{{ */" "/* }}} */" nil t)

;;; outline/outshine package
;; ;; http://orgmode.org/worg/org-tutorials/org-outside-org.html
(defvar outline-minor-mode-prefix "\M-#")
;; ;; (require 'outorg) ;; necessary for outshine
(use-package outshine :ensure t)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'picolisp-mode-hook 'outline-minor-mode)
(add-hook 'clojure-mode-hook 'outline-minor-mode)
(add-hook 'ess-mode-hook 'outline-minor-mode)
(add-hook 'ledger-mode-hook 'outline-minor-mode)
(add-hook 'message-mode-hook 'outline-minor-mode)

;; (use-package outline-magic :ensure t) 
;; ;; ;; https://stat.ethz.ch/pipermail/ess-help/2007-June/004140.html
;; ;; ;; (add-hook 'ess-mode-hook
;; ;; ;; 	  '(lambda ()
;; ;; ;; 	     (outline-minor-mode)
;; ;; ;; 	     (setq outline-regexp "### [*]\\{1,8\\} ")
;; ;; ;; 	     (defun outline-level
;; ;; ;; 		 (lambda () (interactive) (cond ((looking-at "^### ") 1)((looking-at "^### ") 2)((looking-at "^###") 3) (t 1000)))

;; ;; ;; 	       )
;; ;; ;; 	     ))
