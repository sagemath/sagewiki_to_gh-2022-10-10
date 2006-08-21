This page describes some timing tests I did to compare the speed of polynomial multiplication over Z for MAGMA, NTL and PARI. The timings were performed on sage.math.washington.edu.

== Summary of results ==

(TBA)

== Raw output data ==

(TBA)

== The code ==

(TBA)

== Methodology ==

For each pair of degree and coefficient size, and for each system (MAGMA, PARI, NTL), I did the following:

1. Generate a random pair of polynomials and import it into the system.

2. Try multiplying once, see how long that takes. If that took less than half a second, try multiplying twice, see how long that takes. Keep doubling the number of trials until we find some N such that N trials take at least half a second.

3. Time N trials. Divide the answer by N to find out how long each trial took. Do this five times. Report the average of the five samples, and also report the difference between the maximum and minimum (just to make sure we're not being led totally astray by irregularities).
