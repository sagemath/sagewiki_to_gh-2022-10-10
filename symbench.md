See also [[WesterBenchmarks| this other page]], which lists some of Wester's benchmarks.

See also [[https://github.com/sympy/sympy/wiki/Sage-Symbench|SymPy's benchmarks]], that do the same as below, but in [[http://www.sympy.org|SymPy]].

See also [[http://www.axiom-developer.org/axiom-website/CATS/index.html|an ODE test suite]].

<<TableOfContents>>

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

The new Ginac-based symbolics do not have a working real part for I yet, but they take about 0.05 seconds for this benchmark:
{{{
reset()
x = var('x',ns=1); S = x.parent()
i = S(NumberField(polygen(QQ)^2+1, 'i').gen())
def f(z): 
    return S(1/3).sqrt()*z^2 + i/3
# computation
time s = f(f(f(f(f(f(f(f(f(f(i/2))))))))))
///
Time: CPU 0.05 s, Wall: 0.05 s
}}}

Sympy-0.6.2 does very good on this benchmark:
{{{
from sympy import *
def f(z): return sqrt(1/3)*z**2 + I/3
time e = f(f(f(f(f(f(f(f(f(f(I/2)))))))))).as_real_imag()[int(0)]
///
Time: CPU 0.01 s, Wall: 0.01 s
}}}




== Problem R2 ==
Compute and evaluate a Hermite polynomial using the recurrence that defines it.
(Note -- changed because original problem didn't actually involve anything nontrivial that was symbolic.)

{{{
def hermite(n,y):
  if n == 1: return 2*y
  if n == 0: return 1
  return expand(2*y*hermite(n-1,y) - 2*(n-1)*hermite(n-2,y))

time hermite(15,var('y'))
///
32768*y^15 - 1720320*y^13 + 33546240*y^11 - 307507200*y^9 +
1383782400*y^7 - 2905943040*y^5 + 2421619200*y^3 - 518918400*y
Time: CPU 12.65 s, Wall: 44.34 s
}}}

Using the new ginac-based Symbolics in Sage is 183 times faster:
{{{
def hermite(n,y):
  if n == 1: return 2*y
  if n == 0: return 1
  return expand(2*y*hermite(n-1,y) - 2*(n-1)*hermite(n-2,y))

time hermite(15,var('y',ns=1))
///
32768*y^15 - 1720320*y^13 + 33546240*y^11 - 307507200*y^9 +
1383782400*y^7 - 2905943040*y^5 + 2421619200*y^3 - 518918400*y
Time: CPU 0.24 s, Wall: 0.25 s
}}}

For reference (and it doesn't count for our purposes), FLINT can do this problem in 0.04 seconds, or 1100 times faster than Sage's default symbolics:
{{{
time hermite(15, polygen(ZZ))
///
32768*x^15 - 1720320*x^13 + 33546240*x^11 - 307507200*x^9 +
1383782400*x^7 - 2905943040*x^5 + 2421619200*x^3 - 518918400*x
Time: CPU 0.04 s, Wall: 0.04 s
}}}

Sympy is good at this benchmark, better than the above Ginac-Sage timing:
{{{
from sympy import *
def hermite(n,y):
  if n == 1: return 2*y
  if n == 0: return 1
  return expand(2*y*hermite(n-1,y) - 2*(n-1)*hermite(n-2,y))

time hermite(15,var('y'))
///
-518918400*y + 2421619200*y**3 - 2905943040*y**5 + 1383782400*y**7 -
307507200*y**9 + 33546240*y**11 - 1720320*y**13 + 32768*y**15
Time: CPU 0.15 s, Wall: 0.16 s
}}}


== Problem R3 ==
{{{
var('x,y,z')
f = x+y+z
time a = [bool(f==f) for _ in range(10)]
//
CPU time: 0.09 s,  Wall time: 0.52 s
}}}

== Problem R4 ==
{{{
u = [e, pi, sqrt(2)]
time Tuples(u,3).cardinality()
//
27
Time: CPU 0.23 s, Wall: 1.55 s
}}}
For comparison, see what happens with integers.
{{{
u = [1,2,3]
time Tuples(u,3).count()
27
Time: CPU 0.00 s, Wall: 0.00 s
}}}

== Problem R5 ==
{{{
def blowup(L,n):
    for i in [0..n]:
        L.append( (L[i] + L[i+1]) * L[i+2] )
}}}

{{{
(x,y,z)=var('x,y,z')
L = [x,y,z]
blowup(L,8)
time L=uniq(L)
//
Time: CPU 0.17 s, Wall: 0.68 s
}}}

{{{
R.<x,y,z> = QQ[]
L = [x,y,z]
blowup(L,8)
time L=uniq(L)
//
Time: CPU 0.08 s, Wall: 0.08 s
}}}

== Problem R6 ==

{{{
time sum(((x+sin(i))/x+(x-sin(i))/x).rational_simplify() for i in range(100))
///
200
CPU time: 1.39 s,  Wall time: 8.65 s
}}}

== Problem R7 ==
{{{
var('x')
f = x^24+34*x^12+45*x^3+9*x^18 +34*x^10+ 32*x^21
time a = [f(random()) for _ in range(10^4)]
///
Time: CPU 11.92 s, Wall: 12.73 s
}}}


== Problem R8 ==
{{{
def right(f, a, b, n):
   Deltax = (b - a) / n
   c = a
   est = 0
   for i in range(n):
       c += Deltax
       est += f(c)
   return est * Deltax

var('x')
time right(x^2,0,5,10^4)
///
Time: CPU 1.53 s, Wall: 1.57 s
66676667/1600000
}}}

== Problem R9 ==
{{{
var('x,y')
time factor(x^20 - pi^5*y^20)
///
-(pi*y^4 - x^4)*(pi^4*y^16 + pi^3*x^4*y^12 + pi^2*x^8*y^8 + pi*x^12*y^4 + x^16)
Time: CPU 0.02 s, Wall: 7.43 s
}}}

Note that singular takes .05 seconds to do $x^{20} - w^5 y^{20}$, and one could use
that.

== Problem R10 ==

Create a list of the equally spaced symbolic values between $-\pi$ and $\pi$.  This is incredibly slow in Sage right now.  The wall time below is what matters:
{{{
sage: time v = [-pi,-pi+1/10..,pi]
///
CPU times: user 0.44 s, sys: 0.12 s, total: 0.56 s
Wall time: 5.58 s
}}}

[[/r10| Notes]]

== Problem R11 ==

This came up when a user was computed zeros of the derivative of the Riemann zeta function.  They fortunately didn't conclude that Sage is completely useless.
{{{
sage: a = [random() + random()*I for w in [0..1000]]
///
sage: time a.sort()
CPU time: 9.83 s,  Wall time: 28.08 s
}}}


= Sage Gets the Answer All Wrong or Just Can't Do It =

Examples where Sage is just blatantly wrong (often because of Maxima).


== Problem W1 ==

{{{
var('a b c')
eqn1 = a - exp((-pi*b)/sqrt(1-b)) == 0
eqn2 = c - atan(2*b*sqrt(1/(sqrt(4*b^4+1) - 2*b^2)))==0
solve([eqn1,eqn2,a==1/8],b,c,a)
///
[]
}}}
This is because of a bug in Maxima.


== Problem W2 ==
This is related R10.  It's quick, but the output is WRONG, since if you replace pi by $2^{1/3}$ above you will get a
{{{
var('x,y')
time factor(x^20 - (2^(1/3))^5*y^20)
///
-(2*2^(2/3)*y^20 - x^20)
Time: CPU 0.02 s, Wall: 0.12 s
}}}

Observe that
{{{
w = (2^(1/3))
expand(-(w*y^4 - x^4)*(w^4*y^16 + w^3*x^4*y^12 + w^2*x^8*y^8 + w*x^12*y^4 + x^16))
///
x^20 - 2*2^(2/3)*y^20
}}}


This is because of a bug in Maxima.

== Problem W3 ==
The first example of simplifying in the ginac manual (on page 10) remarks that Ginac isn't so stupid as to simplify $\cos(\arccos(x))$ to $x$.  Well Sage is stupid does (unlike Mathematica).  This is bad, since then $42\pi = 0$.

{{{
sage: acos(cos(x))
x
sage: cos(acos(x))
x
sage: mathematica.eval('Cos[ArcCos[x]]')
        x
sage: mathematica.eval('ArcCos[Cos[x]]')
        ArcCos[Cos[x]]
}}}

This is because of a bug in Maxima.

== Problem W4 ==

{{{
sage: var("C_1_0 C_2_0 C_3_0 C_4_0 C_4_1 C_4_2 C_4_3 C_4_4 D_1_0 D_2_0 D_3_0
D_3_1 D_3_2 D_3_3 D_3_4 D_3_5 D_3_6 D_3_7 gamma z")

sage: p = C_1_0*C_2_0^2*C_3_0^3*(z^4*C_4_4 + z^3*C_4_3 + z^2*C_4_2 + z*C_4_1
+ C_4_0 + z^5)^4*gamma^4 - D_1_0*D_2_0^2*(z^7*D_3_7 + z^6*D_3_6 +
z^5*D_3_5 + z^4*D_3_4 + z^3*D_3_3 + z^2*D_3_2 + z*D_3_1 + D_3_0 +
z^8)^3

# explodes:
print p.coefficients(z)

TypeError: Error executing code in Maxima
Maxima encountered a Lisp error:
}}}

== Problem W5 ==

{{{
sage: var('r, kappa');
sage: psi = function('psi',r);
sage: g = (1/r^2*(2*r*diff(psi,r) + r^2*diff(psi,r,2)); g
(r^2*diff(psi(r), r, 2) + 2*r*diff(psi(r), r, 1))/r^2
}}}
The problem is to automatically extract the coefficient of the second derivative of psi(r).

= The Synthetic Symbolic Benchmark Suite =

Here is where synthetic benchmarks go.  These are made up because you abstract think they are good benchmarks.  They don't have to come up in real world problems.

== Problem S1 ==
We use only 7, since Sage's current symbolics are SO slow at this.  We should use 20 to do the Fateman benchmark.
{{{
sage: var('x,y,z')
sage: f = (x+y+z+1)^7
sage: time g = expand(f*(f+1))
///
CPU time: 0.14 s,  Wall time: 2.76 s
}}}

== Problem S2 ==
Compute an expansion of an expression involving funny powers and trig functions.
{{{
sage: time a = expand((x^sin(x) + y^cos(y) - z^(x+y))^100)   # sage-3.1.1
CPU times: user 7.93 s, sys: 0.22 s, total: 8.14 s
Wall time: 20.67 s        # <----------- wall time is what matters for this!
}}}
Mathematica is much faster:
{{{
sage: mathematica.eval('Timing[a = Expand[(x^Sin[x] +y^Cos[y] - z^(x+y))^100];]')
         {0.180212, Null}
}}}
The new Pynac based Sage is even faster than Mathematica at this:
{{{
sage: time a = expand((x^sin(x) + y^cos(y) - z^(x+y))^100)
CPU times: user 0.15 s, sys: 0.00 s, total: 0.15 s
Wall time: 0.16 s
}}}

Sympycore is pretty good:
{{{
sage: x = sympycore.Symbol('x'); y = sympycore.Symbol('y'); z = sympycore.Symbol('z')
sage: time a = expand((x^sympycore.sin(x) + y^sympycore.cos(y) - z^(x+y))^100r)
CPU times: user 0.33 s, sys: 0.02 s, total: 0.35 s
}}}

Sympy in the current Sage doesn't do well:
{{{
sage: x = sympy.var('x'); y = sympy.var('y'); z = sympy.var('z')
sage: time a = expand((x^sympy.sin(x) + y^sympy.cos(y) - z^(x+y))^100r)
CPU times: user 14.64 s, sys: 0.23 s, total: 14.86 s
}}}

SymPy after merging the ticket [[http://trac.sagemath.org/sage_trac/ticket/3707|#3707]] is 10x faster than before:
{{{
sage: import sympy
sage: x = sympy.var('x'); y = sympy.var('y'); z = sympy.var('z')
sage: time a = expand((x^sympy.sin(x) + y^sympy.cos(y) - z^(x+y))^100r)

CPU times: user 1.48 s, sys: 0.05 s, total: 1.53 s
Wall time: 1.55 s
}}}

== Problem S3 ==
Compute the derivative with respect to z of the ''expanded form'' of $(x^y + y^z + z^x)^{50}$.

SUMMARY: Maple is the fastest, mathemaica and Sage/Ginac are very close, and Sage-3.1.1 sucks:

   Maple < Mathematica < Sage/Ginac < Sympcore < Sympy < Maxima < Sage now = Infinity

Note that none of the programs secretly remember the unexpanded form, since when I benchmark
differentiating that, it is instant.

In Sage's maxima/python symbolics this just goes BOOM:
{{{
sage: time f = expand((x^y + y^z + z^x)^50)
CPU times: user 0.73 s, sys: 0.02 s, total: 0.75 s
Wall time: 2.42 s
sage: time g = f.diff(x)
---------------------------------------------------------------------------
RuntimeError                              Traceback (most recent call last)

/Users/was/s/local/lib/python2.5/site-packages/sage/calculus/calculus.py in variables(self)
   4416         except AttributeError:
   4417             pass
-> 4418         vars = list(set(sum([list(op.variables()) for op in self._operands], [])))
   4419
   4420         vars.sort(var_cmp)
RuntimeError: maximum recursion depth exceeded
}}}

In Sage's new Ginac-based symbolics (on August 24) it takes 0.09 seconds:
{{{
sage: var('x,y,z', ns=1)
(x, y, z)
sage: time f = expand((x^y + y^z + z^x)^50)
CPU times: user 0.03 s, sys: 0.00 s, total: 0.03 s
sage: time g = f.diff(x)
CPU times: user 0.08 s, sys: 0.01 s, total: 0.09 s
Wall time: 0.09 s

# We can even do an exponent of 500 in a reasonable amount of time:
sage: time f = expand((x^y + y^z + z^x)^500)
CPU times: user 3.53 s, sys: 0.08 s, total: 3.61 s
Wall time: 3.67 s
sage: time g = f.diff(x)
CPU times: user 8.84 s, sys: 0.50 s, total: 9.34 s
Wall time: 9.52 s

sage: time g = expand((x^y + y^z + z^x)^1000)
CPU times: user 23.34 s, sys: 0.54 s, total: 23.88 s
Wall time: 27.33 s
sage: time h = g.diff(x)
CPU times: user 35.92 s, sys: 2.19 s, total: 38.11 s
Wall time: 40.13 s
}}}

Directly in Sage's (clisp-based) Maxima it takes 52.93 seconds. This has
nothing to do with pexpect or transmitting data -- this is all raw compute time
in the core of maxima, which is evidently 588 times slower than Sage's Ginac.
{{{
sage: g = maxima('expand((x^y + y^z + z^x)^50)')
sage: time h = g.diff(z)
CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
Wall time: 52.93 s
}}}

In sympy-0.6.2 it takes 1.35 seconds:
{{{
sage: from sympy import *
sage: x,y,z = var('x,y,z')
sage: g = expand((x^y + y^z + z^x)^50)
sage: time h = g.diff(x)
CPU times: user 1.33 s, sys: 0.02 s, total: 1.35 s
Wall time: 1.38 s

# Redoing it is faster do to caching.
sage: time h = g.diff(x)
CPU times: user 0.74 s, sys: 0.00 s, total: 0.75 s
Wall time: 0.76 s

# Start from scratch and do 500

}}}

Sympcore does reasonably well at this synthetic benchmark, though sage/ginac and Mathematica still beat it.
{{{
sage: import sympycore
sage: x = sympycore.Symbol("x"); y = sympycore.Symbol("y"); z = sympycore.Symbol("z")
sage: time g = ((x^y + y^z + z^x)^int(50)).expand()
CPU times: user 0.07 s, sys: 0.00 s, total: 0.08 s
Wall time: 0.08 s
sage: time h = g.diff(x)
CPU times: user 0.18 s, sys: 0.01 s, total: 0.19 s
Wall time: 0.20 s

# Pushing harder:
sage: time g = ((x^y + y^z + z^x)^int(500)).expand()
CPU times: user 12.19 s, sys: 0.39 s, total: 12.58 s
Wall time: 12.91 s
sage: time h = g.diff(x)
CPU times: user 42.43 s, sys: 0.77 s, total: 43.20 s
Wall time: 44.51 s
}}}

Mathematica is very good at this, of course:
{{{
sage: g = mathematica('Expand[(x^y + y^z + z^x)^50]')
sage: time mathematica.eval('Timing[w = D[%s, x];]'%g.name())
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.00 s
         {0.00207, Null}
}}}

We try the harder challenge with exponent 500 and compare to what ginac-sage gets.  Mathematica takes about 6.5
seconds and Ginac-Sage takes 9.3 seconds.
{{{
sage: g = mathematica('Expand[(x^y + y^z + z^x)^500]')
sage: time g = mathematica('Expand[(x^y + y^z + z^x)^500]')
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 4.07 s
sage: time mathematica.eval('Timing[w = D[%s, x];]'%g.name())
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 6.56 s
         {6.41675, Null}
}}}

Maple is asymptotically the fastest at this benchmark:
{{{
sage: g = maple('expand((x^y + y^z + z^x)^50)')
sage: t=maple.cputime(); k = g.diff(x); maple.cputime(t)
0.012
sage: g = maple('expand((x^y + y^z + z^x)^500)')
sage: t=maple.cputime(); k = g.diff(x); maple.cputime(t)
1.4990000000000001
}}}

== Problem S4 ==
Compute the first 1000 terms of the Taylor series about 0 of $\sin(x) \cos(x)$.

Sage right now takes about 107 seconds:
{{{
x = var('x')
time w = (sin(x)*cos(x)).taylor(x,0,1000)
///
CPU time: 76.48 s,  Wall time: 107.20 s
}}}

The Sage-Ginac (Aug 24) takes 11 seconds:
{{{
var('x,y',ns=1)
time w = (sin(x)*cos(x)).series(x,1000)
///
Time: CPU 11.01 s, Wall: 11.91 s
}}}

Straight Maxima takes about 29 seconds, which illustrates
that there is some major overhead to using the pexpect interface
in this particular case:
{{{
sage: m = maxima(sin(x)*cos(x))
sage: time w =m.taylor(x,0,1000)
CPU time: 0.01 s,  Wall time: 29.05 s
}}}

Sympy-0.6.2 takes an unbelievably long long long time (and tons of RAM):
{{{
from sympy import *
f = sin(x)*cos(x)
time g = f.series(x, 0, 1000)
///  	
CPU time: 1202.11 s,  Wall time: 1218.15 s
}}}

Mathematica takes 6.1 seconds:
{{{
%mathematica
Timing[Series[Sin[x]*Cos[x], {x,0, 1000}];]
///
{6.11751, Null}
}}}


Maple takes 7.5 seconds:
{{{
%maple
t := time():
series(sin(x)*cos(x), x=0,1000):
time() - t
///
7.504
}}}
