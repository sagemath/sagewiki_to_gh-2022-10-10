

# Sage 2.10.3 Release Tour

Sage 2.10.3 was released on 11 Mar 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release.For the latest changes see<a class="http" href="http://www.sagemath.org/mirror/src/announce/sage-2.10.3.txt">sage-2.10.3.txt</a>. Among many other things that were done, we have the following cool new features. Of course, this list is incomplete; see the release notes for more details. 

Michael Abshoff was the release managers for this Sage release. 


## Interactive Functions

Sage now has a first version of its "interact" command.  Calling "@interact" before defining a function will construct controls to graphically control the input variables of the function, making it dramatically easier to create interactive functionality that is easy to use.  See <a class="http" href="http://wiki.sagemath.org/interact">http://wiki.sagemath.org/interact</a> for details and examples or just type "interact?" in Sage. 


## Graph theory

Many of the results of Sage Days 7: Combinatorics are included in this release, including Schnyder's algorithm for producing straight-line drawings of planar graphs in linear time (Jonathan Bober and Emily Kirkman), and a new compiled backend for the base graph structures (Robert Miller). This backend will be switched into graphs proper in sage-2.10.4, and the basic functions, such as add edge and has edge, will be sped up by at least 20 times in many cases, and often much more. In addition most of graph.py was refactored and cleaned up, in preparation for the switch. 


## Plotting

* The plot_vector_field function now takes 2-variable functions, allowing for much more complex vector fields. 

```txt
sage: plot_vector_field((lambda x,y: x+y, lambda x,y: x^2*y^3), (x,-2,2), (y,-2,2))
```

## Linear Algebra

* Matrices now have a jordan_form method which computes the Jordan canonical form. 

```txt
sage: a = matrix(ZZ,4,[1, 0, 0, 0, 0, 1, 0, 0, 1, -1, 1, 0, 1, -1, 1, 2]); a
[ 1  0  0  0]
[ 0  1  0  0]
[ 1 -1  1  0]
[ 1 -1  1  2]
sage: a.jordan_form()
[2|0 0|0]
[-+---+-]
[0|1 1|0]
[0|0 1|0]
[-+---+-]
[0|0 0|1]
```

## Unified derivative syntax

The `derivative` function now accepts the same argument format across many different data types, including symbolic objects, polynomials, power series, and Laurent series. For example: 


```txt
sage: var("x y")
(x, y)
sage: f = sin(x^3 * y^2)
sage: f.derivative(x, y, 2)   # differentiate with respect to x, and then twice with respect to y
-30*x^5*y^2*sin(x^3*y^2) - 12*x^8*y^4*cos(x^3*y^2) + 6*x^2*cos(x^3*y^2)

sage: R.<t> = PowerSeriesRing(ZZ)
sage: S.<u> = PowerSeriesRing(R)
sage: f = t^3 * u^2
sage: f.derivative(u, t, 2)
12*t*u
```