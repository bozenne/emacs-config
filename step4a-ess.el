
;;; general

(use-package ess-site  :ensure ess)
(setq-default ess-ask-for-ess-directory nil)
(setq-default ess-directory (concat (getenv "HOME") "/R/"))
(setq-default ess-history-directory (concat (getenv "HOME") "/R/"))
(setq-default ess-language "R")
(setq-default ess-dialect "R")

;; set R version ;;
;; (setq-default inferior-R-program-name "C:\\Program Files\\R\\R-3.4.0\\bin\\Rterm.exe")
;; (setq inferior-R-program-name "C:\\Program Files\\R\\R-3.4.0\\bin\\R")
;; (add-hook 'ess-R-post-run-hook 'ess-execute-screen-options)

;;; _ is <- in 
(setq ess-smart-S-assign-key "_")
;;(ess-toggle-underscore nil) 


;;; Do not load data or save envir
(setq inferior-R-args "--no-restore-history --no-restore-data --no-save ")

;;; split window
(add-hook 'ess-mode-hook
          (lambda()
            (setq-local split-width-threshold  9999)
            ))

;;; help
;; the help is sent to a new window in html
;; (setq ess-help-own-frame 'one)
;; (setq inferior-ess-r-help-command "help(\"%s\", help_type=\"html\")\n")

;;; debuging
(setq ess-use-tracebug nil)

;;; indent
(add-hook 'ess-mode-hook
          (lambda()
            (setq ess-fancy-comments t)
            ))


;;; auto completion (alternative: companie mode)
;; documentation: https://github.com/auto-complete/auto-complete/blob/master/doc/manual.md#ac-trigger-commands
(use-package auto-complete :ensure t)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")

;; Stop automatic completion
;; (setq ac-auto-start nil)

;; Not to show completion menu automatically
(setq ac-auto-show-menu nil) ;; no show
;; (setq ac-auto-show-menu 1) ;, wait 1s

;; Start completion using TAB
(ac-set-trigger-key "TAB")

;; bind RET to original and TAB to finish completion
(define-key ac-completing-map "\t" 'ac-complete)
(define-key ac-completing-map "\r" nil)

;; Whether or not to expand a common part of whole candidates.
(setq ac-expand-on-auto-complete t)

;; (setq
  ;; ac-auto-start t
  ;; ac-auto-show-menu 0.5
  ;; ac-show-menu-immediately-on-auto-complete t
  ;; ac-delay 0
  ;; ac-dwim t
  ac-dwim-enable t
  ;; ac-use-comphist t)
;; (setq company-auto-complete 'company-explicit-action-p)
;; (define-key ac-mode-map (kbd "TAB") nil)
;; (define-key ac-completing-map (kbd "TAB") nil)
;; (define-key ac-completing-map [tab] nil)
;; (auto-complete-mode)
;; (ac-set-trigger-key "TAB") ;; completion mode triggered by TAB



