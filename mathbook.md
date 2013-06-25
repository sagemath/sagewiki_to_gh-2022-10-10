= MathBook: An XML Application =

A specification for XML tags and stylesheets to create usable output.

[[http://www.beezers.org/blog/bb/2013/06/shuttleworth-flash-grant/|{{attachment:Shuttleworth-Funded-Logo.jpg|Shuttleworth Funded|width=250px}}]]


Design Goals:

  1. Simple for authors to use - no more complicated logically than LaTeX
  1. Capture the structure of writing about mathematics and Sage
  1. Processing into a variety of formats
  1. A limited number of rational tags, with simple names
  1. Minimal use of external shell scripts
  1. XSLT 1.0 compatible: ideally the only required tool is xsltproc 


Output Formats:

  1.  HTML web pages, enhanced with MathJax, Sage Cell server, knowls
  1.  LaTeX input to create PDFs and print with {{{pdflatex}}}
  1.  HTML for in-browser previewing
  1.  Doctesting of Sage code examples
  1.  E-Books, once technically feasible
  1.  Maybe a DocBook representation for conversion to other outputs

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
xsltproc article-html.xsl calculus-article.xml > calculus-article.html
}}}

Alternate: issue the following to produce [[[[http://buzzard.ups.edu/mathbook/calculus-article.pdf|PDF Output]].  Sage cells are being ignored right now.  A textual version of these should be easy to implement.

{{{
xsltproc article-latex.xsl calculus-article.xml > calculus-article.tex
pdflatex calculus-article.tex
}}}

Advanced: create a [[https://cloud.sagemath.ocom|Sage Cloud]] worksheet from the same source.  I have this working in the lab.

== Other Projects ==

 * [[http://tbookdtd.sourceforge.net/|tbook]] looks very much like what I am imagining.  I have hacked a bit of it to work with the {{{xsltproc}}} processor with mixed success.  Only [[http://tbookdtd.sourceforge.net/dtd/index.html|80 elements]].  But for a very short article, I have found cross-references broken and manufacturing a bibliography begins with BibTeX, so that requires some research (and shell scripts).  Maybe some examples later.
