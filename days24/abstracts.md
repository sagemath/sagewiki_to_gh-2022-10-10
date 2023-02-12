
This page contains the abstracts for the talks given at <a href="/days24">Sage days 24</a>. 

[[_TOC_]] 

<a name="Boudellioua"></a> 
#### Mohamed S. Boudellioua --- On the simplification of systems of linear multidimensional equations

Linear multidimensional equations arise in the treatment of systems of partial differential equations, delay- differential equations, multidimensional discrete recursive equations, etc. The purpose of this talk is to present a constructive result on the simplification of a linear multidimensional system  to an equivalent system which contains fewer equations and unknowns. In particular the case when the reduced system consists of only one equation is considered. It is shown that the transformation of zero-coprime equivalence forms the basis of such simplification. This transformation has been studied by a number of authors and has been shown to play an important role in the theory of multidimensional linear systems. 

<a name="Boettner"></a> 
#### Stefan Böttner --- Mixed Transcendental and Algebraic Extensions for the Risch-Norman Algorithm

The problem of integration in finite terms for elementary functions has been solved since 1969 with the invention of the Risch algorithm. However, ever since then the sine and cosine functions have been rewritten in terms of other functions, originally using complex exponentials. Later, for the Risch-Norman algorithm, an alternative has been proposed where they are rewritten in terms of a tangent of half the angle. 

We discuss extensions to the Risch-Norman algorithm that admit functions satisfying systems of differential equations (and thus also functions satisfying a differential equation of higher order). We further improve the method to allow algebraic relations to exist among the functions, paying particular attention to new logarithms that may appear and need to be predicted. This results in a heuristic but quite powerful algorithm that is able to deal with a large class of special functions and a variety of algebraic functions. In particular, it is able to work with the sine and cosine functions directly without the need to rewrite them in terms of other functions. 

<a name="Chyzak"></a> 
#### Frédéric Chyzak --- DDMF (Dynamic Dictionary of Mathematical Functions) and its DynaMoW

