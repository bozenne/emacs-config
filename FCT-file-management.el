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
