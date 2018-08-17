
;;; google
(use-package google-this :ensure t)
(google-this-mode 1)

;;; bibliography
(use-package gscholar-bibtex :ensure t)
(setq gscholar-bibtex-default-source "Google Scholar")

;;; C++
(use-package cc-mode :ensure t)

;;; docview
;; continuous scrolling over pages in doc view
(setq doc-view-continuous t)
;; ;;; polymode (rmarkdown in r)
;; (require 'poly-R)
;; (require 'poly-markdown)
;; (add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
;; (add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
;; (add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;;; git and github
(use-package magit :ensure t)

(if window-system
    (setenv "GIT_ASKPASS" "git-gui--askpass")
  ;; solve issue with magit on windows system when pushing
  ;; https://github.com/magit/magit/wiki/Pushing-with-Magit-from-Windows
)

;;; latex
(use-package latex)
(use-package tex-site :ensure auctex)

;;;; enable automatic latex compilation when saving
(add-hook 'LaTeX-mode-hook
	  '(lambda ()
	     (add-to-list 'TeX-command-list '("make" "latexmk -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-dvi" "latexmk -pvc -dvi -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-ps"  "latexmk -pvc -ps -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-pdf" "latexmk -pvc -pdf -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-ps2pdf" "latexmk -pvc -pdfps -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-dvi-landscape" "latexmk -pvc -l -dvi -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-ps-landscape" "latexmk  -pvc -l -ps -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-pdf-landscape" "latexmk -pvc -l -pdf -f %t" TeX-run-TeX  nil "nil") t)
	     (add-to-list 'TeX-command-list '("make-ps2pdf-landscape" "latexmk -pvc -l -pdfps -f %t" TeX-run-TeX  nil "nil") t)))

;;;; predictive completion (cannot install!)
;; should be make and make install in the console when being in the predictve repository
;; but I get avl-tree.el:678:1:Warning: the function ‘gv--defsetter’ might not be defined at runtime.
;; In toplevel form:
;; completion-ui-dynamic.el:31:1:Error: Wrong type argument: listp, cons
;; Makefile:149 : la recette pour la cible « completion-ui-dynamic.elc » a échouée
;; make: *** [completion-ui-dynamic.elc] Erreur 1

;; (use-package predictive)
;; (autoload 'predictive-mode "predictive" "predictive" t)
;; (set-default 'predictive-auto-add-to-dict t)

;; (setq predictive-main-dict 'rpg-dictionary
;;       predictive-auto-learn t
;;       predictive-add-to-dict-ask nil
;;       predictive-use-auto-learn-cache nil
;;       predictive-which-dict t)

;; ;;;; LaTeX mode hook
;; (add-hook 'LaTeX-mode-hook
;; 	  '(lambda ()
;; 	     (LaTeX-math-mode)
;; 	     (TeX-source-correlate-mode)
;; 	     (setq TeX-master t)
;; 	     (TeX-PDF-mode t)
;; 	     (define-key LaTeX-mode-map "\C-ce" 'TeX-next-error)
;; 	     )
;; 	  )

;; ;;;; TeX shell and master and custom 
;; (setq TeX-shell "/bin/bash")
;; (setq-default TeX-master nil) ; Query for master file.
;; (setq TeX-parse-self t) 
;; (setq TeX-auto-save t)
;; (setq TeX-file-extensions
;;       '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))
;; (setq reftex-try-all-extensions t)

;; (autoload 'reftex-mode    "reftex" "RefTeX Minor Mode" t) 
;; (autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil) 
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; (setq reftex-plug-into-AUCTeX t)
;; (setq reftex-file-extensions '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))

;;;; latex diff
(use-package latexdiff :ensure t)

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


;;; python
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args "-i")

(use-package elpy :ensure t)
(use-package py-autopep8 :ensure t)

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'ein:connect-mode-hook 'ein:jedi-setup)

(require 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
