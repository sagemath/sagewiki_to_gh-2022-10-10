

# SD 10 Coding Sprint


## Coding Sprint Meetings

* Monday, October 13th at 11am status meeting in A008 
* Tuesday, October 14th at 4pm status meeting in A008  
* Wednesday, October 15th at 11:30am final wrap up session in A008 [after the coffee break] 
The following rooms are available all day during the coding sprint (until midnight) 

* A008 with a capacity of 50 people 
* A006 with a capacity of 30 people 
* A208 with a capacity of 10 people 
* A217 with a capacity of 8 people 

## Rules

* participation is optional 
* starting Monday daily and optional status report meetings at 6pm in the amphitheater 
* each person should only participate in a project or two 
* 3.1.3 should be out by Monday 

## Informal lectures

Talks held on Monday 

* 11:30 am: Mercurial and Mercurial Queues (Mike Hansen)  
      * Mercurial Book: <a href="http://hgbook.red-bean.com/">http://hgbook.red-bean.com/</a> 
      * Mercurial Queues: <a href="http://wiki.sagemath.org/MercurialQueues">http://wiki.sagemath.org/MercurialQueues</a> 
* 1:30 pm: Using Cython (Robert Bradshaw) 
* 2:15 pm: new coercion system - the final frontier (Robert Bradshaw) 
A schedule for the talks should be announced during the organizational meeting on Monday. 


## Coordinators

* Combinatorics: Mike Hansen 
* Linear Algebra: Clement Pernet 
* Groebner Basis (Martin Albrecht) 
* Elliptic Curves (?) 

## Suggested projects


### Bug Squashing

(Michael Abshoff, 1/2 David Harvey, Simon King, Paul Zimmermann)  


### Polynomial Factory over QQ

(Andy Novocin, Bill Hart, 1/2 David Harvey, Michael Abshoff) 


### Nash Equlibria

(Greg Bard, Paul Leopardi) 


### Glucat

(Paul Loepardi) 


### Linear Algebra over Polynomial Rings

(Burcin Erocal, Arne Storjohann, Clément Pernet) 

* (esp. for nullspace computation over fraction fields of these) 
* done -- implemented algorithm suggested by Arne for Z_p[x] 
* lift the results to Z[x] 
* optimize (using ffblas operations from linbox) 

### Improve the State of Fraction Fields

(Burcin Erocal) 

* done -- move Fraction Fields to the new coercion model 
* add a rational function class using flint for Z(x) 

### F5

(Martin Albrecht, Michael Brickenstein, Simon King, Ludovic Perret) 

* we will **read** the original F5 paper and try to understand it 
      * we're working on a toy implementation of F5/Matrix now 
* we will port John Perry's F5 Singular and pseudo code to Sage, see: <a href="http://www.math.usm.edu/perry/Research/">http://www.math.usm.edu/perry/Research/</a> 
      * this is done: see <a href="days10/CodingSprint/f5.py">f5.py</a> 
      * for a different implementation, see <a href="days10/CodingSprint/f5.pyx">f5.pyx</a> 
* additional material: <a href="http://eprint.iacr.org/2006/404.pdf">http://eprint.iacr.org/2006/404.pdf</a> 

### Matrix Factorisation over GF(2)

(Martin Albrecht, Clément Pernet, Greg Bard, Jean-Guillaume Dumas) 

* we have many building blocks for LQUP factorization in place in the M4RI library, these need to be plugged together and optimized 
      * Implementation is done, painfull debugging still in progress 
* we have two out of four TRSM routines, we need to add the remaining two and optimized the existing ones 
      * Done: <a href="days10/CodingSprint/m4ri_trsm_UL_LR.patch">m4ri_trsm_UL_LR.patch</a> 
* Linear system solving in M4RI:  
      * Implemented and tested (using <a href="/LinBox">LinBox</a> sparse PLUQ, while M4RI PLUQ is under developpment).<a href="days10/CodingSprint/jgd_solve.patch">jgd_solve.patch</a> 

### Linear Algebra modulo Small Primes

(Clément Pernet, Jean-Guillaume Dumas) 

   * implement the bound computation and splitting system to use the compressed matmul over small finite fields, 
   * create a matrix_modn_dense implementation based on floating point coefficients and wrapping most of FFLAS-FFPACK (cf tickets #4258,#4259,#4269) 

### Sage-Combinat (coming soon)


### Linear Algebra on GPU

(Michael Abshoff, Clément Pernet) 

* play with the local Ge8800 and FFLAS-FFPACK 

### Simultaneous Diophantine Approximation of Real Numbers

(Andy Novocin) 


### non-coding: summarize the entire Sage history for a sagemath.org/library/history.html web-page

(Harald Schilly) 

* collect old talks, the documentation, ask someone. You would just have to write text, no html 

### Add Wrapper for PLURAL to Sage

(Burcin Erocal, Michael Brickenstein) 

* see: <a href="http://www.singular.uni-kl.de/Manual/3-0-4/sing_355.htm">http://www.singular.uni-kl.de/Manual/3-0-4/sing_355.htm</a> 
* see: <a href="http://sage.math.washington.edu/home/bricken/plural_2.patch">http://sage.math.washington.edu/home/bricken/plural_2.patch</a> 
* Figure out: 
   * Where to put these things in the type hierarchy 
   * How to create one of these objects 
* Progress: 
   * general g-algebra creation 
   * exterior algebras (seem to) work 
   * can be defined using free algebra and relations 

### Add Better Support for Identifying and Citing "Sub"-Systems

* (Mike Hansen) 
* make sure credit goes where credit is due 
* There is a initial patch for handling this at <a href="http://trac.sagemath.org/sage_trac/ticket/4269">http://trac.sagemath.org/sage_trac/ticket/4269</a> 

### Hilbert class polynomial

(Eduardo Ocampo-Alvarez, Andrey Timofeev) 


### Implement Sparse FGLM

(Martin Albrecht) 

* see <a href="http://eprint.iacr.org/2008/402.pdf">http://eprint.iacr.org/2008/402.pdf</a> for timings why this makes sense 

### Speed-Up Arithmetic for Elliptic Curves over Finite Fields

(Nadia El Mrabet) 


### French Translation of the Tutorial (A Project for Newcomers!)

(Bertrand Meyer, Marc Mezzarobba) 

* as a means to discover Sage while doing something (hopefully) useful, we are trying to translate: <a href="http://sage.math.washington.edu/home/mhansen/doc-sphinx/tutorial/">http://sage.math.washington.edu/home/mhansen/doc-sphinx/tutorial/</a> 
* see <a href="http://wiki.sagemath.org/i18n/French">http://wiki.sagemath.org/i18n/French</a> 

### Improve Emacs Interface

(Matthias Meulien) 

Goal: provide fancy enhancement to Nick Alexander's emacs mode for Sage.  

<a href="days10/CodingSprint/sage-view.el">sage-view.el</a> 

This code adds LaTeX processing of Sage output and images embedding in emacs Sage buffer. Work in progress!!! Needs Ghostcript, AUCTeX... and recent emacs!! Done some bug fixing and performance stuff yesterday... Still a major bug with long output... 


### Increase Doctest Coverage

(Paul Zimmermann) 


### 2d Graph Plotting Enhancements

(Emily Kirkman, Philippe Saade) 

* The goals include restructuring current graph plot function to have more readable code, as well as adding features such as multiedge plotting and better scaling heuristics.  Abandon ship of networkx plotting and interact directly with matplotlib. 