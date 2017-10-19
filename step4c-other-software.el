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
