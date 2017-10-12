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

