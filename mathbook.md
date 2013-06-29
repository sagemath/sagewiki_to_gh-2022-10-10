= MathBook: An XML Application =

A specification for XML tags and stylesheets to create usable output.

[[http://www.beezers.org/blog/bb/2013/06/shuttleworth-flash-grant/|{{attachment:Shuttleworth-Funded-Logo.jpg|Shuttleworth Funded|width=250px}}]]

Rob Beezer, beezer@pugetsound.edu

=== Design Goals: ===

  1. Simple for authors to use - no more complicated logically than LaTeX
  1. Capture the structure of writing about mathematics and Sage
  1. Processing into a variety of formats
  1. A limited number of rational tags, with simple names
  1. Minimal use of external shell scripts
  1. XSLT 1.0 compatible: ideally the only required tool is xsltproc 

=== Output Formats: ===

  1.  HTML web pages, enhanced with !MathJax, Sage Cell server, knowls
  1.  LaTeX input to create PDFs and print with {{{pdflatex}}}
  1.  HTML for in-browser previewing
  1.  Doctesting of Sage code examples
  1.  E-Books, once technically feasible
  1.  Maybe a !DocBook representation for conversion to other outputs

=== Project Status: ===

  * Funding:  Shuttleworth Foundation Flash Grant, National Science Foundation UTMOST Grant
  * Late-June 2013: Good basic functionality for HTML, LaTeX output
  * Mid-June 2013: initiated, not mature or stable

== Commentary ==

High-level commentary is recorded on my [[http://www.beezers.org/blog/bb|blog]].

== Implemented Features ==

 * Article structure with numbered sections (subsections will be easy)
 * Numbered theorems
 * Sage input/output: live Sage cells in HTML, styled in LaTeX
 * Bibliography + citations: knowls in HTML version
 * Math: normal LaTeX for PDF, !MathJax in HTML, macros in source '''once'''


== Files and Examples ==

Updated: June 28, 2013
  

Easiest: it would be nice if you could view the source file (calculus-article.xml) by opening it in a web browser with the stylesheet (article-html.xsl) in the same directory.  This did work on some browsers, and not on others.  I've added enough nontrivial features now that this is not working in Firefox.

Easy: Look at the  [[http://buzzard.ups.edu/mathbook/calculus-article.html|XHTML Output]]. !MathJax does the math, Sage Cell Server does the code, knowls do the citations.  Use the following command and files below to create XHTML output and view in your browser by opening the output file. 
{{{
xsltproc article-html.xsl calculus-article.xml > calculus-article.html
}}}

Alternate: Look at the  [[http://buzzard.ups.edu/mathbook/calculus-article.pdf|PDF Output]], which comes from the same source.  Issue the following to produce.

{{{
xsltproc article-latex.xsl calculus-article.xml > calculus-article.tex
pdflatex calculus-article.tex
}}}

Advanced: create a [[https://cloud.sagemath.com|Sage Cloud]] worksheet from the same source.  I have this working in the lab.  Posted soon.

Files: Use your browser to save these files locally, do not simply click on them.  If you are an author, the only file you need to understand is the first one, the XML source.

  1.  [[http://buzzard.ups.edu/mathbook/calculus-article.xml|Example XML source document]]
  1.  [[http://buzzard.ups.edu/mathbook/article-latex.xsl|XSL transform to LaTeX]]
  1.  [[http://buzzard.ups.edu/mathbook/article-html.xsl|XSL transform to XHTML]]
  1.  [[http://buzzard.ups.edu/mathbook/freebsd-docbook.css|FreeBSD documentation CSS]]
  1.  [[http://buzzard.ups.edu/mathbook/mathbook.css|MathBook CSS]]


== To Do ==

 * Cross-references
 * Index for book structure
 * Options for numbering sections, theorem-like structures
 * Improved CSS for HTML
 * Doctesting framework for Sage code
 * Sage notebook, Sage Math Cloud output formats
 * HTML chunking (one HTML file per section, chapter, etc)
 * Customization options (layers, HTML head insertions)
 * LaTeX spacing hints

== Other Projects ==

 * [[http://tbookdtd.sourceforge.net/|tbook]] looks very much like what I am imagining.  I have hacked a bit of it to work with the {{{xsltproc}}} processor with mixed success.  Only [[http://tbookdtd.sourceforge.net/dtd/index.html|80 elements]].  But for a very short article, I have found cross-references broken and manufacturing a bibliography begins with BibTeX, so that requires some research (and shell scripts).  Maybe some examples later.

 * [[http://www.docbook.org/|DocBook]] is big, complicated and full of features. But the emphasis is on technical documentation and support for mathematics and academic publishing is very lacking.  The extensive structure is intimidating if you just have small project.
