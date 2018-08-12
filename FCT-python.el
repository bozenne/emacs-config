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
