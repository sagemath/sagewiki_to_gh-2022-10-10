= Brainstorm on live structured documents =

See also the report for
[[https://github.com/OpenDreamKit/OpenDreamKit/issues/91|D4.2: Active/Structured Documents Requirements and existing Solutions]]
for a comparison of Jupyter notebooks and MathHub.info active documents.

== Potential approaches ==

=== Jupyter notebook export facility for Sphinx ===

 * Preliminary work by Harald Shilly (motivation: sage documentation): https://github.com/sphinx-doc/sphinx/pull/2117

 * Experimental script using pandoc+notedown: https://github.com/nthiery/rst-to-ipynb (Nicolas + ...)

   For some output, see: http://Nicolas.Thiery.name/Enseignement/Agregation/

   Update 01/2017: Now available as `sage -rst2ipynb` (see https://trac.sagemath.org/ticket/21513, https://trac.sagemath.org/ticket/21514)

=== Embedding Jupyter notebooks inside Sphinx documents ===

http://nbsphinx.readthedocs.org/en/0.2.5/

=== Thebe (by Oreilly) ===

https://github.com/oreillymedia/thebe

Javascript library for embedding live cells connected to a Jupyter
kernel in any html page.

=== Live documentation for Sage with Sphinx and Thebe ===

This was implemented by Florent Cayré, Nicolas Thiéry at and after the
Sage Days in http://trac.sagemath.org/ticket/20690. See
https://trac.sagemath.org/ticket/20893 for a follow up.

=== MathBookXML ===

[[https://mathbook.pugetsound.edu/|MathBookXML] is an infrastructure
for authoring large documents, in XML formats, with export to latex,
html, Sage, SMC, Jupyter notebook. We enjoyed a remote presentation by
its main author Robert Beezer.

==== Example of book: Abstract Algebra: Theory and Applications, Tom Judson ====

* Print: http://www.amazon.com/Abstract-Algebra-Applications-Thomas-Judson/dp/0989897591
* PDF:     http://abstract.ups.edu/download/aata-20150812.pdf
* HTML:    http://abstract.ups.edu/aata/
* Source:  https://github.com/twjudson/aata
* Clone:   git clone https://github.com/twjudson/aata.git

==== Nice features ====

 * Knowls (temporary widgets showing pieces of text, like proofs, other end of references or citations)
 * Active cells, connected to the Sage single cell server (all cells sharing the same evaluation context)
 * Possibility for the author to control the granularity of the output (one page per section, or subsection or ...)
 * Internationalization / multiple versions of the document (e.g. with or without solutions) / multiple output formats (pdf, html, epub)
 * Sidebar with table of contents, ...
 * Formal Grammar (dtd)
 * Mobile ready
 * TikZ support
 * Export vers notebook Sage, SageMathCloud, Jupyter (with the know structural problems)

Someone wrote a latex to XML translator to be able to author in latex.

==== MathBook XML resources ====

Site:  http://mathbook.pugetsound.edu/
DTD:   http://mathbook.pugetsound.edu/doc/dtd/

Potential for collaborations:
 * Rendering features of MathBookXML:
   * knowls logic (preview of theoremshttp://www.aimath.org/knowlepedia/)
   * Mobile support
   * Handling of tikz pictures
 * Exporting the ReST to XML to be fed into MathBookXML?
  (there is a detailed DTD specifying the format)
 * Reusing the Jupyter kernel logic from Thebe in MathBookXML to let it work with Jupyter servers (tmpnb, local, ...)
 * Joint feature development: multiplying a given cell (adding above, adding below, splitting)
