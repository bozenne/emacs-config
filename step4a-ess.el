;;; general

(use-package ess-site  :ensure ess)
(use-package ess-edit)
(setq-default ess-ask-for-ess-directory nil)
(setq-default ess-directory (concat (getenv "HOME") "/R/"))
(setq-default ess-history-directory (concat (getenv "HOME") "/R/"))
(setq-default ess-language "R")
(setq-default ess-dialect "R")

;; set R version ;;
;; (setq-default inferior-R-program-name "C:\\Program Files\\R\\R-3.4.0\\bin\\Rterm.exe")
;; (setq inferior-R-program-name "C:\\Program Files\\R\\R-3.4.0\\bin\\R")
;; (add-hook 'ess-R-post-run-hook 'ess-execute-screen-options)

;; _ is <- in 
(setq ess-smart-S-assign-key "_")
;;(ess-toggle-underscore nil) 

;;; auto completion
;; prevent help in minibuffer about the arguments of a function (fait ramer la cession)
(setq ess-use-eldoc nil)

;; auto completion
;(use-package auto-complete-config :ensure t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")
(ac-config-default)
(auto-complete-mode)
(ac-set-trigger-key "TAB") ;; completion mode triggered by TAB

(use-package ac-R
  :config
  (setq
   ac-trigger-key [(TAB)]
   ac-auto-start nil ;; never start ac automatically
   ))
