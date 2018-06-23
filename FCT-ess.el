;;; source files

;;;; package
(defun brice-ess-packageSource-r ()
  "Source a package using butils.base"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (let ((x (read-string "Enter a the name of the package:")))
	(ess-eval-linewise (concat "butils.base:::sourcePackage(\"" x "\", c.code = TRUE)"))
	(message "works only in R mode buffers")))
  )

;;;; cpp file
(defun brice-ess-source-rcpp ()
  "Source a cpp file using sourceCpp"
  (interactive)
  (if (eq major-mode 'c++-mode)
      (let ((file-name (buffer-file-name)))
	(save-buffer)
	(ess-eval-linewise (concat "Rcpp::sourceCpp(\"" file-name "\")")))
    (message "works only in cpp mode buffers")))

;;;; r file
(defun brice-ess-source-r ()
  "Source a R file using source"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (let ((file-name (buffer-file-name)))
	(save-buffer)
	(ess-eval-linewise (concat "base::source(\"" file-name "\")")))
    (message "works only in R mode buffers")))

;;; debug
;;;; browser
(defun brice-ess-browser-r ()
  "Add a browser in the R file"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (let ((x (read-string "Enter a condition:")))
	(if(string= "" x)
	  (insert (concat "browser()"))
	  (insert (concat "if(" x "){browser()}"))
	  ))
    (message "works only in R mode buffers")
    ))

;;;; browser + source
(defun brice-ess-browser-and-source-r ()
  "Add a browser and source a R file"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (progn (brice-ess-browser-r) (brice-ess-source-r))
    ((message "works only in R mode buffers"))
    )
  )


;;; display object
(defun brice-ess-head-object ()
  "Display the first lines of an R object"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (ess-eval-linewise (concat "head(" x ")")))
   	   (let ((x (read-string "Enter a the name of the object:")))
	     (ess-eval-linewise (concat "head(" x ")")))
	)
    ))
  

(defun brice-ess-dim-object ()
  "Display the dimension of an R object"
  (interactive)
      (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (ess-eval-linewise (concat "butils::DIM(" x ")")))
   	   (let ((x (read-string "Enter a the name of the object:")))
	     (ess-eval-linewise (concat "butils::DIM(" x ")")))
     ))

;;; shortcut
(defun brice-ess-ggplot ()
  "Initialize ggplot"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (let ((x (buffer-substring (region-beginning) (region-end))))
	(insert (concat "gg <- ggplot2(" x ", aes())")))
    (let ((x (read-string "Enter a the name of the dataset:")))
      (insert (concat "gg <- ggplot2(" x ", aes())")))
    )
  )

(defun brice-ess-clone ()
  "Duplicate left hand side and right hand side"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (let ((x (buffer-substring (region-beginning) (region-end))))
	(next-line)
	(insert (concat x " <- " x " + "))
	)
    (let ((x (read-string "Enter a the name of the object:")))
      (insert (concat x " <- " x " + ")))
    )
  )
