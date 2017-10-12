;;; export to pdf
(defun brice-org-export-to-pdf (&optional arg)
  "Export to pdf using beamer or latex depending on the mode of the org document"
  (interactive "p")
  (if org-beamer-mode
      (org-beamer-export-to-pdf)
    (org-latex-export-to-pdf))
  )

;;; export to latex
(defun brice-org-export-to-latex (&optional arg)
  "Export to latex using beamer or latex depending on the mode of the org document"
  (interactive "p")
  (if org-beamer-mode
      (org-beamer-export-to-latex)
    (org-latex-export-to-latex))
  )

;;; open pdf file
;; modified from superman
(defvar superman-org-export-target "pdf" "current export target")

(defun brice-browse-this-file (&optional arg)
  "Open pdf file"
  (interactive "p")
   (let ((target (concat (file-name-sans-extension (buffer-file-name)) "." superman-org-export-target)))
     (if (file-exists-p target)
	 (org-open-file target)
       (message (concat "No such file: " target)))
     ))
