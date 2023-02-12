

# Converting Latex Documents to Sage Worksheets


## Introduction

Latex documents can be translated to jsMath, the tool used to render mathematics in the Sage notebook.  This project is about automating the conversion process so that authors can easily use a single command to convert a book-length Latex document to a collection of Sage worksheets.  These could have embedded Sage input cells, possibly containing interacts, and the cross-referencing features of Latex would be preserved in the collection of Sage worksheets.  
 Rob Beezer, <a href="mailto:beezer@ups.edu">beezer@ups.edu</a>, rbeezer on #sage-devel IRC 

Supported by 

   * University Puget Sound Lantz Senior Fellowship (AY 2010-11) 
   * National Science Foundation <a class="http" href="http://www.nsf.gov/awardsearch/showAward.do?AwardNumber=1022574">DUE-1022574</a> (2010-2013) 

## Conversion Software

<a class="http" href="http://bitbucket.org/rbeezer/tex2sws/">Mercurial Repository @BitBucket</a>  
 Clone using:   
```txt
hg clone https://rbeezer@bitbucket.org/rbeezer/tex2sws/
```

## Linear Algebra Patches

This table tracks patches meant to support the teaching of introductory linear algebra and the enhancement of Beezer's "A First Course in Linear Algebra." 

Some tickets below that are available for review can be seen building and passing tests at the <a class="http" href="http://sage.math.washington.edu:21100/ticket/?author=rbeezer">Sage PatchBot</a>.  Failures can be due to improper listing of necessary prerequisites, or builds not caught up with latest alpha version, so do not necessarily mean a ticket is not ready for review. 
 Ticket  |   Description  |  Status  |  Acknowledgements 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8071">8071</a>  |  trivial matrix kernels over non-fields  |  4.4.alpha0  |  Martin Albrecht 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10362">10362</a>  |  vector constructor documentation  |  4.6.1.alpha3  |  Andrey Novoseltsev 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10422">10422</a>  |  documentation fix on new_matrix constructor  |  4.6.1.alpha3  |  Benjamin Jones 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10189">10189</a>  |  additions to all-ones matrix constructor  |  4.6.2.alpha0  |  Karl-Dieter Crisman, Robert Miller
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10364">10364</a>  |  zero_vector constructor, vector constructor error-checking  |  4.6.2.alpha0  |  Andrey Novoseltsev 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10424">10424</a>  |  matrix augment accepts a vector  |  4.6.2.alpha0  |  Joris Vankerschaver, Robert Bradshaw 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10625">10625</a>  |  generic Smith form fails on integer matrices  |  4.6.2.alpha2  |  Author: David Loeffler 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4492">4492</a>  |  block matrix constructor  |  4.6.2.alpha3  |  Author: Willem Jan Palenstijn 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8948">8948</a>  |  latex printing for vectors  |  4.6.2.alpha3  |  Author: Jason Grout 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10454">10454</a>  |  add .is_singular()  |  4.6.2.alpha3  |  Robert Bradshaw 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10471">10471</a>  |  conjugate-transpose of a matrix  |  4.6.2.alpha3  |  Robert Bradshaw 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10500">10500</a>  |  documentation: matrix row/column linear combinations  |  4.6.2.alpha3  |  Alyson Deines 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10535">10535</a>  |  column-oriented matrix constructor  |  4.6.2.alpha3  |  Dan Drake 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10537">10537</a>  |  dictionary input to vector constructor  |  4.6.2.alpha3  |  Dima Pasechnik 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10626">10626</a>  |  route sparse integer matrices to specialized Smith form  |  4.6.2.alpha3  |  David Loeffler 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10627">10627</a>  |  matrix pretty-printing  |  4.6.2.alpha3  |  Author: Ivan Andrus 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10028">10028</a>  |  improved error messages for non-invertible matrices  |  4.6.2.alpha4  |  Author: Andre Apitzsch 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10541">10541</a>  |  row and column matrix from vector, deprecate transpose  |  4.6.2.alpha4  |  Volker Braun, Marco Streng 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10543">10543</a>  |  echelon form over QQ is mutable  |  4.6.2.alpha4  |  Tom Coates 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10604">10604</a>  |  diagonal matrix constructor rewrite  |  4.6.2.alpha4  |  Joint with: Dan Drake 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9796">9796</a>  |  diagonal elements of a matrix  |   4.6.2.rc0  |  Tom Coates 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10714">10714</a>  |  rows/columns of sparse matrices with zero rows/columns  |  4.6.2.rc0  |  Jason Grout 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10568">10568</a>  |  speed-up scalar multiples of sparse matrices  |  4.7.alpha1  |  Author: Maarten Derickx 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10426">10426</a>  |  matrix row and column swapping, returns new matrix  |  4.7.alpha2  |  Alain Filbois 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10763">10763</a>  |  matrix multiplication speedup  |  4.7.alpha2  |  Author: Simon King 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10477">10477</a>  |  random vector constructor  |  4.7.alpha3  |  Felix Lawrence 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10536">10536</a>  |  vector conjugation  |  4.7.alpha3  |  Felix Lawrence 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10545">10545</a>  |  outer product of vectors  |  4.7.alpha3  |  Felix Lawrence, John Palmieri 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10595">10595</a>  |  vector constructor fails with empty list  |  4.7.alpha3  |  Joint: J. Palmieri, Review: D.Pasechnik 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10977">10977</a>  |  document vector constructor  |  4.7.alpha3  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4983">4983</a>  |  fix subdivision attribute  |  4.7.alpha4  |  Author: John Palmieri 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10470">10470</a>  |  listing infinite vector space just hangs  |  4.7.alpha4  |  John Palmieri 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10683">10683</a>  |  Hermitian inner product, doctests  |  4.7.alpha4  |  Karl-Dieter Crisman 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10737">10737</a>  |  extended echelon form  |  4.7.alpha4  |  John Palmieri 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10752">10752</a>  |  make matrix pivots immutable  |  4.7.alpha4  |  Author: John Palmieri 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10848">10863</a>  |  is_unitary() for matrices  |  4.7.alpha4  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10876">10876</a>  |  constructor for elementary matrices  |  4.7.alpha4  |  Karl-Dieter Crisman 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10974">10974</a>  |  overhaul matrix stack, augment  |  4.7.alpha4  |  Keshav Kini 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11004">11004</a>  |  make subdivisions optional on tensor product  |  4.7.alpha4  |  John Palmieri 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11112">11112</a>  |  algebraic closure of CDF  |  4.7.alpha4  |  Mike Hansen 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10987">10987</a>  |  subspace decomposition, check optional  |  4.7.alpha5  |  Author: Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10794">10794</a>  |  QR matrix decomposition over exact rings  |  4.7.alpha5  |  Simon Spicer 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11114">11114</a>  |  is_diagonalizable() for matrices  |  4.7.1.alpha0  |  Dan Drake 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10746">10746</a>  |  refactor matrix kernels  |  4.7.1.alpha2  |  Christian Stump 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11027">11027</a>  |  Schur matrix decomposition  |  4.7.1.alpha3  |  Martin Raum, John Palmieri, Jeroen Demeyer 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10944">10944</a>  |  similarity check for matrices  |  4.7.1.alpha4  |  Dan Drake 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10839">10839</a>  |  LU decomposition for rectangular matrices  |  4.7.2.alpha0  |  Ryan Grout 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11356">11356</a>  |  companion matrix constructor  |  4.7.2.alpha1  |  David Loeffler 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10848">10848</a>  |  is_hermitian() for matrices  |  4.7.2.alpha1  |  Mike Hansen 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11558">11558</a>  |  transformation matrix for echelon form of sparse matrices  |  4.7.2.alpha1   |  Author: Volker Braun 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11166">11166</a>  |  free module inititalization  |  4.7.2.alpha2  |  Author: Nicolas Borie 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11480">11480</a>  |  zigzag form and rational canonical form  |  4.7.2.alpha2  |  David Loeffler 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11535">11535</a>  |  linear dependence of vectors  |  4.7.2.alpha2  |  Ivo Hedtke 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11552">11552</a>  |  fix free module morphism surjectivity  |  4.7.2.alpha2  |  John Palmieri 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11600">11600</a>  |  alias for free module morphism lift method  |  4.7.2.alpha2  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7852">7852</a>  |  solve systems over CDF  |  4.7.2.alpha3  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8094">8094</a>  |  properties for matrices  |  4.7.2.alpha3  |  H Schilly, J Grout, M Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11259">11259</a>  |  LU decomposition for exact matrices  |  4.7.2.alpha3  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11544">11544</a>  |  viewing matrices of algebraic numbers can hang  |  4.7.2.alpha3  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11553">11553</a>  |  matrix morphism additional methods  |  4.7.2.alpha3  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11595">11595</a>  |  update exact eigenspace routines  |  4.7.2.alpha3  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11657">11657</a>  |  vector() function speed  |  4.7.2.alpha3  | Joint: William Stein 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11725">11725</a>  |  random elements of algebraic field  |  4.7.2.alpha3  | Simon Spicer, Leif Leonhardy 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11848">11848</a>  |  zero_at method for RDF/CDF vectors  |  4.7.2.alpha3  |  Leif Leonhardy  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10802">10802</a>  |  singular values for matrices over CDF  |  4.7.2.alpha4  |  Martin Raum, Jeroen Demeyer 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10837">10837</a>  |  matrix and vector norms, condition number over CDF  |  4.7.2.alpha4  |  Simon Spicer, Martin Raum, Jeroen Demeyer 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11555">11555</a>  |  expand print version of free module morphisms  |  4.8.alpha1  |  Julian Rueth 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11721">11721</a>  |  arguments to rows(), columns(), jordan_block()  |  4.8.alpha2  |  Johan Bosman 
  |   |   |  
  |   |   |  
