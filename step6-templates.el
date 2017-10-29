;;; Document class

;;;; Latex science
(add-to-list
 'org-structure-template-alist
 `("La" ,(concat
"#+TITLE:
#+Author: " user-full-name
"\n\n\n
* CONFIG :noexport:
# #+LaTeX_HEADER:\\affil{Department of Biostatistics, University of Copenhagen, Copenhagen, Denmark}
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+OPTIONS:   title:t author:t toc:t todo:t 
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

** code
#+PROPERTY: header-args :session *R*
#+PROPERTY: header-args :tange yes % extract source code: http://orgmode.org/manual/Extracting-source-code.html
#+PROPERTY: header-args :eval yes :cache no

** latex packages
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional packages %%%%
#+LaTeX_HEADER: %
#+LaTeX_HEADER:\\usepackage{authblk}

** display
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% display options %%%%
#+LaTeX_HEADER: %

** latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
"
	  )))

;;;; Latex letter
(add-to-list
 'org-structure-template-alist
 `("Ll" ,(concat
"
#+LaTeX: \\onehalfspacing
#+LaTeX: \\pagestyle{empty}

# ### distinataire
#+BEGIN_EXPORT latex
\\begin{raggedright}
% adresse du destinataire
\\end{raggedright}
#+END_EXPORT

# ### expediteur
#+BEGIN_EXPORT latex
\\begin{raggedleft}
OZENNE Brice \\\\
138L \\O{}resundsvej  \\\\
2300 Copenhague \\\\
\\url{brice.ozenne@orange.fr} \\\\
\\end{raggedleft}
#+END_EXPORT


*Objet:*

\\bigskip
\\bigskip
\\bigskip

Madame, monsieur,

\\bigskip

Je vous prie d'agréer, Madame, Monsieur, mes salutations distinguées. 


# #+ATTR_LATEX: :height 3cm
# [[./Esignature.png]]


* CONFIG :noexport:
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+OPTIONS:   title:nil author:nil toc:nil todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

** code
#+PROPERTY: header-args :session *R*
#+PROPERTY: header-args :tange yes % extract source code: http://orgmode.org/manual/Extracting-source-code.html
#+PROPERTY: header-args :cache no

** latex packages
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional packages %%%%
#+LaTeX_HEADER: %
#+LaTeX_HEADER:\\usepackage{authblk}

** display
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% display options %%%%
#+LaTeX_HEADER: %

** latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
"
	  )))

;;;; Latex recette
(add-to-list
 'org-structure-template-alist
 `("recette" ,(concat
"
#+BEGIN_EXPORT latex
\\recette{% temps de préparation

}{% cuisson-conservation

}{ % ingrédients
\\begin{itemize}
  \\item eau
\\end{itemize}
}{ % instructions

}{ % extensions

}
#+END_EXPORT"
)))


;;;; Beamer
(add-to-list
 'org-structure-template-alist
 `("Lb" ,(concat
"#+TITLE:
#+Author: " user-full-name
"\n#+Latex_header:\\institute{}
#+DATE: 
#+EMAIL:" user-mail-address
"\n\n
* Introduction\n
** Part I\n
*** First slide\n
\n\n
* CONFIG :noexport:
# #+LaTeX_HEADER:\\affil{Department of Biostatistics, University of Copenhagen, Copenhagen, Denmark}
#+LANGUAGE:  en
#+startup: beamer
#+LaTeX_CLASS: beamer
#+LaTeX_class_options: [table] 
#+LaTeX_HEADER: \\subtitle{}
#+LaTeX_HEADER: \\setbeamertemplate{footline}[frame number]
#+LaTeX_HEADER: \\setbeamertemplate{navigation symbols}{}
#+LATEX_HEADER: \\RequirePackage{fancyvrb}
#+LATEX_HEADER: \\DefineVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\small,formatcom = {\\color[rgb]{0.5,0,0}}}

#+OPTIONS:   title:t author:t toc:t todo:t 
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

** code
#+PROPERTY: header-args :session *R*
#+PROPERTY: header-args :tange yes % extract source code: http://orgmode.org/manual/Extracting-source-code.html
#+PROPERTY: header-args :cache no

** latex packages
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional packages %%%%
#+LaTeX_HEADER: %
#+LaTeX_HEADER:\\usepackage{authblk}

** display
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% display options %%%%
#+LaTeX_HEADER: %

** latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
"
)))

