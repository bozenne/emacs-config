;;; comment-or-uncomment-line-or-region
(defun TAG-comment-or-uncomment-line-or-region (&optional arg)
  "If region is active comment or uncomment region, see `comment-or-uncomment-region' 
   URL: 'https://github.com/tagteam/emacs-genome/blob/master/snps/eg-utility-snps.el'
else comment or uncomment current line. If ARG is non-nil uncomment region or current line."
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


;;; duplicate-line
(defun brice-duplicate-line (arg)
  "Duplicate current line, leaving point in lower line.
  URL: 'https://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs'
  "
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg)
  )
