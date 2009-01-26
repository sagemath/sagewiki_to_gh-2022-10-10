= Sage 3.3 Release Tour =

Sage 3.3 was released on FIXME. For the official, comprehensive release notes, see [[http://www.sagemath.org/src/announce/sage-3.3.txt|sage-3.3.txt]]. In general terms, the following points are some of the foci of this release:

 * Clean up various doctest failures from 3.2.3
 * Fix some build issues from 3.2.3 on the new set of supported images
 * Merge small to medium sized patches ready to go in
 * Switch to [[http://www.mpir.org|eMPIRe]] for multi-precision integers and rationals
 * Switch to [[http://ecls.sourceforge.net|ecl]] for a Common Lisp implementation
 * Update [[http://www.python.org|Python]] to 2.5.4
 * Update [[http://pari.math.u-bordeaux.fr|Pari]] to 2.3.4svn
 * Switch to [[http://www.flintlib.org|FLINT]] for univariate polynomial arithmetic over {{{Z/nZ}}}

Here's a summary of features in this release, categorized under various headings.

== Algebra ==

 * Transitivity for permutation groups (William Stein) -- In the permutation group module {{{permgroup.py}}}, the query function {{{is_transitive()}}} returns whether or not the group is transitive on {{{[1..G.degree()]}}}. A few surrounding docstrings are fixed and doctest coverage for the file {{{sage/groups/perm_gps/permgroup.py}}} is now 100%.

== Algebraic Geometry ==

 * Improved precision and performance when calculating analytic rank (William Stein) -- When calculating the analytic rank of an elliptic curve, the default is to use Cremona's {{{gp}}} script, where the precision is automatically doubled until it doesn't fail. The precision is started at 16 rather than the previous default precision. The computation is now about 3 times faster usually by starting off using this smaller precision.

== Basic Arithmetic ==

 * {{{ivalue}}} field in {{{integer_mod.pyx}}} is no longer public (Craig Citro) -- The {{{ivalue}}} field for {{{IntegerMod_int}}} is no longer public. This gives about a 1.5 to 2X speedup when multiplying {{{IntegerMod_ints}}}. 

 * Some fixes for {{{is_perfect_power}}} and {{{bessel_J(0,0)}}} (Craig Citro, Robert Bradshaw, Robert Miller) -- A temporary work around for an upstream bug in GMP when using {{{is_perfect_power()}}}. Resolved a Pari interface bug when using {{{bessel_J(0,0)}}}.

 * Improved performance for generic polynomial rings, and for univariate polynomial arithmetic over {{{Z/nZ[x]}}} (Yann Laigle-Chapuy, Martin Albrecht) -- Improved performance when performing modulo arithmetic between elements of a generic polynomial ring. Univariate polynomial arithmetic over {{{Z/nZ[x]}}} now has considerable speed-up at approximately 20x.

== Build ==

 * 64-bit OSX (Michael Abshoff) -- Fixed 64-bit OSX build support for f2c, added 64-bit OSX build support for tachyon, added 64-bit OSX build support for flintqs, and added persistent Sage 64-bit building switch on OSX and Solaris.

== Calculus ==

 * LaTeX output (Mike Hansen) -- Added LaTeX output for ceiling, floor, and derivative functions, and LaTaX'ing of powers of negative numbers.

 * Make {{{bernoulli_polynomial}}} independent of Maxima (Craig Citro) -- A rewrite of {{{bernoulli_polynomial}}} to avoid using Maxima completely in computing Bernoulli polynomials. This gives roughly a factor of 10 speedup.

== Coding Theory ==

 * Weight distribution for binary codes (Robert Miller) -- A weight distribution algorithm for binary codes using Robert Bradshaw's bitsets. This implementation in [[http://www.cython.org|Cython]] gives a 19 to 20 times performance speed-up over the previous GAP/Guava implementation.

== Coercion ==

 * Ring coercion for polynomials over finite fields (William Stein).

 * Move univariate polynomial rings to new coercion model (Robert Bradshaw).

== Combinatorics ==

== Commutative Algebra ==

 * Multivariate polynomials over residue fields of number fields (Nick Alexander) -- Fixed an infinite loop bug when working with multivariate polynomials over residue fields of number fields. Previously in hashing "large" characteristic residue fields, the hash method would try to hash an ideal of the residue field itself, which in turn would try to hash its parent, and so on ad infinitum. At no point has a residue field with cardinality a very large prime been created in Sage.

 * GCD of polynomials over finite fields (Martin Albrecht) -- Previously when using  ibsingular to compute the GCD of two (multivariate) polynomials over finite fields, Sage would segfault whenever the base rings are not identical.

 * Deprecate {{{Ideal.reduced_basis}}} (John Perry) -- The previous name {{{Ideal.reduced_basis}}} is misleading as it suggests that it can be used for computing the reduced Gröbner basis, when in fact it returns the interreduced basis. Thus {{{Ideal.reduced_basis()}}} is now deprecated and users are encouraged to use {{{Ideal.interreduced_basis()}}} instead.

== Distribution ==

 * GAP configuration file (Matthias Meulien) -- A user's local GAP configuration file is usually named {{{$HOME/.gaprc}}}. When such a file already exists and Sage is compiled from source, using the Sage interface to GAP, e.g. {{{gap._eval_line('1+3;')}}}, can result in gibberish. This is now fixed so that the GAP interface would output a comprehensible message/answer as a result of some GAP calculation.

== Documentation ==

== Geometry ==

 * Polyhedral improvements (Marshall Hampton) -- Added more built-in Archimedean solids and some new methods such as the Gale transform, bipyramid construction, edge truncation, and perspective projection with (optionally) hidden faces invisible. The Schlegel projection code has also been somewhat refactored to make it more general in the future.

== Graph Theory ==

 * Equality testing in graphs (Robert Miller) -- The "weighted" property or edge label is taken into account when testing for equality in graphs.

== Graphics ==

 * Plotting a region (Arnaud Bergeron) -- Plot a region where a system of equations/inequalities were true.

 * Consistency in variable range (Mike Hansen, Jason Grout) -- The variable range of {{{parametric_plot}}} is now consistent with that of {{{plot}}}, namely {{{(var, min, max)}}}.

 * Polar plot syntax (Jason Grout) -- Polar plot now accepts the syntax {{{(t, 0, 2*pi)}}} for the interval.

 * Added a {{{density_plot()}}} function and improve colour map handling (Arnaud Bergeron) -- The {{{density_plot}}} takes a function of two variables and plots contour lines of the function over two specified ranges. Some improve on how colour map is handled.

== Group Theory ==

 * Added an {{{is_cyclic}}} method (David Joyner) -- The {{{is_cyclic}}} method for (finite) groups is currently not as optimized as it should be. Given a finite abelian group, one can test to see whether or not it is cyclic, a test that depends on calculating the elementary divisors of the group. As correctness is the main concern in the current implementation of {{{elementary_divisors()}}}, performance is not taken into account. However, the docstring for {{{elementary_divisors()}}} describes an algorithm communicated by Robert Miller for speeding up this method.

== Interfaces ==

 * Magma interface (William Stein) -- Fixed a problem in Sage's interface to Magma so that now the Magma {{{.sig}}} files in {{{extcode}}} are no longer written there by Magma itself. The current behaviour is that the first (and only first) time a Magma interface is started in a given session, files in {{{data/extcode/magma}}} are copied to a temporary directory.

 * GAP interface (Mike Hansen) -- Ensured that the GAP interface handles keyboard interrupt gracefully, that GAP output would be printed, and that multi-line input and comments are handled as expected.

 * Sage preparser (Robert Bradshaw) -- Some simplification of the Sage preparser, together with improved handling of literal numbers.

== Linear Algebra ==

 * Multiplication of sparse matrices over finite fields (William Stein, Craig Citro) -- Significant performance improvement when multiplying two sparse matrices over the same finite field. In some cases, performance is about 37 times faster than previously.

 * Minimum polynomials for {{{GF(p)}}} (Alex Ghitza).

 * Matrix exponential for general matrices (Jason Grout) -- Added a generic matrix exponential that depends on Maxima's matrix exponentiation function. If the matrix has floating point numbers, these will be rounded automatically to rational numbers during the computation. For numerical approximations to the exponential, one can first convert the matrix to RDF or CDF.

 * 100% doctest coverage for {{{matrix/constructor.py}}}, {{{matrix/misc.pyx}}}, {{{matrix/matrix_generic_dense.pyx}}} (William Stein) -- Apart from the full doctest coverage, calculating the lift of a matrix is now 20 times faster than previously.

 * Improved performance for method {{{density()}}} in {{{matrix/matrix_modn_sparse.pyx}}} (Craig Citro).

 * Added a kernel method for sparse integer matrices (John Palmieri).

== Miscellaneous ==

 * Rewrite of the function {{{__getitem__}}} (Jason Grout, Craig Citro) -- A rewrite of the function {{{__getitem__}}} in {{{matrix/matrix0.pyx}}} to better support slices, negative indices, and improved performance.

 * Function {{{get_memory_usage()}}} now return a float on all platforms (William Stein).

 * The function {{{CremonaDatabase().number_of_curves()}}} now works even when the optional Cremona database isn't installed (Alex Ghitza).

== Modular Forms ==

== Notebook ==

== Number Theory ==

== Numerical ==

== Optional Packages ==

== Packages ==

== Porting ==

== Solaris ==

== User Interface ==

== Website/Wiki ==
