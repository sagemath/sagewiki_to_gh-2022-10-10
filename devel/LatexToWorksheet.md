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

Some tickets below that are available for review can be seen building and passing tests at the [[http://sage.math.washington.edu:21100/ticket/?author=rbeezer|Sage PatchBot]].  Failures can be due to improper listing of necessary prerequisites, or builds not caught up with latest alpha version, so do not necessarily mean a ticket is not ready for review.

Items in ~+'''RED'''+~ are urgently needed because they are used in textbook additions.

||<rowstyle="background-color: #E0E0FF;"> Ticket ||  Description || Status || Acknowledgements ||
|| [[http://trac.sagemath.org/sage_trac/ticket/8071 | 8071]] || trivial matrix kernels over non-fields || 4.4.alpha0 || Martin Albrecht ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10362|10362]] || vector constructor documentation || 4.6.1.alpha3 || Andrey Novoseltsev ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10422|10422]] || documentation fix on new_matrix constructor || 4.6.1.alpha3 || Benjamin Jones ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10189|10189]] || additions to all-ones matrix constructor || 4.6.2.alpha0 || Karl-Dieter Crisman, Robert Miller||
|| [[http://trac.sagemath.org/sage_trac/ticket/10364|10364]] || zero_vector constructor, vector constructor error-checking || 4.6.2.alpha0 || Andrey Novoseltsev ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10424|10424]] || matrix augment accepts a vector || 4.6.2.alpha0 || Joris Vankerschaver, Robert Bradshaw ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10625|10625]] || generic Smith form fails on integer matrices || 4.6.2.alpha2 || Author: David Loeffler ||
|| [[http://trac.sagemath.org/sage_trac/ticket/4492 | 4492]] || block matrix constructor || 4.6.2.alpha3 || Author: Willem Jan Palenstijn ||
|| [[http://trac.sagemath.org/sage_trac/ticket/8948 | 8948]] || latex printing for vectors || 4.6.2.alpha3 || Author: Jason Grout ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10454|10454]] || add .is_singular() || 4.6.2.alpha3 || Robert Bradshaw ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10471|10471]] || conjugate-transpose of a matrix || 4.6.2.alpha3 || Robert Bradshaw ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10500|10500]] || documentation: matrix row/column linear combinations || 4.6.2.alpha3 || Alyson Deines ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10535|10535]] || column-oriented matrix constructor || 4.6.2.alpha3 || Dan Drake ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10537|10537]] || dictionary input to vector constructor || 4.6.2.alpha3 || Dima Pasechnik ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10626|10626]] || route sparse integer matrices to specialized Smith form || 4.6.2.alpha3 || David Loeffler ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10627|10627]] || matrix pretty-printing || 4.6.2.alpha3 || Author: Ivan Andrus ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10028|10028]] || improved error messages for non-invertible matrices || 4.6.2.alpha4 || Author: Andre Apitzsch ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10541|10541]] || row and column matrix from vector, deprecate transpose || 4.6.2.alpha4 || Volker Braun, Marco Streng ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10543|10543]] || echelon form over QQ is mutable || 4.6.2.alpha4 || Tom Coates ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10604|10604]] || diagonal matrix constructor rewrite || 4.6.2.alpha4 || Joint with: Dan Drake ||
|| [[http://trac.sagemath.org/sage_trac/ticket/9796 | 9796]] || diagonal elements of a matrix ||  4.6.2.rc0 || Tom Coates ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10714|10714]] || rows/columns of sparse matrices with zero rows/columns || 4.6.2.rc0 || Jason Grout ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10568|10568]] || speed-up scalar multiples of sparse matrices || 4.7.alpha1 || Author: Maarten Derickx ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10426|10426]] || matrix row and column swapping, returns new matrix || 4.7.alpha2 || Alain Filbois ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10763|10763]] || matrix multiplication speedup || 4.7.alpha2 || Author: Simon King ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10477|10477]] || random vector constructor || 4.7.alpha3 || Felix Lawrence ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10536|10536]] || vector conjugation || 4.7.alpha3 || Felix Lawrence ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10545|10545]] || outer product of vectors || 4.7.alpha3 || Felix Lawrence, John Palmieri ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10595|10595]] || vector constructor fails with empty list || 4.7.alpha3 || Joint: J. Palmieri, Review: D.Pasechnik ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10977|10977]] || document vector constructor || 4.7.alpha3 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/4983 | 4983]] || fix subdivision attribute || 4.7.alpha4 || Author: John Palmieri ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10470|10470]] || listing infinite vector space just hangs || 4.7.alpha4 || John Palmieri ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10683|10683]] || Hermitian inner product, doctests || 4.7.alpha4 || Karl-Dieter Crisman ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10737|10737]] || extended echelon form || 4.7.alpha4 || John Palmieri ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10752|10752]] || make matrix pivots immutable || 4.7.alpha4 || Author: John Palmieri ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10848|10863]] || is_unitary() for matrices || 4.7.alpha4 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10876|10876]] || constructor for elementary matrices || 4.7.alpha4 || Karl-Dieter Crisman ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10974|10974]] || overhaul matrix stack, augment || 4.7.alpha4 || Keshav Kini ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11004|11004]] || make subdivisions optional on tensor product || 4.7.alpha4 || John Palmieri ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11112|11112]] || algebraic closure of CDF || 4.7.alpha4 || Mike Hansen ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10987|10987]] || subspace decomposition, check optional || 4.7.alpha5 || Author: Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10794|10794]] || QR matrix decomposition over exact rings || 4.7.alpha5 || Simon Spicer ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11114|11114]] || is_diagonalizable() for matrices || 4.7.1.alpha0 || Dan Drake ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10746|10746]] || refactor matrix kernels || 4.7.1.alpha2 || Christian Stump ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11027|11027]] || Schur matrix decomposition || 4.7.1.alpha3 || Martin Raum, John Palmieri, Jeroen Demeyer ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10944|10944]] || similarity check for matrices || 4.7.1.alpha4 || Dan Drake ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10839|10839]] || LU decomposition for rectangular matrices || 4.7.2.alpha0 || Ryan Grout ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11356|11356]] || companion matrix constructor || 4.7.2.alpha1 || David Loeffler ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10848|10848]] || is_hermitian() for matrices || 4.7.2.alpha1 || Mike Hansen ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11558|11558]] || transformation matrix for echelon form of sparse matrices || 4.7.2.alpha1  || Author: Volker Braun ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11166|11166]] || free module inititalization || 4.7.2.alpha2 || Author: Nicolas Borie ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11480|11480]] || zigzag form and rational canonical form || 4.7.2.alpha2 || David Loeffler ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11535|11535]] || linear dependence of vectors || 4.7.2.alpha2 || Ivo Hedtke ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11552|11552]] || fix free module morphism surjectivity || 4.7.2.alpha2 || John Palmieri ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11600|11600]] || alias for free module morphism lift method || 4.7.2.alpha2 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/7852 | 7852]] || solve systems over CDF || 4.7.2.alpha3 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/8094 | 8094]] || properties for matrices || 4.7.2.alpha3 || H Schilly, J Grout, M Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11259|11259]] || LU decomposition for exact matrices || 4.7.2.alpha3 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11544|11544]] || viewing matrices of algebraic numbers can hang || 4.7.2.alpha3 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11553|11553]] || matrix morphism additional methods || 4.7.2.alpha3 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11595|11595]] || update exact eigenspace routines || 4.7.2.alpha3 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11657|11657]] || vector() function speed || 4.7.2.alpha3 ||Joint: William Stein ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11725|11725]] || random elements of algebraic field || 4.7.2.alpha3 ||Simon Spicer, Leif Leonhardy ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10837|10837]] || matrix and vector norms, condition number over CDF || sage-4.7.2.alpha4 || Simon Spicer, Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11555|11555]] || expand print version of free module morphisms || sage-4.8.alpha1 || ||

||<rowstyle="background-color: #E0E0FF;"> || || || ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10802|10802]] || singular values for matrices over CDF || dep 10837, positive review || Martin Raum, Jeroen Demeyer ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
||<rowstyle="color: #FF0000;"> [[http://trac.sagemath.org/sage_trac/ticket/10791|10791]] || fix and upgrade Gram-Schmidt || with patch || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10795|10795]] || QR double dense matrix decomposition upgrade || with patch || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11104|11104]] || is_normal() for matrices || with patch ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11306|11306]] || upgrade is_unitary() for RDF/CDF || with patch, dep. #10848, #11277 ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11364|11364]] || cyclic subspaces (aka Krylov subspaces) || with patch ||  ||
||<rowstyle="color: #FF0000;"> [[http://trac.sagemath.org/sage_trac/ticket/11556|11556]] || linear transformations || needs trivial review, dep #11552, #11553 || Martin Raum ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11603|11603]] || deprecate eigenspaces for matrices over RDF/CDF || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11608|11608]] || RDF/CDF eigenvalues, symmetric matrices, multiplicities || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11715|11715]] || upgrade matrix set_row() and set_column() || with patch || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11721|11721]] || arguments to rows(), columns(), jordan_block() || with patch || ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/4932 | 4932]] || remove solve-left-LU || needs work ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/7392 | 7392]] || rank for matrices over CDF || new ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/8046 | 8046]] || add double dense matrix file to documentation || needs work || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10465|10465]] || adjoint meta-ticket || information, dep. 10471, 8094, 10501 || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10501|10501]] || deprecate adjoint in favor of adjugate || needs work || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10544|10544]] || LLL reduced bases for right kernels || new ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10765|10765]] || obliterate sage/matrix/misc.pyx || orphaned ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11274|11274]] || Cholesky decomposition over rationals || new ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11286|11286]] || speed up solve_right() || new ||  ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11596|11596]] || cached eigenstuff is mutable || new ||  ||


== Abstract Algebra Patches ==

||<rowstyle="background-color: #E0E0FF;"> Ticket || Description || Status || Acknowledgements ||
|| [[http://trac.sagemath.org/sage_trac/ticket/7244 | 7244]] || dicyclic groups || 4.2.1.alpha0 || David Joyner ||
|| [[http://trac.sagemath.org/sage_trac/ticket/7305 | 7305]] || Higman-Sims graph || 4.2.1.rc0 || Nathann Cohen ||
|| [[http://trac.sagemath.org/sage_trac/ticket/7555 | 7555]] || Cayley tables, operation tables || 4.4.alpha0 || Nicolas M. Thiery, Jason Grout ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10685|10685]] || all subgroups of a permutation group || 4.6.2.alpha4 || Dima Pasechnik ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10722|10722]] || all cosets of a permutation group || 4.6.2.alpha4 || Dima Pasechnik ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10871|10871]] || intersections of permutation groups || 4.7.alpha3 || Dima Pasechnik ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10911|10911]] || inverse of permutation group elements || 4.7.alpha3 || Robert Bradshaw ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10920|10920]] || conjugates of permutation groups || 4.7.alpha3 || Dima Pasechnik ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10921|10921]] || commutator subgroup for permutation groups || 4.7.alpha3 || Dima Pasechnik, David Joyner ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10334|10334]] || permutation group cleanup || 4.7.1.alpha1 || Author: Mike Hansen ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11292|11292]] || inputs to lattice meet and join || 4.7.1.alpha1 || Anne Schilling, Franco Saliola ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11293|11293]] || all relations of a poset || 4.7.1.alpha1 || Franco Saliola ||
|| [[http://trac.sagemath.org/sage_trac/ticket/11289|11289]] || random poset generation (docs, error checks) || 4.7.1.alpha3 || Franco Saliola ||
|| [[http://trac.sagemath.org/sage_trac/ticket/10335|10335]] || add domains for permutation groups || 4.7.2.alpha0 || Author: Mike Hansen ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
||<rowstyle="background-color: #E0E0FF;"> || || || ||
|| [[http://trac.sagemath.org/sage_trac/ticket/9773 | 9773]] || finitely-generated abelian groups || needs work || ||


== Examples ==

To view a worksheet, click on the "worksheet" link, then in the resulting page find the big blue download box and use your browser's function to copy the link there.  Then open your notebook, click the "Upload" link near the upper-left and then paste in the link into the URL field (the second one).

Note: If your version of Sage is 4.3.2 or older then some examples may not render quite right.  See way below for how to edit older configurations.

 * Sage-Enhancing an Abstract Algebra Textbook (Updated: 2011/08/10))
   * Tom Judson's free open-source [[http://abstract.pugetsound.edu|Abstract Algebra; Theory and Applications]]
   * This project is complete, Sage material and exercises available for most of the chapters
   * See the [[http://abstract.pugetsound.edu/sage-aata.html|book's website]] to download

 * Sage-Enhancing a Linear Algebra Textbook (Updated: 2011/08/03)
   * Rob Beezer's [[http://linear.pugetsound.edu|A First Course in Linear Algebra]]
   * Preview version now at [[http://linear.ups.edu/sage-fcla.html|book's website page]]
   * Necessary patches tracked here; by section, on top of 4.7.1.rc1:
     * #11535, LI (linear dependence)
     * #10791, O (Gram-Schmidt)
     * #10848, MM (hermitian check, merged 4.7.2.alpha1)
     * #11595, EE (eigenspaces)
     * #11552, #11600, #11553, #11556, LT (linear transformations)

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
  * Details removed, this is now obsolete

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
