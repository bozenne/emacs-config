;;; source files

;;;; package
(defun brice-ess-packageSource-r ()
  "Source a package using butils.base"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))  
      (let ((x (read-string "Enter a the name of the package:")))
	(ess-eval-linewise (concat "butils.base:::sourcePackage(\"" x "\", c.code = TRUE)"))
	)
        ((message "works only with .R files or R console)"))
	)
  )

;;;; cpp file
(defun brice-ess-source-rcpp ()
  "Source a cpp file using sourceCpp"
  (interactive)
  (if (eq major-mode 'c++-mode)
      (let ((file-name (buffer-file-name)))
	(save-buffer)
	(ess-eval-linewise (concat "Rcpp::sourceCpp(\"" file-name "\")")))
    (message "works only with .cpp files")))

;;;; r file
(defun brice-ess-source-r ()
  "Source a R file using source"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (let ((file-name (buffer-file-name)))
	(save-buffer)
	(ess-eval-linewise (concat "base::source(\"" file-name "\")")))
    (message "works only with .R files")))

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
    (message "works only with .R files")
    ))

;;;; browser + source
(defun brice-ess-browser-and-source-r ()
  "Add a browser and source a R file"
  (interactive)
  (if (eq major-mode 'ess-mode)
      (progn (brice-ess-browser-r) (brice-ess-source-r))
    ((message "works only with .R files"))
    )
  )

;;;; traceback
(defun brice-ess-revTraceback ()
  "Set revTraceback"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
      (ess-eval-linewise "options(error = function()revTraceback(max.lines = 5))")
      ((message "works only with .R files or R terminals)"))
  )
)

  

;;; display object
(defun brice-ess-head-object ()
  "Display the first lines of an R object"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
      (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (ess-eval-linewise (concat "head(" x ")")))
   	   (let ((x (read-string "Enter a the name of the object:")))
	     (ess-eval-linewise (concat "head(" x ")")))
	   )
      ((message "works only with .R files or R terminals)"))
    ))
  

(defun brice-ess-dim-object ()
  "Display the dimension of an R object"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
      (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (ess-eval-linewise (concat "butils::DIM(" x ")")))
   	   (let ((x (read-string "Enter a the name of the object:")))
	     (ess-eval-linewise (concat "butils::DIM(" x ")")))
	   )
      ((message "works only with .R files or R terminals)"))
     )
)

(defun brice-ess-names-object ()
  "Display the dimension of an R object"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
      (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (ess-eval-linewise (concat "butils::NAMES(" x ")")))
   	   (let ((x (read-string "Enter a the name of the object:")))
	     (ess-eval-linewise (concat "butils::NAMES(" x ")")))
	   )
      ((message "works only with .R files or R terminals)"))
    )
  )

;;; shortcut
(defun brice-ess-ggplot ()
  "Initialize ggplot"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
    (let ((x (read-string "Enter a the name of the dataset:")))
      (insert (concat "gg <- ggplot2(" x ", aes())")))
      ((message "works only with .R files or R terminals)"))
    )
  )

(defun brice-ess-clone ()
  "Duplicate left hand side and right hand side"
  (interactive)
  (if (eq major-mode 'ess-mode)
   (if (region-active-p)
       (let ((x (buffer-substring (region-beginning) (region-end))))
	(next-line)
	(insert (concat x " <- " x " + "))
	)
    (let ((x (read-string "Enter a the name of the object:")))
      (insert (concat x " <- " x " + ")))
    )
         ((message "works only with .R files or R terminals)"))
	 )
  )

(defun brice-ess-install-package ()
  "Install a package from the CRAN or Github"
  (interactive)
  (let ((packageName (read-string "Enter a the name of the library (without \"\"):")))
    (let ((repository (read-string "Repository [CRAN/Github]:" "CRAN")))

    (if (or (eq major-mode 'ess-mode) (eq major-mode 'inferior-ess-mode))
	(progn
	  (message repository)
	  (cond ((string= repository "CRAN")
		 (ess-eval-linewise (concat "install.packages(\"" packageName "\")")))
		((string= repository "Github")
		 (ess-eval-linewise (concat "devtools::install_packages(\"" packageName "\")")))
		(t
		 (message "Repository should be either CRAN or Github"))
		)
	  )
	  
	  
      ))
  )
  )
