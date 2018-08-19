;;; launch python
(defun brice-python-switch-to-py ()
  "Switch to the buffer containing the python console (create one if necessary)"
    (interactive)

    (if (eq (python-shell-get-process) 'nil)
	(run-python python-shell-interpreter nil nil)
      )
    
    (python-shell-switch-to-shell)
      
  )    


;;; run command
;;;; brice-python-shell-send-region
(defun brice-python-shell-send-region (arg)
  "Send the selected python code - or the current line when no selected regions
   to the python console (create one if necessary)"
  (interactive "p")
    (setq currentBuffer (format (buffer-name)))
  
  ;; create a python console
  (if (eq (python-shell-get-process) 'nil)
      (run-python python-shell-interpreter nil nil)
    )

  ;; identify the region to be evaluated
  (let (codeRegion)
    (if(not (region-active-p))
	(progn
    	  (let (start end)
    	    (setq start (line-beginning-position))
    	    (setq end (line-end-position))
    	    (goto-char start)
    	    (push-mark end)
    	    (setq mark-active t)
	    (setq codeRegion (buffer-substring (region-beginning) (region-end)))
	    (setq mark-active nil)
	    (forward-line)
	    )
   	  )
      (progn (setq codeRegion (buffer-substring (region-beginning) (region-end))) )
      )

    ;; send code to the console
      (python-shell-switch-to-shell)
      (insert codeRegion)
      (comint-send-input)

   ;; come back
      (switch-to-buffer-other-window  currentBuffer)	  
      )
  )

;;;; brice-python-install-package
(defun brice-python-install-package ()
  (interactive)
  (let ((packageName (read-string "Enter a the name of the library:")))

    (cond ((eq major-mode 'python-mode)
	   (progn
	     ;; send code to the console
	     (python-shell-switch-to-shell)
	     (insert (concat "!pip install --user " packageName))
	     (comint-send-input)

	     ;; come back
	     (switch-to-buffer-other-window  currentBuffer)	      
	     ))
   	  ((eq major-mode 'inferior-python-mode)
	   (progn
	     (insert (concat "!pip install --user " packageName))
	     (comint-send-input)
	     )
	   )
	  (t (message "works only with .py files or python console"))
	  )
    )
  )

;; available packages
;; help('modules')

;;; folding
;; ;; https://stackoverflow.com/questions/4079648/combine-python-mode-with-org-mode-for-emacs
;; (defun brice-python-mode-outline-hook ()
;;   (setq outline-level 'brice-python-outline-level)

;;   (setq outline-regexp
;;     (rx (or
;;          ;; Commented outline heading
;;          (group
;;           (* space)  ; 0 or more spaces
;;           (one-or-more (syntax comment-start))
;;           (one-or-more space)
;;           ;; Heading level
;;           (group (repeat 1 8 "\*"))  ; Outline stars
;;           (one-or-more space))

;;          ;; Python keyword heading
;;          (group
;;           ;; Heading level
;;           (group (* space)) ; 0 or more spaces
;;           bow
;;           ;; Keywords
;;           (or "class" "def" "else" "elif" "except" "for" "if" "try" "while")
;;           eow))))
;;   )

;; (defun brice-python-outline-level ()
;;   (or
;;    ;; Commented outline heading
;;    (and (string-match (rx
;;                (* space)
;;                (one-or-more (syntax comment-start))
;;                (one-or-more space)
;;                (group (one-or-more "\*"))
;;                (one-or-more space))
;;               (match-string 0))
;;     (- (match-end 0) (match-beginning 0)))

;;    ;; Python keyword heading, set by number of indentions
;;    ;; Add 8 (the highest standard outline level) to every Python keyword heading
;;    (+ 8 (- (match-end 0) (match-beginning 0)))))
