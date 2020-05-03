## page was renamed from sage-3.2.3
= Sage 3.2.3 Release Tour =

Sage 3.2.3 was released on January 5th, 2009. For the official, comprehensive release note, see [[http://www.sagemath.org/changelogs/sage-3.2.3.txt|sage-3.2.3.txt]]; see also [[https://trac.sagemath.org/query?milestone=sage-3.2.3|Trac tickets for milestone 3.2.3]]. The following points are some of the foci of this release: 

 * Fixed performance regression in {{{eisenstein_submodule.py}}} introduced in Sage 3.2.2.
 * Fixed readline build troubles on OpenSUSE 11.1.
 * Disabled DSage tests.
 * Merged some last minute non-invasive small tickets.

Here's a summary of features in this release, categorized under various headings.

== Algebra ==

 * Powers of polynomial variables (Alex Ghitza) -- Report an error message when a determinate of a (multivariate) polynomial is raised to a fractional exponent. Previously, raising a polynomial determinate to a fractional power has the effect of rounding the exponent to an integer. As yet, fractional powers are not supported.

 * Extensions of finite fields (Alex Ghitza) -- Implements methods {{{random_element()}}} and {{{order()}}} for quotients of polynomial rings. The method {{{order()}}} returns the number of elements of a quotient ring, and {{{random_element()}}} returns a random element of a quotient ring.

 * Conjugates for integer, rational and real numbers (Alex Ghitza) -- Implements trivial {{{conjugate()}}} methods for elements over the integers, rationals, and reals. Conjugates work (trivially) for matrices over rings that embed canonically into the real numbers.

 * Square roots of Galois field elements (John Cremona, William Stein) -- Improve the square root of an element of a Galois field {{{GF(2^e)}}}, where {{{e > 15}}}. Previously, this works fine except for the square root of 1, where 1 is an element of {{{GF(2^e)}}} for {{{e > 15}}}.

== Build ==

 * Upgrade ATLAS in Sage to version 3.8.2 (Michael Abshoff) -- An update of the ATLAS spkg to the upstream version 3.8.2. This upstream version now provides: (1) better detection of Pentium D and E; (2) detect more Core 2 Duo cores; and (3) properly detect Dunnington cores. Versions 3.8.x for x < 2 sometimes detect a modern CPU architecture as an older architecture, hence causing a massive blow up in the time it takes to compile ATLAS on systems like Xeon core 2 quad, Itanium 2, and Xeon E5420.

 * Update optional Sage package polymake (Michael Abshoff) -- The updated optional Sage package is polymake-2.2.p5. Earlier versions hard coded spkg versions of cddlib and gmp, and could cause polymake to break in Sage versions 3.0.3 and 3.0.4.

== Coercion ==

 * Fix performance regression in {{{eisenstein_submodule.py}}} (Robert Bradshaw) -- Performance regression in {{{eisenstein_submodule.py}}} was due to cyclotomic coercion. Previously, it would take about 73.3 seconds to run all doctests in {{{eisenstein_submodule.py}}}. Now, the performance is substantially increased such that all dotests in {{{eisenstein_submodule.py}}} should now take about 3.4 seconds.

== Doctest ==

 * Disable DSage doctests (Michael Abshoff) -- Doctesting DSage is disabled for now due to a number of problems in the doctests. This issue is expected to be revisited in the 3.4.x series, the earliest one probably is 3.4.alpha0. It will not be considered in Sage 3.3 since that release is mainly concerned with sphinxifying the Sage documentation.

 * Numerical noise in Sage 3.2.2 (Michael Abshoff) -- Compiling with GCC 4.3.2, the module {{{sage/rings/number_field/number_field_morphisms.pyx}}} exhibited numerical noise during doctesting.

 * {{{matrix1.pyx}}} reference related doctest crash (William Stein).

== Graphics ==

 * Some fixes to {{{matrix_plot()}}} and the plotting of {{{gamma(x)}}} (Mike Hansen, Robert Bradshaw).

 * Fix fallout in refactoring the plotting module (William Stein, Mike Hansen) -- Sage 3.2.1 refactored {{{plot.py}}} so that it was splitted up into multiple modules. However, the functions xmin/xmax/ymin/ymax were all removed without deprecating them. These are now added back exactly as before, since they are depended upon by a lot of plotting code.

== Linear Algebra ==

 * Upgrade ATLAS to version 3.8.2 (Michael Abshoff).

== Miscellaneous ==

 * Remove ancient files (Michael Abshoff) -- The following files are now removed from Sage

    1. sage/functions/elementary.py 
    1. sage/rings/interval.py
    1. sage/schemes/elliptic_curves/heegner.py

== Notebook ==

 * By default, the twisted package is no longer imported at startup (William Stein).

 * Support "application shortcut" in chrome and gears (Alexander Hupfer, Timothy Clemans).

== Packages ==

 * Upgrade FLINT to version 1.0.21 (Michael Abshoff).

 * Upgrade ECM to version 6.2.1 (Michael Abshoff).
