= Sage 3.2.3 Release Tour =

Sage 3.2.3 was released on FIXME. For the official, comprehensive release notes, see [[http://www.sagemath.org/src/announce/sage-3.2.3.txt|sage-3.2.3.txt]].

== Algebra ==

 * Powers of polynomial variables (Alex Ghitza) -- Report an error message when a determinate of a (multivariate) polynomial is raised to a fractional exponent. Previously, raising a polynomial determinate to a fractional power has the effect of rounding the exponent to an integer. As yet, fractional powers is not supported.

 * Extensions of finite fields (Alex Ghitza) -- Implements methods {{{random_element()}}} and {{{order()}}} for quotients of polynomial rings. The method {{{random_element()}}} returns the number of elements of a quotient ring, and {{{order()}}} returns a random element of a quotient ring.

 * Conjugates for integer, rational and real numbers (Alex Ghitza) -- Implements trivial {{{conjugate()}}} methods for elements over the integers, rationals, and reals. Conjugates work (trivially) for matrices over rings that embed canonically into the real numbers.

 * Square roots of Galois field elements (John Cremona, William Stein) -- Improve the square root of an element of a Galois field {{{GF(2^e)}}}, where {{{e > 15}}}. Previously, this works fine except for the square root of 1, where 1 is an element of {{{GF(2^e)}}} for {{{e > 15}}}.

== Build ==

== Coercion ==

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
