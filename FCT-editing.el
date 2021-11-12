;;; brice-duplicate-line
(defun brice-duplicate-line-or-region (&optional n)
  "Doc:  Duplicate current line, or region if active.
         With argument N, make N copies.
         With negative N, comment out original line and use the absolute value.
   From: https://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs#answer-4717026"
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region        ;Get region if active, otherwise line
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                          (newline))))))
        (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
          (insert text))))
    (if use-region nil                  ;Only if we're working with a line (not a region)
      (let ((pos (- (point) (line-beginning-position)))) ;Save column
        (if (> 0 n)                             ;Comment out original with negative arg
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))


;;; brice-flyspell-check-next-highlighted-word
(defun brice-flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

;;; brice-comment-symbol
(defun brice-comment-symbol ()
  "Change the comment symbol"
  (interactive)
  (let ((x (read-string "new comment character:")))
    (setq comment-start x))
  )

;;; brice-copy-line
 (defun brice-copy-line (arg)
    "Doc:  Copy lines (as many as prefix argument) in the kill ring.
           Ease of use features:
           - Move to start of next line.
           - Appends the copy on sequential calls.
           - Use newline as last char even on the last line of the buffer.
           - If region is active, copy its lines.
     From: https://www.emacswiki.org/emacs/CopyingWholeLines"
    (interactive "p")
    (let ((beg (line-beginning-position))
          (end (line-end-position arg)))
      (when mark-active
        (if (> (point) (mark))
            (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
          (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
      (if (eq last-command 'copy-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-ring-save beg end)))
    (kill-append "\n" nil)
    (beginning-of-line (or (and arg (1+ arg)) 2))
    (if (and arg (not (= 1 arg))) (message "%d lines copied" arg))
    )


;;; brice-current-time
(defun brice-current-time ()
  "Doc: Insert string for the current time formatted like '01/01/18 12:34'. 
   From: https://www.emacswiki.org/emacs/CopyingWholeLines"
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%A %y-%m-%d at %H:%M")))
;;; brice-flyspell-save-word
(defun brice-flyspell-save-word ()
  "Doc: do not correct this word but save it in the dictionary'. 
   From: https://stackoverflow.com/questions/22107182/in-emacs-flyspell-mode-how-to-add-new-word-to-dictionary"
  (interactive)
  (let ((current-location (point))
         (word (flyspell-get-word)))
    (when (consp word)    
      (flyspell-do-correct 'save nil (car word) current-location (cadr word) (caddr word) current-location))))

;;; brice-sort-lines-nocase
(defun brice-sort-lines-nocase ()
   "Doc: case insensitive alternative to sort lines
   From: https://stackoverflow.com/questions/20967818/emacs-function-to-case-insensitive-sort-lines" 
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines))
  )

;;; brice-beginning-of-line
(defun brice-beginning-of-line ()
  "Doc: go to beginning-of-line first and to indentation on the next hit'. 
   From: https://www.emacswiki.org/emacs/BackToIndentationOrBeginning"
   (interactive) 
   (if (bolp) (back-to-indentation) (beginning-of-line))
   )

