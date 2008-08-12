See also [:SymbolicBenchmarks: this other page].

= The Symbolic Benchmark Suite =

The conditions for something to be listed here: (a) it must be resemble an ''actual'' computation somebody actually wanted to do in Sage, and (b) the question must be precisely formulated with Sage code that uses the Sage symbolics in a straightforward way (i.e., don't cleverly use number fields).   Do ''not'' post any synthetic benchmarks, i.e., completely made up ones like Fateman's $(x+y+z+1)^20$ benchmark.  This page is supposed to be about nailing down exactly why people consider the sage symbolics at present "so slow as to be completely useless for anything but fast float". 

== Problem 1 ==

SETUP: Define a function $f(z) = \sqrt{1/3}\cdot z^2 + i/3$.  COMPUTATION: Compute the real part of $f(f(f(...(f(i/2))...)$ iterated $10$ times. 
{{{
# setup
def f(z): return sqrt(1/3)*z^2 + i/3
# computation
real(f(f(f(f(f(f(f(f(f(f(i/2)))))))))))
//
-15323490199844318074242473679071410934833494247466385771803570370858961112774390851798166656796902695599442662754502211584226105508648298600018090510170430216881977761279503642801008178271982531042720727178135881702924595044672634313417239327304576652633321095875724771887486594852083526001648217317718794685379391946143663292907934545842931411982264788766619812559999515408813796287448784343854980686798782575952258163992236113752353237705088451481168691158059505161807961082162315225057299394348203539002582692884735745377391416638540520323363224931163680324690025802009761307137504963304640835891588925883135078996398616361571065941964628043214890356454145039464055430143
}}}


== Problem 2 ==
