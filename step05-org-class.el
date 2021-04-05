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
	;;;; figures
	("" "graphicx") ;; [default orgmode]
	("" "grffile") ;; [default orgmode]
	("" "wrapfig") ;; [default orgmode]
;;	("" "capt-of") ;; [default orgmode] - NOT COMPATIBLE WITH biometrical
;;      ("" "caption") ;; newlines in graphics  - NOT COMPATIBLE WITH biometrical
	("" "rotating") ;; rotate figures
	;;;; titles
;;	("" "titlesec") ;; modify titles - NOT COMPATIBLE WITH BEAMER
	;;;; tables
	("" "longtable") ;; default orgmode
	("" "multirow") ;; merge rows in table
	("" "multicol") ;; merge columns in table
	;;;; track change
	("" "changes") ;; NOTE: must be loaded before ulem
        ;;;; display
	("" "pdflscape") ;; switch to landscape	
	("" "geometry") ;; define margin of the document
	("normalem" "ulem") ;; _xx_ in orgmode (underline)
	;;;; math
	("" "amssymb") ;; [default orgmode]
	("" "amsmath") ;; [default orgmode]
	("" "amsfonts")
	("" "dsfont")
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
      (concat "\\lstdefinestyle{code-small}{
backgroundcolor=\\color{white}, % background color for the code block
basicstyle=\\ttfamily\\small, % font used to display the code
commentstyle=\\color[rgb]{0.5,0,0.5}, % color used to display comments in the code
keywordstyle=\\color{black}, % color used to highlight certain words in the code
numberstyle=\\ttfamily\\tiny\\color{gray}, % color used to display the line numbers
rulecolor=\\color{black}, % color of the frame
stringstyle=\\color[rgb]{0,.5,0},  % color used to display strings in the code
breakatwhitespace=false, % sets if automatic breaks should only happen at whitespace
breaklines=true, % sets automatic line breaking
columns=fullflexible,
frame=single, % adds a frame around the code (non,leftline,topline,bottomline,lines,single,shadowbox)
keepspaces=true, % % keeps spaces in text, useful for keeping indentation of code
literate={~}{$\\sim$}{1}, % symbol properly display via latex
numbers=none, % where to put the line-numbers; possible values are (none, left, right)
numbersep=10pt, % how far the line-numbers are from the code
showspaces=false,
showstringspaces=false,
stepnumber=1, % the step between two line-numbers. If it's 1, each line will be numbered
tabsize=1,
xleftmargin=0cm,
emph={anova,apply,class,coef,colnames,colNames,colSums,dim,dcast,for,ggplot,head,if,ifelse,is.na,lapply,list.files,library,logLik,melt,plot,require,rowSums,sapply,setcolorder,setkey,str,summary,tapply},
aboveskip = \\medskipamount, % define the space above displayed listings.
belowskip = \\medskipamount, % define the space above displayed listings.
lineskip = 0pt} % specifies additional space between lines in listings
\\lstset{style=code-small}"))

(setq brice-org-latex-common-header-string
      (concat brice-org-latex-listing-options-string)
)

;; set-up of hyperref
(setq  org-latex-hyperref-template
      "\\hypersetup{
 colorlinks=true,
 pdfauthor={%a},
 pdftitle={%t},
 pdfkeywords={%k},
 pdfsubject={%d},
 pdfcreator={%c},
 pdflang={%L}
 }\n"
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

;;;; image
(add-to-list 'org-latex-classes
	     `("standalone"
	       ,(concat "\\documentclass{standalone}\n\n"
			"[NO-DEFAULT-PACKAGES]" 
		 )
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

;;;; biometrical
(add-to-list 'org-latex-classes
	     `("biometrical-journal"
	       ,(concat "\\documentclass[bimj,fleqn]{w-art}\n\n"
			"[NO-DEFAULT-PACKAGES]"
			"%%%% settings when exporting code %%%% \n\n"
			"\\usepackage{listings}\n"
			"%%%% packages %%%%%"
			)
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
	       ))
;;;; jrssc
(add-to-list 'org-latex-classes
	     `("jrssc-journal"
	       ,(concat "\\documentclass[mathtime]{statsoc}\n\n"
			"[NO-DEFAULT-PACKAGES]"
			"%%%% settings when exporting code %%%% \n\n"
			"\\usepackage{listings}\n"
			"%%%% packages %%%%%"
			)
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
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

;;;; jss article
(add-to-list 'org-latex-classes
             `("jss-article"
	       ,(concat
		 "\\documentclass[article]{jss}\n\n"
		 "[NO-DEFAULT-PACKAGES]"
		 "[NO-PACKAGES]"
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
