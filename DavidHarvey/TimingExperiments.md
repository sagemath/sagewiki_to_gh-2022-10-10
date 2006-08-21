This page describes some timing tests I did to compare the speed of polynomial multiplication over Z for MAGMA, NTL and PARI. The timings were performed on sage.math.washington.edu.

== Summary of results ==

(TBA)

== Raw output data ==

 * attachment:output.txt

This is the file produced by poly_multiply_benchmark.sage.

The fields in each line are:

 * the polynomial degree
 * the number of bits in each coefficient (e.g. if it's 8 then the coefficients are between -256 and 256)
 * which system is being tested
 * the average time over the five samples (see "methodology" below)
 * the difference between the maximum time and the minimum time of the five samples
 * the number of trial multiplications used in each sample

== The code ==

 * attachment:poly_multiply_benchmark.sage (runs the timing tests)
 * attachment:make_graphs.sage (generates the pretty graphs)

== Methodology ==

For each pair of degree and coefficient size, and for each system (MAGMA, PARI, NTL), I did the following:

 * Generate a random pair of polynomials and import it into the system.

 * Try multiplying once, see how long that takes. If that took less than half a second, try multiplying twice, see how long that takes. Keep doubling the number of trials until we find some N such that N trials take at least half a second.

 * Time N trials. Divide the answer by N to find out how long each trial took. Do this five times. Report the average of the five samples, and also report the difference between the maximum and minimum (just to make sure we're not being led totally astray by irregularities).

=== Problems with the methodology ===

 * For the very fast operations (e.g. when the degree is very small), it's not clear how much overhead is being incurred by the python interpreter. So I'm not sure how much of the time is really being spent on the multiplication.
