

# Differential Calculus

Besides the examples on this page, please see the discussion in <a href="/BasicCalculus">BasicCalculus</a>. 


## Functions

Piecewise fcns, polynomials, exponential, logs, trig and hyperboic trig functions. 


## Limits

SAGE can compute $\lim_{x\rightarrow 0}\frac{\sin(x)}{x}$: 


```python
#!python numbers=none 
sage: limit(sin(x)/x,x=0)
1
```

### Laws and properties


### Continuity


## Differentiation

SAGE can differentiate $x<sup>2\log(x+a)$ and $\tan</sup>{-1}(x)=\arctan(x)$: 


```python
#!python numbers=none 
sage: diff(x^2 * log(x+a), x)
2*x*log(x + a) + x^2/(x + a)
sage: derivative(atan(x), x)
1/(x^2 + 1)
```
Another example: 


```txt
sage: var('x k w')
(x, k, w)
sage: f = x^3 * e^(k*x) * sin(w*x); f
x^3*e^(k*x)*sin(w*x)
sage: f.diff(x)
k*x^3*e^(k*x)*sin(w*x) + 3*x^2*e^(k*x)*sin(w*x) + w*x^3*e^(k*x)*cos(w*x)
sage: print diff(f, x)
           3   k x               2   k x               3   k x
        k x   e    sin(w x) + 3 x   e    sin(w x) + w x   e    cos(w x)
sage: latex(f.diff(x))
{{{k {x}^{3} } {e}^{{k x}} } \sin \left( {w x} \right)} + {{{3 {x}^{2} } {e}^{{k x}} } \sin \left( {w x} \right)} + {{{w {x}^{3} } {e}^{{k x}} } \cos \left( {w x} \right)}
```

### Laws

SAGE can verify the product rule 


```python
#!python numbers=none 
sage: function('f, g')
(f, g)
sage: diff(f(t)*g(t),t)
f(t)*diff(g(t), t, 1) + g(t)*diff(f(t), t, 1)
```
the quotient rule 


```python
#!python numbers=none 
sage: diff(f(t)/g(t), t)
diff(f(t), t, 1)/g(t) - (f(t)*diff(g(t), t, 1)/g(t)^2)
```
and linearity: 


```python
#!python numbers=none 
sage: diff(f(t) + g(t), t)
diff(g(t), t, 1) + diff(f(t), t, 1)
sage: diff(c*f(t), t)
c*diff(f(t), t, 1)
```

### Rates of change, velocity


### Derivatives of polys, exps, trigs, log


### Chain rule


### Implicit differentiation


### Higher derivatives


## Applications


### Related rates


### Maximum and minimum values

You can find critical points of a piecewise defined function: 
```python
#!python numbers=none 
sage: x = PolynomialRing(RationalField(), 'x').gen()
sage: f1 = x^0
sage: f2 = 1-x
sage: f3 = 2*x
sage: f4 = 10*x-x^2
sage: f = Piecewise([[(0,1),f1],[(1,2),f2],[(2,3),f3],[(3,10),f4]])
sage: f.critical_points()
[5.0]
```

### Optimization problems


### Indeterminate Forms, L'Hopital's rule


### Newton’s Method


## Sequences and series

(Some schools teach this topic as part of integral calculus.) 


### Sequences


### Series


### Tests for Convergence

                           * o The Comparison Test o Absolute and Conditional Convergence o The Ratio Test o The Root Test  

### Power series

                           * o Shift the Origin o Convergence of Power Series  

### Taylor series

Taylor series: 


```txt
sage: var('f0 k x')
(f0, k, x)
sage: g = f0/sinh(k*x)^4
sage: g.taylor(x, 0, 3)
f0/(k^4*x^4) - 2*f0/(3*k^2*x^2) + 11*f0/45 - 62*k^2*f0*x^2/945
sage: maxima(g).powerseries('x',0)
16*f0*('sum((2^(2*i1-1)-1)*bern(2*i1)*k^(2*i1-1)*x^(2*i1-1)/(2*i1)!,i1,0,inf))^4
```
Of course, you can view the latexed version of this using view(g.powerseries('x',0)). 

The Maclaurin and power series of $ \log({\frac{\sin(x)}{x}})$ : 
```txt
sage: f = log(sin(x)/x)
sage: f.taylor(x, 0, 10)
-x^2/6 - x^4/180 - x^6/2835 - x^8/37800 - x^10/467775
sage: [bernoulli(2*i) for i in range(1,7)]
[1/6, -1/30, 1/42, -1/30, 5/66, -691/2730]
sage: maxima(f).powerseries(x,0)
('sum((-1)^i2*2^(2*i2)*bern(2*i2)*x^(2*i2)/(i2*(2*i2)!),i2,1,inf))/2
```

### Applications of Taylor series
