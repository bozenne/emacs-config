;;; flyspell

;;;; enable spell checking on fly
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 0))))


;;;; spell checking on demand
(dolist (mode '(emacs-lisp-mode-hook
                inferior-lisp-mode-hook))
  (add-hook mode '(lambda () (flyspell-prog-mode)))
  )

;; color for spell checking on demand
(custom-set-faces
 '(flyspell-incorrect ((t (:foreground "#99ff99" :background nil :bold t :underline t))))
 )

;;;; ignore text
(set (make-variable-buffer-local 'ispell-parser) 'tex)


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

;;; ispell
;;;; latex
(add-to-list 'ispell-skip-region-alist '("citep:" . " "))
(add-to-list 'ispell-skip-region-alist '("citet:" . " "))
(add-to-list 'ispell-skip-region-alist '("bibliographystyle:" . " "))
(add-to-list 'ispell-skip-region-alist '("bibliography:" . " "))
(add-to-list 'ispell-skip-region-alist '("bigskip"))
(add-to-list 'ispell-skip-region-alist '("maketitle"))


;;;; orgmode
(add-to-list 'ispell-skip-region-alist '("TODO"))
(add-to-list 'ispell-skip-region-alist '(":noexport:"))
(add-to-list 'ispell-skip-region-alist '("#\\+LaTeX:"))
(add-to-list 'ispell-skip-region-alist '("#\\+LANGUAGE:" . "\n"))
(add-to-list 'ispell-skip-region-alist '("#\\+LATEX_HEADER:" . "\n"))
(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))

;; (add-to-list 'ispell-skip-region-alist '("\\$\\$" . "\\$\\$"))
;; (add-to-list 'ispell-skip-region-alist '("\\\\\(" . "\\\\\)"))
;; (add-to-list 'ispell-skip-region-alist '("\\\\\[" . "\\\\\]"))

;; Never ispell org source blocks:
(add-to-list 'ispell-skip-region-alist '("^#\\+begin_src ". "#\\+end_src$"))
;; Never ispell org source blocks defined in upper case:
(add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC ". "#\\+END_SRC$"))
;; Never ispell org example blocks:
(add-to-list 'ispell-skip-region-alist '("^#\\+begin_example ". "#\\+end_example$"))
(add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_EXAMPLE ". "#\\+END_EXAMPLE$"))
;; Properties block in org do not need to be ispelled
(add-to-list 'ispell-skip-region-alist '("\:PROPERTIES\:$" . "\:END\:$"))
;; Footnoes in org that have http links that are line breaked should not be ispelled:
(add-to-list 'ispell-skip-region-alist '("^http" . "\\]"))
;; Verbatim regions in org mode should not be ispelled:
(add-to-list 'ispell-skip-region-alist '("=" . "="))


;; (eval-after-load "ispell"
  ;; '(let ((list (car ispell-tex-skip-alists)))
     ;; (add-to-list 'list '("\\$" . "\\$"))
     ;; (setcar ispell-tex-skip-alists list)))