<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11556">11556</a>  |  linear transformations  |  positive review  |  Martin Raum, Jason Grout 
<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10791">10791</a>  |  fix and upgrade Gram-Schmidt  |  positive review  |  Martin Raum, John Palmieri, Jason Grout 
  |   |   |  
  |   |   |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10795">10795</a>  |  QR double dense matrix decomposition upgrade  |  with patch  |  Martin Raum 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11104">11104</a>  |  is_normal() for matrices  |  with patch  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11306">11306</a>  |  upgrade is_unitary() for RDF/CDF  |  with patch, dep. #10848, #11277  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11364">11364</a>  |  cyclic subspaces (aka Krylov subspaces)  |  with patch  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11603">11603</a>  |  deprecate eigenspaces for matrices over RDF/CDF  |  with patch  |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11608">11608</a>  |  RDF/CDF eigenvalues, symmetric matrices, multiplicities  |  with patch  |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11715">11715</a>  |  upgrade matrix set_row() and set_column()  |  with patch  |  
  |   |   |  
  |   |   |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4932">4932</a>  |  remove solve-left-LU  |  needs work  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7392">7392</a>  |  rank for matrices over CDF  |  new  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8046">8046</a>  |  add double dense matrix file to documentation  |  needs work  |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10465">10465</a>  |  adjoint meta-ticket  |  information, dep. 10471, 8094, 10501  |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10501">10501</a>  |  deprecate adjoint in favor of adjugate  |  needs work  |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10544">10544</a>  |  LLL reduced bases for right kernels  |  new  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10765">10765</a>  |  obliterate sage/matrix/misc.pyx  |  orphaned  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11274">11274</a>  |  Cholesky decomposition over rationals  |  new  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11286">11286</a>  |  speed up solve_right()  |  new  |   
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11596">11596</a>  |  cached eigenstuff is mutable  |  new  |   


