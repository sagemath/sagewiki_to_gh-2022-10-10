== Computing theta series for Congruent Number Problem ==

Implemented fast code to compute unary and binary theta series needed for the Congruent Number Problem. The aim is to multiply these two theta series together using a fast multiplication to get the weight 3/2 modular form --- instead of using a ternary theta series (which would be O(X^3/2^).)

In order to support computing X=10^12^ coefficients, this code allows computing theta series "by blocks", and I discovered that it's actually faster to compute by small blocks (a bit larger than O(sqrt(X))), for example:
 * 10^9^ takes 3.6 secs if computed in blocks of 10^5^ coefficients, and 15 secs if computed in blocks of 10^6^ coefficients, etc.
 * for 10^12^ it seems optimal to use blocks of 10^7^ coefficients -- estimated total time a bit under 6 hours (note that clearing 10^12^ words to 0 would take about 2 of the 6 hours).

The goal is to eventually extended this to handle general binary and ternary quadratic forms.

== Multiplying large polynomials ==

Worked with Bill Hart on huge polynomial multiplication using multimodular method (see his [:dev1/billhart: Status Report]). So far the code is twice as slow as FLINT, but uses less memory. For instance, I can multiply two polinomials of 1 million 960 bit coefficients each in 4 minutes in my laptop. FLINT would take an estimated 2 minutes, but I "only" have 2Gb of RAM in my laptop (I killed it after 10 minutes just before the OOM killer jumped in).

== Montgomery multiplication ==

The reconstruction step in the multimodular multiplication can be improved using (division free) Montgomery multiplication, so we've been working on adding support for this to FLINT (to be added in MPIR later).
