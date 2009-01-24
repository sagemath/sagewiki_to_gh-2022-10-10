= Sage 3.3 Release Tour =

Sage 3.3 was released on FIXME. For the official, comprehensive release notes, see [[http://www.sagemath.org/src/announce/sage-3.3.txt|sage-3.3.txt]]. In general terms, the following points are some of the foci of this release:

 * Clean up various doctest failures from 3.2.3
 * Fix some build issues from 3.2.3 on the new set of supported images
 * Merge small to medium sized patches ready to go in
 * Switch to [[http://www.mpir.org|eMPIRe]] as an implementation of multi-precision integers and rationals
 * Switch to [[http://ecls.sourceforge.net|ecl]] for a Common Lisp implementation
 * Update [[http://www.python.org|Python]] to 2.5.4
 * Update [[http://pari.math.u-bordeaux.fr|Pari]] to 2.3.4svn

Here's a summary of features in this release, categorized under various headings.

== Algebra ==

 * Transitivity for permutation groups (William Stein) -- In the permutation group module {{{permgroup.py}}}, the query function {{{is_transitive()}}} returns whether or not the group is transitive on {{{[1..G.degree()]}}}. A few surrounding docstrings are fixed and doctest coverage for the file {{{sage/groups/perm_gps/permgroup.py}}} is now 100%.

== Algebraic Geometry ==

 * Improved precision and performance when calculating analytic rank (William Stein) -- When calculating the analytic rank of an elliptic curve, the default is to use Cremona's {{{gp}}} script, where the precision is automatically doubled until it doesn't fail. The precision is started at 16 rather than the previous default precision. The computation is now about 3 times faster usually by starting off using this smaller precision.

== Basic Arithmetic ==

 * {{{ivalue}}} field in {{{integer_mod.pyx}}} is no longer public (Craig Citro) -- The {{{ivalue}}} field for {{{IntegerMod_int}}} is no longer public. This gives about a 1.5 to 2X speedup when multiplying {{{IntegerMod_ints}}}. 

 * Some fixes for {{{is_perfect_power}}} and {{{bessel_J(0,0)}}} (Craig Citro, Rob Bradshaw, Robert Miller) -- A temporary work around for an upstream bug in GMP when using {{{is_perfect_power()}}}. Resolved a Pari interface bug when using {{{bessel_J(0,0)}}}.

 * Improved performance for generic polynomial rings, and for univariate polynomial arithmetic over {{{Z/nZ[x]}}} (Yann Laigle-Chapuy, Martin Albrecht) -- Improved performance when performing modulo arithmetic between elements of a generic polynomial ring. Univariate polynomial arithmetic over {{{Z/nZ[x]}}} now has considerable speed-up at approximately 20x.

== Build ==

 * 64-bit OSX (Michael Abshoff) -- Fixed 64-bit OSX build support for f2c, added 64-bit OSX build support for tachyon, added 64-bit OSX build support for flintqs, and added persistent Sage 64-bit building switch on OSX and Solaris.

== Calculus ==

== Coding Theory ==

== Coercion ==

== Combinatorics ==

== Commutative Algebra ==

== Distribution ==

== Doctest ==

== Documentation ==

== Geometry ==

== Graph Theory ==

== Graphics ==

== Group Theory ==

== Interact ==

== Interfaces ==

== Linear Algebra ==

== Memory Leak ==

== Miscellaneous ==

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
