;;; orgmode start files with folding 
(setq org-startup-folded "content")

;;; folding package
(use-package folding :ensure t)

(folding-add-to-marks-list 'mediawiki-mode "<!-- {{{" "<!-- }}}" t)
(folding-add-to-marks-list 'ess-mode "# {{{" "# }}}" t)
(folding-add-to-marks-list 'latex-mode "% {{{" "% }}}" t)
(folding-add-to-marks-list 'c-mode "// {{{" "// }}}" t)
(folding-add-to-marks-list 'muse-mode "; {{{" "; }}}" t)
(folding-add-to-marks-list 'python-mode "# {{{" "# }}}" nil t)
(folding-add-to-marks-list 'css-mode "/* {{{ */" "/* }}} */" nil t)

;;; outline/outshine package
;; ;; http://orgmode.org/worg/org-tutorials/org-outside-org.html
(defvar outline-minor-mode-prefix "\M-#")
;; ;; (require 'outorg) ;; necessary for outshine
(use-package outshine :ensure t)
(add-hook 'outline-minor-mode-hook 'outshine-mode)
(add-hook 'emacs-lisp-mode-hook 'outline-minor-mode)
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'picolisp-mode-hook 'outline-minor-mode)
(add-hook 'clojure-mode-hook 'outline-minor-mode)
(add-hook 'ess-mode-hook 'outline-minor-mode)
(add-hook 'ledger-mode-hook 'outline-minor-mode)
(add-hook 'message-mode-hook 'outline-minor-mode)
(add-hook 'c++-mode-hook 'outline-minor-mode)
(add-hook 'c-mode-hook 'outline-minor-mode)
(add-hook 'python-mode-hook 'outline-minor-mode)

(use-package outline-magic :ensure t) 

;; (add-hook 'ess-mode-hook
;; '(lambda ()
;; (auto-complete-mode nil)
;; (outline-minor-mode 1)
;; (setq outline-regexp "\\(^#\\{4,6\\}\\)\\|\\(^[a-zA-Z0-9_\.]+ ?<- ?function(.*{\\)")
;; (setq outline-heading-alist
;; '(("###" . 1) ("###" . 2) ("###" . 3)
;; ("^[a-zA-Z0-9_\.]+ ?<- ?function(.*{" .4)))))


;; possible solution
;; ;; add 
;; ;; ### Local Variables:
;; ;; ### eval: (orgstruct-mode 1)
;; ;; ### orgstruct-heading-prefix-regexp: "### "
;; ;; ### End:
;; ;; at the end of the R files

;; ;; issues: anoying to have to add emacs code in R files - might be possible to solve it using (add-hook 'message-mode-hook 'turn-on-orgstruct)
;; ;;         does not match outline shorcuts 

;;; documentation
;; https://stat.ethz.ch/pipermail/ess-help/2007-June/004140.html
;; https://stackoverflow.com/questions/14941429/structuring-a-statistical-analysis-with-r-using-emacs-ess
;; https://www.emacswiki.org/emacs/FoldingMode


(use-package yasnippet)
(yas-global-mode 1)
(yas/initialize)
;; Make TAB the yas trigger key in the org-mode-hook and enable flyspell mode and autofill                                                                     
(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet                                                        
            (make-variable-buffer-local 'yas/trigger-key)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)
            ;; flyspell mode for spell checking everywhere                      
;;            (flyspell-mode 1)                                                 
            ;; auto-fill mode on                                                
            (auto-fill-mode 1)))
