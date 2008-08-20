See also [:WesterBenchmarks: this other page], which lists some of Wester's benchmarks.

See also [http://wiki.sympy.org/wiki/Symbench SymPy's benchmarks], that do the same as below, but in SymPy.

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
Compute and evaluate a Hermite polynomial using the recurrence that defines it.

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
var('x,y,z')
f = x+y+z
time a = [bool(f==f) for _ in range(10)]
//
CPU time: 0.09 s,  Wall time: 0.52 s
}}}

== Problem R4 ==
{{{
u = [e, pi, sqrt(2)]
time Tuples(u,3).count()
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
time sum(((x+sin(i))/x+(x-sin(i))/x).rational_simplify() for i in xrange(100))
///
200
CPU time: 1.39 s,  Wall time: 8.65 s
}}}

== Problem R7 ==
{{{
var('x')
f = x^24+34*x^12+45*x^3+9*x^18 +34*x^10+ 32*x^21
time a = [f(random()) for _ in xrange(10^4)]
///
Time: CPU 11.92 s, Wall: 12.73 s
}}}


== Problem R8 ==
{{{
def right(f,a,b,n):
   Deltax = (b-a)/n; c=a; est=0
   for i in range(n):
       c += Deltax
       est += f(c)
   return est*Deltax

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

[:/r10: Notes]

== Problem R11 ==

This came up when a user was computed zeros of the derivative of the Riemann zeta function.  They fortunately didn't conclude that Sage is completely useless.
{{{
sage: a = [random() + random()*I for w in [0..1000]]
///
sage: time a.sort()
CPU time: 9.83 s,  Wall time: 28.08 s
}}}


= Sage Gets the Answer All Wrong =

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
WRONG and LAME!  This is because of a bug in Maxima.


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