## Abstract Algebra Patches
 Ticket  |  Description  |  Status  |  Acknowledgements 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7244">7244</a>  |  dicyclic groups  |  4.2.1.alpha0  |  David Joyner 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7305">7305</a>  |  Higman-Sims graph  |  4.2.1.rc0  |  Nathann Cohen 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7555">7555</a>  |  Cayley tables, operation tables  |  4.4.alpha0  |  Nicolas M. Thiery, Jason Grout 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10685">10685</a>  |  all subgroups of a permutation group  |  4.6.2.alpha4  |  Dima Pasechnik 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10722">10722</a>  |  all cosets of a permutation group  |  4.6.2.alpha4  |  Dima Pasechnik 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10871">10871</a>  |  intersections of permutation groups  |  4.7.alpha3  |  Dima Pasechnik 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10911">10911</a>  |  inverse of permutation group elements  |  4.7.alpha3  |  Robert Bradshaw 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10920">10920</a>  |  conjugates of permutation groups  |  4.7.alpha3  |  Dima Pasechnik 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10921">10921</a>  |  commutator subgroup for permutation groups  |  4.7.alpha3  |  Dima Pasechnik, David Joyner 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10334">10334</a>  |  permutation group cleanup  |  4.7.1.alpha1  |  Author: Mike Hansen 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11292">11292</a>  |  inputs to lattice meet and join  |  4.7.1.alpha1  |  Anne Schilling, Franco Saliola 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11293">11293</a>  |  all relations of a poset  |  4.7.1.alpha1  |  Franco Saliola 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11289">11289</a>  |  random poset generation (docs, error checks)  |  4.7.1.alpha3  |  Franco Saliola 
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10335">10335</a>  |  add domains for permutation groups  |  4.7.2.alpha0  |  Author: Mike Hansen 
  |   |   |  
  |   |   |  
 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9773">9773</a>  |  finitely-generated abelian groups  |  needs work  |  


