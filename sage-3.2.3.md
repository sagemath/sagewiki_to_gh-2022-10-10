= Sage 3.2.3 Release Tour =

Sage 3.2.3 was released on FIXME. For the official, comprehensive release notes, see [[http://www.sagemath.org/src/announce/sage-3.2.3.txt|sage-3.2.3.txt]].

== Algebra ==

 * Powers of polynomial variables (Alex Ghitza) -- Report an error message when a determinate of a (multivariate) polynomial is raised to a fractional exponent. Previously, raising a polynomial determinate to a fractional power has the effect of rounding the exponent to an integer. As yet, fractional powers is not supported.

 * Extensions of finite fields (Alex Ghitza) -- Implements methods {{{random_element()}}} and {{{order()}}} for quotients of polynomial rings. The method {{{random_element()}}} returns the number of elements of a quotient ring, and {{{order()}}} returns a random element of a quotient ring.

 * Conjugates for integer, rational and real numbers (Alex Ghitza) -- Implements trivial {{{conjugate()}}} methods for elements over the integers, rationals, and reals. Conjugates work (trivially) for matrices over rings that embed canonically into the real numbers.

 * Square roots of Galois field elements (John Cremona, William Stein) -- Improve the square root of an element of a Galois field {{{GF(2^e)}}}, where {{{e > 15}}}. Previously, this works fine except for the square root of 1, where 1 is an element of {{{GF(2^e)}}} for {{{e > 15}}}.

== Build ==

 * Upgrade ATLAS in Sage to version 3.8.2 (Michael Abshoff) -- An update of the ATLAS spkg to the upstream version 3.8.2. This upstream version now provides: (1) better detection of Pentium D and E; (2) detect more Core2Duos cores; and (3) properly detect Dunnington cores. Versions 3.8.x for x < 2 sometimes detect a modern CPU architecture as an older architecture, hence causing a massive blow up in the time it takes to compile ATLAS on systems like Xeon core 2 quad, Itanium 2, and Xeon E5420.

 * Update optional Sage package polymake (Michael Abshoff) -- The updated optional Sage package is polymake-2.2.p5. Earlier versions hard coded spkg versions of cddlib and gmp, and could cause polymake to break in Sage versions 3.0.3 and 3.0.4.

== Coercion ==

 * Fix performance regression in {{{eisenstein_submodule.py}}} (Robert Bradshaw) -- Performance regression in {{{eisenstein_submodule.py}}} was due to cyclotomic coercion. Previously, it would take about 73.3 seconds to run all doctests in {{{eisenstein_submodule.py}}}. Now, the performance is substantially increased such that all dotests in {{{eisenstein_submodule.py}}} should now take about 3.4 seconds.

== Commutative Algebra ==

== Doctest ==

== Documentation ==

== Graphics ==

== Interfaces ==

== Linear Algebra ==

== Miscellaneous ==

== Modular Forms ==

== Notebook ==

== Number Theory ==

== Optional Packages ==

== Packages ==

== Solaris ==
