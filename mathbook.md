= MathBook: An XML Application =

A specification for XML tags and stylesheets to create usable output.

Design Goals:

  1. Simple for authors to use - no more complicated logically than LaTeX.
  1. Capture the structure of writing about mathematics and Sage
  1. Processing into a variety of formats

Output Formats:

  1.  HTML web pages, enhanced with MathJax, Sage Cell server, knowls
  1.  LaTeX input to create PDFs and print with {{{pdflatex}}}
  1.  HTML for in-browser previewing
  1.  Doctesting of Sage code examples
  1.  E-Books, once technically feasible

Project Status:

  * Funding:  Shuttleworth Foundation Flash Grant, National Science Foundation UTMOST Grant
  * Mid-June 2013: initiated, not mature or stable


== Files and Examples ==
  (Use your browser to save these files locally, do not simply click on them)

  1. XSL transform to LaTeX [[http://buzzard.ups.edu/mathbook/article-latex.xsl]]
  1. XSL transform to XHTML [[http://buzzard.ups.edu/mathbook/article-html.xsl]]
  1. Example XML document  [[http://buzzard.ups.edu/mathbook/calculus-article.xml]]

To use, for example, put all files in the same directory and issue

{{{
xsltproc article-latex.xsl calculus-article.xml > calculus-article.tex
pdflatex calculus-article.tex
}}}

Or you should be able to preview the source file (*.xml) by opening it in a web browser with the stylesheet (*.xsl) in the same directory.  This works on some browsers, and not on others, so experiment.  I have used Firefox on Ubuntu with success.
