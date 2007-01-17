These are the abstracts for all the talks scheduled for the workshop, listed in 
alphabetical order.  For times, see the [:msri07/schedule: schedule] itself.

[[TableOfContents]]

== Bailey -- Experimental Mathematics and High-Performance Computing ==
 
[http://crd.lbl.gov/~dhbailey/ David H Bailey], Lawrence Berkeley Lab
 
Recent developments in "experimental mathematics" have underscored the value of
high-performance computing in modern mathematical research.  The most frequent
computations that arise here are high-precision (typically
several-hundred-digit accuracy) evaluations of integrals and series, together
with integer relation detections using the "PSLQ" algorithm.  Some recent
highlights in this arena include: (2) the discovery of "BBP"-type formulas for
various mathematical constants, including pi and log(2); (3) the discovery of
analytic evaluations for several classes of multivariate zeta sums; (4) the
discovery of Apery-like formulas for the Riemann zeta function at integer
arguments; and (5) the discovery of analytic evaluations and linear relations
among certain classes of definite integrals that arise in mathematical physics.
The talk will include a live demo of the "experimental mathematician's
toolkit".

== Bradshaw -- Loosely Dependent Parallel Processes ==

[robertwb@math.washington.edu Robert Bradshaw ]

Many parallel computational algorithms involve dividing the problem into
several smaller tasks and running each task in isolation in parallel.  Often
these tasks are the same procedure over a set of varying parameters.
Inter-process communication might not be needed, but the results of one task
may influence what subsequent tasks need to be performed. I will discuss the
concept of job generators, or custom-written tasks that generate other tasks
and process their feedback. I would discuss this specifically in the context of
integer factorization.

== Bremner -- An evolutionary algorithm for finding an optimal basis of a subspace ==
[bremmer@math.usask.ca Murray Bremner]

We present an evolutionary algorithm for finding an optimal basis of the
nullspace of a matrix over the rational numbers in the sense that the basis
vectors have integral components with no common factor and the components are
as small as possible. The algorithm employs a variation operator in which an
existing basis is combined with one or more randomly generated bases and then
filtered by a greedy algorithm to produce a better basis. For a dense random 5
by 10 matrix we compare the algorithm to an exhaustive search.  For a dense
random 10 by 20 matrix we test the algorithm with population sizes from 1
to 10. Our third example is a sparse structured 120 by 90 matrix whose
nullspace contains polynomial identities for a nonassociative algebra. The
better bases located with this algorithm permit the automatic discovery of new
algebraic identities with simple statements.

== Cohn -- <TITLE> ==
[http://research.microsoft.com/~cohn/ Henry Cohn (Microsoft Research)]

== Cooperman -- Disk-Based Parallel Computing: A New Paradigm ==
[http://www.ccs.neu.edu/home/gene/ Gene Cooperman (Northeastern University)]

Symbolic algebra problems are often characterized by intermediate swell. Hence,
many computations are limited by space rather than by time.  Previously,
practitioners were space-limited by the available aggregate RAM of a
cluster. By using disk as the "new RAM", one can now consider computations that
were previously unthinkable. Such a strategy takes advantage of the parallel
I/O of the many local disks in a cluster. Note that 50 disks provide a parallel
bandwidth of about 2.5 GB/s --- similar to the bandwidth of a single RAM
subsystem. Hence, the local disks of a cluster provide many tens of terabytes
of the new "disk-based RAM", while traditional physical RAM serves as a
cache. Since disk ("disk-based RAM") has poor latency, any computation must be
structured around algorithmic primitives that based on streaming
access. Luckily, in many interesting cases, this is not difficult. We present a
general software architecture and an early implementation of that architecture.


== Edelman -- <TITLE> ==
[http://www-math.mit.edu/~edelman/ Alan Edelman (MIT)]


== Fateman -- polynomial multiplication ==

[fateman@cs.berkeley.edu Richard Fateman ]

Dense polynomial multiplication can be reduced to (long) integer multiplication
which can be reduced to FFT which can be done in parallel. Sparse multivariate
polynomial multiplication cannot plausibly be reduced in this manner. Explicit
representation of sparse polynomials by (distributed) hash tables provides a
possible parallel technique. I'd like to hear discussion of this (or offer such
comments myself.)  I hope an hour is too much time.

== Granger -- Interactive Parallel Computing using Python and IPython ==

[http://txcorp.com Brian Granger - Tech X Corp.]

Interactive computing environments, such as Matlab, IDL and
Mathematica are popular among researchers because their
interactive nature is well matched to the exploratory nature of
research.  However, these systems have one critical weakness:
they are not designed to take advantage of parallel computing
hardware such as multi-core CPUs, clusters and supercomputers.
Thus, researchers usually turn to non-interactive compiled
languages, such as C/C++/Fortran when parallelism is needed.

In this talk I will describe recent work on the IPython project
to implement a software architecture that allows parallel
applications to be developed, debugged, tested, executed and
monitored in a fully interactive manner using the Python
programming language.  This system is fully functional and allows
many types of parallelism to be expressed, including message
passing (using MPI), task farming, shared memory, and custom user
defined approaches.  I will describe the architecture, provide an
overview of its basic usage and then provide more sophisticated
examples of how it can be used in the development of new parallel
algorithms.  Because IPython is one of the components of the SAGE
system, I will also discuss how IPython's parallel computing
capabilities can be used in that context.


== Harrison -- Science at the petascale --- tools in the tool box. ==

[http://www.csm.ornl.gov/ccsg/html/staff/harrison.html Robert Harrison ] (Oak Ridge 
National Lab)

Petascale computing will require coordinating the actions of 100,000+
processors, and directing the flow of data between up to six levels
of memory hierarchy and along channels that differ by over a factor of
100 in bandwidth. Amdahl's law requires that petascale applications
have less than 0.001% sequential or replicated work in order to
be at least 50% efficient. These are profound challenges for all but
the most regular or embarrassingly parallel applications, yet we also
demand that not just bigger and better, but fundamentally new science.
In this presentation I will discuss how we are attempting to confront
simultaneously the complexities of petascale computation while
increasing our scientific productivity. I hope that I can convince you
that our development of MADNESS (multiresolution adaptive numerical
scientific simulation) is not as crazy as it sounds.

This work is funded by the U.S. Department of Energy, the division of
Basic Energy Science, Office of Science, and was performed in part
using resources of the National Center for Computational Sciences, both
under contract DE-AC05-00OR22725 with Oak Ridge National Laboratory.


== Hart -- <TITLE> ==
[http://www.maths.warwick.ac.uk/~masfaw/ Bill Hart (Warwick)]

== Hida -- <TITLE> ==
[http://www.cs.berkeley.edu/~yozo/ Yozo Hida (UC Berkeley)]

== Johnson-Leung -- Special values for abelian extensions of imaginary quadratic fields. ==

[jenfns@brandeis.edu Jennifer Johnson-Leung]

In the case of extensions of number fields, the equivariant Tamagawa number
conjecture is best though of as a twisted, Galois equivariant class number
formula. This conjecture is proved for abelian extensions of the rationals. I
will summarize the current state of the problem for abelian extensions of
imaginary quadratic fields. This is the only other large class of field
extensions where substantive progress has been made. I will discuss the
difficulties in other cases where I am hopeful that computational methods may
prove fruitful

== Khan -- Game Theoretical Solutions for Data Replication in Distributed Computing Systems ==

[sakhan@cse.uta.edu Samee Khan]

Data replication is an essential technique employed to reduce the user
perceived access time in distributed computing systems. One can find numerous
algorithms that address the data replication problem (DRP) each contributing in
its own way. These range from the traditional mathematical optimization
techniques, such as, linear programming, dynamic programming, etc. to the
biologically inspired meta-heuristics. We aim to introduce game theory as a new
oracle to tackle the data replication problem. The beauty of the game theory
lies in its flexibility and distributed architecture, which is well-suited to
address the DRP. We will specifically use action theory (a special branch of
game theory) to identify techniques that will effectively and efficiently solve
the DRP. Game theory and its necessary properties are briefly introduced,
followed by a through and detailed mapping of the possible game theoretical
techniques and DRP. As an example, we derive a game theoretical algorithm for
the DRP, and propose several extensions of it. An elaborate experimental setup
is also detailed, where the derived algorithm is comprehensively evaluated
against three conventional techniques, branch and bound, greedy and genetic
algorithms.

== Kotsireas -- Combinatorial Designs: constructions, algorithms and new results ==

[ ikotsire@wlu.ca Ilias Kotsireas]

We plan to describe recent progress in the search for combinatorial designs of
high order. This progress has been achieved via some algorithmic concepts, such
as the periodic autocorrelation function, the discrete Fourier transform and
the power spectral density criterion, in conjunction with heuristic
observations on plausible patterns for the locations of zero elements. The
discovery of such patterns is done using meta-programming and automatic code
generation (and perhaps very soon data mining algorithms) and reveals the
remarkable phenomenon of crystalization, which does not yet possess a
satisfactory explanation. The resulting algorithms are amenable to parallelism
and we have implemented them on supercomputers, typically as implicit parallel
algorithms.

== Leykin -- Parallel computation of Grobner bases in the Weyl algebra ==

[leykin@ima.umn.edu Anton Leykin ]

The usual machinery of Grobner bases can be applied to non-commutative algebras
of the so-called solvable type. One of them, the Weyl algebra, plays the
central role in the computations with $D$-modules. The practical complexity of
the Grobner bases computation in the Weyl algebra is much higher than in the
(commutative) polynomial rings, therefore, calling naturally for parallel
computation.  We have developed an algorithm to perform such computation
employing the master-slave paradigm. Our implementation, which has been carried
out in C++ using MPI, draws ideas from both Buchberger algorithm and
Faug\`{e}re's $F_4$. It exhibits better speedups for the Weyl algebra in
comparison to polynomial problems of the similar size.

== Martin -- MPMPLAPACK: The Massively Parallel Multi-Precision Linear Algebra Package ==

[http://www.math.jmu.edu/~martin/ Jason Martin (James Madison University)]

For several decades, researchers in the applied fields have had access
to powerful linear algebra packages designed to run on massively
parallel systems.  Libraries such as ScaLAPACK and PLAPACK provide a
rich set of libraries (usually based on BLAS) for performing linear
algebra over single or double precision real or complex data.
However, such libraries are of limited use to researchers in discrete
mathematics who often need to compute with multi-precision data types.

This talk will cover a massively parallel multi-precision linear
algebra package that I am attempting to write.  The goal of this C/MPI
library is to provide drop-in parallel functionality to existing
number theory and algebraic geometry programs (such as Pari, Sage, and
Macaulay2) while preserving enough flexibility to eventually become a
full multi-precision version of PLAPACK.  I will describe some
architectural assumptions, design descisions, and benchmarks made so
far and actively solicit input from the audience (I'll buy coffee for
the person who suggests the best alternative to the current name).

== Maza-Xie -- <TITLE> ==
[http://www.csd.uwo.ca/~moreno/ Moreno Maza and Xie (Western Ontario)]

== Noel -- <TITLE> ==
[http://www.math.umb.edu/~anoel/ Alfred Noel (UMass Boston / MIT)]

== Pernet -- Parallelism perspectives for the LinBox library ==

[cpernet@uwaterloo.ca Clement Pernet]

LinBox is a generic library for efficient linear algebra with blackbox or dense matrices over a finite fields or Z. We first prent a few notions of the
sequential implementations of selected problems, such as the system resolution or multiple triangular system resolution, or the chinese remaindering
algorithm.
Then we expose perspectives for incorporating parallelism in LinBox, including multi-prime lifting for system resolution over Q, or parallel chinese
remaindering. This last problem raises the difficult problem of combining early termination and work-stealing techniques.

== Qiang -- Distributed Computing using SAGE ==
[http://www.yiqiang.net/ Yi Qiang (UW)]

The objective of this research project is to implement coarse grained
distributed computation facilities into SAGE. Our goal was to design and
implement distributed computing facilities that offered SAGE users an easy and
effective method of parallelizing computations that are "embarrassingly"
parallelizable. In the presentation I will demonstrate several sample use cases
of how to leverage distributed computing in SAGE.

== Shishkina -- Variational Inequalities on Stratified Sets ==

[ilina_dico@mail.ru Elina Shishkina]

I establish variational inequalities on a class of multistructures, called stratified sets.
For stratified sets these problem have to combined with the geometry and the algebraic
structure of the domain.

== Roch -- <TITLE> ==
[http://www-id.imag.fr/Laboratoire/Membres/Roch_Jean-Louis/perso.html Jean-Louis Roch 
(France)]

== Tonchev -- Combinatorial designs and code synchronization ==

[tonchev@mtu.edu Vladimir Tonchev ]

Difference systems of sets are combinatorial designs that arise in connection
with code synchronization.  Algebraic constructions based on cyclic difference
sets and finite geometry and algorithms for finding optimal difference systems
of sets are discussed.

== Verschelde -- <TITLE> ==
[http://www.math.uic.edu/~jan/ Jan Verschelde (UIC)]

== Wolf & Neun -- Parallel sparsening and simplification of systems of equations ==
[ twolf@brocku.ca Thomas Wolf ]
[ neun@zib.de Winfried Neun ]

In a Groebner Basis computation the guiding principle for pairing and
`reducing' equations is a total ordering of monomials or of derivatives for
differential Groebner Bases. If reduction based on an ordering is replaced by
reduction to minimize the number of terms of an equation through another
equation then on the downside the resulting (shorter) system does depend on the
order of pairing of equations for shortening but on the upside there are number
of advantages that makes this procedure a perfect addition/companion to the
Groebner Basis computation. Such features are:

  - In contrast to Groebner Basis computations, this algorithm is safe in the
sense that it does not need any significant amount of memory, even not
temporarily.

  - It is self-enforcing, i.e. the shorter equations become, the more useful
  for shortening other equations they potentially get.

  - Equations in a sparse system are less coupled and a cost effective
elimination strategy (ordering) is much easier to spot (for humans and
computers) than for a dense system.

  - Statistical tests show that the probability of random polynomials to
  factorize increases drastically the fewer terms a polynomial has.

  - By experience the shortening of partial differential equations increases
their chance to become ordinary differential equations which are usually easier
to solve explicitly.

  - The likelyhood of shortenings to be possible is especially high for large
overdetermined systems. This is because the number of pairings goes
quadratically with the number of equations but for overdetermined systems, more
equations does not automatically mean more unknowns to occur which potentially
obstruct shortening by introducing terms that can not cancel.

  - The algorithm offers a fine grain parallelization in the computation to
shorten one equation with another one and a coarse grain parallelization in
that any pair of two equations of a larger system can be processed in parallel.
In the talk we will present the algorithm, show examples supporting the above
statements and give a short demo.

== Wong-Kew -- Global Analysis of Algorithms and the PvsNP-Completeness Problem ==
[bi346@scn.org Richard Wong-Kew]

References: Global Analysis Newton's Method,
Kachian's Theorem, PvsNP-Completeness Problem.


== Zafiris -- Geometric Characteristics of Trivariate Maps ==
[ZafirisV@uhd.edu Vasilis Zafiris]

Volume grid cells are usually constructed using a trivariate polynomial map
defined on a reference domain. The simplest and most popular trivariate is the
trilinear. The map and its Jacobian are represented in Bezier form and a
pyramid algorithm is utilized to simultaneously compute points and geometric
characteristics associated with the map. In addition, sufficient conditions are
given for the positivity of the Jacobian determinant and an iterative algorithm
for solving the inversion problem is derived. The convergence and the accuracy
of numerical solutions to partial differential equations strongly depend on the
geometric characteristics of the grids on which these solutions are
computed. First and second order geometric characteristics for hexahedral
volume grids cells are formulated and applied to evaluate the quality of
three-dimensional grid structures. Examples measuring the Jacobian and the
orthogonality of geologic grids are given.

== Yelick -- <TITLE> ==
[http://www.cs.berkeley.edu/~yelick/ Kathy Yelick (UC Berkeley)]

== Zhuang -- Parallel Implementation of Polyhedral Homotopy Methods ==
[yzhuan1@math.uic.edu Yan Zhuang]

Homotopy methods to solve polynomial systems are well suited for parallel
computing because the solution paths defined by the homotopy can be tracked
independently. For sparse polynomial systems, polyhedral methods give efficient
homotopy algorithms. The polyhedral homotopy methods run in three stages: (1)
compute the mixed volume; (2) solve a random coefficient start system; (3)
track solution paths to solve the target system.  This paper is about how to
parallelize the second stage in PHCpack. We use a static workload distribution
algorithm and achieve a good speedup on the cyclic n-roots benchmark
systems. Dynamic workload balancing leads to reduced wall times on large
polynomial systems which arise in mechanism design.
