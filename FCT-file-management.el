;;; rename-file-and-buffer
(defun brice-rename-file-and-buffer () 
  "Rename the current buffer and file it is visiting.
   URL 'http://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/'
  "
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

;;; delete-file-and-buffer
(defun brice-delete-file-and-buffer () 
  "Kill the current buffer and deletes the file it is visiting.
  URL 'http://emacsredux.com/blog/2013/04/03/delete-file-and-buffer/'
  "
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

;;; photo-raw-to-png
(defun brice-photo-raw-to-png ()
  "Convert raw file to readable files"
  (interactive)
  (if (eq major-mode 'shell-mode)
      (let ((formatIn (read-string "Enter an input format:" "*.raw")))
	(let ((formatOut (read-string "Enter an output format:" "png")))
	  	(if(string= "jpeg" formatOut)
		    (let ((compression (read-string "Enter a quality factor [0-100]:" "85")))
		      (insert (concat "ufraw-batch " formatIn " --silent --out-type=" formatOut " --compression=" compression))
		     )
		      (insert (concat "ufraw-batch " formatIn " --silent --out-type=" formatOut))		  
		      )
		))
    ))

