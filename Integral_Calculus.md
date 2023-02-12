

# Integral Calculus

Besides the examples on this page, please see the discussion in <a href="/BasicCalculus">BasicCalculus</a>. 


## Definite and Indefinite Integrals

SAGE can compute both definite integrals like $\int_0<sup>1 \frac{dx}{x</sup>3+1}$ and  indefinite integrals such as $\int \frac{dx}{x^3+1}$: 


```txt
sage: print integrate(1/(x^3+1),x)
                                         2 x - 1
                       2            atan(-------)
                  log(x  - x + 1)        sqrt(3)    log(x + 1)
                - --------------- + ------------- + ----------
                         6             sqrt(3)          3
sage: integrate(1/(x^3+1), x, 0, 1)
(6*log(2) + sqrt(3)*pi)/18 + sqrt(3)*pi/18
```
More examples: 


```txt
sage: integrate(1/x^2, x, 1, infinity)
1
sage: f = x^3 
sage: f.integral()
x^4/4
sage: integral(x^3,x)
x^4/4
sage: f = x*sin(x^2)
sage: integral(f,x)
-cos(x^2)/2
```

### The Definite Integral

                           * o The definition of area under curve o Relation between velocity and area o Definition of Integral o The Fundamental Theorem of Calculus  

## Indefinite Integrals and Change

                           * o Indefinite Integrals o Physical Intuition  

## Substitution and Symmetry

                           * o The Substitution Rule o The Substitution Rule for Definite Integrals o Symmetry  

## Applications to Areas, Volume, and Averages


### Using Integration to Determine Areas Between Curves


### Computing Volumes of Surfaces of Revolution


### Average Values


## Polar coordinates and complex numbers

                  * o Polar Coordinates o Areas in Polar Coordinates o Complex Numbers o Polar Form  o Complex Exponentials and Trig Identities o Trigonometry and Complex Exponentials  

## Integration Techniques


### Integration by parts


### Trigonometric integrals

                  * o Some Remarks on Using Complex-Valued Functions  

### Trigonometric substitutions


### Factoring polynomials


### Integration of Rational Functions Using Partial Fractions


### Approximating Integrals

Regarding numerical approximation of $ \int_a^bf(x) dx$ , where $ f$ is a piecewise defined function, Sage can 

         * compute (for plotting purposes) the piecewise linear function defined by the trapezoid rule for numerical integration based on a subdivision into N subintervals 
         * the approximation given by the trapezoid rule, 
         * compute (for plotting purposes) the piecewise constant function defined by the Riemann sums (left-hand, right-hand, or midpoint) in numerical integration based on a subdivision into N subintervals, 
         * the approximation given by the Riemann sum approximation. 

```txt
sage: f1 = x^2      
sage: f2 = 5-x^2
sage: f = Piecewise([[(0,1),f1],[(1,2),f2]])
sage: f.trapezoid(4)
Piecewise defined function with 4 parts, [[(0, 1/2), x/2], [(1/2, 1), 9*(x - 1/2)/2 + 1/4], [(1, 3/2), (x - 1)/2 + 5/2], [(3/2, 2), 11/4 - 7*(x - 3/2)/2]]
sage: f.riemann_sum_integral_approximation(6,mode="right")
19/6
sage: f.integral()
3
sage: n(f.integral())
3.00000000000000
```

### Improper Integrals

                           * o Convergence, Divergence, and Comparison  