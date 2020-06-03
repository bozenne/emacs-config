;; NOTE: ? is the  where the cursor should wind up at the end

;;; Document class

;;;; Beamer
(add-to-list
 'org-structure-template-alist
 `("Lb" ,(concat
"#+TITLE:
#+Author: " user-full-name
"\n # #+LaTeX_HEADER: \\institute{
# #+LaTeX_HEADER: \\textsuperscript{1} Neurobiology Research Unit, University Hospital of Copenhagen, Rigshospitalet.
# #+LaTeX_HEADER: \\and \\textsuperscript{2} Section of Biostatistics, Department of Public Health, University of Copenhagen.
# #+LaTeX_HEADER: }
#+DATE: 
#+EMAIL:" user-mail-address
"\n\n
* Introduction\n
** Part I\n
*** First slide\n
\n\n

* Reference :noexport:

*** Reference
:PROPERTIES:
:BEAMER_OPT: fragile,allowframebreaks
:END:  

#+BEGIN_EXPORT latex
\\begingroup
\\renewcommand{\\section}[2]{}
#+END_EXPORT
bibliographystyle:apalike
[[bibliography:bibliography.bib]] 
#+BEGIN_EXPORT latex
\\endgroup
#+END_EXPORT


* CONFIG :noexport:
#+LANGUAGE:  en
#+startup: beamer
#+LaTeX_CLASS: beamer
#+LaTeX_class_options: [table] 
#+LaTeX_HEADER: \\subtitle{}
#+LaTeX_HEADER: \\setbeamertemplate{footline}[frame number]
#+LaTeX_HEADER: \\setbeamertemplate{navigation symbols}{}
#+OPTIONS:   title:t author:t toc:nil todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

#+LATEX_HEADER: %
#+LATEX_HEADER: %%%% specifications %%%%
#+LATEX_HEADER: %

** Latex command
#+LATEX_HEADER: \\usepackage{ifthen}
#+LATEX_HEADER: \\usepackage{xifthen}
#+LATEX_HEADER: \\usepackage{xargs}
#+LATEX_HEADER: \\usepackage{xspace}

#+LATEX_HEADER: \\newcommand\\Rlogo{\\textbf{\\textsf{R}}\\xspace} % 

** Notations

** Code
# Documentation at https://org-babel.readthedocs.io/en/latest/header-args/#results
# :tangle (yes/no/filename) extract source code with org-babel-tangle-file, see http://orgmode.org/manual/Extracting-source-code.html 
# :cache (yes/no)
# :eval (yes/no/never)
# :results (value/output/silent/graphics/raw/latex)
# :export (code/results/none/both)
#+PROPERTY: header-args :session *R* :tangle yes :cache no ## extra argument need to be on the same line as :session *R*

# Code display:
#+LATEX_HEADER: \\RequirePackage{fancyvrb}
#+LATEX_HEADER: \\DefineVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\small,formatcom = {\\color[rgb]{0.5,0,0}}}

# ## change font size input
# ## #+ATTR_LATEX: :options basicstyle=\\ttfamily\\scriptsize
# ## change font size output
# ## \\RecustomVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\tiny,formatcom = {\\color[rgb]{0.5,0,0}}}

** Display 
#+LATEX_HEADER: \\RequirePackage{colortbl} % arrayrulecolor to mix colors

# ## valid and cross symbols
#+LaTeX_HEADER: \\RequirePackage{pifont}
#+LaTeX_HEADER: \\RequirePackage{relsize}
#+LaTeX_HEADER: \\newcommand{\\Cross}{{\\raisebox{-0.5ex}%
#+LaTeX_HEADER:		{\\relsize{1.5}\\ding{56}}}\\hspace{1pt} }
#+LaTeX_HEADER: \\newcommand{\\Valid}{{\\raisebox{-0.5ex}%
#+LaTeX_HEADER:		{\\relsize{1.5}\\ding{52}}}\\hspace{1pt} }
#+LaTeX_HEADER: \\newcommand{\\CrossR}{ \\textcolor{red}{\\Cross} }
#+LaTeX_HEADER: \\newcommand{\\ValidV}{ \\textcolor{green}{\\Valid} }

# ## warning symbol
#+LaTeX_HEADER: \\usepackage{stackengine}
#+LaTeX_HEADER: \\usepackage{scalerel}
#+LaTeX_HEADER: \\newcommand\\Warning[1][3ex]{%
#+LaTeX_HEADER:   \\renewcommand\\stacktype{L}%
#+LaTeX_HEADER:   \\scaleto{\\stackon[1.3pt]{\\color{red}$\\triangle$}{\\tiny\\bfseries !}}{#1}%
#+LaTeX_HEADER:   \\xspace
#+LaTeX_HEADER: }

** Lists
# # fix bug with beamer when specifying options for itemize
# #  https://tex.stackexchange.com/questions/24371/does-enumitem-conflict-with-beamer-for-lists/24491#24491
# #+LaTeX_HEADER: \\usepackage{enumitem}
# #+LaTeX_HEADER: \\setitemize{label=\\usebeamerfont*{itemize item}%
# #+LaTeX_HEADER: \\usebeamercolor[fg]{itemize item}
# #+LaTeX_HEADER: \\usebeamertemplate{itemize item}}

** Image
#+LATEX_HEADER: \\RequirePackage{epstopdf} % to be able to convert .eps to .pdf image files
#+LATEX_HEADER: \\RequirePackage{capt-of} % 
#+LATEX_HEADER: \\RequirePackage{caption} % newlines in graphics

*** Backup slides
#+LATEX_HEADER: \\newcommand{\\backupbegin}{
#+LATEX_HEADER:   \\newcounter{finalframe}
#+LATEX_HEADER:   \\setcounter{finalframe}{\\value{framenumber}}
#+LATEX_HEADER: }
#+LATEX_HEADER: \\newcommand{\\backupend}{
#+LATEX_HEADER:   \\setcounter{framenumber}{\\value{finalframe}}
#+LATEX_HEADER:}

*** Footnotes
#+LaTeX_HEADER: \\RequirePackage{hanging}
#+LaTeX_HEADER: \\setbeamertemplate{footnote}{%
#+LaTeX_HEADER:   \\hangpara{2em}{1}%
#+LaTeX_HEADER:   \\makebox[2em][l]{\\insertfootnotemark}\\footnotesize\\insertfootnotetext\\par%
#+LaTeX_HEADER: } 

** Theme
#+BEAMER_THEME: Singapore [height=20pt]
"
)))

;;;; Latex default
(add-to-list
 'org-structure-template-alist
 `("Ld" ,(concat
"#+TITLE:
#+Author: " user-full-name
"\n\n

# @@latex:any arbitrary LaTeX code@@
\n\n

* CONFIG :noexport:
# #+LaTeX_HEADER:\\affil{Department of Biostatistics, University of Copenhagen, Copenhagen, Denmark}
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+LaTeX_CLASS_OPTIONS: [12pt]
#+OPTIONS:   title:t author:t toc:nil todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t

#+LATEX_HEADER: %
#+LATEX_HEADER: %%%% specifications %%%%
#+LATEX_HEADER: %

** Latex command
#+LATEX_HEADER: \\usepackage{ifthen}
#+LATEX_HEADER: \\usepackage{xifthen}
#+LATEX_HEADER: \\usepackage{xargs}
#+LATEX_HEADER: \\usepackage{xspace}

#+LATEX_HEADER: \\newcommand\\Rlogo{\\textbf{\\textsf{R}}\\xspace} % 

** Notations

** Code
# Documentation at https://org-babel.readthedocs.io/en/latest/header-args/#results
# :tangle (yes/no/filename) extract source code with org-babel-tangle-file, see http://orgmode.org/manual/Extracting-source-code.html 
# :cache (yes/no)
# :eval (yes/no/never)
# :results (value/output/silent/graphics/raw/latex)
# :export (code/results/none/both)
#+PROPERTY: header-args :session *R* :tangle yes :cache no ## extra argument need to be on the same line as :session *R*

# Code display:
#+LATEX_HEADER: \\RequirePackage{fancyvrb}
#+LATEX_HEADER: \\DefineVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\small,formatcom = {\\color[rgb]{0.5,0,0}}}

# ## change font size input
# ## #+ATTR_LATEX: :options basicstyle=\\ttfamily\\scriptsize
# ## change font size output
# ## \\RecustomVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\tiny,formatcom = {\\color[rgb]{0.5,0,0}}}

** Display 
#+LATEX_HEADER: \\RequirePackage{colortbl} % arrayrulecolor to mix colors
#+LATEX_HEADER: \\RequirePackage{setspace} % to modify the space between lines - incompatible with footnote in beamer
#+LaTeX_HEADER:\\renewcommand{\\baselinestretch}{1.1}
#+LATEX_HEADER:\\geometry{top=1cm}

** Image
#+LATEX_HEADER: \\RequirePackage{epstopdf} % to be able to convert .eps to .pdf image files
#+LATEX_HEADER: \\RequirePackage{capt-of} % 
#+LATEX_HEADER: \\RequirePackage{caption} % newlines in graphics
"
)))
;;;; Referee report
;;;; Latex math
(add-to-list
 'org-structure-template-alist
 `("Lm" ,(concat
"
** Algorithm
#+LATEX_HEADER: \\RequirePackage{amsmath}
#+LATEX_HEADER: \\RequirePackage{algorithm}
#+LATEX_HEADER: \\RequirePackage[noend]{algpseudocode}

** Math
#+LATEX_HEADER: \\RequirePackage{dsfont}
#+LATEX_HEADER: \\RequirePackage{amsmath,stmaryrd,graphicx}
#+LATEX_HEADER: \\RequirePackage{prodint} % product integral symbol (\\PRODI)

# ## lemma
# #+LaTeX_HEADER: \\RequirePackage{amsthm}
# #+LaTeX_HEADER: \\newtheorem{theorem}{Theorem}
# #+LaTeX_HEADER: \\newtheorem{lemma}[theorem]{Lemma}

*** Template for shortcut
#+LATEX_HEADER: \\newcommand\\defOperator[7]{%
#+LATEX_HEADER:	\\ifthenelse{\\isempty{#2}}{
#+LATEX_HEADER:		\\ifthenelse{\\isempty{#1}}{#7{#3}#4}{#7{#3}#4 \\left#5 #1 \\right#6}
#+LATEX_HEADER:	}{
#+LATEX_HEADER:	\\ifthenelse{\\isempty{#1}}{#7{#3}#4_{#2}}{#7{#3}#4_{#1}\\left#5 #2 \\right#6}
#+LATEX_HEADER: }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommand\\defUOperator[5]{%
#+LATEX_HEADER: \\ifthenelse{\\isempty{#1}}{
#+LATEX_HEADER:		#5\\left#3 #2 \\right#4
#+LATEX_HEADER: }{
#+LATEX_HEADER:	\\ifthenelse{\\isempty{#2}}{\\underset{#1}{\\operatornamewithlimits{#5}}}{
#+LATEX_HEADER:		\\underset{#1}{\\operatornamewithlimits{#5}}\\left#3 #2 \\right#4}
#+LATEX_HEADER: }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommand{\\defBoldVar}[2]{	
#+LATEX_HEADER:	\\ifthenelse{\\equal{#2}{T}}{\\boldsymbol{#1}}{\\mathbf{#1}}
#+LATEX_HEADER: }

*** Shortcuts

**** Probability
#+LATEX_HEADER: \\newcommandx\\Cov[2][1=,2=]{\\defOperator{#1}{#2}{C}{ov}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Esp[2][1=,2=]{\\defOperator{#1}{#2}{E}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Prob[2][1=,2=]{\\defOperator{#1}{#2}{P}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Qrob[2][1=,2=]{\\defOperator{#1}{#2}{Q}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Var[2][1=,2=]{\\defOperator{#1}{#2}{V}{ar}{\\lbrack}{\\rbrack}{\\mathbb}}

#+LATEX_HEADER: \\newcommandx\\Binom[2][1=,2=]{\\defOperator{#1}{#2}{B}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Gaus[2][1=,2=]{\\defOperator{#1}{#2}{N}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Wishart[2][1=,2=]{\\defOperator{#1}{#2}{W}{ishart}{(}{)}{\\mathcal}}

#+LATEX_HEADER: \\newcommandx\\Likelihood[2][1=,2=]{\\defOperator{#1}{#2}{L}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Information[2][1=,2=]{\\defOperator{#1}{#2}{I}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Score[2][1=,2=]{\\defOperator{#1}{#2}{S}{}{(}{)}{\\mathcal}}

**** Operators
#+LATEX_HEADER: \\newcommandx\\Vois[2][1=,2=]{\\defOperator{#1}{#2}{V}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\IF[2][1=,2=]{\\defOperator{#1}{#2}{IF}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Ind[1][1=]{\\defOperator{}{#1}{1}{}{(}{)}{\\mathds}}

#+LATEX_HEADER: \\newcommandx\\Max[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{min}}
#+LATEX_HEADER: \\newcommandx\\Min[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{max}}
#+LATEX_HEADER: \\newcommandx\\argMax[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{argmax}}
#+LATEX_HEADER: \\newcommandx\\argMin[2][1=,2=]{\\defUOperator{#1}{#2}{(}{)}{argmin}}
#+LATEX_HEADER: \\newcommandx\\cvD[2][1=D,2=n \\rightarrow \\infty]{\\xrightarrow[#2]{#1}}

#+LATEX_HEADER: \\newcommandx\\Hypothesis[2][1=,2=]{
#+LATEX_HEADER:         \\ifthenelse{\\isempty{#1}}{
#+LATEX_HEADER:         \\mathcal{H}
#+LATEX_HEADER:         }{
#+LATEX_HEADER: 	\\ifthenelse{\\isempty{#2}}{
#+LATEX_HEADER: 		\\mathcal{H}_{#1}
#+LATEX_HEADER: 	}{
#+LATEX_HEADER: 	\\mathcal{H}^{(#2)}_{#1}
#+LATEX_HEADER:         }
#+LATEX_HEADER:         }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommandx\\dpartial[4][1=,2=,3=,4=\\partial]{
#+LATEX_HEADER: 	\\ifthenelse{\\isempty{#3}}{
#+LATEX_HEADER: 		\\frac{#4 #1}{#4 #2}
#+LATEX_HEADER: 	}{
#+LATEX_HEADER: 	\\left.\\frac{#4 #1}{#4 #2}\\right\\rvert_{#3}
#+LATEX_HEADER: }
#+LATEX_HEADER: }

#+LATEX_HEADER: \\newcommandx\\dTpartial[3][1=,2=,3=]{\\dpartial[#1][#2][#3][d]}

#+LATEX_HEADER: \\newcommandx\\ddpartial[3][1=,2=,3=]{
#+LATEX_HEADER: 	\\ifthenelse{\\isempty{#3}}{
#+LATEX_HEADER: 		\\frac{\\partial^{2} #1}{\\partial #2^2}
#+LATEX_HEADER: 	}{
#+LATEX_HEADER: 	\\frac{\\partial^2 #1}{\\partial #2\\partial #3}
#+LATEX_HEADER: }
#+LATEX_HEADER: } 

**** General math
#+LATEX_HEADER: \\newcommand\\Real{\\mathbb{R}}
#+LATEX_HEADER: \\newcommand\\Rational{\\mathbb{Q}}
#+LATEX_HEADER: \\newcommand\\Natural{\\mathbb{N}}
#+LATEX_HEADER: \\newcommand\\trans[1]{{#1}^\\intercal}%\\newcommand\\trans[1]{{\\vphantom{#1}}^\\top{#1}}
#+LATEX_HEADER: \\newcommand{\\independent}{\\mathrel{\\text{\\scalebox{1.5}{$\\perp\\mkern-10mu\\perp$}}}}
#+LaTeX_HEADER: \\newcommand\\half{\\frac{1}{2}}
#+LaTeX_HEADER: \\newcommand\\normMax[1]{\\left|\\left|#1\\right|\\right|_{max}}
#+LaTeX_HEADER: \\newcommand\\normTwo[1]{\\left|\\left|#1\\right|\\right|_{2}}
"
)))

;;;; Latex letter
(add-to-list
 'org-structure-template-alist
 `("Ll" ,(concat
"
#+LaTeX: \\onehalfspacing
#+LaTeX: \\pagestyle{empty}

# ### destinataire
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

** latex packages
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional packages %%%%
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


;;;; Latex tikz
(add-to-list
 'org-structure-template-alist
 `("Ltikz" ,(concat
"#+TITLE:
#+Author: Brice Ozenne

#+BEGIN_EXPORT latex
\\begin{preview}
\\begin{tikzpicture}[auto]
% endogenous variables
		\\tikzstyle{every node} = [NodeData, draw=\\darkblue]
			\\node (Y1) at (-5, 3) {$Region_1$};
			\\node (Y2) at (-5, 0) {$Region_2$};
			\\node (Y3) at (-5, -3) {$Region_3$};
% latent variables
		\\tikzstyle{every node} = [NodeLV]
			\\node (eta)[minimum size=2cm] at (0, 0) [draw]{\\Large $\\eta_{5HT4}$};

% exogeneous variable
		\\tikzstyle{every node} = [NodeData=green, draw=\\darkgreen]
			\\node (X1) at (5, 1.5) {Age};
			\\node (X2) at (5, -1.5) {Gene 1};

% loading
         	\\tikzstyle{every node} = [,]
                \\foreach \\to/\\from/\\legend in {Y1/eta/1, Y2/eta/1, Y3/eta/1, eta/X1/}	
                \\draw [GrayArrow] (\\from) -- node[LegendArrow]{\\Large \\legend} (\\to);
% regression
                \\foreach \\to/\\from/\\legend in {eta/X2/$\\gamma_1$}	
                \\draw [BlackArrow, dashed] (\\from) -- node[LegendArrow]{\\Large \\legend} (\\to);
% intercept
                \\draw [GrayArrow] (-6.5, 2.6) -- node[LegendArrow, below]{\\Large $0$} (-5.7, 2.6);
                \\draw [BlackArrow, dashed] (-6.5, -0.4) -- node[LegendArrow, below]{\\Large $\\nu_2$} (-5.7, -0.4);
%                \\draw [GrayArrow] (-6.5, -3.4) -- node[LegendArrow, below]{} (-5.7, -3.4);

% variance
\\draw [GrayArrow,stealth-stealth] (Y1.north) arc [radius=0.5, start angle=10, end angle = 250]  node[midway, above]{\\Large $\\sigma^2$};
\\draw [GrayArrow,stealth-stealth] (Y2.north) arc [radius=0.5, start angle=10, end angle = 250]  node[midway, above]{\\Large $\\sigma^2$};
\\draw [GrayArrow,stealth-stealth] (Y3.north) arc [radius=0.5, start angle=10, end angle = 250]  node[midway, above]{\\Large $\\sigma^2$};
\\end{tikzpicture}
\\end{preview}
#+END_EXPORT

* CONFIG :noexport:
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+OPTIONS:   title:t author:t toc:nil todo:t 
#+OPTIONS:   TeX:t LaTeX:t

** Latex packages
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional packages %%%%
#+LaTeX_HEADER: %
#+LaTeX_HEADER:\\usepackage[pdftex,active,tightpage]{preview} % to get standalone diagram
#+LaTeX_HEADER:%\\setlength\\PreviewBorder{2mm} % use to add a border around the image

** Latex command
#+LaTeX_HEADER: %
#+LaTeX_HEADER: %%%% additional latex commands %%%%
#+LaTeX_HEADER: %
#+LaTeX_HEADER: \\newcommand{\\lightblue}{blue!50!white}
#+LaTeX_HEADER: \\newcommand{\\darkblue}{blue!80!black}
#+LaTeX_HEADER: \\newcommand{\\darkgreen}{green!50!black}
#+LaTeX_HEADER: \\newcommand{\\darkred}{red!50!black}
#+LaTeX_HEADER: \\definecolor{gray}{gray}{0.5}

** Tikz 
#+LATEX_HEADER: \\RequirePackage{tikz}
#+LATEX_HEADER: \\RequirePackage{tkz-euclide} % for working with euclidean grids
#+LATEX_HEADER: \\usetikzlibrary{arrows} % various types of arrows
#+LATEX_HEADER: \\usetikzlibrary{shapes} % various shapes for nodes
#+LATEX_HEADER: \\usetikzlibrary{positioning} % relative positionning of nodes
#+LATEX_HEADER: \\usetikzlibrary{shadows}
#+LATEX_HEADER: \\usetikzlibrary{backgrounds,fit,calc}

#+LATEX_HEADER: \\tikzset{YellowArrow/.style={line width=2pt, ->,  >=latex, yellow}}
#+LATEX_HEADER: \\tikzset{GrayArrow/.style={line width=2pt, ->,  >=latex, gray}}
#+LATEX_HEADER: \\tikzset{BlackArrow/.style={line width=2pt, ->,  >=latex, black}}
#+LATEX_HEADER: \\tikzset{DoubleBlackArrow/.style={line width=2pt, <->,  >=latex, black}}
#+LATEX_HEADER: \\tikzset{BlueArrow/.style={line width=2pt, ->,  >=latex, \\darkblue}}
#+LATEX_HEADER: \\tikzset{BlueCov/.style={line width=2pt, <->,  >=latex, \\darkblue}}
#+LATEX_HEADER: \\tikzset{RedArrow/.style={line width=2pt,->,  >=latex, \\darkred}}
#+LATEX_HEADER: \\tikzset{GreenArrow/.style={line width=2pt,->,  >=latex, \\darkgreen}}
#+LATEX_HEADER: \\tikzset{LegendArrow/.style={midway,#1,scale=1.25},
#+LATEX_HEADER:     	LegendArrow/.default={above}}
#+LATEX_HEADER: \\tikzset{NodeLV/.style={circle, fill=blue!30, very thick, fill=red!30, draw=\\darkred}}
#+LATEX_HEADER: \\tikzset{NodeData/.style={rectangle, minimum width=1cm,minimum height=1cm, rounded corners=2pt,  very thick, fill=#1!30,draw=#1},
#+LATEX_HEADER: 	NodeData/.default={blue}}"
)))

;;;; Latex trackchange
(add-to-list
 'org-structure-template-alist
 `("Lchange" ,(concat
"
** Track change
#+LaTeX_HEADER:\\definechangesauthor[name={Brice}, color=orange]{Brice}
#+LaTeX_HEADER:\\colorlet{Changes@Color}{orange} % change default color
#+LaTeX_HEADER:\\setauthormarkup{} % change what is displayed when specifying id
#+LaTeX_HEADER:\\setremarkmarkup{\\footnote{\\textcolor{Changes@Color#1}{Remark from #1: #2}}} % change what is displayed when specifying remark


# # Example
# # This is \\added[id=Brice]{new} text.
# # This is \\deleted[id=Brice]{unnecessary}text.
# # This is \\replaced[id=Brice]{nice}{bad} text.

\n")))


;;; org shortcut
;;;; agenda contact
(add-to-list
 'org-structure-template-alist
 '("contact" 
"** ? :TAG: 
:PROPERTIES:
:EMAIL1: 
:TELEPHONE1: 
:ADRESS1: 
:WORK: 
:LEISURE: 
:WITH: 
:KIDS: 
:DATE-OF-BIRTH:
:END:          "))

;;;; Beamer: column slides
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

;;;; Latex: align
(add-to-list
 'org-structure-template-alist
 '("leq" 
"#+BEGIN_EXPORT latex
\\begin{align*}
?
\\end{align*}
#+END_EXPORT"))
;;;; Latex: align
(add-to-list
 'org-structure-template-alist
 '("litem" 
"#+BEGIN_EXPORT latex
\\begin{itemize}
\\item ?
\\end{itemize}
#+END_EXPORT"))
;;;; Latex: columns
(add-to-list
 'org-structure-template-alist
 '("lcol" 
"#+LaTeX: \\begin{columns}
#+LaTeX: \\begin{column}{0.45\\columnwidth}
?
#+LaTeX: \\end{column}
#+LaTeX: \\begin{column}{0.45\\columnwidth}

#+LaTeX: \\end{column}
#+LaTeX: \\end{columns}"))

;;;; Latex: header
(add-to-list
 'org-structure-template-alist
 '("Lh" "#+LaTeX_HEADER:?"))

;;;; Latex: image
(add-to-list
 'org-structure-template-alist
 `("Li" ,(concat
"
#+name: fig:1
#+ATTR_LaTeX: :width 1\\textwidth :placement [!h]
#+CAPTION:
[[./figures/?]]

"
)))

;;;; Latex: caption
(add-to-list
 'org-structure-template-alist
 `("Lc" ,(concat
"#+CAPTION:?"
)))

;;;; Latex: one line formula
(add-to-list
 'org-structure-template-alist
 '("leqO" 
"#+BEGIN_EXPORT latex
\\[ ? \\]
#+END_EXPORT"))

;;;; Latex: bibliography
(add-to-list
 'org-structure-template-alist
 '("LbBiblio" 
"* References
:PROPERTIES:
:BEAMER_OPT: fragile,allowframebreaks
:END:  

#+LaTeX: \\begingroup
#+LaTeX: \\renewcommand{\\section}[2]{}
bibliographystyle:apalike
[[bibliography:bibliography.bib]]
# help: https://gking.harvard.edu/files/natnotes2.pdf
#+LaTeX: \\endgroup
"))

(add-to-list
 'org-structure-template-alist
 '("LdBiblio" 
"* References
#+LaTeX: \\begingroup
#+LaTeX: \\renewcommand{\\section}[2]{}
bibliographystyle:apalike
[[bibliography:bibliography.bib]]
# help: https://gking.harvard.edu/files/natnotes2.pdf
#+LaTeX: \\endgroup
"))

;;;; Latex: reference external document
(add-to-list
 'org-structure-template-alist
 '("Lxr" 
"#+LaTeX_HEADER:\\usepackage{xr} %% read the .aux of the external file
#+LaTeX_HEADER: \\externaldocument[prefix-]{mydocWithoutExtension}
"))
;;;; Latex: box
(add-to-list
 'org-structure-template-alist
 '("Lbox" 
"#+LaTeX_HEADER: \\setbeamercolor{uppercol}{fg=black,bg=blue!35}
#+LaTeX_HEADER: \\setbeamercolor{lowercol}{fg=black,bg=blue!10}
\\begin{beamerboxesrounded}[upper=uppercol,lower=lowercol,shadow=true]
{boxtitle} 
boxcontent
\\end{beamerboxesrounded}

"))
;;;; Latex: dag
(add-to-list
 'org-structure-template-alist
 '("Ldag" 
"#+LaTeX_HEADER: \\RequirePackage{tikz}
#+BEGIN_EXPORT latex
\\begin{tikzpicture}
    \\node[draw=none,fill=none] (W) at (-2,1) {W};
    \\node[draw=none,fill=none] (X) at (-1,0) {X};
    \\node[draw=none,fill=none] (Z) at (0,1) {Z};
    \\node[draw=none,fill=none] (Y) at (1,0) {Y};
    \\node[draw=none,fill=none] (V) at (2,1) {V};

    \\path [->,very thick](W) edge node[left] {} (X);
    \\path [->,very thick](Z) edge node[left] {} (X);
    \\path [->,very thick](Z) edge node[left] {} (Y);
    \\path [->,very thick](V) edge node[left] {} (Y);
\\end{tikzpicture}
"))
;;;; Latex: affiliations
(add-to-list
 'org-structure-template-alist
 '("affiliations" 
"#+AUTHOR:
#+LATEX_HEADER:\\usepackage{authblk} % enable several affiliations (clash with beamer)
#+LaTeX_HEADER:\\author[1,2]{Author A}
#+LaTeX_HEADER:\\author[1]{Author B}
#+LaTeX_HEADER:\\author[2]{Author C}
#+LaTeX_HEADER:\\affil[1]{Affiliation A}
#+LaTeX_HEADER:\\affil[2]{Affiliation B}
"))



;;; R code
;;;; R hide code and result
(add-to-list
 'org-structure-template-alist
 '("Rh" 
"#+BEGIN_SRC R :results output raw drawer  :exports none :session *R* :cache no 

#+END_SRC"))

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
"   
# see https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-R.html for more arguments
# #+header: :width 4 :height 4 :R-dev-args bg=\"lightgrey\" 
#+BEGIN_SRC R :results graphics :file %file :exports results :session *R* :cache no

#+END_SRC

#+name: fig:1
#+ATTR_LATEX: :width 0.7\\textwidth
#+CAPTION:\n"
))

;;; Lips code
(add-to-list
 'org-structure-template-alist
 '("lisp" 
"#+BEGIN_SRC emacs-lisp

#+END_SRC"))

;;; Agenda template

(add-to-list
 'org-structure-template-alist
 '("event" 
   "* Event
   :PROPERTIES:
   :on:
   :with:
   :END:"
   ))

(add-to-list
 'org-structure-template-alist
 '("meeting" 
   "* Meeting
   :PROPERTIES:
   :on:
   :with:
   :END:"
   ))

 (add-to-list
 'org-structure-template-alist
 '("task" 
   "* Task
   :PROPERTIES:
   :on:
   :with:
   :END:"
   ))

