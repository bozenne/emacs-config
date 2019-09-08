;;; brice-dired-display-side
;; https://emacs.stackexchange.com/questions/15117/how-to-use-o-to-open-from-dired-ibuffer-into-another-frame
(defun brice-dired-display-side ()
"Doc : display the file indicated in dired in another window.
       Priority for the window on the right, 
       then the one on the left, 
       then split the buffer to create a window on the right."
(interactive)
  (let* (
      (file-or-dir (dired-get-file-for-visit))
      (buffer (find-file-noselect file-or-dir)))
      (brice-display-side buffer nil)
    ))

;;; brice-display-side [necessary for brice-dired-display-side]
(defun brice-display-side (buffer alist)
  (let (
	(window
	 (cond
	  ((get-buffer-window buffer (selected-frame)))
	  ((window-in-direction 'right))
	  ((window-in-direction 'left))
	  (t (split-window (selected-window) nil 'right))
	  )))	  
    (window--display-buffer buffer window 'window alist display-buffer-mark-dedicated)
    window))

;; (defun brice-display-side (buffer alist)
;;   "Doc-string."
;;   (let (
;; 	(window
;; 	 (cond
;; 	  ((get-buffer-window buffer (selected-frame)))
;; 	  (if (window-in-direction 'right) (split-window (selected-window) nil 'right)
;; 	    (if (window-in-direction 'left)) (split-window (selected-window) nil 'left)
;; 	  )
;; 	   )))
;;     (window--display-buffer buffer window 'window alist display-buffer-mark-dedicated)
;;     window))
  

