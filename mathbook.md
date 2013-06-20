= MathBook: An XML Application =


== Files and Examples ==

  1. XSL transform to LaTeX [[http://buzzard.ups.edu/mathbook/article-latex.xsl]]
  1. XSL transform to XHTML [[http://buzzard.ups.edu/mathbook/article-html.xsl]]
  1. Example XML document  [[http://buzzard.ups.edu/mathbook/calculus-article.xml]]

To use, for example, put all files in the same directory and issue

{{{
xsltproc article-latex.xsl calculus-article.xml > calculus-article.tex
pdflatex calculus-article.tex
}}}

Or you should be able to preview the source file (*.xml) by opening it in a web browser with the stylesheet (*.xsl) in the same directory.
