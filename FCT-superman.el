;;; genome/indent-paragraph

(defun genome/indent-paragraph ()
  "From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: superman-indent-paragraph
   location  : emacs-genome/snps/eg-utility-snps.el"
  (interactive)
  (cond 
   ((eq major-mode 'org-mode)
    (cond ((string= (car (org-babel-get-src-block-info)) "emacs-lisp")
	   (let* ((info (org-edit-src-find-region-and-lang))
		  (beg  (nth 0 info))
		  (end (nth 1 info)))
	     (narrow-to-region beg end)
	     (emacs-lisp-mode)
	     (indent-region beg end)
	     (org-mode)
	     (widen)))
	  ((string= (car (org-babel-get-src-block-info)) "R")
	   (let ((org-src-preserve-indentation t))
	     (org-edit-special)
	     (indent-region (point-min) (point-max))
	     (org-edit-src-exit)))
	  ;; (let* ((info (org-edit-src-find-region-and-lang))
	  ;; (beg  (nth 0 info))
	  ;; (end (nth 1 info)))
	  ;; (narrow-to-region beg end)
	  ;; (R-mode)
	  ;; (indent-region beg end)
	  ;; (org-mode)
	  ;; (widen)))
	  (t (fill-paragraph))))
   ((eq major-mode 'Rd-mode) nil)
   ((eq major-mode 'bibtex-mode)
    (save-excursion
      (let ((beg (progn (backward-paragraph 1) (point)))
	    (end (progn (forward-paragraph 1)
			(point))))
	(narrow-to-region beg end)
	(bibtex-reformat)
	(widen))))
   ((eq major-mode 'latex-mode)
    (unless (save-excursion
	      (re-search-forward "begin{document}" nil t))
      (LaTeX-fill-paragraph))) ;; in the preamble do nothing
   (t (save-excursion
	(let ((beg (progn (backward-paragraph 1) (point)))
	      (end (progn (forward-paragraph 1)
			  (point))))
	  (unless (string-match "ess-\\|c-\\|c++\\|emacs" (symbol-name major-mode))
	    (fill-region beg end nil nil nil))
	  (when (string-match "ess-\\|c-\||c++\\|emacs" (symbol-name major-mode))
	    (indent-region beg end nil)))))))

;;; genome/yank-or-pop
(defun genome/yank-or-pop (arg)
  "Doc       :Combine `yank' with `yank-pop'.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: yank-or-pop
   Location  : emacs-genome/snps/eg-utility-snps.el"
  (interactive "*p") 
  (if (eq last-command 'yank)
      (yank-pop arg)
    (yank arg))
  nil)

;;; genome/comment-or-uncomment-line-or-region
(defun genome/comment-or-uncomment-line-or-region (&optional arg)
  "Doc       : If region is active comment or uncomment region, see `comment-or-uncomment-region' 
               else comment or uncomment current line. If ARG is non-nil uncomment region or current line.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: comment-or-uncomment-line-or-region
   Location  : emacs-genome/snps/eg-utility-snps.el"  
  (interactive "P")
  (if arg
      (if (region-active-p)
	  (uncomment-region (region-beginning) (region-end))
	(uncomment-region (point-at-bol) (point-at-eol))
	(forward-line))
    (if (region-active-p)
	(comment-or-uncomment-region (region-beginning) (region-end))
      (while (looking-at "^[ \t\n]*$") (forward-line))
      (comment-or-uncomment-region (point-at-bol) (point-at-eol))
      (forward-line))))

;;; genome/uncomment-line-or-region
(defun genome/uncomment-line-or-region ()
  "Doc       : If region is active uncomment the region, else uncomment the current line.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: uncomment-line-or-region
   Location  : emacs-genome/snps/eg-utility-snps.el"  
  (interactive)
  (genome/comment-or-uncomment-line-or-region 1))

;;; genome/ess-edit-indent-call-sophisticatedly

(defun genome/ess-edit-indent-call-sophisticatedly (&optional arg force)
  "Doc       : 
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-indent-call-sophisticatedly
   Location  : emacs-genome/snps/ess-edit.el"  

  (interactive "p")
  (let* ((arg (or arg 1))
	 (fun (genome/ess-edit-read-call arg 'go))
	 (beg (+ (point) 1))
	 (end (progn (forward-sexp) (point)))
	 breaks
	 delete-p)
    ;;	  (eq last-command 'ess-edit-indent-call-sophisticatedly)
    (goto-char beg)
    (while (setq match (re-search-forward "[\"\'{([,]" end t))
      (if (string= (match-string 0) ",")
	  (setq breaks (cons (cons (point)
				   (if (looking-at "[ \t]*\n") t nil)) breaks))
	(if (or (string= (match-string 0) "\"")  (string= (match-string 0) "\'"))
	    (re-search-forward (match-string 0) nil t)
	  (backward-char 1)
	  (forward-sexp))))
    ;; if there are more breaks than half the number of
    ;; arguments then delete breaks else add linebreaks
    (setq delete-p
	  (if force nil
	    (> (length (delete nil (mapcar 'cdr breaks))) (* 0.5 (length breaks)))))
    (while breaks (goto-char (caar breaks))
	   (if delete-p
	       (if (cdar breaks)
		   (delete-region (caar breaks) (+ (point) (skip-chars-forward " \t\n"))))
	     (if (not (cdar breaks))
		 (insert "\n")))
	   (setq breaks (cdr breaks)))
    (goto-char (- beg 1))
    (if (and
	 (eq major-mode 'org-mode)
	 (string= (car (org-babel-get-src-block-info)) "R"))
	(let ((org-src-preserve-indentation t))
	  (org-edit-special)
	  (indent-region (point-min) (point-max))
	  (org-edit-src-exit))
      (ess-indent-exp))))
  ;; (ess-edit-read-call arg 'go)))

;;; genome/ess-edit-read-call [necessary for genome/ess-edit-indent-call-sophisticatedly]
(defun genome/ess-edit-read-call (&optional arg move all)
  "Doc       : Return the name of the R-function call at point as a string. 
               if ARG return name of function call which is ARG function calls above point. 
               if MOVE is non-nil leave point after  opening parentheses of call. 
               If all is non-nil return the full string.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-read-call
   Location  : emacs-genome/snps/ess-edit.el"
  (interactive "p")
  (or arg (setq arg 1))
  (if (< arg 0) (error "Only backward reading of function calls possible."))
  (add-hook 'pre-command-hook 'genome/ess-edit-pre-command-hook)
  ;; assume correct syntax, at least beyond previous paragraph-start 
  (let ((oldpoint (point))
	(lim (save-excursion
	       (backward-paragraph 1) (point)))
	fun beg end)
    ;;move outside comments and quotes first
    (genome/ess-edit-backward-move-out-of-comments lim)
    (genome/ess-edit-backward-move-out-of-quotes)
    ;;what if we are sitting on a function call?
    (if (save-excursion
	  (skip-chars-backward "a-zA-Z0-9.")
	  (looking-at "\\([a-zA-Z0-9.]+\\)\\((\\)"))
	(setq beg (match-beginning 1) end (match-end 1)
	      fun (list (match-string 1))
	      arg (- arg 1)))
    (while
	(and (> arg 0)
	 (re-search-backward "[\"\'()]" lim t)
	 (let ((matchcar (char-before (match-end 0)))
	       matchcall)
	   (if (eq ?\( matchcar)
	       ;; test if sitting on proper function call
	       (if (not (progn
			  (skip-chars-backward "a-zA-Z0-9.")
			  (looking-at "\\([a-zA-Z0-9.]+\\)\\((\\)")))
		   nil
		 (if (string= "\\(if\\|else\\|for\\)"
				   (setq matchcall (match-string 1)))
		     t
		   (setq beg (match-beginning 1) end (match-end 1)
			 fun (append (list matchcall) fun))
		   (if (= arg 1) nil (setq arg (- arg 1)))))
	     ;; skip balanced parentheses or quotes
	     (if (not (= ?\) matchcar))
		 (re-search-backward
		  (char-to-string matchcar) lim t)
	       (condition-case nil 
		   (progn
		     (forward-char 1)
		     (backward-sexp) t)
		 (t (goto-char oldpoint)
		    (message "Point is not in a proper function call or unbalanced parentheses paragraph."))))))))
	 (if (not fun)
	     (progn (goto-char oldpoint)
	     (message "Point is not in a proper function call or unbalanced parentheses in this paragraph."))
	   (genome/ess-edit-highlight 0 beg end)
	   (message (car fun))
	   (goto-char (if move (+ (point) (skip-chars-forward "a-zA-Z0-9."))
			oldpoint))
	   (if all fun (car fun)))))

(defun genome/ess-edit-pre-command-hook ()
  "Doc       : Remove highlighing in both source and help buffers.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-pre-command-hook
   Location  : emacs-genome/snps/ess-edit.el"
  ;; used as pre command hook in *toc* buffer
  (genome/ess-edit-unhighlight 0)
  (genome/ess-edit-unhighlight 1))

(defun genome/ess-edit-backward-move-out-of-comments (lim)
  "Doc       : If inside comments, move the point backwards out.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-backward-move-out-of-comment
   Location  : emacs-genome/snps/ess-edit.el"
  (let ((opoint (point)) stop)
    (if (save-excursion
	  (beginning-of-line)
	  (search-forward "#" opoint 'move))
	(while (not stop)
	  (skip-chars-backward " \t\n\f" lim)
	  (setq opoint (point))
	  (beginning-of-line)
	  (search-forward "#" opoint 'move)
	  (skip-chars-backward " \t#")
	  (setq stop (or (/= (preceding-char) ?\n) (<= (point) lim)))
	  (if stop (point)
	    (beginning-of-line))))))

(defun genome/ess-edit-how-many-quotes-region (beg end)
  "Doc       : Return number of matches for quotes skipping double quotes and escaped quotes from BEG to END.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-how-many-quotes-region
   Location  : emacs-genome/snps/ess-edit.el"
  (let ((count 0))
    (save-excursion
      (save-match-data
	(goto-char beg)
	(while (re-search-forward "\"\\|\'" end t)
	  (if (or (save-excursion
		    (backward-char 3)
		    (looking-at "\\\\"))
		  (looking-at "\"\\|\'"))
	      (forward-char 1)
	    (setq count (1+ count))))))
    count))

(defun genome/ess-edit-within-quotes (beg end)
  "Doc       : Return t if the number of quotes between BEG and END is odd.
               Quotes are single and double.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-within-quotes
   Location  : emacs-genome/snps/ess-edit.el"
  (let (
	;; (countsq (ess-edit-how-many-quotes-region "\\(^\\|[^\\\\]\\)\'" beg end))
	;; (countdq (ess-edit-how-many-quotes-region "\\(^\\|[^\\\\]\\|^\"\"\\)\"" beg end)))
	(countsq (genome/ess-edit-how-many-quotes-region beg end))
	(countdq (genome/ess-edit-how-many-quotes-region beg end)))
    ;; (countsq (ess-edit-how-many-region "\'" beg end))
    ;; (countdq (ess-edit-how-many-region "\"" beg end)))
    (or (= (mod countsq 2) 1) (= (mod countdq 2) 1))))

(defun genome/ess-edit-backward-move-out-of-quotes ()
  "Doc       : If inside quotes, move the point backwards out.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-backward-move-out-of-quotes
   Location  : emacs-genome/snps/ess-edit.el"
  (let ((start 
	 (save-excursion
	   (beginning-of-line) (point))))
    (if (genome/ess-edit-within-quotes start (point))
	(re-search-backward "[\'\"]" nil t))))

(defvar genome/ess-edit-highlight-overlays [nil nil])
;; Initialize the overlays
(aset genome/ess-edit-highlight-overlays 0 (make-overlay 1 1))
(overlay-put (aref genome/ess-edit-highlight-overlays 0) 'face 'highlight)
(aset genome/ess-edit-highlight-overlays 1 (make-overlay 1 1))
(overlay-put (aref genome/ess-edit-highlight-overlays 1) 'face 'highlight)

(defun genome/ess-edit-highlight (index begin end &optional buffer)
  "Doc       : Highlight a region with overlay INDEX.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-highlight
   Location  : emacs-genome/snps/ess-edit.el"
  (move-overlay (aref genome/ess-edit-highlight-overlays index)
                begin end (or buffer (current-buffer))))

(defun genome/ess-edit-unhighlight (index)
  "Doc       : Detatch overlay INDEX.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-unhighlight
   Location  : emacs-genome/snps/ess-edit.el"
  (delete-overlay (aref genome/ess-edit-highlight-overlays index)))

;;; genome/ess-switch-to-R
(defun genome/ess-switch-to-R (&optional arg)
  "Doc       : Goto the end of the R console with argument ARG erase its contents. See `ess-switch-to-ESS' and `ess-show-buffer' for buffer behaviour.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: eg-switch-to-R
   location  : emacs-genome/snps/ess-R-snps.el"
  (interactive "P")
  (ess-switch-to-end-of-ESS)
  (when arg (erase-buffer) (comint-send-input)))

;;; genome/ess-get-help-R-object
(defun genome/ess-get-help-R-object ()
  "Doc       : Open the help file of the R object at the cursor point from a script in an external buffer.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: eg/ess-get-help-R-object
   location  : emacs-genome/snps/ess-R-snps.el"
  (interactive)
  (let ((fun (ess-symbol-at-point)))
    (ess-switch-to-end-of-ESS)
    (insert (concat "help(" (symbol-name fun) ")"))
    (inferior-ess-send-input)))

;;; genome/ess-edit-insert-path
(defun genome/ess-edit-insert-path (&optional arg)
  "Doc       : Insert a directory path as a string.
If ARG is non-nil prompt for directory path else
use value of `default-directory' which usually is the
directory in which the current file lives.

If `ess-edit-expand-file-name-relative' is non-nil
replace absolute path to home directory by '~'.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-insert-path
   location  : emacs-genome/snps/ess-edit.el"
  (interactive "P")
  (let ((dir (if arg
		 (read-directory-name "insert directory name: ")
	       default-directory)))
    (insert "\""
	    (genome/ess-edit-expand-file-name dir ) "\"")
    (backward-char 1)))

;;; genome/ess-edit-insert-file-name
(defun genome/ess-edit-insert-file-name ()
  "From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-insert-file-name
   location  : emacs-genome/snps/ess-edit.el"
  (interactive)
  (insert "\"" (genome/ess-edit-expand-file-name (read-file-name "insert filename: ")) "\"")
  )

;;; genome/ess-edit-insert-path [necessary for genome/ess-edit-insert-path]
(defcustom ess-edit-expand-file-name-relative t
  "Controls behaviour of 'ess-edit-insert-path' and 'ess-edit-insert-file-name':
If 'nil' just call expand-file-name else replace user-home with `~`. This is useful, when
the code should work on machines with different values of user-home.")

(defun genome/ess-edit-expand-file-name (name)
  "From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-expand-file-name
   location  : emacs-genome/snps/ess-edit.el"
  (let ((ename (expand-file-name name)))
  (if ess-edit-expand-file-name-relative
      (genome/ess-edit-replace-in-string ename (expand-file-name "~") "~")
    ename)))

;;; genome/ess-edit-replace-in-string [necessary for genome/ess-edit-insert-path]
(defun genome/ess-edit-replace-in-string (string regexp newtext)
  "Doc       : In STRING, replace all matches for REGEXP with NEWTEXT.
Hack to get a common function for all Emacsen.  Note that Oort Gnus
has
`gnus-replace-in-string', but we don't want to load Gnus.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: ess-edit-replace-in-string 
   location  : emacs-genome/snps/ess-edit.el"
  (cond
   ;; Emacs 21 and later
   ((fboundp 'replace-regexp-in-string)
    (replace-regexp-in-string regexp newtext string))
   ;; Emacs < 21; XEmacs
   (t
    ;; Code duplicated from `subr.el' revision 1.423 of Emacs. Neither
    ;; `replace-in-string' from XEmacs 21.4.15 nor the Gnus replacement works
    ;; correctly when an empty string is matched.
    (let ((rep newtext)
	  (l (length string))
	  (start 0) ;; (or start 0) in `subr.el'
	  fixedcase literal subexp
	  matches str mb me)
      (save-match-data
	(while (and (< start l) (string-match regexp string start))
	  (setq mb (match-beginning 0)
		me (match-end 0))
	  ;; If we matched the empty string, make sure we advance by
	  one char
	  (when (= me mb) (setq me (min l (1+ mb))))
	  ;; Generate a replacement for the matched substring.
	  ;; Operate only on the substring to minimize string consing.
	  ;; Set up match data for the substring for replacement;
	  ;; presumably this is likely to be faster than munging the
	  ;; match data directly in Lisp.
	  (string-match regexp (setq str (substring string mb me)))
	  (setq matches
		(cons (replace-match (if (stringp rep)
					 rep
				       (funcall rep (match-string 0
								  str)))
				     fixedcase literal str subexp)
		      (cons (substring string start mb) ; unmatched
			    prefix
			    matches)))
	  (setq start me))
	;; Reconstruct a string from the pieces.
	(setq matches (cons (substring string start l) matches)) ;
	leftover
	(apply #'concat (nreverse matches)))))))


;;; genome/org-smart-underscore
(defun genome/org-smart-underscore ()
  "Doc       : Smart \"_\" key: insert <- if in SRC R block unless in string/comment.
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: eg/org-smart-underscore
   location  : emacs-genome/snps/org-snps.el"
    (interactive)
    (if (and
	 (string= (car (org-babel-get-src-block-info)) "R")
	 (not (ess-inside-string-or-comment-p (point))))
      (ess-insert-S-assign)
      (insert "_")))

;;; genome/org-babel-clear-all-results
(defun genome/org-babel-clear-all-results ()
  "Doc       : clear all results from babel-org-mode
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: org-babel-clear-all-results
   location  : emacs-genome/snps/org-snps.el"  
  ""
  (interactive)
  (org-babel-map-src-blocks nil (org-babel-remove-result)))

;;; genome/org-indent
(defun genome/org-indent ()
  "Doc       : context dependent indent
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: eg/org-indent
   location  : emacs-genome/snps/org-snps.el"
  (interactive)
  (if (string= (car (org-babel-get-src-block-info)) "R")
      ;; (save-excursion
      (genome/ess-edit-indent-call-sophisticatedly)
    (eg/org-tab)
    ;; )
    (pcomplete)))


;;; genome/org-tab
(defun genome/org-tab ()
  "Doc       : either indent R code or cycle through sections in orgmode
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: eg/org-tab
   location  : emacs-genome/snps/org-snps.el"
  (interactive)
  (if (string= (car (org-babel-get-src-block-info)) "R")
      (genome/indent-paragraph)
    (org-cycle)))

;;; genome/insert-folds
(defun genome/insert-folds ()
  "Doc       : insert folding tags in a file
   From      : https://github.com/tagteam/emacs-genome (author Thomas Alexander Gerds)
   Originally: insert-folds
   location  : emacs-genome/snps/folding-snps.el"
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point)))
	(marks (cdr (assoc major-mode folding-mode-marks-alist))))
    (if marks
	(save-excursion
	  (goto-char beg)
	  (insert (car marks) " ")
	  (if (region-active-p)
	      (goto-char (region-end))
	    (insert "\n"))
	  (insert "\n")
	  (insert (cadr marks))))))
