
[[_TOC_]] 

A list of tickets we're working on can be found <a class="https" href="https://trac.sagemath.org/query?keywords=~sd87&amp;col=id&amp;col=summary&amp;col=status&amp;col=type&amp;col=priority&amp;col=milestone&amp;col=component&amp;order=priority">here</a>.  If you work on a ticket, please add `sd87` to the list of keywords so that it appears! 

Most of the code for working with p-adics can be found <a class="https" href="https://git.sagemath.org/sage.git/tree/src/sage/rings/padics">here</a> and <a class="https" href="https://git.sagemath.org/sage.git/tree/src/sage/libs/linkages/padics">here</a> if you want to browse. 


## Big Sage projects

* Add general extensions of p-adic fields in Sage <a class="https" href="https://trac.sagemath.org/ticket/23218">#23218</a> (David Roe) 
* Add Julian's Mac Lane package which provides a general framework for discrete valuations to Sage <a class="https" href="https://trac.sagemath.org/ticket/21869">#21869</a> (Julian) 
* Add Julian's Completion package, for general p-adic extension backed by number fields, to Sage <a class="https" href="https://trac.sagemath.org/ticket/22956">#22956</a> (Julian) 
* Polynomial factorization, using Julian's Mac Lane package and/or Brian Sinclair's ticket <a class="https" href="https://trac.sagemath.org/ticket/12561">#12561</a> (Ticket needs review) (Brian - meeting in UHS 115) 
   * make sure simpler factoring methods are in good shape, like Hensel lifting and Panayi's root finding. 
