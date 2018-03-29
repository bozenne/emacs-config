;;; Spelling

;;;; enable spell checking on fly
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 0))))


;;;; spell checking on demand
(dolist (mode '(emacs-lisp-mode-hook
                inferior-lisp-mode-hook))
  (add-hook mode '(lambda () (flyspell-prog-mode)))
  )

;;;;; color for spell checking on demand
(custom-set-faces
 '(flyspell-incorrect ((t (:background nil :bold t :underline t))))
 )

;; (setq ispell-dictionary-alist
;;  '(("english"  
;;   "[A-Za-z]" "[^A-Za-z]" "[---']" nil "-B")
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

;; original
;; ((nil "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-B") nil utf-8)
 ;; ("francais-tex" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_FR") nil utf-8)
 ;; ("francais7" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_FR") nil utf-8)
 ;; ("suisse" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_CH") nil utf-8)
 ;; ("suisse-sml" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_CH-40") nil utf-8)
 ;; ("suisse-med" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_CH-60") nil utf-8)
 ;; ("suisse-lrg" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_CH-80") nil utf-8)
 ;; ("suisse-80" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_CH-80") nil utf-8)
 ;; ("suisse-60" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_CH-60") nil utf8)
 ;; ("suisse-40" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_CH-40") nil utf-8)
 ;; ("french" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_FR") nil utf-8)
 ;; ("french-sml" "[[:alpha:]]" "[^[:alpha:]]" "['.-]" t ("-d" "fr_FR-40") nil utf-8)
 ;; ...)

;; skip regions with org code or code chunk
(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
