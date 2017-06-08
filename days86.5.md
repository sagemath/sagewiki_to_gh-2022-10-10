= Sage Days 86.5: PIMS Workshop on Computational Arithmetic Geometry =

June 5-9, 2017, Simon Fraser University, Burnaby, Canada

http://www.cecm.sfu.ca/~nbruin/WCAG2017/

== Tickets we're working on ==

Add the keyword "sd86.5" to any tickets you are working on so they show in this list: [[https://trac.sagemath.org/query?keywords=~sd86.5&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|sd86.5 Tickets]]

== CoCalc ==

We have a dedicated CoCalc instance at https://k8s.sagemath.org. (Ask somebody if you need the secret token to sign up.)

To SSH into this instance: Add your public key (`~/.ssh/id_rsa.pub`) to (`~/.ssh/authorized_keys`) and then `ssh e18ab8dc695143fdae98229d0178040f@35.185.249.31`.

You can use this SSH connection to use your local editor to work on files there through sshfs; ask around if you want to setup something like that.

== Projects ==

This SageDays/workshop emphasizes on computational arithmetic geometry. So far we have 4 programming projects:

1. Basic arithmetic in function fields

2. Fast point adding on Jacobians of genus 2 imaginary hyperelliptic curves

3. Riemann surfaces: Numerical computation of endomorphism rings

4. P-adic computation in divisor class groups

=== 1. Basic arithmetic in function fields ===

We have code that implements the Montes algorithm and therefore the OM representation of prime ideals in function fields ([[https://arxiv.org/pdf/1005.1156.pdf]|details])

Based on this representation we want to realize the following tasks for function fields:

1.3 Representation of fractional ideals

1.2 P-adic valuation for a prime ideal P of a function field.

1.3 Computation integral basis of fractional ideals.

1.4 Divisor representation.

1.5 Divisor arithmetic.

1.6 Reduction algorithm for lattices over polynomial rings.

1.7 Riemann-Roch and genus computation. 

I am currently working full time on these tasks for global function fields (F/F_q). I will let you know how far I got. Finally we need an implementation for function fields of Q or over number fields.

=== 3. Riemann surfaces ===

People interested: Aly Deines, Alexandre Zotine, Nils Bruin

Relevant tickets: [[https://trac.sagemath.org/ticket/21198|#21198]] [[https://trac.sagemath.org/ticket/23140|#23140]] [[https://trac.sagemath.org/ticket/23175]]

We have code that implements a "RiemannSurface" class that allows computation of period matrices (currently, Singular is used to compute the basis of differentials). The homology basis is derived from a Voronoi cell decomposition based on the branch locus and monodromy computation uses certified continuation. Integration uses Gauss-Legendre to get accurate integral values.

We compute endomorphism ring generators by using LLL to recognize relations, largely in analogy to what Paul van Wamelen has done for hyperelliptic curves.

Tasks left:

 a. Figure out if, where, and how to integrate this class into Sage

 a. Allow for an alternative option to certified continuation: Heuristically this can be done pretty reliably, and in many cases answers aren't proven anyway, so having unproven monodromy doesn't make much difference. One heuristic would be to try to extrapolate (by order 0 or 1) over a distance that is a given fraction of the distance to the closest singularity and see if Newton iteration for each value converges to a value that's close. If not, halve distance and try again.

 a. Find a good place to put the numerical integration routine. The code presently is basically that of mpmath, but partially cythonized for enhanced performance. High performance, high order integration methods are nice to have ... See also [[https://trac.sagemath.org/ticket/21198|#21198]] for improving fast_callable for multiprecision complex numbers.

 a. Other integration methods: Probably Gauss-Legendre is best for these integrals in terms of number of evaluations, but efficient evaluation schemes for finding the evaluation points (which are zeros of Legendre polynomials) get problematic, meaning that for very high order the precomputation of the evaluation points might become dominant. Clenshaw-Curtis probably needs more evaluation points, but finding which points should be used is a little easier, since the evaluation points are zeros of Chebyshev polynomials, which can be computed more efficiently using a Discrete Cosine Transform (which can be encoded with an FFT). All of this doesn't seem to be available in Sage in multiprecision, but it could lead to high order integration routines with better runtimes.

 a. Find cool examples ...

=== 4.P-adic computation in divisor class groups ===

People interested: David Roe, David Harvey, Peter Bruin

Relevant Trac tickets: [[https://trac.sagemath.org/ticket/15104|#15104]], [[https://trac.sagemath.org/ticket/15113|#15113]]

One idea here is to just use characteristic 0 approaches, with some measures to improve numerical stability a bit. For this, the approach taken by Kamal Khuri-Makdisi is perhaps more attractive, because it only needs linear algebra rather than computing polynomial GCDs. There is some code at [[https://trac.sagemath.org/ticket/15113|#15113]] that is a proof of concept, which can be made to work over p-adics as well. Presently, it leaks precision in a horrible way, but this can likely be improved considerably by using pivoting strategies that take numerical stability into account at least a little bit.

We should probably integrate [[https://trac.sagemath.org/ticket/15104|#15104]] as well, because it considerably improves matrix computation over finite fields (a different case).
