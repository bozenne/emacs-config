;;; load package
;; (add-hook 'emacs-lisp-mode-hook 'auto-make-header)
;; (use-package header2 :ensure t)
(load-file (expand-file-name "packages/header2.el" path-emacs-config))

;;; configure package as in emacs-genome
(add-hook 'write-file-hooks 'auto-update-file-header)
;; (autoload 'auto-make-header "header2")
(add-hook 'R-mode-hook 'auto-make-header)
;; (add-hook 'org-mode-hook 'auto-make-header)
(setq header-date-format  "%b %e %Y (%R) ")


(defsubst header-end-line ()
  "Insert a divider line."
  (insert (cond (comment-end-p comment-end)
                ((and comment-start (= 1 (length comment-start)))
		 (concat comment-start comment-start "" (make-string 70 (aref "-" 0))))
		;; (make-string 70 (aref comment-start 0)))
		(comment-start-p comment-start comment-start)
		(t (make-string 70 ?\;)))
	  "\n"))
(setq comment-end-p nil)
(setq make-header-hook '(
                         ;;header-mode-line
                         header-title
			 header-end-line
                         ;;header-blank
					;header-file-name
					;header-description
                         ;;header-status
                         ;;header-copyright
                         header-author
                         ;;header-maintainer
                         ;;header-blank
                         header-creation-date
                         ;;header-rcs-id
                         header-version
                         ;;header-sccs
			 header-modification-date
			 header-modification-author
			 header-update-count
			 header-end-line
                         ;;header-url
                         ;;header-keywords
                         ;;header-compatibility
                         ;;header-free-software
                         ;;header-blank
                         ;;header-lib-requires
					;header-blank
					;header-end-line
                         header-commentary
                         ;;header-blank
                         ;;header-blank
                         ;;header-blank
                         ;;header-end-line
                         header-history
                         ;;header-rcs-log
                         ;;header-blank
                         ;;header-blank
                         header-end-line
                         ;;header-free-software
                         header-code
                         header-eof
                         ))
