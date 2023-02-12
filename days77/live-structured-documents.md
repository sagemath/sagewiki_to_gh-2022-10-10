

# Brainstorm on live structured documents

See also the report for <a class="https" href="https://github.com/OpenDreamKit/OpenDreamKit/issues/91">D4.2: Active/Structured Documents Requirements and existing Solutions</a> for a comparison of Jupyter notebooks and <a href="/MathHub">MathHub</a>.info active documents. 


## Potential approaches


### Jupyter notebook export facility for Sphinx

* Preliminary work by Harald Shilly (motivation: sage documentation): <a href="https://github.com/sphinx-doc/sphinx/pull/2117">https://github.com/sphinx-doc/sphinx/pull/2117</a> 
* Experimental script using pandoc+notedown: <a href="https://github.com/nthiery/rst-to-ipynb">https://github.com/nthiery/rst-to-ipynb</a> (Nicolas + ...) 
      * For some output, see: <a href="http://Nicolas.Thiery.name/Enseignement/Agregation/">http://Nicolas.Thiery.name/Enseignement/Agregation/</a> Update 01/2017: Now available as `sage -rst2ipynb` (see <a href="https://trac.sagemath.org/ticket/21513">https://trac.sagemath.org/ticket/21513</a>, <a href="https://trac.sagemath.org/ticket/21514">https://trac.sagemath.org/ticket/21514</a>) 

### Embedding Jupyter notebooks inside Sphinx documents

<a href="http://nbsphinx.readthedocs.org/en/0.2.5/">http://nbsphinx.readthedocs.org/en/0.2.5/</a> 


### Thebe (by Oreilly)

<a href="https://github.com/oreillymedia/thebe">https://github.com/oreillymedia/thebe</a> 

Javascript library for embedding live cells connected to a Jupyter kernel in any html page. 


### Live documentation for Sage with Sphinx and Thebe

This was implemented by Florent Cayré and Nicolas Thiéry at and after the Sage Days in <a href="http://trac.sagemath.org/ticket/20690">http://trac.sagemath.org/ticket/20690</a>. See <a href="https://trac.sagemath.org/ticket/20893">https://trac.sagemath.org/ticket/20893</a> for a follow up. 


### MathBookXML

<a class="https" href="https://mathbook.pugetsound.edu/">MathBookXML</a> is an infrastructure for authoring large documents, in XML formats, with export to latex, html, Sage, SMC, Jupyter notebook. We enjoyed a remote presentation by its main author Robert Beezer. 


#### Example of book: Abstract Algebra: Theory and Applications, Tom Judson

* Print: <a href="http://www.amazon.com/Abstract-Algebra-Applications-Thomas-Judson/dp/0989897591">http://www.amazon.com/Abstract-Algebra-Applications-Thomas-Judson/dp/0989897591</a> 
* PDF:     <a href="http://abstract.ups.edu/download/aata-20150812.pdf">http://abstract.ups.edu/download/aata-20150812.pdf</a> 
* HTML:    <a href="http://abstract.ups.edu/aata/">http://abstract.ups.edu/aata/</a> 
* Source:  <a href="https://github.com/twjudson/aata">https://github.com/twjudson/aata</a> 
* Clone:   git clone <a href="https://github.com/twjudson/aata.git">https://github.com/twjudson/aata.git</a> 

#### Nice features

* Knowls (temporary widgets showing pieces of text, like proofs, other end of references or citations) 
* Active cells, connected to the Sage single cell server (all cells sharing the same evaluation context) 
* Possibility for the author to control the granularity of the output (one page per section, or subsection or ...) 
* Internationalization / multiple versions of the document (e.g. with or without solutions) / multiple output formats (pdf, html, epub) 
* Sidebar with table of contents, ... 
* Formal Grammar (dtd) 
* Mobile ready 
* TikZ support 
* Export vers notebook Sage, <a href="/SageMathCloud">SageMathCloud</a>, Jupyter (with the know structural problems) 
Someone wrote a latex to XML translator to be able to author in latex. 


#### MathBook XML resources

Site:  <a href="http://mathbook.pugetsound.edu/">http://mathbook.pugetsound.edu/</a> DTD:   <a href="http://mathbook.pugetsound.edu/doc/dtd/">http://mathbook.pugetsound.edu/doc/dtd/</a> 

Potential for collaborations: 

* Rendering features of MathBookXML: 
      * knowls logic (preview of theoremshttp://www.aimath.org/knowlepedia/) 
      * Mobile support 
      * Handling of tikz pictures 
* Exporting the ReST to XML to be fed into MathBookXML? 
   * (there is a detailed DTD specifying the format) 
* Reusing the Jupyter kernel logic from Thebe in MathBookXML to let it work with Jupyter servers (tmpnb, local, ...) 
* Joint feature development: multiplying a given cell (adding above, adding below, splitting) 