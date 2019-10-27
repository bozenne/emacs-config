;;; source files

;;;; package
(defun brice-ess-packageSource-r ()
  "Source a package using butils.base"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'c++-mode))
	  ;; (setq mylist (list "butils.base" "butils" "BuyseTest" "lavaSearch2" "riskRegression")
	  (let ((mylist (list "butils.base" "butils" "BuyseTest" "lavaSearch2" "riskRegression")))
		(let ((x (read-string "Enter a the name of the package:" nil nil mylist)))			  
		  ;; (let ((x (read-string "Enter a the name of the package:" "butils.base")))			  
		  (ess-eval-linewise (concat "butils.base:::sourcePackage(\"" x "\", c.code = TRUE, trace = TRUE)"))
		  )
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
	(if (string= (file-name-extension file-name) "cpp") 
	    (ess-eval-linewise (concat "Rcpp::sourceCpp(\"" file-name "\")"))
	  (progn
	    (setq bufferContent (buffer-substring-no-properties 1 (point-max)))
	    (setq testStart (s-contains? "// :cppFile:{" bufferContent))
	    ;; (message testStart)
	    (setq testEnd (s-contains? "}:end:" bufferContent))
	    ;; (message testEnd)
	    ( if(and (eq testStart 't) (eq testEnd 't))		
		(progn
		  (setq lsResSearch (s-match-strings-all "{\\([^}]+\\)}" bufferContent))
		  (setq fileName (nth 1 (nth 0 lsResSearch)))
		  (setq path default-directory)
		  (ess-eval-linewise (concat "Rcpp::sourceCpp(file.path(\"" path "\", \"" fileName "\"))"))
		  )
	      (message "Non .cpp file detected: add tag \"// :cppFile:{fileName.cpp}:end:\" to indicate to the compiler what is the .cpp file")
	      ))
	  )
	)
    (message "works only with files whose major mode is c++mode"))
  )

;; (s-match ":cppFile: * :end:" "// :cppFile:FCT_buyseTest.cpp :end: xx")
;; (s-match-strings-all "{\\([^}]+\\)}" "// :cppFile:{FCT_buyseTest.cpp}:end: xx")
;; (match-string "{\\([^}]+\\)}" "// :cppFile:{FCT_buyseTest.cpp}:end: xx")




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

;;;; imenu
(defun brice-jump-to-function ()
  "Jump to function definition"
  (interactive)
  (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (defun defaultArg ()
		  ;; (insert x)
		  (insert (concat x " /Functions"))		  
		  )
		(minibuffer-with-setup-hook
			'defaultArg
		  (call-interactively #'imenu-anywhere))
		(minibuffer-keyboard-quit)
		)
	((imenu-anywhere)
	 )
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

(defun brice-ess-script-object ()
  "Convert R object to into text for a script"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
      (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (ess-eval-linewise (concat "butils::object2script(" x ", digit = 8)")))
   	   (let ((x (read-string "Enter a the name of the object:")))
	     (ess-eval-linewise (concat "butils::object2script(" x ", digit = 8)")))
	   )
      ((message "works only with .R files or R terminals)"))
	  ))


(defun brice-ess-str-object ()
  "Display the structure of an R object"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
      (if (region-active-p)
	  (let ((x (buffer-substring (region-beginning) (region-end))))
	    (ess-eval-linewise (concat "str(" x ")")))
   	   (let ((x (read-string "Enter a the name of the object:")))
	     (ess-eval-linewise (concat "str(" x ")")))
	   )
      ((message "works only with .R files or R terminals)"))
    ))

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


(defun brice-setwd-currentBuffer ()
  "Set working directory to the path to the current buffer"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))
	  (progn 
		(let (try path)
		  (setq try (file-name-directory buffer-file-name))
		  (setq path (read-string "path:" try))
		  (ess-eval-linewise (concat "setwd(\"" path "\")"))
		  ))
	((message "works only with .R files or R terminals)"))
    )
  )

;;; data manipulation
(defun brice-col-2-vector ()
  "Convert a column of data into an R vector ggplot"
  (interactive)
  (if (or (eq major-mode 'ess-mode)  (eq major-mode 'inferior-ess-mode))	  
	  (progn
		(let (start end nlines)
		  (setq start(region-beginning))
		  (setq end (region-end))
		  (setq nlines (count-words start end))	 ;; number of rows
		  (goto-char start)
		  ;; (print nlines)
		  (insert "c(")
		  (end-of-line)
		  (dotimes (i (- nlines 1))
		  	  (progn
		  		(insert ",")
		  		(forward-line)
		  		(end-of-line)
		  		)
		  	)
		  (insert ")")

		  (goto-char start)
		  (forward-char)
		  (genome/ess-edit-indent-call-sophisticatedly)
		  )
		)
	)
  )
  