;; "\n#+OPTIONS: H:3 num:t toc:nil \\n:nil @:t ::t |:t ^:t -:t f:t *:t <:t
;; #+OPTIONS: TeX:t LaTeX:t skip:nil d:t todo:t pri:nil tags:not-in-toc
;; #+INFOJS_OPT: view:nil toc:nil ltoc:t mouse:underline buttons:0 path:http://orgmode.org/org-info.js


;;;; R markdown
(add-to-list
 'org-structure-template-alist
 `("Rmd" ,(concat
"#+TITLE:
#+Author: " user-full-name
"\n\n\n
* CONFIG :noexport:
# #+LaTeX_HEADER:\\affil{Department of Biostatistics, University of Copenhagen, Copenhagen, Denmark}
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+OPTIONS:   title:t author:t toc:nil todo:nil 
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

** code
#+PROPERTY: header-args :session *R*
#+PROPERTY: header-args :tange yes % extract source code: http://orgmode.org/manual/Extracting-source-code.html
#+PROPERTY: header-args :eval yes :cache no

** latex packages
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional packages %%%%
#+LaTeX_HEADER: %
#+LaTeX_HEADER:\\usepackage{authblk}

** display
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% display options %%%%
#+LaTeX_HEADER: %

** latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
"
	  )))

;;; org shortcut

;;;; latex header
(add-to-list
 'org-structure-template-alist
 '("Lh" "#+LaTeX_HEADER:"))

(add-to-list
 'org-structure-template-alist
 '("Lf"
"#+name: fig:1
#+ATTR_LATEX: :width 0.7\\textwidth
#+CAPTION:\n"
))


;;;; Two column slides
(add-to-list
 'org-structure-template-alist
 '("Bc" "
**** Untitled column
    :PROPERTIES:
    :BEAMER_col: 0.5
    :END:

**** Titled column 
    :PROPERTIES:
    :BEAMER_col: 0.5
    :BEAMER_env: block
    :END:

**** Back to no columns 
    :PROPERTIES:
    :BEAMER_env: ignoreheading
    :END:
    "))

;;;; latex align
(add-to-list
 'org-structure-template-alist
 '("leq" 
"#+BEGIN_EXPORT latex
\\begin{align*}

\\end{align*}
#+END_EXPORT"))


;;;; caption
(add-to-list
 'org-structure-template-alist
 '("Lcaption"
"#+name: fig:1
#+ATTR_LATEX: :width 0.7\\textwidth
#+CAPTION:\n"
))

;;; R code
;;;; R hide code and result
(add-to-list
 'org-structure-template-alist
 '("Rh" 
"#+BEGIN_SRC R :results output raw drawer  :exports none :session *R* :cache no 

#+END_SRC"))

;;;; R export code 
(add-to-list
 'org-structure-template-alist
 '("Rc"
"#+BEGIN_SRC R :exports both :results output :session *R* :cache no

#+END_SRC"	
))

;;;; R export code and result (output)
(add-to-list
 'org-structure-template-alist
 '("Re"
"#+BEGIN_SRC R :exports both :results output :session *R* :cache no

#+END_SRC"	
))

;;;; R export code and result (latex)
(add-to-list
 'org-structure-template-alist
 '("Rl"
"#+BEGIN_SRC R :exports both :results latex :session *R* :cache no

#+END_SRC"	
))

;;;; R export graphic
(add-to-list
 'org-structure-template-alist
 '("Rg"
"#+BEGIN_SRC R :results graphics :file %file :exports results :session *R* :cache yes

#+END_SRC

#+name: fig:1
#+ATTR_LATEX: :width 0.7\\textwidth
#+CAPTION:\n"
))







;;; Lips code

(add-to-liste
 'org-structure-template-alist
 '("lisp" 
"#+BEGIN_SRC emacs-lisp

#+END_SRC"))
