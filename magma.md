= Magma versus Sage =

The goal of [[http://magma.maths.usyd.edu.au/magma/|Magma]] is to provide a mathematically rigorous environment for solving computationally hard problems in algebra, number theory, geometry and combinatorics.  The core goal of Sage is to provide a free open source alternative to Magma.  This includes being able to do everything Magma does and to do it better.   This page is meant to track our progress in that direction.  We intend to accomplish this by some combination of: (1) extremely hard work, (2) better technology, (3) getting Magma open sourced and incorporated into Sage, (4) sharing of effort (e.g., people who work for Magma sharing the code and algorithms they produce with the Sage community). 

The point of this page is to list functionality that Magma has and whether Sage has it or not, and if Sage has said functionality, how does the speed compare.  It is basically to answer the question "can Magma still do anything Sage can't do".

The main reference for what Magma does is [[http://magma.maths.usyd.edu.au/magma/htmlhelp/MAGMA.htm|the Magma reference manual]].  

See also [[sagebeatsmagma|Sage versus Magma]].

<<TableOfContents>>

= Functionality in Magma not in Sage =

There are tons of things that Magma does that Sage also obviously does, e.g., "compute with univariate polynomials".  The goal is to list here only things that Magma does that Sage doesn't do.  Also, if Magma can do something ''much'' more efficiently than Sage, it should be listed here. 

== Platform Support ==
Magma officially supports the following hardware/OS platforms that Sage does not officially support:

Alpha (Linux), Alpha (OSF/Tru64), IBM PowerPC64 (AIX), IBM PowerPC64 (Linux), Macintosh 64-bit Intel (OS X 10.5 [Leopard]), Sparc (Solaris), Sparc64 (Solaris)

Notes: 
  * Nobody cares about Alpha support anymore.
  * We do not have access to any PPC Linux boxes.
  * We do not have access to any AIX boxes.
  * There is active work to port sage to 64-bit MacIntel, but it is '''not''' done.  Libsingular, fortran, and pexpect issues remain.  Sage-3.4.1.alpha0 builds with the spkg at http://trac.sagemath.org/sage_trac/ticket/5057, but does not start. 

== Univariate Polynomials ==
=== Interpolation ===

Magma has the following function, which Sage doesn't have.

{{{
Interpolation(I, V) : [ RngElt ], [ RngElt ] -> RngUPolElt

    This function finds a univariate polynomial that evaluates to the values V in the interpolation points I. Let K be a field and n > 0 an integer. Given sequences I and V both consisting of n elements of K, return the unique univariate polynomial p over K of degree less than n such that p(I[i]) = V[i] for each 1≤i≤n. 
}}}

The corresponding Sage function would likely work like this:
{{{
sage: R.<x> = QQ[]
sage: f = R.interpolation([1,2/3,3], [-1,2,3/5])
}}}
Then f would be the monic polynomial over QQ such that f(1) = -1, f(2/3) = 2 and f(3) = 3/5.

Note that Sage has
{{{
sage: R.<x> = QQ[]
sage: R.lagrange_polynomial([(1,-1),(2/3,2),(3,3/5)])
21/5*x^2 - 16*x + 54/5
}}}
so this problem can easily be solved via an alias. 


=== Reductum ===
Magma has this and Sage doesn't:
{{{
Reductum(f) : RngUPolElt -> RngUPolElt
    The reductum of a polynomial f, which is the polynomial obtained by removing the leading term of f. 
}}}

=== PowerPolynomial ===
Magma has this and Sage doesn't:
{{{
PowerPolynomial(f,n) : RngUPolElt, RngIntElt -> RngUPolElt
    The polynomial whose roots are the nth powers of the roots of the given polynomial (which should have coefficients in some field). 
}}}

Here is how to implement it in Sage:
{{{
def power_polynomial(f,n):
    y0,y1=PolynomialRing(f.base_ring(),2,'y').gens()
    return f(y1).resultant(y0-y1**n,y1).substitute({y0:f.parent().gen(),y1:0})
}}}
It would also be easy to generalise, retruning the polynomial whose roots are g(a) where a runs over the roots of f and g is another univariate polynomial.  Just change y1**n to g(y1).
=== PrimitivePart, MaxNorm, SumNorm ===
For polynomials over ZZ, Magma has these and Sage doesn't:
{{{
PrimitivePart(p) : RngUPolElt -> RngUPolElt
    The primitive part of p, being p divided by the content of p. 

MaxNorm(p) : RngUPolElt -> RngIntElt
    The maximum of the absolute values of the coefficients of p. 

SumNorm(p) : RngUPolElt -> RngIntElt
    The sum of the coefficients of p. 

DedekindTest(p, m) : RngUPolElt, RngIntElt -> Boolelt
    Given a monic polynomial p (univariate or multivariate in one variable) and a 
    prime number m, this returns true if p satisfies the Dedekind criterion at m, 
    and false otherwise. The Dedekind criterion is satisfied at m if and only if 
    the equation order corresponding to p is locally maximal at m [PZ89, p.295]. 
}}}
In Sage we would have:
{{{
sage: R.<x> = ZZ[]
sage: f = 6*(x^3 + 2*x + 3)
sage: f.primitive_part()
x^3 + 2*x + 3
sage: f.max_norm()
sage: f.sum_norm()
sage: f.dedekind_test(3)
}}}

=== Normalize ===
Magma has this and Sage doesn't, and it looks like it could be useful.
{{{
Normalize(f) : RngUPolElt -> RngUPolElt
    Given a univariate polynomial f over the ring R, this function returns the unique 
normalized polynomial g which is associated to f (so g = uf for some unit in R). This is 
chosen so that if R is a field then g is monic, if R is Z then the leading coefficient 
of g is positive, if R is a polynomial ring itself, then the leading coefficient of g 
is recursively normalized, and so on for other rings. 
}}}

=== Factorization ===

Sage is missing these:

{{{
DistinctDegreeFactorization(f) : RngUPolElt -> [ <RngIntElt, RngUPolElt> ]

    Degree: RngIntElt                   Default: 0

    Given a squarefree univariate polynomial f∈F[x] with F a finite field, this 
function returns the distinct-degree factorization of f as a sequence of pairs, 
each consisting of a degree d, together with the product of the degree-d 
irreducible factors of f.

    If the optional parameter Degree is given a value L > 0, then only (products of) 
factors up to degree L are returned. 
}}}

{{{
EqualDegreeFactorization(f, d, g) : RngUPolElt, RngIntElt, RngUPolElt -> [ RngUPolElt ]

    Given a squarefree univariate polynomial f∈F[x] with F a finite field, and 
integer d and another polynomial g∈F[x] such that F is known to be the product of 
distinct degree-d irreducible polynomials alone, and g is xq mod f, where q is the 
cardinality of F, this function returns the irreducible factors of f as a sequence 
of polynomials (no multiplicities are needed).

    If the conditions are not satisfied, the result is unpredictable. This function 
allows one to split f, assuming that one has computed f in some special way. 
}}}

Sage should definitely have this, but doesn't.
{{{
IsSeparable(f) : RngUPolElt -> BoolElt

    Given a polynomial f∈K[x] such that f is a polynomial of degree ≥1 and K 
is a field allowing polynomial factorization, this function returns true
 iff f is separable. 
}}}

=== Misc poly functions ===

The QMatrix of a degree d polynomial f over F_q is the matrix of the qth power Frobenius map on the d-dimensional F_q-algebra F_q[x]/(f):   
{{{
QMatrix(f) : RngUPolElt -> AlgMatElt
    Given a univariate polynomial f of degree d over a finite field F, this 
function returns the Berlekamp Q-matrix associated with f, which is an 
element of the degree d matrix algebra over F. 
}}}

The CompanionMatrix of a degree d polynomial f over a ring R is the matrix of the multiplication-by-x map on the R-algebra R[x]/(f). Sage doesn't have this easy function:
{{{
CompanionMatrix(f) : RngUPolElt -> AlgMatElt

    Given a monic univariate polynomial f of degree d over some ring R, return the 
companion matrix of f as an element of the full matrix algebra of degree d over R. 
The companion matrix for f=a_0 + a_1x + ... + a_{d-1}x^{d-1} + x^d is given by

        [    0    1    0    ...        0 ]
        [    0    0    1    ...        0 ]
        [    .    .    .    .          . ]
        [    .    .    .     .         . ]
        [    .    .    .      .        . ]
        [ -a_0 -a_1 -a_2    ... -a_(d-1) ]

}}}

=== Hensel Lifting ===

{{{
HenselLift(f, s, P) : RngUPolElt, [ RngUPolElt ], RngUPol -> [ RngUPolElt ]

    Given the sequence of irreducible factors s modulo some prime p of the univariate 
integer polynomial f, return the Hensel lifting into the polynomial ring P, which must 
be the univariate polynomial ring over a residue class ring modulo some power of p.
Thus given f = ∏i si mod p, this returns f = ∏i ti mod pk for some k ≥1, as a 
sequence of polynomials in Z/pkZ. The factorization of f modulo p must be 
squarefree, that is, s should not contain repeated factors. 
}}}
See http://magma.maths.usyd.edu.au/magma/htmlhelp/text304.htm#1869 for an example of Hensel lifting in Magma.

== Galois Theory ==

Magma's support for computing Galois groups of polynomials over QQ is substantially better than that of Pari, or indeed anything else. The algorithms used by Magma are well-documented but implementing them would be a very major project.

== Modular Forms ==

Magma has:

   * Kevin Buzzard's code for computing weight 1 cusp forms
   * Lassina Dembele's algorithms for Hilbert modular forms using definite quaternion algebras


Kevin Buzzard says on November 5, 2015 that he would also be more than willing to share the magma code he wrote; he also wrote code that computed mod p weight 1 modular forms, which he did not give to magma but would happily give to anyone who asks (including magma). However it should be noted that George J. Schaeffer wrote some **much** more efficient weight 1 modular forms code, so in terms of optimising overall functionality of sage one should *definitely* attempt to implement Schaeffer's code first if possible.

Getting either of these into Sage would be a worthy project (the first much easier than the second).

The second is very much also work of John Voight.  I don't think the second would be too hard, given the work that John Voight and Lassina Dembele have already done, since they have both written numerous nice papers very clearly explaining the algorithms, and they are more than willing to share all the Magma code they wrote. -- William Stein. 

== Coding Theory ==

=== Weight distributions ===

Magma can compute weight distributions quickly for any base field.

{{{
WeightDistribution(C) : Code -> [ <RngIntElt, RngIntElt> ]
}}}
Sage can only do this quickly in the binary case (using Cython) or in the case of a field of size q<11 (using Leon's code).

=== Other code constructions ===

Magma has Quantum codes, codes over rings, LDPC codes, AG codes, and many other code constructions which Sage does not have.

http://magma.maths.usyd.edu.au/magma/htmlhelp/text1694.htm#17385
http://magma.maths.usyd.edu.au/magma/htmlhelp/text1686.htm
http://magma.maths.usyd.edu.au/magma/htmlhelp/text1722.htm

=== Decoding algorithms ===

Magma has a wide range of specialized decoding algorithms which Sage does not have.

http://magma.maths.usyd.edu.au/magma/htmlhelp/text1681.htm

== Analytic jacobians of hyperelliptic curves ==

Magma has a wide-ranging package implemented principally by Paul van Wamelen for computing analytic parametrizations of Jacobians of hyperelliptic curves.  Nick Alexander has code for doing some of this and has code for interfacing to Magma's code for doing this buried in his tree; contact him if you're interested in doing more work in this direction.

Alternatively, there is some crude implementaion of Khuri-Makdisi's method working over CC. However, this could also be adapted to work over exact fields, see: https://github.com/edgarcosta/endomorphisms/blob/beb12124563fb2bf448c57e587a3e3f1d6a1d724/newton/PicardGroup.py

http://magma.maths.usyd.edu.au/magma/htmlhelp/text1400.htm

== Quadratic Forms ==

A patch from Alia to help improve the balance [[http://trac.sagemath.org/sage_trac/ticket/6106|trac 6106]].

=== Binary Quadratic Forms ===
Magma has the following and Sage doesn't.

{{{
BinaryQuadraticForms(D) : RngIntElt -> QuadBin

QuadraticForms(D) : RngIntElt -> QuadBin

Create the structure of integral binary quadratic forms of discriminant D.
}}}

{{{
Composition(f, g) : QuadBinElt, QuadBinElt -> QuadBinElt

Al: MonStgElt                       Default: "Gauss"
Reduction: BoolElt                  Default: false

Returns the composition of two binary quadratic forms f and g. The default for Composition is Reduction := false, so that one can work in the group of forms, rather in the set of class group representatives. The function Composition takes a further parameter Al which specifies whether the algorithm of Gauss or Shanks, set to "Gauss" by default. The algorithm of Shanks performs partial intermediate reductions, so the combination Reduction := false and Al := "Shanks" are incompatible and returns a runtime error.
}}}

{{{
AmbiguousForms(Q) : QuadBin -> SeqEnum

Enumerates the ambiguous forms of negative discriminant D, where D is the discriminant of the magma of binary quadratic forms Q.
}}}
{{{
Order(f) : QuadBinElt -> RngIntElt

For a binary quadratic form f, returns its order as an element of the class group Cl(Q) where Q is the parent of f.
}}}

{{{
IsEquivalent(f, g) : QuadBinElt, QuadBinElt -> BoolElt, AlgMatElt

Return true if the quadratic forms f and g reduce to the same form and false otherwise. If true and the discriminant is negative, then the transformation matrix is also returned. An error is returned if the forms are not of the same discriminant.
}}}

{{{
QuadraticOrder(Q) : QuadBin -> RngQuad

Given a structure of quadratic forms of discriminant D, returns the associated order of discriminant D in a quadratic field.
}}}

{{{
ClassGroup(Q: parameters) : QuadBin -> GrpAb, Map

    FactorBasisBound: FldPrElt          Default: 0.1
    ProofBound: FldPrElt                Default: 6
    ExtraRelations: RngIntElt           Default: 1
The class group of the binary quadratic forms of discriminant D. The function also returns a map from the abelian group to the structure of quadratic forms.

}}}

The following functionalities are in Magma but in Sage they are only implemented for definite binary quadratic forms.

{{{
IsReduced(f) : QuadBinElt -> BoolElt

Return true if the quadratic form f is reduced; false otherwise.
}}}

{{{
ReducedForm(f) : QuadBinElt -> QuadBinElt, Mtrx

Returns a reduced quadratic form equivalent to f, and the transformation matrix.
}}}
{{{
ReducedOrbits(Q) : QuadBin -> [ {@ QuadBinElt @} ]

Given the structure of quadratic forms of positive discriminant D, returns the sequence of all reduced orbits of primitive forms of discriminant D, as an indexed set.
}}}
=== General Quadratic forms ===
The quadratic forms package in Sage supports a wider array of functions than that in Magma.
Here's the only functionality that Magma has and I couldn't find in Sage.
{{{
IsotropicSubspace(f) : RngMPolElt -> ModTupRng

IsotropicSubspace(M) : Mtrx -> ModTupRng

This returns an isotropic subspace for the given quadratic form (which must be either integral or rational), which may be given either as a multivariate polynomial f or as a symmetric matrix M. The subspace returned is in many cases guaranteed to be a maximal totally isotropic subspace.
}}}

== Algebraic Geometry ==
=== Base Change ===
Magma has the following and Sage doesn't.
{{{
BaseChange(C, m) : Sch,Map -> Sch

The base change of the curve C by the map of base rings m. The resulting curve will lie in a newly created plane.
BaseChange(C, A) : Sch,Sch -> Sch

BaseChange(C, A, m) : Sch,Sch,Map -> Sch

The base change of the curve C to a curve in the new ambient space A. The space A must be of the same type as the ambient of C and its base ring must either admit coercion from the base ring of C or have the map m between the two explicitly given.

BaseChange(C, n) : Sch, RngIntElt -> Sch

The base change of C, where the base ring of C is a finite field to the finite field which is a degree n extension of the base field of C.
}}}

I think Sage only has an analogue of the following magma function.

{{{

BaseChange(C, K) : Sch,Rng -> Sch

The base change of the curve C to the new base ring K. This is only possible if elements of the current base ring of C can be coerced automatically into K.
}}}

=== Some Basic Attributes of Schemes ===

Again Magma has the following functions which I couldn't find in Sage.

{{{

JacobianIdeal(C) : Sch -> RngMPol

The ideal of partial derivatives of the defining polynomials of the curve C.

JacobianMatrix(C) : Sch -> ModMatRngElt

The matrix of partial derivatives of the defining polynomials of the curve C.

HessianMatrix(C) : Sch -> Mtrx

The symmetric matrix of second partial derivatives of the defining polynomial of the plane curve C.
}}}

=== Generation of Random Curves ===
The following is implemented in Magma but not in Sage:
{{{
RandomNodalCurve(d, g, P) : RngIntElt, RngIntElt, Prj -> CrvPln

    RandomBound: RngIntElt              Default: 9
Generates a random plane curve in the projective plane P of degree d and genus g with only nodes as singularities. These nodes are chosen as a random set of points in P. The base field may be a finite field or Q.

RandomCurveByGenus(g, K) : RngIntElt, Fld -> Crv

    RandomBound: RngIntElt              Default: 9
Given a positive integer g and a field K this function generates a random projective curve over K of genus g. The field K must be a finite field or Q.

Adjoints(C,d) : Crv, RngIntElt -> LinearSys

Given a plane curve C, this gives the general degree d adjoint linear system.
}}}

=== Singularity Analysis ===

Magma treats this in a more explicit way than Sage does. For example, the following is in Magma.

{{{

HasSingularPointsOverExtension(C) : Sch -> BoolElt

Returns false if and only if the scheme of singularities of the curve C has support defined over the base field of C. This function requires that C be reduced.

These functions report an error if p is not a singular point of C. Again, the arguments can be abbreviated to just the point if care is taken about its parent. Currently, each of these functions apply only to plane curves.

Multiplicity(p) : Sch,Pt -> RngIntElt

Multiplicity(C,p) : Sch,Pt -> RngIntElt

The multiplicity of the plane curve C at the point p.
}}}

==== Resolution of Singularities ====


{{{

Blowup(C) : CrvPln -> CrvPln, CrvPln

Given the affine plane curve C, return the two affine plane curves lying on the standard patches of the blowup of the affine plane at the origin. Note that the two curves returned are the birational transforms of C on the blowup patches. The patches are contained in the same affine space as the curve itself. If C does not contain the origin this returns an error message.

Blowup(C,M) : CrvPln,Mtrx -> CrvPln, RngIntElt, RngIntElt

This returns the weighted blowup of the plane curve C at the origin defined by the 2 x 2 matrix of integers M. Again, the birational transform of C is returned inside the ambient plane of C. An error is reported if M does not have determinant +- 1.
}}}
=== Local Intersection Theory ===

The following "easy to implement" stuff should be in Sage.
{{{

IsIntersection(C,D,p) : Sch,Sch,Pt -> BoolElt

Returns true if and only if the point p lies on both curves C and D.

IntersectionNumber(C,D,p) : Sch,Sch,Pt -> RngIntElt

The local intersection number Ip(C, D) of the plane curves C and D at the point p. This reports an error if C or D have a common component at p.
}}}

=== Divisors ===

The Divisors package in Sage needs serious work to be at the level of Magma. [[http://magma.maths.usyd.edu.au/magma/htmlhelp/text1288.htm#13052|Here's]] what Magma offers.

Also it seems to me that Sage has completely ignored the subject of Linear Equivalence of Divisors, where as Magma [[http://magma.maths.usyd.edu.au/magma/htmlhelp/text1289.htm|hasn't]] :) .


=== Function Fields ===
Sage should have an elaborate Function Field package, but it doesn't. Click [[http://magma.maths.usyd.edu.au/magma/htmlhelp/text1287.htm|here]] to view Magma's treatment of this subject.



== Representation Theory ==

=== Group Algebra ===
Magma seems to offer two modes for storing group algebra elements. One for small groups, and an other optimized for large (finite?) groups. Sage only seems to implement one way (Not sure which as formal_sum.py has no comments or docstring).

Magma seems to accept Group Rings over any unital ring, not just commutative rings.

Sage seems to do more things for the group Algebra of the symmetric group. But, general group algebra implementation has nothing to do with the symmetric group algebra implementation, theses things should be given the same interface.


==== Construction of Subalgebras, Ideals and Quotient Algebras ====
Sage does nothing about subalgebras of a group algebra. Essentially this entire page http://magma.maths.usyd.edu.au/magma/htmlhelp/text1113.htm is missing. 

==== Operations on Group Algebras and their Subalgebras ====
Again here, Sage does absolutely nothing relating to the operations listed here http://magma.maths.usyd.edu.au/magma/htmlhelp/text1110.htm

==== Operations on Elements ====
http://magma.maths.usyd.edu.au/magma/htmlhelp/text1115.htm
Here are several small functions that Magma has, but Sage doesn't have.

These first few would be easy to implement. 
Some of theses are being implemented at [[http://trac.sagemath.org/sage_trac/ticket/6105|trac 6105]].

{{{
Support(a) : AlgGrpElt -> SeqEnum

The support of a; that is, the sequence of group elements whose coefficients in a are non-zero.
Trace(a) : AlgGrpElt -> RngElt

The trace of a; that is, the coefficient of 1G in a.
Augmentation(a) : AlgGrpElt -> RngElt

The augmentation of the group algebra element a; that is, ∑G rg where a = ∑G rg * g.
Involution(a) : AlgGrpElt -> AlgGrpElt

If a = ∑G rg * g, returns ∑G rg * g1.
Coefficient(a, g) : AlgGrpElt, GrpElt -> RngElt

a[g] : AlgGrpElt, GrpElt -> RngElt

The coefficient of g ∈G in a ∈R[G].


Coefficients(a) : AlgGrpElt -> SeqEnum

}}}

Theses would be much harder.
{{{
For an element a from a group algebra A given in vector representation, this returns the sequence of coefficients with respect to the fixed basis of A.
Centraliser(a) : AlgGrpElt -> AlgGrpSub

Centralizer(a) : AlgGrpElt -> AlgGrpSub

The centralizer in the group algebra A of the element a of A.
Centraliser(S, a) : AlgGrpSub, AlgGrpElt -> AlgGrpSub

Centralizer(S, a) : AlgGrpSub, AlgGrpElt -> AlgGrpSub

The centralizer of the element a (of a group algebra A) in the subalgebra S of A.
}}}


=== K[G]-Modules and group representations ===

Ok, this stuff is amazing in Magma, but not at all in Sage.
http://magma.maths.usyd.edu.au/magma/htmlhelp/text1117.htm#-6
I want this so badly, I'm ready to pay for Magma and eat instant noodles for a year.

Magma seems to give you a very natural way of manipulating modules; for example tensoring two modules. Which would be a great way of exploring their properties.

=== Representation of symmetric groups ===
Here it is hard to say what is in Sage.
For example this discussion 
http://groups.google.com/group/sage-support/browse_thread/thread/ce478c8ac55b5b88
says that characters of symmetric group can be computed by using functionality coming from sage-combinat. For the life of me, I can't find good documentation for sage-combinat. So, their should be wrappers for using this combinatorial stuff from SymmetricGroup, so that a student doesn't have to learn all the combinatorial lingo to do basic representation theory of the symmetric group.

http://magma.maths.usyd.edu.au/magma/htmlhelp/text1131.htm


=== Representations of Lie groups and algebras ===

Gap seems to do some of theses things, but Sage is lacking the warpers to make effective use of this.
So, I don't feel productive saying this, but Sage is again missing all the functionality that is listed here;
http://magma.maths.usyd.edu.au/magma/htmlhelp/text1139.htm



= Specialized Functionality in Magma also in Sage =

Here we list specialized things Magma does that Sage also does. For example, both Magma and Sage have extensive support for computing with modular symbols (far beyond all other math software).  



= Specialized Functionality in Sage not in Magma =

Here we list functionality in Sage that Magma doesn't have, but is functionality that is part of Magma's core goals, i.e., solving computationally hard problems in algebra, number theory, geometry and combinatorics.  Note that because Sage does calculus, graphics, statics and numerical computation, there are thousands of functions and features in Sage that are not in Magma and never will be in Magma, and this won't be mentioned here. 