## Examples

To view a worksheet, click on the "worksheet" link, then in the resulting page find the big blue download box and use your browser's function to copy the link there.  Then open your notebook, click the "Upload" link near the upper-left and then paste in the link into the URL field (the second one). 

Note: If your version of Sage is 4.3.2 or older then some examples may not render quite right.  See way below for how to edit older configurations. 

* Sage-Enhancing an Abstract Algebra Textbook (Updated: 2011/08/10)) 
      * Tom Judson's free open-source <a class="http" href="http://abstract.pugetsound.edu">Abstract Algebra; Theory and Applications</a> 
      * This project is complete, Sage material and exercises available for most of the chapters 
      * See the <a class="http" href="http://abstract.pugetsound.edu/sage-aata.html">book's website</a> to download 
* Sage-Enhancing a Linear Algebra Textbook (Updated: 2011/08/03) 
      * Rob Beezer's <a class="http" href="http://linear.pugetsound.edu">A First Course in Linear Algebra</a> 
      * Preview version now at <a class="http" href="http://linear.ups.edu/sage-fcla.html">book's website page</a> 
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
      * <a href="devel/LatexToWorksheet/approxpoly.tex">Latex source</a> 
      * <a href="devel/LatexToWorksheet/approxpoly.pdf">PDF</a> 
      * <a href="devel/LatexToWorksheet/approxpoly.sws">Worksheet</a> 
* SageTeX integration (Robert Marik, 2010/02/20) 
      * Slightly modified version of the `example.tex` file from the <a class="http" href="http://bitbucket.org/ddrake/sagetex/">SageTeX</a> distribution 
      * All but three graphics coming through, understandably 
      * Missing 3D tachyon graphic is just a path problem and is fixable 
      * Might be able to do something better with the `sagesilent` environment such as inserting a `%hide` at the start of the block 
      * To re-create this, run the following sequence of commands: ```txt
pdflatex example.tex
sage example.sage
htlatex example.tex "/path/to/tex4ht-sage.cfg" " -cunihtf -utf8"
tex2sws
   
```
      * <a href="devel/LatexToWorksheet/example.tex">Latex source</a> 
      * <a href="devel/LatexToWorksheet/example.pdf">PDF</a> 
      * <a href="devel/LatexToWorksheet/example.sws">Worksheet</a> 
      * For fixed tex4ht-sage.cfg, tex2sws.py which allows to insert 3D graphics and vertex labels see <a class="http" href="http://user.mendelu.cz/marik/sage/tex2sws">this link</a>. 
* A Whole-Book Experiment (2010/02/07) This is all of Beezer's <a class="http" href="http://linear.ups.edu">First Course in Linear Algebra</a> as a linked collection of Sage worksheets.  It runs about 900 pages when printed, but as a tar archive is around 700K. 
   * Details removed, this is now obsolete 
* tikz graphics migration (2010/02/03, Updated: 2010/02/20)  
 
      * tikz graphics in latex source passing through to the worksheet 
      * combinatorial graphs in Sage creating tikz source, also included 
      * worksheet has graphics as SVG, live cells, graph editor 
      * Not all browsers render SVG?  Tested in Firefox 
      * <a href="devel/LatexToWorksheet/graphics-test.tex">Latex source</a>, some generated by Sage 
      * <a href="devel/LatexToWorksheet/graphics-test.pdf">PDF</a>, a faithful rendition 
      * <a href="devel/LatexToWorksheet/graphics-test.sws">Worksheet</a>, note SVG graphics, run code, experiment with graph editor 
      * This experiment prompted by a <a class="http" href="http://old.nabble.com/Using-pgfsys-tex4ht.def-to-make-svg-output-td16685147.html">mailing list discussion</a> 
