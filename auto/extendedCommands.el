(TeX-add-style-hook
 "extendedCommands"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10"
    "listings"
    "inputenc"
    "fontenc"
    "lmodern"
    "textcomp"
    "color"
    "enumerate"
    "graphicx"
    "grffile"
    "wrapfig"
    "capt-of"
    "rotating"
    "caption"
    "longtable"
    "multirow"
    "multicol"
    "pdflscape"
    "setspace"
    "geometry"
    "amssymb"
    "amsmath"
    "amsfonts"
    "dsfont"
    "array"
    "ifthen"
    "hyperref"
    "natbib")
   (LaTeX-add-labels
    "sec:org87eb94c"
    "sec:orgc36b5e2"
    "sec:org1c1c281"
    "sec:org5aa2ecd"
    "sec:org8e57ed4"
    "sec:orge99b73e"
    "sec:orgc4eddb6"
    "sec:orge1426d3"
    "sec:org19dce5f"
    "sec:orgcc5df99"
    "sec:orge1d7941"
    "sec:org51f7684"
    "sec:orgca17c1d"
    "sec:org28659c8"
    "sec:org849fa32"
    "sec:orgeb624cf"
    "sec:org0893060"
    "sec:org91fa5b3"
    "sec:orgc147246"
    "sec:org1ffb7ef"
    "sec:orge001202"
    "sec:orgaeb2ef5"
    "sec:orgc3684b7"
    "sec:org2ea6571"
    "sec:org072e526"
    "sec:org1199bc9"
    "sec:orgda94750"
    "sec:org15b699e"
    "sec:org90030dc"
    "sec:orgda188a0"
    "sec:orge4dab77"))
 :latex)

