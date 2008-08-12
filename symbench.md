See also [:SymbolicBenchmarks: this other page].

= The Symbolic Benchmark Suite =

The conditions for something to be listed here: (a) it must be resemble an ''actual'' computation somebody actually wanted to do in Sage, and (b) the question must be precisely formulated with Sage code that uses the Sage symbolics in a straightforward way (i.e., don't cleverly use number fields). 

== PROBLEM 1 == 

SETUP: Define a function $f(z) = \sqrt{1/3}\cdot z^2 + i/3$.  COMPUTATION: Compute the real part of $f(f(f(...(f(i/2))...)$ iterated $10$ times. 
{{{
def f(z): return sqrt(1/3)*z^2 + i/3
timeit('real(f(f(f(f(f(f(f(f(f(f(i/2)))))))))))')
}}}
