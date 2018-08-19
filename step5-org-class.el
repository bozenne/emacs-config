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
	      "backgroundcolor=\\color{white},\n"
	      "basewidth={0.5em,0.4em},\n"
	      "basicstyle=\\ttfamily\\small,\n"            ;; the size of the fonts that are used for the code  
	      "breakatwhitespace=false,\n"
	      "breaklines=true,\n"                         ;; sets automatic line breaking
	      "columns=fullflexible,\n"
	      "commentstyle=\\color[rgb]{0.5,0,0.5},\n"
	      "frame=single,\n"                            ;; adds a frame around the code
	      "keepspaces=true,\n"
              "keywordstyle=\\color{black},\n"
	      "literate={~}{$\\sim$}{1},\n"
	      "numbers=left,\n"
	      "numbersep=10pt,\n"
	      "numberstyle=\\ttfamily\\tiny\\color{gray},\n"
	      "showspaces=false,\n"                        ;; show spaces adding particular underscores
	      "showstringspaces=false,\n"
	      "stepnumber=1,\n"
	      "stringstyle=\\color[rgb]{0,.5,0},\n"        ;; string literal style
	      "tabsize=4,\n"
	      "xleftmargin=.23in,\n"
	      "emph={anova,apply,class,coef,colnames,colNames,colSums,dim,dcast,for,ggplot,head,if,ifelse,is.na,lapply,list.files,library,logLik,melt,plot,require,rowSums,sapply,setcolorder,setkey,str,summary,tapply},\n" ;; <-,+,-,%*%,*,/,^,(,)
              "emphstyle=\\color{blue}\n"
              "}\n"))

(setq brice-org-latex-common-header-string
      (concat brice-org-latex-listing-options-string)
)

;; set-up of hyperref

(setq  org-latex-hyperref-template
      "\\hypersetup{
 colorlinks=true,
 citecolor=[rgb]{0,0.5,0},
 urlcolor=[rgb]{0,0,0.5},
 linkcolor=[rgb]{0,0,0.5},
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

;;;; jrss article
(add-to-list 'org-latex-classes
             `("jrss-article"
	       ,(concat
		 "\\documentclass[article]{statsoc}\n\n"
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
 