* Lattice precision for p-adics (in particular p-adic matrices, polynomials) (Xavier) 
   * Smith normal form <a class="https" href="https://trac.sagemath.org/ticket/23450">#23450</a> (ready for review), determinant <a class="https" href="https://trac.sagemath.org/ticket/23478">#23478</a> (ready for review) 
   * Hermite normal form <a class="https" href="https://trac.sagemath.org/ticket/23486">#23486</a> (ready for review) 
   * Lattices in p-adic vector spaces: this is handled by the generic code for modules over PID (after the implementation of HNF above and ~~this simple ticket <a class="https" href="https://trac.sagemath.org/ticket/23503">#23503</a>~~) 
   * Design a framework for lattice precision <a class="https" href="https://trac.sagemath.org/ticket/23505">#23505</a> 
* Power series via p-adic templates (Adriana) 
* Linkage files for p=2 and/or using longs for the case that $p<sup>{\text{prec}} < 2</sup>{62}$ 
* Implementation of Gröbner bases and tropical Gröbner bases algorithm (F4, F5, FGLM), doctest and submission (Tristan). A ticket on F5 has been posted (<a class="https" href="https://trac.sagemath.org/ticket/23461">#23461</a>, needs review). A ticket on a Tropical F5 is in progress (<a class="https" href="https://trac.sagemath.org/ticket/23501">#23501</a>). 
   * We might finish reviewing the inclusion of openf4 at <a class="https" href="https://trac.sagemath.org/ticket/18749">#18749</a> and patch it to avoid going through strings all the time 
   * And also look at the performance of Singular, polybori, giac, ... 
* Zeta function tickets  
   * <a class="https" href="https://trac.sagemath.org/ticket/20264">#20264</a> (Edgar, Vishal Aru, Nicholas Triantafillou, Ricky) 
   * <a class="https" href="https://trac.sagemath.org/ticket/20265">#20265</a> (Edgar, JP)  
   * <a class="https" href="https://trac.sagemath.org/ticket/19865">#19865</a>  
   * <a class="https" href="https://trac.sagemath.org/ticket/20308">#20308</a> (Ben, David) 
* Roadmap for regular models in Sage using Mac Lane package, <a class="http" href="http://www-personal.umich.edu/~psuchand/projects.html">Suchandan Pal's code</a> and <a class="https" href="https://github.com/swewers/MCLF">Stefan Wewers' work</a>. (Julian) 
* Etale algebras (maybe see also ticket <a class="https" href="https://trac.sagemath.org/ticket/21413">#21413</a>) (Ricky) 
* For an old list of possible projects, see <a href="/padics">padics</a> 

## Smallish Sage projects

* Norms, traces, frobenius, matrix mod pn for relative p-adic extensions (David) 
* Add more black-box testing to p-adics, performance benchmarketing (Aly) 
* nth roots, square roots that create extensions (extend=True as for integers) <a class="https" href="https://trac.sagemath.org/ticket/12567">#12567</a> (Marc, David) 
* Artin-Hasse exponentials <a class="https" href="https://trac.sagemath.org/ticket/12560">#12560</a> (Xavier) 
* ~~Gauss sums via the Gross-Koblitz formula, which uses code on p-adic gamma functions <a class="https" href="https://trac.sagemath.org/ticket/23456">#23456</a> (Adriana and Ander)~~  
* Better coercion/conversion to and from residue fields (Aly, Marc) 
* ~~Optimized implementation of Frobenius automorphism <a class="https" href="https://trac.sagemath.org/ticket/12657">#12657</a> (Ander)~~ 
* p-adic polylogarithms <a class="https" href="https://trac.sagemath.org/ticket/20260">#20260</a> (Alex) Ready for review! 
* ~~bug in matrix of Frobenius when p = 3 <a class="https" href="https://trac.sagemath.org/ticket/11960">#11960</a> (Jen)~~ 
* Switching to exact defining polynomials for p-adic extensions <a class="https" href="https://trac.sagemath.org/ticket/23331">#23331</a> (David) 
* Change p-adic constructors to not care about the base ring of a defining polynomial <a class="https" href="https://trac.sagemath.org/ticket/18606">#18606</a> (David) 
* Investigate slowness in unramified extensions <a class="https" href="https://trac.sagemath.org/ticket/23172">#23172</a> (Xavier) 
* Review Xavier's fast exponential code <a class="https" href="https://trac.sagemath.org/ticket/23235">#23235</a> (Xavier) 
* Ray class groups and Hecke characters <a class="https" href="https://trac.sagemath.org/ticket/15829">#15829</a>, <a class="https" href="https://trac.sagemath.org/ticket/23518">#23518</a> (Rob) 
* Add Monge-reduction for Eisenstein polynomials (first over $\mathbb{Q}_p$, then over unramified extensions) (Sebastian) 
* Generic zeta function method for schemes <a class="https" href="https://trac.sagemath.org/ticket/20308">#20308</a> (Edgar) 
* Elliptic curve point counting over F_q using PARI <a class="https" href="https://trac.sagemath.org/ticket/16931">#16931</a> <a class="https" href="https://trac.sagemath.org/ticket/16949">#16949</a> (J-P Flori, Kevin) 
* Expose PARI code for Frobenius matrix on hyperelliptic curves <a class="https" href="https://trac.sagemath.org/ticket/20309">#20309</a> (Marc) 
* Raise coverage of schemes/hyperelliptic_curves/monsky_washnitzer.py to 100% <a class="https" href="https://trac.sagemath.org/ticket/15645">#15645</a> (Edgar) 
* ~~For number fields, extend the range of degrees where is_galois() works, add method is_abelian(), and for abelian number fields add method conductor() (JJ)~~ 
* Requested by Anna Haensch: A weak approximation function 

## Non Beginner Sage tickets needing review

   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23204">#23204</a> (Aly) ~~ 
   * <a class="https" href="https://trac.sagemath.org/ticket/23203">#23203</a> (Claire) 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23484">#23484</a>~~ 
   * <a class="https" href="https://trac.sagemath.org/ticket/20265">#20265</a> 

## Beginner Sage projects

* Change root_field to return a p-adic field <a class="https" href="https://trac.sagemath.org/ticket/14893">#14893</a>, ~~<a class="https" href="https://trac.sagemath.org/ticket/20073">#20073</a>~~,~~<a class="https" href="https://trac.sagemath.org/ticket/20244">#20244</a>~~ (Aly) 
* ~~Add an `exact_ring` method for p-adic rings and fields <a class="https" href="https://trac.sagemath.org/ticket/23507">#23507</a> (Adele)~~ 
* Update and improve the p-adic tutorial (Rob) 
* Add more thematic tutorials in number theory (Rob) 
* Here are some tickets that should be easy to review (feel free to add more!): 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/12657">#12657</a> (<a href="/GaYee">GaYee</a>)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/16949">#16949</a> (<a href="/GaYee">GaYee</a>)~~ 
   * <a class="https" href="https://trac.sagemath.org/ticket/23190">#23190</a> (possible dependencies for global tests -- Adele) 
   * <a class="https" href="https://trac.sagemath.org/ticket/23185">#23185</a> (Needs work, doctests are failing) 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23482">#23482</a> (Claire)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23483">#23483</a> (Adele)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23484">#23484</a> (Need to wait until <a class="https" href="https://trac.sagemath.org/ticket/23204">#23204</a> is done -- David A.)~~ 
   * <a class="https" href="https://trac.sagemath.org/ticket/23376">#23376</a> (Samuel) 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23473">#23473</a> (This tickets now needs a review ! -- David A.) (Freda)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23456">#23456</a> (Adele)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23495">#23495</a> (Adele)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23499">#23499</a> (Adele)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23193">#23193</a> (Freda)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23194">#23194</a> (Edgar)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23235">#23235</a> (Adele)~~  
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23479">#23479</a> (Sara)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23503">#23503</a> (Angie)~~ 
   * <a class="https" href="https://trac.sagemath.org/ticket/12657">#12657</a> (Sara) 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/20308">#20308</a> (David A.)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23509">#23509</a> (Sara)~~ 
   * polylogarithms <a class="https" href="https://trac.sagemath.org/ticket/20260">#20260</a> 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23507">#23507</a> (Sara)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23510">#23510</a> (Adele)~~ 
   * ~~<a class="https" href="https://trac.sagemath.org/ticket/23512">#23512</a> (really small) (Edgar) ~~ 

## LMFDB projects

* Fix polredabs related issues <a class="https" href="https://github.com/LMFDB/lmfdb/issues/2135">#2135</a>  (JJ) 
* Finish up: <a href="https://github.com/LMFDB/lmfdb-collab/wiki//Warwick-workshop-June-2017">https://github.com/LMFDB/lmfdb-collab/wiki//Warwick-workshop-June-2017</a>, precisely:  
   * Compute Elliptic Curves over number fields L-functions <a class="https" href="https://github.com/LMFDB/lmfdb/issues/396">#396</a> (Edgar) 
   * Compute Hilbert Modular Form L-functions <a class="https" href="https://github.com/LMFDB/lmfdb/issues/418">#418</a> (Edgar) 
   * Compute the Asai L-functions <a class="https" href="https://github.com/LMFDB/lmfdb/issues/414">#414</a>  
* Doc-Testing utilities (David Lowry-Duda) 
* Hecke algebras: see <a href="https://github.com/sanni85/HeckeAlgebras">https://github.com/sanni85/HeckeAlgebras</a> and <a href="https://github.com/sanni85/lmfdb/tree/hecke_alg">https://github.com/sanni85/lmfdb/tree/hecke_alg</a> (Samuele) pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2189">#2189</a> 
* Display Hecke eigenvalues in terms of an integral basis. See: <a class="https" href="https://github.com/LMFDB/lmfdb/issues/975">#975</a>, pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2197">#2197</a> (Edgar, Sam Schiavone, Michael Musty) 
* Compute Galois splitting models (Ben, Angie) 
* ~~Display local algebras (JJ)~~ 
* Better handling of character tables (JJ) 
* Some finished work: 
   * ~~Sanitize API interface: <a href="https://github.com/LMFDB/lmfdb/issues/2053">https://github.com/LMFDB/lmfdb/issues/2053</a> (Edgar) ~~ 
   * ~~Prototype a Sage/LMFDB interface. See <a href="https://github.com/LMFDB/lmfdb/issues/1360">https://github.com/LMFDB/lmfdb/issues/1360</a>  and <a href="https://github.com/LMFDB/lmfdb/issues/2169">https://github.com/LMFDB/lmfdb/issues/2169</a> (Edgar, Simon Brandhorst and David Lowry-Duda)~~ 
   * ~~PR <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2184">#2184</a>~~ 
   * ~~Issue <a class="https" href="https://github.com/LMFDB/lmfdb/issues/1959">#1959</a> pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2190">#2190</a>~~ 
   * ~~Issue <a class="https" href="https://github.com/LMFDB/lmfdb/issues/2187">#2187</a> pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2188">#2188</a>~~ 
   * ~~Moving import scripts: pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2186">#2186</a>~~ 
   * ~~Issue <a class="https" href="https://github.com/LMFDB/lmfdb/issues/2172">#2172</a> pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2176">#2176</a>~~ 
   * ~~Pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2198">#2198</a>: Hilbert modular forms search CM and base change, solves issues <a class="https" href="https://github.com/LMFDB/lmfdb/issues/1975">#1975</a>, <a class="https" href="https://github.com/LMFDB/lmfdb/issues/1972">#1972</a>~~ 
* Yoshida lifts of Hilbert modular forms: adding function to compute, working on displaying the data (Malcolm, Samuele) <a href="https://github.com/sanni85/lmfdb/tree/paramodular_lift">https://github.com/sanni85/lmfdb/tree/paramodular_lift</a> and Pull Request <a href="https://github.com/LMFDB/lmfdb/pull/2201">https://github.com/LMFDB/lmfdb/pull/2201</a> 
* Compute shapes of cubic and quartic number fields (Rob) 
* Shapes of number fields (Rob, Samuele) pull request <a class="https" href="https://github.com/LMFDB/lmfdb/pull/2205">#2205</a> 
* Idle: 
   * Work on the isogeny classes of abelian varieties over finite fields. See <a href="http://beta.lmfdb.org/Variety/Abelian/Fq/">http://beta.lmfdb.org/Variety/Abelian/Fq/</a> (Christelle) 
   * Work on Hypergeometric Motives over ℚ. See <a href="http://beta.lmfdb.org/Motive/Hypergeometric/Q/">http://beta.lmfdb.org/Motive/Hypergeometric/Q/</a> (Dave Roberts) 
   * Use Monge-reduced polynomials (and ones related to them) for defining polynomials (JJ) 
   * Dirichlet characters modulo l: see <a href="https://github.com/sanni85/Dirichlet_modL">https://github.com/sanni85/Dirichlet_modL</a> (Samuele) 
   * Galois representations modulo l: see <a href="https://github.com/sanni85/Mod-l-galois-representations">https://github.com/sanni85/Mod-l-galois-representations</a> and <a href="http://beta.lmfdb.org/Representation/Galois/ModL/">http://beta.lmfdb.org/Representation/Galois/ModL/</a> (Samuele) 