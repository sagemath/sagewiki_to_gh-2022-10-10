
Abstracts of talks at <a href="/days53">Sage Days 53</a> 



---

 
### Monday, September 23

<a name="Balakrishnan"></a> **Introduction to number theory and Sage (Jennifer Balakrishnan)** 

This talk will give some applications of Sage to number theory. No previous knowledge of Sage as a computer algebra system is assumed. 

<a name="Braun1"></a> **Introduction to mathematical physics and Sage (Volker Braun)** 

This is a continuation of the previous talk, giving some applications in geometry and physics. 

<a name="TBD"></a> **Scientific computing with Python and Cython (TBD)** 

We will give a quick review of Python and Cython, and how they are used in Sage to tie together scientific code from various fields. 

<a name="King"></a> **Implementing arithmetic operations in Sage (Simon King)** 

In algebra, one often not only wants to do arithmetic operations (addition, multiplication,...) within a fixed algebraic structure (e.g., multiplication in a ring), but also between _different_ algebraic structure (e.g., the field of coefficients acting on a vector space). Moreover, it often makes sense to allow arithmetic involving two algebraic structures such that the result lives in a _new_ structure (e.g., adding a rational number to a polynomial with integer coefficients yields a polynomial with rational coefficients). Another problem that commonly occurs in computer algebra is to make different _implementations_ of the same algebraic structure cooperate. Sage provides a framework to achieve all this, called the _coercion framework_. This talk will cover how to take advantage of it in your own code, and in particular how to interrelate your code with existing stuff in Sage. 

<a name="Braun2"></a> **Git and the new development workflow (Volker Braun)** 

Git is a system to collaboratively edit a set of files, and is being used for anything from writing scientific articles to the Linux source code (~16 million lines of source code). I’ll start with a basic introduction to using git for distributed development that is of general interest. The second half will be about the new development workflow in Sage using Git. 


### Tuesday, September 24

<a name="Flori"></a> **p-adics in Sage (Jean-Pierre Flori)** 

In this talk, I'll give a quick overview of the current and future implementations of p-adic numbers and related objects in Sage, with a special emphasis on their performance and the different ways offered to deal with inexact elements. 

<a name="SalernoWhitcher"></a> **Zeta functions, point counting, and mirror symmetry (Adriana Salerno and Ursula Whitcher)** 

Arithmetic mirror symmetry predicts that the zeta functions of mirror pairs of varieties should be closely related.  We'll describe existing results involving highly symmetric hypersurfaces and suggest avenues for experimentation in Sage. 



---

 


### Wednesday, September 25

<a name="Kedlaya"></a> **Some approaches to computing zeta functions of toric hypersurfaces (Kiran Kedlaya)**  

A hypersurface in a complete toric variety is *nondegenerate* if it has transversal intersection with each component of the natural stratification of the toric variety; this class of varieties includes many examples of interest to both number theorists and physicists. We survey several approaches based on p-adic cohomology for computing the zeta functions of nondegenerate hypersurfaces over finite fields, including Lauder's deformation method, the Castryck-Denef-Vercauteren method, and the Abbott-Kedlaya-Roe method. We then propose a modification of the AKR method based on the idea of controlled reduction in de Rham cohomology, which we expect to work well in practice. Joint work in progress with David Harvey. 

<a name="BesserEscriva"></a> **Frobenius lifts and point counting for smooth curves (Amnon Besser and Francois Escriva)** 

We will sketch a new approach for point counting on smooth curves, which is a joint work with Rob de Jeu. A few new ideas are involved: computing the action of Frobenius on cohomology via residues, a general method for lifting Frobenius globally and a local version of this lift. 



---

 


### Thursday, September 26

<a name="Novoseltsev"></a> **Toric geometry in Sage (Andrey Novoseltsev)** 

We will give an overview of toric geometry capabilities of Sage, demonstrate its use on a few examples, and discuss the current code structure and potential future improvements and additions. 

<a name="Tuitman"></a> **Counting points with the deformation method (Jan Tuitman)** 

I will first give a short introduction to the deformation method for computing zeta functions of varieties over finite fields. Then I will report on recent joint work with S. Pancratz that makes this method more practical for smooth projective hypersurfaces. Finally, I will try to show some examples computed with a very fast (FLINT) implementation of the algorithm. 



---

 


### Friday, September 27

<a name="Harker"></a> **Computational homology via discrete Morse theory (Shaun Harker)** 

Homology of chain complexes can traditionally be computed via matrix algorithms, in particular by computing Smith Normal Form (SNF). However, SNF can be quite slow for large matrices. Additionally, many SNF algorithms provide only the invariant factors and not the transformation matrices. This is problematic for applications (such as computing the induced map on homology given a function between spaces) which require that representative cycles of homology generators be computed. Discrete Morse Theory can be used as a tool to accelerate homology computation. The essential idea is to quickly produce from a large complex a smaller one, known as the Morse Complex, which has isomorphic homology groups. Then standard techniques may be applied to the reduced complex at far less cost. Moreover, algorithms exist to lift representative cycles from the Morse Complex back to the original complex. We discuss the theory and the algorithms implemented in the CHomP software package. 

<a name="Voight"></a> **Computing zeta functions of nondegenerate hypersurfaces with few monomials (John Voight)** 

Using the cohomology theory of Dwork, as developed by Adolphson and Sperber, we exhibit a deterministic algorithm to compute the zeta function of a nondegenerate hypersurface defined over a finite field. This algorithm is particularly well-suited to work with polynomials in small characteristic that have few monomials (relative to their dimension). 



---

 


### Saturday, September 28

<a name="Bouillaguet"></a> **TBD (Charles  Bouillaguet)** 



---

 


### Sunday, September 29

<a name="Keitel"></a> 

**Geometric engineering in toric F-theory (Jan Keitel)** 

An algorithm to systematically construct all Calabi-Yau elliptic fibrations realized as hypersurfaces in a toric ambient space for a given base and gauge group is described. This general method is applied to the particular question of constructing SU(5) GUTs with multiple U(1) gauge factors. The basic data consists of a top over each toric divisor in the base together with compactification data giving the embedding into a reflexive polytope. In order to ensure the existence of a low-energy gauge theory, the elliptic fibration must be flat, which is reformulated into conditions on the top and its embedding. Abelian gauge symmetries arising in toric F-theory compactifications are studied systematically. Using implementations in Sage, the toric Mordell-Weil groups determining the minimal number of U(1) factors are computed, an exhaustive list of SU(5) tops is compiled and several explicit fourfolds exemplifying the general algorithm are constructed. 