* Group Theory Primer (2010/01/28)  
 Lots of simple Sage code, some simple mathematics, one interact (search for "@interact")  
 Best working demo (though it lacks a title)  
 <a href="devel/LatexToWorksheet/sage-group-theory-primer.sws">Worksheet</a> <a href="devel/LatexToWorksheet/sage-group-theory-primer.sws">Source</a> 
* Textbook Section Experiment (2010/01/30, updated 2010/02/07)  
 This is a straight conversion of a math-heavy section from Beezer's linear algebra text. 
   * See note above about jsMath and matrix formatting. 
   * The original tex4ht output is at <a class="http" href="http://linear.ups.edu/jsmath/0220/fcla-jsmath-2.20li35.html#x36-143000">FCLA Section FS in jsMath</a> which seems to render just fine for me. 
   * There is no embedded Sage code here yet, but that will be easy to add. 
   * Links go nowhere unless they are internal to this section. 
   * <a href="devel/LatexToWorksheet/math-test.sws">Worksheet</a>  
* Linked Worksheets (2010/01/30)  
 A simple manufactured example of cross-worksheet linking. 
   * Fire up Sage, then create a new, temporary notebook with the user "link" ```txt
sage: from sagenb.notebook.notebook import Notebook
sage: nb = Notebook('/tmp/test.sagenb')
sage: nb.add_user('link', 'link', '', force=True)
sage: nb.save()
sage: exit
  
```
   * At system command-line extract archive (below) to create the worksheets with numbers 0 and 1 in link's space. ```txt
$ cd /tmp/test.sagenb/home
$ tar -xvf <path-to>/link-worksheets.tar.gz
  
```
   * Fire up Sage to start a notebook session in the temporary notebook: ```txt
sage: notebook(directory="/tmp/test.sagenb")
  
```
   * You may need to create an admin password (do it). You may see the worksheets, but be logged in as admin.  
 If needed, be certain to login as "link" with password "link."  
 
   * Open worksheet 0, execute a cell or two, find link to worksheet 1. 
   * Follow link to worksheet 1, execute some cells here too. 
   * <a href="devel/LatexToWorksheet/link-worksheets.tar.gz">Archive (described above)</a> <a href="devel/LatexToWorksheet/link-worksheets.py">Python generation script</a> 

## tex4ht

This is a list of known configurations of tex4ht that seem to work: 

* "tex4ht is part of the standard mactex distribution" (Dana Ernst, 2010/01/29) 
* "TeXLive 2009  (separate from Ubuntu package manager) includes its own little package manager ('tlmgr') and I used that to install tex4ht" (Dan Drake, 2010/01/30) 
* Ubuntu/Kubuntu/Debian: (K)Ubuntu Karmic 2009/05/21, Debian stable 2008/07/01, Debian testing 2009/06/11  
 From Jason B. Hill (2010/02/24) 
      * "texlive-full" depends on tex4ht (and hence will install tex4ht) in Ubuntu/Xubuntu/Kubuntu 9.10. 
      * "tex4ht" may also be installed directly from the standard Ubuntu repositories via apt/aptitude on top of the smaller "texlive-base/texlive-base-bin". This is also true for Debian stable. 
      * In either case, tex4ht/htlatex/etc commands must be added manually at this point to Kile, or can be called directly from the terminal. 

## Related Project

<a class="http" href="http://bitbucket.org/whuss/sws2tex/">sws2tex</a>, <a class="http" href="http://user.mendelu.cz/marik/sage/skolka.pdf">Example</a>  
 Anybody want to try for the round-trip, Latex -> SWS -> Latex? 


## jsMath Safe Boxes Edit

For Sage versions prior to 4.3.3.alpha0 (sagenb prior to 0.7.5) it is necessary to slightly tweak the jsMath configuration in Sage.  It is a one-character edit.  You can still view the sections, but "reasons" given in math displays (generally in proofs) won't render right and you will see lots of "@a()" stuff.  This was fixed in <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8202">Trac 8202</a> for Sage 4.3.3.  Check your version of Sage with `sage --version`. 

The file to edit is 
```txt
SAGE_ROOT/local/lib/python/site-packages/sagenb-0.6-py2.6.egg/sagenb/data/sage/js/jsMath.js
```
where you might have to adjust the numbering on the `sagenb` package.  Then at line 97 (or thereabouts) make the following change 
```txt
jsMath.safeHBoxes=1 --> jsMath.safeHBoxes=0
```