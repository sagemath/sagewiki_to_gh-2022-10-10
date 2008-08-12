See also [:SymbolicBenchmarks: this other page].

[[TableOfContents]]

= The "Real World" Symbolic Benchmark Suite =

The conditions for something to be listed here: (a) it must be resemble an ''actual'' computation somebody actually wanted to do in Sage, and (b) the question must be precisely formulated with Sage code that uses the Sage symbolics in a straightforward way (i.e., don't cleverly use number fields).   Do ''not'' post any "synthetic" benchmarks.  This page is supposed to be about nailing down exactly why people consider the sage symbolics at present "so slow as to be completely useless for anything but fast float". 

Just to emphasize, some of these seem silly but they all come up when REAL USERS use Sage.  For synthetic benchmarks, see the second section below.

== Problem R1 ==

SETUP: Define a function $f(z) = \sqrt{1/3}\cdot z^2 + i/3$.  COMPUTATION: Compute the real part of $f(f(f(...(f(i/2))...)$ iterated $10$ times. 
{{{
# setup
def f(z): return sqrt(1/3)*z^2 + i/3
# computation
real(f(f(f(f(f(f(f(f(f(f(i/2)))))))))))
//
-15323490199844318074242473679071410934833494247466385771803570370858961112774390851798166656796902695599442662754502211584226105508648298600018090510170430216881977761279503642801008178271982531042720727178135881702924595044672634313417239327304576652633321095875724771887486594852083526001648217317718794685379391946143663292907934545842931411982264788766619812559999515408813796287448784343854980686798782575952258163992236113752353237705088451481168691158059505161807961082162315225057299394348203539002582692884735745377391416638540520323363224931163680324690025802009761307137504963304640835891588925883135078996398616361571065941964628043214890356454145039464055430143/(160959987592246947739944859375773744043416001841910423046466880402863187009126824419781711398533250016237703449459397319370100476216445123130147322940019839927628599479294678599689928643570237983736966305423831947366332466878486992676823215303312139985015592974537721140932243906832125049776934072927576666849331956351862828567668505777388133331284248870175178634054430823171923639987569211668426477739974572402853248951261366399284257908177157179099041115431335587887276292978004143353025122721401971549897673882099546646236790739903146970578001092018346524464799146331225822142880459202800229013082033028722077703362360159827236163041299500992177627657014103138377287073792*sqrt(3))
Time: CPU 0.11 s, Wall: 0.34 s
}}}


== Problem R2 ==

{{{
def hermite(n,y):
  if n == 1:
      return 2*y
  if n == 0:
      return 1
  return 2*y*hermite(n-1,y) - 2*(n-1)*hermite(n-2,y)

def phi(n,y):
  return 1/(sqrt(2^n*factorial(n))*pi^(1/4))*exp(-y^2/2)*hermite(n,y)

time a = phi(25,4)
//
Time: CPU 0.59 s, Wall: 0.60 s
}}}

== Problem R3 ==
{{{
sage: var('x,y,z')
sage: f = x+y+z
sage: time for _ in range(10): a = bool(f==f)
//
CPU time: 0.09 s,  Wall time: 0.52 s
}}}

== Problem R4 ==
{{{
sage: u=[e,pi,sqrt(2)]
sage: time Tuples(u,3).count()
//
27
Time: CPU 0.23 s, Wall: 1.55 s
}}}
For comparison, see what happens with integers.
{{{
sage: u=[1,2,3]
sage: time Tuples(u,3).count()
27
Time: CPU 0.00 s, Wall: 0.00 s
}}}

= The Synthetic Symbolic Benchmark Suite =

Here is where synthetic benchmarks go.  These are made up because you abstract think they are good benchmarks.  They don't have to come up in real world problems.

== Problem S1 ==
{{{


}}}
