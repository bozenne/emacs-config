;; NOTE: ? is the  where the cursor should wind up at the end

;;; Document class

;;;; Beamer
(add-to-list
 'org-structure-template-alist
 `("Lb" ,(concat
"#+TITLE: My presentation ? 
#+Author: " user-full-name
"\n#+LaTeX_HEADER: \\institute{
#+LaTeX_HEADER: \\textsuperscript{1} Section of Biostatistics, Department of Public Health, University of Copenhagen
#+LaTeX_HEADER: \\and \\textsuperscript{2} Neurobiology Research Unit, University Hospital of Copenhagen, Rigshospitalet.
#+LaTeX_HEADER: }
#+DATE: " (format-time-string "%A, %d %B %Y")
"\n#+EMAIL:" user-mail-address
"\n\n
# add title in the footpage (remember to comment lines in *config **Display of the document)
#+LaTeX: \\addtocounter{framenumber}{-1}
#+LaTeX: \\setbeamertemplate{footline}{
#+LaTeX: \\vspace{-0.3cm}
#+LaTeX:   \\noindent\\makebox[\\textwidth][s]{
#+LaTeX:   \\hspace{5mm} \\usebeamerfont{title in head/foot}\\insertshorttitle \\hfill
#+LaTeX:   \\usebeamercolor[fg]{structure} {\\small \\insertframenumber{} / \\inserttotalframenumber} \\hspace{5mm} 
#+LaTeX:   }
#+LaTeX:  \\vspace{0.3cm}
 #+LaTeX: }
* Introduction\n
** Part I\n
*** First slide\n
xx
\n\n
* Reference :noexport:
# help: https://gking.harvard.edu/files/natnotes2.pdf
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
#+LaTeX_class_options: [11pt,table] 
#+LaTeX_HEADER: \\subtitle{}
#+LaTeX_HEADER: \\setbeamertemplate{footline}[frame number]
#+LaTeX_HEADER: \\setbeamertemplate{navigation symbols}{}
#+OPTIONS:   title:t author:t toc:nil todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t
** Display of the document
# ## margins
#+LATEX_HEADER:\\geometry{left=1cm}
# ## page number
#+LaTeX_HEADER: \\setbeamertemplate{footline}{} %% remove numbering
# #+LaTeX_HEADER: \\setbeamerfont{footline}{size=\\small} %% increase size and 
# #+LaTeX_HEADER: \\setbeamertemplate{footline}[frame number]{}
# #+LaTeX_HEADER: \\setbeamercolor{footline}{fg=blue}
# ## handout (i.e. animation-free: last slide)
# #+LaTeX_CLASS_options: [handout]
# #+LaTeX_HEADER: \\usepackage{pdfpages}
# #+LaTeX_HEADER: \\mode<handout>{
# #+LaTeX_HEADER: \\pdfpageuselayout{resize to}[a4paper, landscape]
# #+LaTeX_HEADER: }
** Theme
#+BEAMER_THEME: Singapore [height=20pt]
** Color
# # define new colors
#+LATEX_HEADER: \\RequirePackage{colortbl} % arrayrulecolor to mix colors
#+LaTeX_HEADER: \\definecolor{myorange}{rgb}{1,0.2,0}
#+LaTeX_HEADER: \\definecolor{mypurple}{rgb}{0.7,0,8}
#+LaTeX_HEADER: \\definecolor{mycyan}{rgb}{0,0.6,0.6}
#+LaTeX_HEADER: \\newcommand{\\lightblue}{blue!50!white}
#+LaTeX_HEADER: \\newcommand{\\darkblue}{blue!80!black}
#+LaTeX_HEADER: \\newcommand{\\darkgreen}{green!50!black}
#+LaTeX_HEADER: \\newcommand{\\darkred}{red!50!black}
#+LaTeX_HEADER: \\definecolor{gray}{gray}{0.5}
# # change the color of the links
#+LaTeX_HEADER: \\hypersetup{
#+LaTeX_HEADER:  citecolor=[rgb]{0,0.5,0},
#+LaTeX_HEADER:  urlcolor=[rgb]{0,0,0.5},
#+LaTeX_HEADER:  linkcolor=[rgb]{0,0,0.5},
#+LaTeX_HEADER: }
# beamer seems to ignore the citecolor so this is a solution
# https://tex.stackexchange.com/questions/104290/beamer-ignores-citecolor-from-hyperref
#+LaTeX_HEADER: \\let\\oldcite=\\cite                                                     
#+LaTeX_HEADER: \\renewcommand{\\cite}[1]{\\textcolor[rgb]{0,0.5,0}{\\oldcite{#1}}}
** Font
# https://tex.stackexchange.com/questions/25249/how-do-i-use-a-particular-font-for-a-small-section-of-text-in-my-document
#+LaTeX_HEADER: \\newenvironment{comment}{\\small \\color{gray}\\fontfamily{lmtt}\\selectfont}{\\par}
#+LaTeX_HEADER: \\newenvironment{activity}{\\color{orange}\\fontfamily{qzc}\\selectfont}{\\par}
# #+LaTeX_HEADER: \\newcommand\\comment[1]{ {\\small \\color{gray}\\fontfamily{lmtt}\\selectfont #1} }
#+LaTeX_HEADER: \\newcommand\\highlight[1]{ {\\usebeamercolor[fg]{structure}\\textbf{\\selectfont #1}} }
** Symbols
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
# # R Software
#+LATEX_HEADER: \\newcommand\\Rlogo{\\textbf{\\textsf{R}}\\xspace} % 
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
# ## change font size input (global change)
# ## doc: https://ctan.math.illinois.edu/macros/latex/contrib/listings/listings.pdf
# #+LATEX_HEADER: \newskip\skipamount   \skipamount =6pt plus 0pt minus 6pt
# #+LATEX_HEADER: \\lstdefinestyle{code-tiny}{basicstyle=\\ttfamily\\tiny, aboveskip = \skipamount, belowskip = \skipamount}
# #+LATEX_HEADER: \\lstset{style=code-tiny}
# ## change font size input (local change, put just before BEGIN_SRC)
# ## #+ATTR_LATEX: :options basicstyle=\\ttfamily\\scriptsize
# ## change font size output (global change)
# ## \\RecustomVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\tiny,formatcom = {\\color[rgb]{0.5,0,0}}}
** Lists
#+LaTeX_HEADER: \\usepackage{enumitem} % better than enumerate
# fix bug with beamer when specifying options for itemize
#  https://tex.stackexchange.com/questions/24371/does-enumitem-conflict-with-beamer-for-lists/24491#24491
#+LaTeX_HEADER: \\setitemize{label=\\usebeamerfont*{itemize item}%
#+LaTeX_HEADER: \\usebeamercolor[fg]{itemize item}
#+LaTeX_HEADER: \\usebeamertemplate{itemize item}}
** Image
#+LATEX_HEADER: \\RequirePackage{epstopdf} % to be able to convert .eps to .pdf image files
#+LATEX_HEADER: \\RequirePackage{capt-of} % 
#+LATEX_HEADER: \\RequirePackage{caption} % newlines in graphics
** Backup slides
#+LATEX_HEADER: \\newcommand{\\backupbegin}{
#+LATEX_HEADER:   \\newcounter{finalframe}
#+LATEX_HEADER:   \\setcounter{finalframe}{\\value{framenumber}}
#+LATEX_HEADER: }
#+LATEX_HEADER: \\newcommand{\\backupend}{
#+LATEX_HEADER:   \\setcounter{framenumber}{\\value{finalframe}}
#+LATEX_HEADER:}
** Footnotes
#+LaTeX_HEADER: \\RequirePackage{hanging}
#+LaTeX_HEADER: \\setbeamertemplate{footnote}{%
#+LaTeX_HEADER:   \\hangpara{2em}{1}%
#+LaTeX_HEADER:   \\makebox[2em][l]{\\insertfootnotemark}\\footnotesize\\insertfootnotetext\\par%
#+LaTeX_HEADER: } 
** Inline latex
# @@latex:any arbitrary LaTeX code@@
"
)))

;;;; Latex default
(add-to-list
 'org-structure-template-alist
 `("Ld" ,(concat
"#+TITLE: My document ?
#+Author:
#+LATEX_HEADER: \\RequirePackage{authblk}
#+LaTeX_HEADER: \\author[1,2]{"user-full-name"}
#+LaTeX_HEADER: \\affil[1]{Section of Biostatistics, Department of Public Health, University of Copenhagen}
#+LaTeX_HEADER: \\affil[2]{Neurobiology Research Unit, University Hospital of Copenhagen, Rigshospitalet}
#+DATE: " (format-time-string "%A, %d %B %Y")
"\n#+EMAIL: " user-mail-address
"\n\n
* Introduction\n
** Part I\n
xx
\n\n
* Reference :noexport:
# help: https://gking.harvard.edu/files/natnotes2.pdf
#+BEGIN_EXPORT latex
\\begingroup
\\renewcommand{\\section}[2]{}
#+END_EXPORT
bibliographystyle:apalike
[[bibliography:bibliography.bib]] 
#+BEGIN_EXPORT latex
\\endgroup
#+END_EXPORT
#+BEGIN_EXPORT LaTeX
\\appendix
\\titleformat{\\section}
{\\normalfont\\Large\\bfseries}{}{1em}{Appendix~\\thesection:~}
\\renewcommand{\\thefigure}{\\Alph{figure}}
\\renewcommand{\\thetable}{\\Alph{table}}
\\renewcommand{\\theequation}{\\Alph{equation}}
\\setcounter{figure}{0}    
\\setcounter{table}{0}    
\\setcounter{equation}{0}    
\\setcounter{page}{1}
#+END_EXPORT
* CONFIG :noexport:
#+LANGUAGE:  en
#+LaTeX_CLASS: org-article
#+LaTeX_CLASS_OPTIONS: [12pt]
#+OPTIONS:   title:t author:t toc:nil todo:nil
#+OPTIONS:   H:3 num:t 
#+OPTIONS:   TeX:t LaTeX:t
** Display of the document
# ## space between lines
#+LATEX_HEADER: \\RequirePackage{setspace} % to modify the space between lines - incompatible with footnote in beamer
#+LaTeX_HEADER:\\renewcommand{\\baselinestretch}{1.1}
# ## margins
#+LATEX_HEADER:\\geometry{top=1cm}
# ## personalize the prefix in the name of the sections
#+LaTeX_HEADER: \\usepackage{titlesec}
# ## fix bug in titlesec version
# ##  https://tex.stackexchange.com/questions/299969/titlesec-loss-of-section-numbering-with-the-new-update-2016-03-15
#+LaTeX_HEADER: \\usepackage{etoolbox}
#+LaTeX_HEADER: 
#+LaTeX_HEADER: \\makeatletter
#+LaTeX_HEADER: \\patchcmd{\\ttlh@hang}{\\parindent\\z@}{\\parindent\\z@\\leavevmode}{}{}
#+LaTeX_HEADER: \\patchcmd{\\ttlh@hang}{\\noindent}{}{}{}
#+LaTeX_HEADER: \\makeatother
** Color
# ## define new colors
#+LATEX_HEADER: \\RequirePackage{colortbl} % arrayrulecolor to mix colors
#+LaTeX_HEADER: \\definecolor{myorange}{rgb}{1,0.2,0}
#+LaTeX_HEADER: \\definecolor{mypurple}{rgb}{0.7,0,8}
#+LaTeX_HEADER: \\definecolor{mycyan}{rgb}{0,0.6,0.6}
#+LaTeX_HEADER: \\newcommand{\\lightblue}{blue!50!white}
#+LaTeX_HEADER: \\newcommand{\\darkblue}{blue!80!black}
#+LaTeX_HEADER: \\newcommand{\\darkgreen}{green!50!black}
#+LaTeX_HEADER: \\newcommand{\\darkred}{red!50!black}
#+LaTeX_HEADER: \\definecolor{gray}{gray}{0.5}
# ## change the color of the links
#+LaTeX_HEADER: \\hypersetup{
#+LaTeX_HEADER:  citecolor=[rgb]{0,0.5,0},
#+LaTeX_HEADER:  urlcolor=[rgb]{0,0,0.5},
#+LaTeX_HEADER:  linkcolor=[rgb]{0,0,0.5},
#+LaTeX_HEADER: }
** Font
# https://tex.stackexchange.com/questions/25249/how-do-i-use-a-particular-font-for-a-small-section-of-text-in-my-document
#+LaTeX_HEADER: \\newenvironment{comment}{\\small \\color{gray}\\fontfamily{lmtt}\\selectfont}{\\par}
#+LaTeX_HEADER: \\newenvironment{activity}{\\color{orange}\\fontfamily{qzc}\\selectfont}{\\par}
** Symbols
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
# # R Software
#+LATEX_HEADER: \\newcommand\\Rlogo{\\textbf{\\textsf{R}}\\xspace} % 
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
# ## change font size input (global change)
# ## doc: https://ctan.math.illinois.edu/macros/latex/contrib/listings/listings.pdf
# #+LATEX_HEADER: \newskip\skipamount   \skipamount =6pt plus 0pt minus 6pt
# #+LATEX_HEADER: \\lstdefinestyle{code-tiny}{basicstyle=\\ttfamily\\tiny, aboveskip = \skipamount, belowskip = \skipamount}
# #+LATEX_HEADER: \\lstset{style=code-tiny}
# ## change font size input (local change, put just before BEGIN_SRC)
# ## #+ATTR_LATEX: :options basicstyle=\\ttfamily\\scriptsize
# ## change font size output (global change)
# ## \\RecustomVerbatimEnvironment{verbatim}{Verbatim}{fontsize=\\tiny,formatcom = {\\color[rgb]{0.5,0,0}}}
** Lists
#+LATEX_HEADER: \\RequirePackage{enumitem} % better than enumerate
** Image and graphs
#+LATEX_HEADER: \\RequirePackage{epstopdf} % to be able to convert .eps to .pdf image files
#+LATEX_HEADER: \\RequirePackage{capt-of} % 
#+LATEX_HEADER: \\RequirePackage{caption} % newlines in graphics
#+LaTeX_HEADER: \\RequirePackage{tikz-cd} % graph
# ## https://tools.ietf.org/doc/texlive-doc/latex/tikz-cd/tikz-cd-doc.pdf
** Table
#+LATEX_HEADER: \\RequirePackage{booktabs} % for nice lines in table (e.g. toprule, bottomrule, midrule, cmidrule)
** Inline latex
# @@latex:any arbitrary LaTeX code@@
** Notations
"
)))

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
#+LATEX_HEADER: \\usepackage{ifthen}
#+LATEX_HEADER: \\usepackage{xifthen}
#+LATEX_HEADER: \\usepackage{xargs}
#+LATEX_HEADER: \\usepackage{xspace}
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
**** Probability
#+LATEX_HEADER: \\newcommandx\\Esp[2][1=,2=]{\\defOperator{#1}{#2}{E}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Prob[2][1=,2=]{\\defOperator{#1}{#2}{P}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Qrob[2][1=,2=]{\\defOperator{#1}{#2}{Q}{}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Var[2][1=,2=]{\\defOperator{#1}{#2}{V}{ar}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Cov[2][1=,2=]{\\defOperator{#1}{#2}{C}{ov}{\\lbrack}{\\rbrack}{\\mathbb}}
#+LATEX_HEADER: \\newcommandx\\Binom[2][1=,2=]{\\defOperator{#1}{#2}{B}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Gaus[2][1=,2=]{\\defOperator{#1}{#2}{N}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Wishart[2][1=,2=]{\\defOperator{#1}{#2}{W}{ishart}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\Likelihood[2][1=,2=]{\\defOperator{#1}{#2}{L}{}{(}{)}{\\mathcal}}
#+LATEX_HEADER: \\newcommandx\\logLikelihood[2][1=,2=]{\\defOperator{#1}{#2}{\\ell}{}{(}{)}{}}
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
#+LATEX_HEADER: \\newcommand\\Veta{\\boldsymbol{\\eta}}
#+LATEX_HEADER: \\newcommand\\VX{\\mathbf{X}}
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
