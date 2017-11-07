;;; bibliography

(use-package gscholar-bibtex :ensure t)
(setq gscholar-bibtex-default-source "Google Scholar")

;;; C++
(define-key c++-mode-map (kbd "\M-q") 'indent-region)

;;; docview
;; continuous scrolling over pages in doc view
(setq doc-view-continuous t)

;;; git and github
(use-package magit :ensure t)

(if window-system
    (setenv "GIT_ASKPASS" "git-gui--askpass")
  ;; solve issue with magit on windows system when pushing
  ;; https://github.com/magit/magit/wiki/Pushing-with-Magit-from-Windows
)

;;; latex
(use-package tex-site :ensure auctex)
(use-package latex-snps)

;;;; LaTeX mode hook
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	     (LaTeX-math-mode)
	     (TeX-source-correlate-mode)
	     (setq TeX-master t)
	     (TeX-PDF-mode t)
	     (define-key LaTeX-mode-map "\C-ce" 'TeX-next-error)
	     )
	  )

;;;; TeX shell and master and custom 
(setq TeX-shell "/bin/bash")
(setq-default TeX-master nil) ; Query for master file.
(setq TeX-parse-self t) 
(setq TeX-auto-save t)
(setq TeX-file-extensions
      '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))
(setq reftex-try-all-extensions t)
;;}}}
;;{{{ reftex
(autoload 'reftex-mode    "reftex" "RefTeX Minor Mode" t) 
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil) 
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-file-extensions '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))


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

