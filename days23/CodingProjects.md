## page was renamed from CodingProjects

<<TableOfContents>>

== sage-4.5 ==


 * Robert Miller


== ABC at home ==


 * review code
 * model runtime

 * People: Bart de Smit, Willem Jan Palenstijn, Demeyer, Mak Trifkovic, Thijs van Dijk, Alyssa Milburn, Dan Bernstein, Sebastian Pancratz


== Models for elliptic curves ==


 * genus 1 --> Weierstrass
 * People: Dan Bernstein, Tanja Lange, Niels Duif, Johannes van der Horst, Michiel Kosters, Marco Streng, Vince Bush, Julio Brau, Michael Mourao, John Cremona
 * Tom Fisher's Magma code for invariants and covariants of plane cubics [[attachment:covariants.m]], and for minimization and reduction of genus one models [[attachment:g1minimisation-2008.m]] [[attachment:g1reduction-2008.m]] [[attachment:minred-demo1.m]] [[attachment:minred-demo2.m]]
 * Ian Connell's lecture notes contain all the formulas needed to convert plane cubics and hyperelliptic quartics:  see http://www.math.mcgill.ca/connell/public/ECH1/ (first several pages of Chapter 1 (c1.ps)).


== Function Fields ==

The main goal of this project is to get the basic infrastructure for function fields into Sage.   If time permits, we will also implement Hess's algorithms.

People: William Stein, Maarten Derickx, Peter Bruin, Jan Tuitman, Max Flander, Tanja Lange, Michiel Kosters, Christiane Peters, Marco Streng 

 * Trac 9054: [[http://trac.sagemath.org/sage_trac/ticket/9054|Create a class for basic function_field arithmetic for Sage]]
 * Trac 9094: [[http://trac.sagemath.org/sage_trac/ticket/9094|is_square and sqrt for polynomials and fraction fields]]
 * Trac 9095: [[http://trac.sagemath.org/sage_trac/ticket/9095|Heights of points on elliptic curves over function fields]]


== Hyperbolic geometry ==


 * plotting (arc of circle, filling domain bounded with arc of circles, ...)
 * actions (using the coercion model to act on Hyperbolic Plane element by matrices)
 * fundamental domains (port H. Verrill program and implement R. Kulkarni method)
 * People: Vincent Delecroix, Maite Arianes, Thijs van Dijk


== Ticket #4000 on rational polynomials... QQ[x] via FLINT ==


 * People: Sebastian Pancratz, Bill Hart, Jan Tuitman


== Sage on GPU's ==


 * People: Dan Bernstein, Thijs van Dijk, Andy Novocin


== ZZ[x] factoring in FLINT, plus LLL ==


 * People: Andy Novocin, Wieb Bosma, Johannes van der Horst, Bill Hart, Max Flander


== MPIR projects ==

 * fmpz in Sage
 * a very concrete C project
 * People: Frederik Johansson, Bill Hart

== Ticket #4260 - Sage + Linbox ==


 * unify for matrices over GF(p)
 * C++ wizardry, etc
 * People: Andy Novocin, Clement Pernet, (Burcin Erocal, remotely)


== Sage Notebook in the classroom ==


 * People: Bart de Smit, William Stein, Eric van der Velden, Willem Jan Palenstijn, Alyssa Milburn

=== Specific Projects ===

  * Greatly improve [[http://nb.sagemath.org/|the Sage Notebook website]]
    * Improved information on the site:
       * how to setup a server
          * standalone server
          * with sage
       * how to develop the sage notebook: give a complete example of how to change something
    * Make site much prettier -- I think it is ugly.

  * Database
    * Users and basic configuration -- get the startup time of sagenb.org down from 20 minutes to 1 second by replacing users.pickle by a sqlite database, and rewriting the notebook server to use this database instead of making a list of *all* users (and other data about them) in memory.
    * worksheets -- see [[http://trac.sagemath.org/sage_trac/ticket/8757|trac 8757]];  This might also totally deal with the above "users and basic configuration" info. 

  * Worksheet labels
    * linking between worksheets: [[http://trac.sagemath.org/sage_trac/ticket/5042|trac 5042]] is relevant
    * support library worksheets, so you can type, e.g., {{{load "library.sws"}}}
   

== General framework for the factor(n) command ==

 * mpfq is LGPL!
 * special support for $p^n \pm 1$.
 * People: Hendrik Lenstra, Dan Bernstein, Tanja Lange, Christiane Peters, Peng Tian, Julio Brau, Mak Trifkovic
 * [[http://ttic.uchicago.edu/~kalai/papers/old_papers/factorcryptology.pdf|Kalai's paper]]
== Solving Conics ==



 * a Conic class using Denis Simon's pari code, possibly mwrank, finding points over number fields, other fields?
 * see sage trac #727 (and also #6881)
 * People: Marco Streng, Mak Trifkovic, Peter Bruin, John Cremona


== Sums of Squares ==


 * People: Japp Spies, Dung Duong

== Porting ECHIDNA code from MAGMA ==


 * People: Lloyd Kilford
