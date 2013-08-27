= MathBook: An XML Application =

A specification for XML tags and stylesheets to create mathematical content that yields usable output.

[[http://www.beezers.org/blog/bb/2013/06/shuttleworth-flash-grant/|{{attachment:Shuttleworth-Funded-Logo.jpg|Shuttleworth Funded|width=250px}}]]

Rob Beezer, beezer@pugetsound.edu

=== Design Goals: ===

  1. Simple for authors to use - no more complicated logically than LaTeX
  1. Capture the structure of writing about mathematics and Sage
  1. Processing into a variety of formats
  1. A limited number of rational tags, with simple names
  1. Minimal use of external shell scripts
  1. XSLT 1.0 compatible: ideally the only semi-unusual required tool is xsltproc 

=== Output Formats: ===

  1.  HTML web pages, enhanced with !MathJax, Sage Cell server, knowls for web browsing
  1.  LaTeX input as precursor of PDF output  via {{{pdflatex}}} for print
  1.  Doctesting of Sage code examples for quality assurance
  1.  Sage Worksheets (Sage Notebook, Sage Math Cloud)
  1.  E-Books, once technically feasible
  1.  Maybe a !DocBook representation for conversion to other outputs and future-proofing

=== Project Status: ===

  * Funding:  Shuttleworth Foundation Flash Grant, National Science Foundation UTMOST Grant
  * Late-June 2013: Good basic functionality for HTML, LaTeX output
  * Mid-June 2013: initiated, not mature or stable
  * Late-August 2013: usable, with more to do

== Examples (Updated 2013/08/23) ==

  1.  A short sample article:  [[http://buzzard.ups.edu/mathbook/calculus-article.xml|XML Source-Author Format]] <[[http://buzzard.ups.edu/mathbook/calculus-article.html|HTML Output]]> <[[http://buzzard.ups.edu/mathbook/calculus-article.pdf|PDF Output]]>
  1. A skeletal mock book: [[http://buzzard.ups.edu/mathbook/graph-theory-book.xml|XML Source-Author Format]] <[[http://buzzard.ups.edu/mathbook/book/graph-theory-book.html|HTML Output]]> <[[http://buzzard.ups.edu/mathbook/graph-theory-book.pdf|PDF Output]]>

== Commentary ==

High-level commentary is recorded on my [[http://www.beezers.org/blog/bb|blog]].

[[http://www.beezers.org/blog/bb/2013/06/shuttleworth-flash-grant/|June 14|, 2013]]
[[http://www.beezers.org/blog/bb/2013/06/the-case-for-an-xml-application/|June 27, 2013]]
[[http://www.beezers.org/blog/bb/2013/06/an-xml-application-for-mathematics/|June 28, 2013]]
[[http://www.beezers.org/blog/bb/2013/08/summer-progress-on-mathbook-xml/|August 23, 2013]]

== Implemented Features ==

 * Article structure with numbered sections and subsections
 * Book structure with preface, numbered chapters, sections and subsections
 * Mathematics: normal LaTeX for PDF, !MathJax in HTML, macros in source '''only once'''
 * Numbered theorems and definitions, with cross-references, even in !MathJax displays
 * Sage input/output: live Sage cells in HTML, styled as text for LaTeX
 * Figures, with numbering and cross-references
 * Basic raster images
 * Bibliography + citations: as knowls in HTML version
 * Navigation (previous/up/next) in HTML (needs just a bit of work)
 * Basic CSS for HTML version

== Files and Commands, the nitty-gritty ==

Updated: August 23, 2013

Prerequisites:  {{{xsltproc}}} is in most Linux distributions and on Mac OS as a command-line executable.  Information on Windows availablity would be helpful - please write.  You'll need TeX to run {{{pdflatex}}}.  You can author if you also have a text editor and a browser - that is all you need.
  
HTML output: !MathJax does the math, Sage Cell Server does the code, knowls do the citations.  Use the following command and files below to create (X)HTML output and view in your browser by opening the output file. 
{{{
xsltproc mathbook-html.xsl calculus-article.xml > calculus-article.html
}}}

PDF: Same XML source file.  Use a different XSLT file to process.  View PDF as you please. Issue the following to produce.

{{{
xsltproc mathbook-latex.xsl calculus-article.xml > calculus-article.tex
pdflatex calculus-article.tex
}}}

More:  repeat above with the mock book, {{{graph-theory-book.xml}}}, linked above.

Advanced: create a [[https://cloud.sagemath.com|Sage Cloud]] worksheet from the same source.  I have this working in the lab.  Posted soon.

Files: Use your browser to save these files locally, do not simply click on them.  The XSL files can be scary - not critical for an author to understand them.  You'll want the CSS to render any HTML you produce.

  1.  [[http://buzzard.ups.edu/mathbook/xsl/mathbook-html.xsl|XSL transform to HTML]]
  1.  [[http://buzzard.ups.edu/mathbook/xsl/mathbook-latex.xsl|XSL transform to LaTeX]]
  1.  [[http://buzzard.ups.edu/mathbook/xsl/mathbook.css|MathBook CSS]]

== To Do (unprioritized) ==

 * Further improve cross-references
 * Table of Contents in HTML as sidebar
 * Index (for book structure)
 * Options for numbering sections, theorem-like structures (hard)
 * Improved CSS for HTML
 * Doctesting framework for Sage code (easy)
 * Sage notebook, Sage Math Cloud output formats
 * Customize level of HTML chunking (one HTML file per section, chapter, etc)
 * Customization options (layers, HTML head insertions)
 * LaTeX spacing hints
 * Figures
 * Tables
 * Exercises
 * Margin paragraphs

== Other Projects ==

 * [[http://tbookdtd.sourceforge.net/|tbook]] looks very much like what I am imagining.  I have hacked a bit of it to work with the {{{xsltproc}}} processor with mixed success.  Only [[http://tbookdtd.sourceforge.net/dtd/index.html|80 elements]].  But for a very short article, I have found cross-references broken and manufacturing a bibliography begins with BibTeX, so that requires some research (and shell scripts).  Maybe some examples later.

 * [[http://www.docbook.org/|DocBook]] is big, complicated and full of features. But the emphasis is on technical documentation and support for mathematics and academic publishing is very lacking.  The extensive structure is intimidating if you just have small project.
