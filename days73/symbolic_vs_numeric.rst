============================
Symbolic vs numerics in Sage
============================

------------------
Parent and element
------------------

When using Sage, it is important to understand where your objects live. Or more
mathematically in which structure they belong to. The number `1` as an integer
will behave differently as the number `1` as a rational number...

In Sage this *ambient space* is called parent::

    sage: a = 4
    sage: parent(a)

    sage: a = 2/3
    sage: parent(a)

    sage: a = 2.5
    sage: parent(a)

    sage: a = pi
    sage: parent(pi)

The parent determines the behavior of many operations::

    sage: x = SR.var('x')
    sage: p = 12*x^2 + 12*x + 24
    sage: print parent(p)
    sage: print p.factor()

    sage: x = polygen(ZZ)
    sage: p = 12*x^2 + 12*x + 24
    sage: print parent(p)
    sage: print p.factor()

    sage: x = polygen(QQ)
    sage: p = 12*x^2 + 12*x + 24
    sage: print parent(p)
    sage: print p.factor()

    sage: x = polygen(QQbar)
    sage: p = 12*x^2 + 12*x + 24
    sage: print parent(p)
    sage: print p.factor()

Even for real numbers there is a huge variety of them

- exact numbers (integer, rational, algebraic numbers)
- floating point numbers (real or complex)
- intervals and balls (real or complex)
- symbolic (the "big garbage")

Floating point numbers are **inexact** by nature... it is particularly
dangerous in an **unstable** situation. They should be used with a lot of care.

-----------------------------
Exercise 1: stability matters
-----------------------------

Look at the following four cells and try to guess what will be the output
*before* executing them.::

    sage: x0 = 1/3
    sage: print 4*x0 - 1 == x0

    sage: x = x0
    sage: for i in range(100):
    ....:     x = 4*x - 1
    sage: print x

    sage: x0 = RR(1/3)
    sage: print 4*x0 - 1 == x0

    sage: x = x0
    sage: for i in range(100):
    ....:      x = 4*x - 1
    sage: print x

    sage: #edit

--------------------------
Exercise 2: parent matters
--------------------------

Compare the following two cells. Which computations is the most accurate? the fastest?::

    sage: a = sqrt(2) + sqrt(3) + sqrt(5) + sqrt(7) - 6
    sage: for i in range(8):
    ....:    a = a^4 - 4*a^3 + 4*a^2
    sage: print a.numerical_approx()

    sage: a = sqrt(2.) + sqrt(3.) + sqrt(5.) + sqrt(7.) - 6
    sage: for i in range(8):
    ....:    a = a^4 - 4*a^3 + 4*a^2
    sage: print a.numerical_approx() 
    
    sage: #edit

In both cases, add some code to see what is the parent of ``a``.

--------
Coercion
--------

Coercion is what happens when you mix numbers (or more generally objects) of different kinds.

For example the addition of an integer and a rational will be a rational::

    sage: parent(5 + 2/3)

But what about:

- the addition of a rational with a polynomial with integer coefficients?
- division of two integers?
- division of two polynomials?

::

    sage: # edit
    sage: # edit
    sage: # edit

----------------------------
Interval and ball arithmetic
----------------------------

Interval and balls are two kinds of floating point arithmetic that take care of
error propagation. These types correspond to pairs of floating point numbers
that represent respectively:

- the left and right endpoints of an interval
- the center and the radius of a ball 

The parents are ``RIF`` (for *real interval field*) and ``RBF`` (for *real ball field*)::

    sage: RIF(sqrt(2))

    sage: RBF(sqrt(2))

The arithmetic is done in such way that for any operation `f(X)` applied to an
interval or a ball `X` *contains* all of `\{f(x): x \in X\}`::

    sage: a = RIF(1/2,1)   # the interval [1/2,1]
    sage: print a.endpoints()
    sage: b = a^2
    sage: print b.endpoints()

    sage: a = RBF(RIF(1/2,1))  # the same seen as a ball
    sage: print a.endpoints()
    sage: b = a^2
    sage: print b.endpoints()

You can prove theorems using balls or intervals (which is much harder using
floating point)!

You can apply most of standard functions on intervals and balls::

    sage: a = RIF(1/3)
    sage: print a.cos()
    sage: print a.tan()

    sage: # etc

