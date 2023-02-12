

# What Sage Can Do

This is a high-level overview and list of functionality that is easily available from the standard Sage interface.  (The intended reader has never heard of Maxima, GAP, Singular, Givaro, etc.).  


## Bioinformatics

* Sage can parse various file formats such as GenBank, FASTA, BLAST, and ClustalW. 
* Access online databases such as NCBI, SwissProt, and PubMed. 
* Translate RNA sequences to protein sequences using a variety of translation types (e.g. mitochondrial). 

## Calculus

* Sage has fairly complete symbolic manipulation capabilities, including symbolic and numerical integration, differentiation, limits, etc. 

## Combinatorics

* Many basic functions. 
* Many of Sloane's functions are implemented. 

## Coding theory

* A wide range of basic functionality. 

## Commutative Algebra

* Fast computation of Groebner basis. 
* Fast basic arithmetic over $Q$ and $GF(p^n)$. 
* Global, local and mixed monomial orderings. 
* Many basic ideal related functions/methods. 

## Cryptography

* Classical ciphers are well supported. 
* Fast point counting on elliptic curves. 
* Support for algebraic cryptanalysis like small scale AES equation system generators 

## Elementary Education

* The Sage notebook (a graphical interface) is a useful tool for basic math education because of its flexible visualization/output capabilities. 

## Finite Fields

* Fast arithmetic over finite fields and extensions of finite fields for $GF(p<sup>n)$ with $p</sup>n < 2^{16}$ and $p=2$ and $n > 1$. 

## Graph Theory

* Construction, directed graphs, labeled graphs. 
* 2d and 3d plotting of graphs using an optimized implementation of the spring layout algorithm. 
* Constructors for all standard families of graphs 
* Graph isomorphism testing; automorphism group computation 

## Graphical Interface

* A web-browser based graphical interface, which anybody can easily use or share.  The GUI can also be used for any math software that SAGE interfaces with.  
* A wiki with math typesetting preconfigured.  

## Group Theory

* Permutations groups 
* Abelian groups 
* Matrix groups (in particular, classical groups over finite fields) 

## Interfaces to Math Software

* Interpreter interfaces to Axiom, CoCoA, GAP, KASH, Macaulay2, Magma, Maple, Mathematica, Matlab, Maxima, MuPAD, Octave, and Singular. 
* C/C++-library interfaces to NTL, PARI, Linbox, and mwrank. 

## Linear Algebra

* Compute the reduced row echelon form of e.g. dense 20,000x20,000 matrices over GF(2) in seconds and 50MB of RAM. 
* Computation of reduced row echelon forms of sparse matrices. 
* Sparse matrix solver and rank computation over $GF(p)$. 
* Fast matrix multiplication, characteristic polynomial and echelon forms of dense matrices over QQ. 

## Number Theory

* Compute Mordell-Weil groups of (many) elliptic curves using both invariants and algebraic 2-descents. 
* A wide range of number theoretic functions, e.g., euler_phi, primes enumeration, sigma, tau_qexp, etc.  
* Optimized modern quadratic sieve for factoring integers n = p*q. 
* Optimized implementation of the elliptic curve factorization method. 
* Modular symbols for general weight, character, Gamma1, and GammaH. 
* Modular forms for general weight >= 2, character, Gamma1, and GammaH. 
* Elliptic Curves: 
         * All standard invariants of elliptic curves over QQ, division polynomials, etc.  
         * Compute the number of points on an elliptic curve modulo p for all primes p less than a million in seconds. 
         * Optimized implementation of the Schoof-Elkies-Atkin point counting algorithm for counting points modulo p when p is large. 
         * Complex and p-adic L-functions of elliptic curves 
         * Can compute p-adic heights and regulators for p < 100000 in a reasonable amount of time. 
         * Formal groups 

## Numerical Computation

* Fast arithmetic and special functions with double precision real and complex numbers. 
* Matrix and vector arithmetic, QR decomposition, system solving. 

## p-adic Numbers

* Extensive support for arithmetic with a range of different models of p-adic arithmetic. 

## Plotting

* Sage provides very complete 2d plotting functionality similar to Mathematica's.  
* Sage provides limited 3d plotting via an included ray tracer.  

## Polytopes

* State of the art support for computing with lattice polytopes. 
* Exact convex hulls in any dimension can be quickly computed (requires the optional polymake package). 

## Statistics

* Linear and nonlinear modelling, classical statistical tests, time-series analysis, classification, clustering. 