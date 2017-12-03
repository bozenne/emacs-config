;;; Spelling

;;;; enable spell checking on fly
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))


;;;; spell checking on demand
(dolist (mode '(emacs-lisp-mode-hook
                inferior-lisp-mode-hook))
  (add-hook mode '(lambda () (flyspell-prog-mode)))
  )

;; (setq ispell-dictionary-alist
;;  '(("english"  
;;   "[A-Za-z]" "[^A-Za-z]" "[---']" nil ("-B") nil)
;;  ("francais" 
;;   "[A-Za-zÀÂÇ-ËÎÏÔÙÛÜàâç-ëîïôùûü]" "[^A-Za-zÀÂÇ-ËÎÏÔÙÛÜàâç-ëîïôùûü]"
;;   "[---']" nil ("-n") "~nroff")
;;  ("francais-TeX" 
;;   "[A-Za-zÀÂÇ-ËÎÏÔÙÛÜàâç-ëîïôùûü\\]" "[^A-Za-zÀÂÇ-ËÎÏÔÙÛÜàâç-ëîïôùûü\\]"
;;   "[---'^`\"]" t nil "~tex")
;;  ("dansk" 
;;   "[A-Za-zåÅøØæÆéÉèÈ]" "[^A-Za-zåÅøØæÆéÉèÈ]"
;;   "[---'^`\"]" t nil "~nroff")
;;  ))


;; skip regions with org code or code chunk
(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
