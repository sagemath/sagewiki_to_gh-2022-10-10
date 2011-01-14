= Converting Latex Documents to Sage Worksheets =

== Introduction ==

Latex documents can be translated to jsMath, the tool used to render mathematics in the Sage notebook.  This project is about automating the conversion process so that authors can easily use a single command to convert a book-length Latex document to a collection of Sage worksheets.  These could have embedded Sage input cells, possibly containing interacts, and the cross-referencing features of Latex would be preserved in the collection of Sage worksheets.<<BR>>
Rob Beezer, beezer@ups.edu, rbeezer on #sage-devel IRC

Supported by
  * University Puget Sound Lantz Senior Fellowship (AY 2010-11)
  * National Science Foundation [[http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=1022574|DUE-1022574]] (2010-2013)

== Conversion Software ==

[[http://bitbucket.org/rbeezer/tex2sws/ | Mercurial Repository @BitBucket ]]<<BR>>
Clone using:  
{{{
hg clone https://rbeezer@bitbucket.org/rbeezer/tex2sws/
}}}

== Linear Algebra Patches ==

This table tracks patches meant to support the teaching of introductory linear algebra and the enhancement of Beezer's "A First Course in Linear Algebra."

||<rowstyle="background-color: #E0E0FF;"> Ticket ||  Description || Status || Acknowledgements ||
|| [[http://trac.sagemath.org/sage_trac/ticket/8071 | 8071]] || trivial matrix kernels over non-fields || 4.4.alpha0 || Martin Albrecht ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10189|10189]] || additions to all-ones matrix constructor || 4.6.2.alpha0 || Karl-Dieter Crisman, Robert Miller||
|| [[http://trac.sagemath.org/sage_trac/ticket/10362|10362]] || vector constructor documentation || 4.6.1.alpha3 || Andrey Novoseltsev ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10364|10364]] || zero_vector constructor, vector constructor error-checking || 4.6.2.alpha0 || Andrey Novoseltsev ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10422|10422]] || documentation fix on new_matrix constructor || 4.6.1.alpha3 || Benjamin Jones ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10424|10424]] || matrix augment accepts a vector || 4.6.2.alpha0 || Joris Vankerschaver, Robert Bradshaw ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10425|10425]] || subdivisions when augmenting || obsolete, in 10424 || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10454|10454]] || add .is_singular() || positive review || Robert Bradshaw ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10471|10471]] || conjugate-transpose of a matrix || positive review || Robert Bradshaw ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10500|10500]] || documentation: matrix row/column linear combinations || positive review|| Alyson Deines ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10535|10535]] || column-oriented matrix constructor || positive review || Dan Drake ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10537|10537]] || dictionary input to vector constructor || positive review, dep. 10364 || Dima Pasechnik ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10541|10541]] || row and column matrix from vector, deprecate transpose || positive review || Volker Braun ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10595|10595]] || vector constructor fails with only empty list || positive review, dep. 10537 || Dima Pasechnik ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/8046 | 8046]] || add double dense matrix file to documentation || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/8094 | 8094]] || properties for matrices || with patch || Harald Schilly, Jason Grout ||
|| [[http://trac.sagemath.org/sage_trac/ticket/9796 | 9796]] || diagonal elements of a matrix || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10426|10426]] || matrix row and column swapping, returns new matrix || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10465|10465]] || adjoint meta-ticket || information only, dep. 10471, 8094, 10501 || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10470|10470]] || listing infinite vector space just hangs || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10477|10477]] || random vector constructor || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10501|10501]] || deprecate adjoint in favor of adjugate || needs work || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10536|10536]] || vector conjugation || with patch, dep. 10537 ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10543|10543]] || echelon form over QQ is mutable || with patch ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10543|10544]] || LLL reduced bases for right kernels || new ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10543|10545]] || outer product of vectors || with patch, dep. 10541 ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10604|10604]] || diagonal matrix constructor rewrite || with patch, dep. 10537, 10626 ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10625|10625]] || generic Smith form fails on integer matrices || new ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10665|10626]] || route sparse integer matrices to specialized Smith form || with patch ||  ||
== Examples ==

To view a worksheet, click on the "worksheet" link, then in the resulting page find the big blue download box and use your browser's function to copy the link there.  Then open your notebook, click the "Upload" link near the upper-left and then paste in the link into the URL field (the second one).

Note: If your version of Sage is 4.3.2 or older then some examples may not render quite right.  See way below for how to edit older configurations.

 * Sage-Enhancing a Linear Algebra Textbook (Updated: 2010/12/29)
   * Rob Beezer's [[http://linear.pugetsound.edu|A First Course in Linear Algebra]]
   * Live Sage code for two chapters (SLE, V), in Sections (RREF, TSS, HSE, NM, VO, LC, SS, LI, LDS)
   * "Read-Only" - some content is temporarily missing, Sage commands use new unofficial patches for linear algebra, some formatting needs improvements
   * Upload the zip file using the notebook's "Upload Worksheet" function - the notebook will do the unzipping
   * In the notebook, skip front matter sections, click on actual sections to bring up content
   * [[http://bitbucket.org/ddrake/sagetex/|SageTeX]] is used to render faithful PDF from the same source
   * [[attachment:fcla-sage-experimental.zip | Worksheet Zip File]]
   * [[attachment:fcla-sage-experimental.pdf | PDF Version]]

 * An Entire Mathematics Textbook (2010/08/27)
   * Tom Judson's [[http://abstract.pugetsound.edu|Abstract Algebra: Theory and Applications]]
   * Zip file has about 30 worksheets, simply upload the zip file using the notebook's "Upload Worksheet" function - the notebook will do the unzipping.
   * No cross-worksheet links working (in particular the "Table of Contents" is dysfunctional).  So just click on a chapter in your notebook's list of chapters.
   * No additional compute cells.  Yet.
   * Sage compute cell available at the end of each chapter for experiments or for notes (via TinyMCE editor)
   * [[attachment:aata-sage-20100827.zip | Zip File]]

 * Approximating Polynomial Worksheet (2010/02/20)
   * A classroom worksheet, with interacts
   * Nice mix of mathematics and live demonstrations
   * PDF could do something better with interacts (hide code, show screenshot?)
   * [[attachment:approxpoly.tex | Latex source]]
   * [[attachment:approxpoly.pdf | PDF]]
   * [[attachment:approxpoly.sws | Worksheet]]

 * SageTeX integration (Robert Marik, 2010/02/20)
   * Slightly modified version of the {{{example.tex}}} file from the [[http://bitbucket.org/ddrake/sagetex/ | SageTeX]] distribution
   * All but three graphics coming through, understandably
   * Missing 3D tachyon graphic is just a path problem and is fixable
   * Might be able to do something better with the {{{sagesilent}}} environment
   such as inserting a {{{%hide}}} at the start of the block
   * To re-create this, run the following sequence of commands:
   {{{
pdflatex example.tex
sage example.sage
htlatex example.tex "/path/to/tex4ht-sage.cfg" " -cunihtf -utf8"
tex2sws
   }}}
   * [[attachment:example.tex | Latex source]]
   * [[attachment:example.pdf | PDF]]
   * [[attachment:example.sws | Worksheet]]
   * For fixed tex4ht-sage.cfg, tex2sws.py which allows to insert 3D graphics and vertex labels see [[http://user.mendelu.cz/marik/sage/tex2sws | this link]].

 * A Whole-Book Experiment (2010/02/07)
 This is all of Beezer's [[http://linear.ups.edu|First Course in Linear Algebra]] as
 a linked collection of Sage worksheets.  It runs about 900 pages when printed, but
 as a tar archive is around 700K.
  * See note below about jsMath configuration and matrix formatting.
  * No Sage content yet - see other experiments for demonstrations.
  * Installation: To rig worksheet numbers, and thus have cross-worksheet
  linking work properly, it is necessary to create a pristine user
  and insert the worksheets properly into the notebook storage
  area.  In the following, you must use the new user "linear",
  but password and notebook location can be adjusted.  But the notebook
  location needs to end with ".sagenb".
  {{{
$ sage
sage: from sagenb.notebook.notebook import Notebook
sage: nb=Notebook("/tmp/fcla.sagenb")
sage: nb.add_user('linear', 'algebra', '', account_type='user', force=True)
sage: exit
$ cd /tmp/fcla.sagenb/home
$ tar -xvf /path/to/fcla-worksheets.tar.bz2
$ sage
sage: notebook(directory="/tmp/fcla.sagenb")
  }}}
  * You will possibly be asked to create an admin password, just do it.
  * Even if you see the right worksheets, sign-out right away.
  * Sign-in as the user "linear" with password "algebra".
  * Now you should be able to view the worksheets.
  * [[attachment:fcla-worksheets.tar.bz2 | Tar Archive of FCLA Worksheets]]


 * tikz graphics migration (2010/02/03, Updated: 2010/02/20)<<BR>>
   * tikz graphics in latex source passing through to the worksheet
   * combinatorial graphs in Sage creating tikz source, also included
   * worksheet has graphics as SVG, live cells, graph editor
   * Not all browsers render SVG?  Tested in Firefox
   * [[attachment:graphics-test.tex | Latex source]], some generated by Sage
   * [[attachment:graphics-test.pdf | PDF]], a faithful rendition
   * [[attachment:graphics-test.sws | Worksheet]], note SVG graphics, run code, experiment with graph editor
   * This experiment prompted by a [[http://old.nabble.com/Using-pgfsys-tex4ht.def-to-make-svg-output-td16685147.html | mailing list discussion]]

 * Group Theory Primer (2010/01/28)<<BR>>
 Lots of simple Sage code, some simple mathematics, one interact (search for "@interact")<<BR>>
 Best working demo (though it lacks a title)<<BR>>
 [[attachment:sage-group-theory-primer.sws | Worksheet]] [[attachment:sage-group-theory-primer.sws | Source]]

 * Textbook Section Experiment (2010/01/30, updated 2010/02/07)<<BR>>
 This is a straight conversion of a math-heavy section from Beezer's linear algebra text.
  * See note above about jsMath and matrix formatting.
  * The original tex4ht output is at [[http://linear.ups.edu/jsmath/0220/fcla-jsmath-2.20li35.html#x36-143000 | FCLA Section FS in jsMath]]
  which seems to render just fine for me.
  * There is no embedded Sage code here yet, but that will be easy to add.
  * Links go nowhere unless they are internal to this section.
  * [[attachment:math-test.sws | Worksheet]] 

 * Linked Worksheets (2010/01/30)<<BR>>
 A simple manufactured example of cross-worksheet linking.
  * Fire up Sage, then create a new, temporary notebook with the user "link"
  {{{
sage: from sagenb.notebook.notebook import Notebook
sage: nb = Notebook('/tmp/test.sagenb')
sage: nb.add_user('link', 'link', '', force=True)
sage: nb.save()
sage: exit
  }}}
  * At system command-line extract archive (below) to create the worksheets with numbers 0 and 1 in link's space.
  {{{
$ cd /tmp/test.sagenb/home
$ tar -xvf <path-to>/link-worksheets.tar.gz
  }}}
  * Fire up Sage to start a notebook session in the temporary notebook:
  {{{
sage: notebook(directory="/tmp/test.sagenb")
  }}}
  * You may need to create an admin password (do it).
  You may see the worksheets, but be logged in as admin.<<BR>>
  If needed, be certain to login as "link" with password "link."<<BR>>
  * Open worksheet 0, execute a cell or two, find link to worksheet 1.
  * Follow link to worksheet 1, execute some cells here too.
  * [[attachment:link-worksheets.tar.gz | Archive (described above)]] [[attachment:link-worksheets.py | Python generation script]]

== tex4ht ==

This is a list of known configurations of tex4ht that seem to work:
 * "tex4ht is part of the standard mactex distribution" (Dana Ernst, 2010/01/29)
 * "TeXLive 2009  (separate from Ubuntu package manager) includes its own little package manager ('tlmgr') and I used that to install tex4ht" (Dan Drake, 2010/01/30)
 * Ubuntu/Kubuntu/Debian: (K)Ubuntu Karmic 2009/05/21, Debian stable 2008/07/01, Debian testing 2009/06/11<<BR>>
 From Jason B. Hill (2010/02/24)
   * "texlive-full" depends on tex4ht (and hence will install tex4ht) in Ubuntu/Xubuntu/Kubuntu 9.10.
   * "tex4ht" may also be installed directly from the standard Ubuntu repositories via apt/aptitude on top of the smaller "texlive-base/texlive-base-bin". This is also true for Debian stable.
   * In either case, tex4ht/htlatex/etc commands must be added manually at this point to Kile, or can be called directly from the terminal.

== Related Project ==
[[http://bitbucket.org/whuss/sws2tex/ | sws2tex]], [[http://user.mendelu.cz/marik/sage/skolka.pdf | Example]]<<BR>>
Anybody want to try for the round-trip, Latex -> SWS -> Latex?

== jsMath Safe Boxes Edit ==

For Sage versions prior to 4.3.3.alpha0 (sagenb prior to 0.7.5) it is necessary to slightly tweak the jsMath configuration in Sage.  It is a one-character edit.  You can still view the sections, but "reasons" given in math displays (generally in proofs) won't render right and you will see lots of "@a()" stuff.  This was fixed in [[http://trac.sagemath.org/sage_trac/ticket/8202 | Trac 8202]] for Sage 4.3.3.  Check your version of Sage with {{{sage --version}}}.

The file to edit is
{{{
SAGE_ROOT/local/lib/python/site-packages/sagenb-0.6-py2.6.egg/sagenb/data/sage/js/jsMath.js
}}}

where you might have to adjust the numbering on the {{{sagenb}}} package.  Then at line 97 (or thereabouts) make the following change
{{{
jsMath.safeHBoxes=1 --> jsMath.safeHBoxes=0
}}}

Also, these examples have a bit of a formatting problem for larger matrices (more than two rows) on my setup, but I'm uncertain if that is my problem or more general.  A report, either way, would be appreciated if you look at these.

== The 20% Defying Categorization ==
