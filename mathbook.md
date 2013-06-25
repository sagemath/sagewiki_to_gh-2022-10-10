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

Updated: June 25, 2013
  
  (Use your browser to save these files locally, do not simply click on them)

  1.  [[http://buzzard.ups.edu/mathbook/calculus-article.xml|Example XML source document]]
  1.  [[http://buzzard.ups.edu/mathbook/article-latex.xsl|XSL transform to LaTeX]]
  1.  [[http://buzzard.ups.edu/mathbook/article-html.xsl|XSL transform to XHTML]]

Easiest: you should be able to preview the source file (calculus-article.xml) by opening it in a web browser with the stylesheet (article-html.xsl) in the same directory.  This works on some browsers, and not on others, so experiment.  I have used Firefox on Ubuntu with success.

Easy: use the following command to create XHTML output and view in your browser by opening the output file, which should look like:  [[[[http://buzzard.ups.edu/mathbook/calculus-article.html|XHTML Output]].  MathJax does the math, Sage Cell Server does the code.

{{{
xsltproc article-html.xsl calculus-article.xml > calculus-html.tex
}}}

Alternate: issue the following to produce [[[[http://buzzard.ups.edu/mathbook/calculus-article.pdf|PDF Output]].  Sage cells are being ignored right now.  A text version of these should be easy to implement.

{{{
xsltproc article-latex.xsl calculus-article.xml > calculus-article.tex
pdflatex calculus-article.tex
}}}
