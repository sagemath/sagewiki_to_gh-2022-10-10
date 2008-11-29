= Sage 3.2 Release Tour =
Sage 3.2 was released on November 20th, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see [[http://sagemath.org/src/announce/sage-3.2.txt|sage-3.2.txt]].

== Subspace generation ==
Robert Miller: generate all subspaces of a vector space/projective space

== New Symbolics ==
William Stein, Burcin Erocal: high level integration of pynac into Sage


== General group algebras class ==
David Loeffler: General group algebras class

== Elliptic Curve Doctesting ==

Paul Zimmermann: much improved elliptic curve doctests and some bug fixes


== Modular Forms ==
* Craig Citro: Huge number of small fixes to modular forms code 
* David Loeffler: Eta product modular functions
* Craig Citro: massively speed up Victor Miller basis code

== Magma Interface ==
William Stein: much improved magma interface with 100% doctests

== Generalized Bernoulli Numbers ==
William Stein: massively optimized generalized bernoulli numbers

== Modular Composition ==
Martin Albrecht, Paul Zimmermann: improve modular composition in GF(2)[x]

== Polyhedral Improvements ==
Marshall Hampton: Schlegel diagrams, standard polytopes, multiplication, polars

= Notebook =
Timothy Clemans: notebook templatization work

== Sage Build ==
William Stein: make it so "sage -br" does the cythonization in parallel using pyprocessing
Robert Bradshaw, Gonzalo Tonaria, Craig Citro: Massively cleaned up and faster setup.py
Robert Bradshaw: Update to Cython 0.10

== libSingular ==
Simon King, Martin Albrecht: Fix memory leaks in libsingular's reduce() 

== Numerical Linear Algebra ==
Jason Grout: make numpy the backend for matrices over CDF and RDF

== Graph Theory ==
Jason Grout: much more robust planarity testing code for graphs