**Exercise:**

Find an example of a singleton interval `X = [x,x]` and a function `f` where the
`f(X)` is not a singleton::

    sage: # edit
    sage: # edit
    sage: # edit

---------
Precision
---------

Most floating point parents admit a precision attribute::

     sage: R = RealField(64)
     sage: R(1/3)

     sage: R = RealField(256)
     sage: R(1/3)

     sage: R = RealIntervalField(64)
     sage: R(1/3)

     sage: R = RealIntervalField(256)
     sage: R(1/3)

------------------------------
Playing with algebraic numbers
------------------------------

Since sage-7.1 it is possible to work with embedded number fields in the set of
real numbers::

    sage: R.<x> = PolynomialRing(ZZ)
    sage: K.<cbrt2> = NumberField(x^3 - 2, embedding=AA(2)**(1/3))

    sage: 1 < cbrt2 < 2

    sage: continued_fraction(cbrt2)

These numbers are exact by nature, but comparing them can lead to expensive
computations. Moreover the complexity of addition/multiplication increase
(linearly) with the degree of the number field.

---------------------------------
Integrating Abelian differentials
---------------------------------

In this section, you are invited to play with Abelian differential in the
complex plane. The aim is to:

- compute holonomy of paths $$ \int_\gamma f(x) dx = \int_0^1 f(\gamma(t)) \gamma'(t) dt.$$

- integrate $f(x) dx$ in other words find numerica solutions to the one
  parameter family of ODEs $$f \left(\gamma(t) \right)\ \gamma'(t) = e^{i \theta}.$$


Two basic functions in Sage to perform this task are:

- `numerical_integral`
- `ode_solver`


::

    sage: class DifferentialCaller:
    ....:       def __init__(self, f):
    ....:         vars = f.variables()
    ....:         assert len(vars) == 1
    ....:         var = vars[0]
    ....:         
    ....:         x = SR.var('x')
    ....:         y = SR.var('y')
    ....:         theta = SR.var('theta')
    ....:         I = SR('I')
    ....:         g = exp(I * theta) / f(x + I*y)
    ....:         g1 = g.real()
    ....:         self.g1 = fast_callable(g1, vars=[x,y,theta], domain=float)
    ....:         g2 = g.imag()
    ....:         self.g2 = fast_callable(g2, vars=[x,y,theta], domain=float)
    ....:         dF = exp(I * theta) * f.derivative(var)(x + I*y) / (f(x+I*y) * f(x+I*y))
    ....:         dF = dF.full_simplify()
    ....:         print dF
    ....:         self.dg1x = fast_callable(dF.real(), vars=[x,y,theta], domain=float)
    ....:         self.dg1y = fast_callable((I * dF).real(), vars=[x,y,theta], domain=float)
    ....:         self.dg2x = fast_callable(dF.imag(), vars=[x,y,theta], domain=float)
    ....:         self.dg2y = fast_callable((I * dF).imag(), vars=[x,y,theta], domain=float)                        
    ....:     def function(self, t, z, params):
    ....:         return (self.g1(z[0], z[1], params[0]), self.g2(z[0], z[1], params[0]))
    ....:         
    ....:     def jacobian(self, t, z, params):
    ....:         return ((self.dg1x(z[0], z[1], params[0]), self.dg2x(z[0],z[1],params[0])),
    ....:                 (self.dg1y(z[0], z[1], params[0]), self.dg2y(z[0],z[1],params[0])))

    sage: f(z) = exp(1/z)
    sage: D = DifferentialCaller(f)
    -e^(I*theta - 1/(x + I*y))/(x^2 + 2*I*x*y - y^2)
    sage: T = ode_solver()
    sage: T.function = D.function
    sage: #T.jacobian = D.jacobian
    sage: G = Graphics()
    sage: Z0 = [(-1,0.3)]
    sage: theta_step = 0.5
    sage: for z0 in Z0:
    ....:     theta = 0.0
    ....:     while theta < 2*RR.pi()+theta_step/2:
    ....:         T.ode_solve(y_0=z0, t_span=[0,1], params=[theta], num_points=100)
    ....:         G += line2d([z for t,z in T.solution], color='blue')
    ....:         theta += theta_step
    sage: G.show()
