= MathBook: An XML Application =

  1. XSL transform to LaTeX [[attachment:article-latex.xsl]]
  1. XSL transform to XHTML [[attachment:article-html.xsl]]
  1. Example XML document  [[attachment:calculus-article.xml]]

To use, for example, put all files in the same directory and issue

{{{
xsltproc article-latex.xsl calculus-article.xml > calculus-article.tex
pdflatex calculus-article.tex
}}}

Or you should be able to preview 