We present the prototype of a new system for displaying dynamic mathematical contents on the web (DynaMoW), together with an application based on it, our interactive web-based encyclopedia of mathematical functions (DDMF, <a href="http://ddmf.msr-inria.inria.fr">http://ddmf.msr-inria.inria.fr</a>).  As part of DynaMoW, we developed an extension of the Ocaml language that is based on quotations and antiquotations to embed fragments of computer-algebra and mathematics-presentation languages.  This extension controls the simultaneous interactions between a user and one or several computer-algebra systems, as well as the generation of mathematical documents.  Our encyclopedia DDMF focuses on so-called differentiably finite functions, and can in principle be augmented with any such function.  For each mathematical function, the current version (v1.5) _algorithmically_ computes then displays: its potential symmetries; Taylor and Chebyshev series expansions; more generally, asymptotic expansions given in closed form or through definitions by recurrence; calculations of guaranteed, arbitrary-precision numerical approximations; real plots; its Laplace transform.  Upon request by the user, more terms in series expansions or more digits in numerical approximations can be computed incrementally.  For some of the properties, human-readable proofs are also automatically _generated_ and displayed.  (DynaMoW is joint work in progress with Alexis Darrasse; DDMF is joint work in progress with Alexandre Benoit, Alexis Darrasse, Stefan Gerhold, Marc Mezzarobba, and Bruno Salvy.) 

<a name="Erocal"></a> 
#### Burcin Erocal --- Difference fields & summation in Sage

I will present an implementation of Karr's summation machinery based on towers of difference fields in Sage. Karr's algorithms provide tools to simplify indefinite nested sums and products. They can also be used to find Zeilberger type creative telescoping relation to either prove identities involving definite sums, or when coupled with a recurrence equation solver, to find closed forms for given definite sums. 

After briefly presenting some relevant theory, I will give several examples to demonstrate the capabilities of my implementation. 

<a name="Johansson"></a> 
#### Fredrik Johansson --- Arbitrary-precision special functions in mpmath

The mpmath library, part of Sage, implements arbitrary-precision real and complex arithmetic along with tools for numerical evaluation of infinite series, integrals, derivatives, limits, and so on. It also provides a comprehensive set of special functions. We discuss how mpmath evaluates general and special functions, with emphasis on generalized hypergeometric functions (including Bessel functions, the Meijer G function and so on) for complex parameters and argument. 

<a name="Kauers"></a> 
#### Manuel Kauers --- Is it really a power series?

We will talk about a recent result in lattice path enumeration whose proof required heavy computer algebra calculation. The focus of the talk will be on a particularly expensive computational step in the proof, where we needed to show that something that looks like a power series really is a power series. Joint work with Alin Bostan, Inria. 

<a name="King"></a> 
#### Simon King --- Completeness criteria for modular group cohomology

The modular cohomology of a finite group is a graded commutative algebra over a finite field. Using projective resolutions and the stable element method, the algebraic structure can be "approximated" to arbitrary degree. Since the modular cohomology has a finite presentation, it is isomorphic to its degree-$n$ approximation, if $n$ is big enough. 

Jon Carlson was the first to give a completeness criterion, that tells when $n$ is big enough. He used it for the first modular cohomology computation for all groups of order 64. More recent completeness criteria are due to Dave Benson, Peter Symonds, David Green and myself. I implemented them in Sage, obtaining the first modular cohomology computation for all groups of order 128 and for various interesting non-prime-power groups, including the Higman-Sims group and the third Conway group. 

<a name="Korporal"></a> 
#### Anja Korporal and Georg Regensburger --- Implementing Integro-differential Operators via Normal Forms

Integro-differential operators provide an algebraic structure for representing linear boundary problems for ordinary differential equations as well as their solution operators. We discuss a possible implementation of integro-differential operators in computer algebra systems. The operators are represented in normal forms, which are given as a sum of a differential, an integral, and a boundary operator. We show an implementation in Maple with applications to boundary problems. It allows to compute solution operators (Green's operators) and to multiply and factor boundary problems. 

<a name="Paule"></a> 
#### Peter Paule --- Symbolic Computation in Special Functions: Recent Applications in Physics and Other Selected Topics

In this talk I present recent developments achieved in my working group at RISC. Primary focus is put on applications of symbolic computation methods in the area of Special Functions. A major part of the talk is devoted to the application of holonomic tools to problems related to Coulomb integrals in quantum physics (joint work with S. Suslov). If time remains I will report on some other applications, for instance, about new computer algebra methods in connection with special function inequalities (joint work with V. Pillwein) and modular forms (joint work with S. Radu). Papers related to my talk can be found at <a href="http://www.risc.jku.at/research/combinat/publications">http://www.risc.jku.at/research/combinat/publications</a>. 

<a name="Pillwein"></a> 
#### Veronika Pillwein --- CAD and Special Functions Inequalities

Cylindrical algebraic decomposition (CAD) is a widely known tool to handle (possibly quantified) systems of polynomial equations and inequalities. As Stefan Gerhold and Manuel Kauers discovered, CAD can also be applied for proving special functions inequalities that go beyond the scope of the original area of applications. It is their approach that primarily caught my interest in CAD and in this talk I want to briefly introduce CAD, the Gerhold/Kauers-method and to present a non-trival application of their method to show the positivity of a sum over certain Gegenbauer polynomials. 

<a name="Quadrat"></a> 
#### Alban Quadrat --- A Short Introduction to Constructive Algebraic Analysis

In this talk, we shall introduce a few basic ideas on algebraic analysis (e.g., algebraic D-modules), show how they can be studied within a constructive view point using, for instance, Gröbner basis techniques, and show how they can be used to answer interesting questions coming from mathematical systems theory and mathematical physics such as the existence of a (potential-like/Monge/injective) parametrization of underdetermined linear functional systems (e.g., systems of partial differential equations, of differential time-delay systems). Finally, we shall shortly explain how the ideas and techniques introduced in this talk can be generalized to obtain an equivalent block-triangular form for any linear system of partial differential equations based on the concept of the purity filtration of a differential module. This new form is extremely useful for the computation of closed form solutions. In particular, large classes of linear systems of partial differential equations, which cannot be directly integrated by Maple, can be integrated when rewritten under this new form. 

<a name="Raab"></a> 
#### Clemens Raab --- Symbolic computations for parameter integrals

We give an introduction to two paradigms for finding antiderivatives of given functions that are used in symbolic integration. Risch-type algorithms deal with (suitable representations of) functions directly whereas Zeilberger-type algorithms use operator calculus. There are parametric versions of both of them, which are useful in the evaluation of definite parameter integrals. These algorithms address the case when no antiderivative of the integrand is found as well as the issue of verifiability of the result. We will discuss the principles behind and give examples. 

<a name="Stein"></a> 
#### William Stein --- Sage: Creating a viable free open source alternative to Magma, Maple, Mathematica, and Matlab

I will describe in more detail some of our short and long term strategies for making Sage into a viable open source alternative to expensive proprietary commercial mathematics software. 

<a name="Temme"></a> 
#### Nico Temme --- Special Functions and Computer Algebra

The following points will be discussed. 

An overview of basic numerical methods to compute special functions, such as series expansions, recurrence relations, continued fractions,  and numerical quadrature. 

Examples of certain certain asymptotic forms of special functions, which forms are missing and/or would be welcomed. 

Examples where Maple and Mathematica produce wrong or too difficult answers in special functions evaluations. 

A few other topics in connection with special functions and computer algebra, such as methods based on Zeilberger's summation  method. 

<a name="Ulmer"></a> 
#### Felix Ulmer --- Liouvillian Solutions of Second and Third Order Linear Differential Equations

The computation of Liouvillian solutions (in particular for third order equations). Along the lines of  

   * Liouvillian solutions of third order differential equations  
            * Journal of Symbolic Computation, 36, 855-889 (2003) 
   * Linear Differential Equations and Products of Linear Forms (with M.F. Singer)  
            * Journal of Pure and Applied Algebra, 117-118,  549-563 (1997) 
   * Liouvillian and Algebraic Solutions of Second and Third Order Linear Differential Equations (with M.F. Singer) 
            * Journal of Symbolic Computation, 16, 37-74 (1993) 
I would suppose known the computation of the exponents and series solutions at a singular point, and of rational and exponential solutions 
