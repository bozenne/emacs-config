;;; package to export by default
(setq org-latex-packages-alist
      '(;;;; font/encoding
	("utf8" "inputenc") ;; [default orgmode]
	("T1" "fontenc") ;; [default orgmode]
	("" "lmodern") ;; Police LatinModern
	("" "textcomp") ;; [default orgmode]
	;; ("normalem" "ulem") ;; [default orgmode but clash with the changes packages] 
	;;;; color
	("" "color")
	;;;; lists
	("" "enumerate")
	;;;; figures
	("" "graphicx") ;; [default orgmode]
	("" "grffile") ;; [default orgmode]
	("" "wrapfig") ;; [default orgmode]
	("" "capt-of") ;; [default orgmode]
	("" "rotating")
	("" "caption") ;; newlines in graphices
	("" "rotating") ;; rotate figures
	;;;; titles
;;	("" "titlesec") ;; modify titles - NOT COMPATIBLE WITH BEAMER
	;;;; tables
	("" "longtable") ;; default orgmode
	("" "multirow") ;; merge rows in table
	("" "multicol") ;; merge columns in table
        ;;;; display
	("" "pdflscape") ;; switch to landscape
	("" "setspace") ;; to modify the space between lines
	("" "geometry") ;; define margin of the document
	;;;; math
	("" "amssymb") ;; [default orgmode]
	("" "amsmath") ;; [default orgmode]
	("" "amsfonts")
	("" "dsfont")
	("" "textcomp") ;; [default orgmode]
	("" "array")
	;;;; to define macro
	("" "ifthen")
	;;;; link
	("" "hyperref") ;; [default orgmode]
	;;;; bibliography
	("" "natbib")
	))


;;; additionnal information in the header
(setq brice-org-latex-listing-options-string
      (concat "\\lstset{\n"
	      "keywordstyle=\\color{blue},\n"
	      "commentstyle=\\color{red},\n"
	      "stringstyle=\\color[rgb]{0,.5,0},\n"
              "literate={~}{$\\sim$}{1},\n"
	      "basicstyle=\\ttfamily\\small,\n"
	      "columns=fullflexible,\n"
	      "breaklines=true,\n"        
	      "breakatwhitespace=false,\n"
	      "numbers=left,\n"
	      "numberstyle=\\ttfamily\\tiny\\color{gray},\n"
	      "stepnumber=1,\n"
	      "numbersep=10pt,\n"
	      "backgroundcolor=\\color{white},\n"
	      "tabsize=4,\n"
              "keepspaces=true,\n"
	      "showspaces=false,\n"
	      "showstringspaces=false,\n"
	      "xleftmargin=.23in,\n"
	      "frame=single,\n"
	      "basewidth={0.5em,0.4em}\n"
	      "}\n"))

(setq brice-org-latex-common-header-string
      (concat brice-org-latex-listing-options-string)
)

;;; document class
;;;; org-article
(add-to-list 'org-latex-classes
	     `("org-article"
	       ,(concat "\\documentclass{article}\n\n"
			"[NO-DEFAULT-PACKAGES]" 
			"%%%% settings when exporting code %%%% \n\n"
			"\\usepackage{listings}\n"
   			brice-org-latex-common-header-string
			"\n"
			"%%%% packages %%%%%"
		 )
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	       ))

;;;; report
(add-to-list 'org-latex-classes
             `("org-report"
	       ,(concat "\\documentclass{report}\n\n"
			"[NO-DEFAULT-PACKAGES]" 
			"%%%% settings when exporting code %%%% \n\n"
			"\\usepackage{listings}\n"
   			brice-org-latex-common-header-string
			"\n"
			"%%%% packages %%%%%"
		 )
	       ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ))

;;;; Rnew-article
(add-to-list 'org-latex-classes
	     `("Rnews-article"
	       ,(concat "\\documentclass{report}\n\n"
			"[NO-PACKAGES]
			[NO-DEFAULT-PACKAGES]"
			"%%%% settings when exporting code %%%% \n\n"
			"\\usepackage{listings}\n"
			brice-org-latex-common-header-string
			"\n"
			"%%%% packages %%%%%"
			)
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	       ))

;;;; beamer
(add-to-list 'org-latex-classes
	     `("beamer"
	       ,(concat "\\documentclass{beamer}\n\n"
			"[NO-DEFAULT-PACKAGES]" 
			"%%%% settings when exporting code %%%% \n\n"
			"\\usepackage{listings}\n"
   			brice-org-latex-common-header-string
			"\n"
			"%%%% packages %%%%%"
		 )	     
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	       ))
 
