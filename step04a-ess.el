
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
;;  ess-cycle-assign for cycle between <- <<- =
(define-key ess-r-mode-map ";" 'ess-insert-assign)
(define-key inferior-ess-r-mode-map ";" 'ess-insert-assign)

;;; Do not load data or save envir
(setq inferior-R-args "--no-restore-history --no-restore-data --no-save ")

;;; Unique naming of R buffers
;; https://stackoverflow.com/questions/4504244/how-can-i-switch-between-r-sessions-in-emacs-ess
;; *R* instead of *R:mydirectory*
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; split window
(add-hook 'ess-mode-hook
          (lambda()
            (setq-local split-width-threshold  9999)
            ))

;;(setq display-buffer-alist
;;      '(("^\\*R"
;;         (display-buffer-reuse-window display-buffer-pop-up-frame)
;;         (reusable-frames . 0))))
(setq display-buffer-alist
      '(("^\\*R" . ((display-buffer-same-window) (inhibit-same-window . nil)))
        ("\\.R$" . ((display-buffer-same-window) (inhibit-same-window . nil)))))


;;; help
;; the help is sent to a new window in html
;; (setq ess-help-own-frame 'one)
;; (setq inferior-ess-r-help-command "help(\"%s\", help_type=\"html\")\n")

;;; debuging
(setq ess-use-tracebug t)

;;; find function
(use-package imenu-anywhere :ensure t)

;;; indent
(add-hook 'ess-mode-hook
          (lambda()
            (setq ess-fancy-comments t)
            ))

;;; eldoc (display arguments in the minibuffer)
(setq ess-use-eldoc nil) ;; disable eldoc because it slows down emacs too much

;;; previous command
;; recommanded in https://ess.r-project.org/Manual/ess.html
 (eval-after-load "comint"
   '(progn
      (define-key comint-mode-map [up]
        'comint-previous-matching-input-from-input)
      (define-key comint-mode-map [down]
        'comint-next-matching-input-from-input)

      ;; also recommended for ESS use --
      (setq comint-move-point-for-output 'others)
      ;; somewhat extreme, almost disabling writing in *R*, *shell* buffers above prompt:
      (setq comint-scroll-to-bottom-on-input 'this)
      ))

;;; companie mode (alternative: auto completion)

(setq ess-use-auto-complete t)

(use-package company :ensure t)
(setq tab-always-indent 'complete)

(setq company-idle-delay 1
      company-show-numbers nil
      company-minimum-prefix-length 2
      company-tooltip-flip-when-above t)

(global-set-key [C-tab] #'company-complete)
(global-company-mode)

;; documentation: https://github.com/auto-complete/auto-complete/blob/master/doc/manual.md#ac-trigger-commands
;; (use-package auto-complete :ensure t :config (ac-flyspell-workaround))
;; (ac-config-default)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")

;; Stop automatic completion
;; (setq ac-auto-start nil)

;; Not to show completion menu automatically
;; (define-key ac-mode-map [C-tab] 'auto-complete)
;; (define-key ac-completing-map [return] 'nil)
;; (setq ac-quick-help-delay 2)


;; (setq ac-auto-show-menu nil) ;; no show
;; (setq ac-auto-show-menu 1) ;, wait 1s

;; Start completion using TAB
;; (ac-set-trigger-key "TAB")

;; bind RET to original and TAB to finish completion
;; (define-key ac-completing-map "\t" 'ac-complete)
;; (define-key ac-completing-map "\r" nil)

;; Whether or not to expand a common part of whole candidates.
;; (setq ac-expand-on-auto-complete t)

;; (setq
  ;; ac-auto-start t
  ;; ac-auto-show-menu 0.5
  ;; ac-show-menu-immediately-on-auto-complete t
  ;; ac-delay 0
  ;; ac-dwim t
  ;; ac-dwim-enable t
  ;; ac-use-comphist t)
;; (setq company-auto-complete 'company-explicit-action-p)
;; (define-key ac-mode-map (kbd "TAB") nil)
;; (define-key ac-completing-map (kbd "TAB") nil)
;; (define-key ac-completing-map [tab] nil)
;; (auto-complete-mode)
;; (ac-set-trigger-key "TAB") ;; completion mode triggered by TAB



