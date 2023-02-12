

# Differential Equations


## First order DEs


### IVPs, Direction Fields, Isoclines


### Direction Fields, Autonomous DEs


### Separable DEs, Exact DEs, Linear 1st order DEs


### Numerical method: Euler (or Constant Slope)


### Applications (Growth/Cooling/Circuits/Falling body)


## Higher order DEs


### IVPs/General solutions, Basic theory


### Numerical methods for higher order DEs


### Constant coefficient case: Undetermined Coefficients


### Application: springs (free, damped, forced, pure resonance)


### Application: Electrical Circuits


## Laplace Transform (LT) methods


### Inverse Laplace & Derivatives


### 1st Translation Thrm


### Partial Fractions, completing the square


### Unit Step Functions

SAGE can define piecewise functions like 

$$x \ {\mapsto}\ \sin ( \frac{\pi \cdot x}{2} ) $$ on $(0, 1)$, $$x \ {\mapsto}\ 1 - ( x - 1 )^2 $$ on $(1, 3)$, $$x \ {\mapsto}\ -x $$ on  $(3, 5)$, as follows: 


```txt
sage: f(x) = sin(x*pi/2)
sage: g(x) = 1-(x-1)^2
sage: h(x) = -x
sage: P = Piecewise([[(0,1), f], [(1,3),g], [(3,5), h]])
sage: latex(P)
```
However, at the moment only Laplace transforms of "piecewise polynomial" functions are implemented: 


```txt
sage: f(x) = x^2+1      
sage: g(x) = 1-(x-1)^3
sage: P = Piecewise([[(0,1), f], [(1,3),g], [(3,5), h]])
sage: P.laplace(x,s)
(s^3 - 6)*e^(-s)/s^4 - ((2*s^2 + 2*s + 2)*e^(-s)/s^3) + (7*s^3 + 12*s^2 + 12*s + 6)*e^(-3*s)/s^4 + (-3*s - 1)*e^(-3*s)/s^2 + (5*s + 1)*e^(-5*s)/s^2 + (s^2 + 2)/s^3
```

### 2nd Translation Theorem


### Derivative thrms, Solving DEs


### Convolution theorem

You can find the convolution of any piecewise defined function with another (off the domain of definition, they are assumed to be zero). Here is $ f$ , $ f*f$ , and $ f*f*f$ , where $ f(x)=1$ , $ 0<x<1$ : 


```txt
sage: x = PolynomialRing(QQ, 'x').gen()
sage: f = Piecewise([[(0,1),1*x^0]])
sage: g = f.convolution(f)
sage: h = f.convolution(g)
sage: P = f.plot(); Q = g.plot(rgbcolor=(1,1,0)); R = h.plot(rgbcolor=(0,1,1))
```
The command show(P+Q+R) displays this: 

![http://sage.math.washington.edu/home/wdj/art/convolutions.png](http://sage.math.washington.edu/home/wdj/art/convolutions.png) 

Though SAGE doesn't simplify very well, you can see that the $LT(f*f)$ is equal to  $LT(f)^2$: 


```txt
sage: f.laplace(x,s)
1/s - e^(-s)/s
sage: g.laplace(x,s)
-(s + 1)*e^(-s)/s^2 + (s - 1)*e^(-s)/s^2 + e^(-(2*s))/s^2 + 1/s^2
sage: (f.laplace(x,s)^2).expand()
-2*e^(-s)/s^2 + e^(-(2*s))/s^2 + 1/s^2
```

### Dirac Delta Function


### Application: Lanchester's equations


### Application: Electrical networks


## PDEs


### Separation of Variables


### Heat Equation., Fourier's solution


### Fourier Series

If $ f(x)$  is a piecewise-defined polynomial function on $ -L<x<L$  then the Fourier series 

$\displaystyle f(x) \sim \frac{a_0}{2} + \sum_{n=1}^\infty [a_n\cos(\frac{n\pi x}{L}) + b_n\sin(\frac{n\pi x}{L})], $ 

converges. In addition to computing the coefficients $ a_n,b_n$ , it will also compute the partial sums (as a string), plot the partial sums (as a function of $ x$ over $ (-L,L)$ , for comparison with the plot of $ f(x)$ itself), compute the value of the FS at a point, and similar computations for the cosine series (if $ f(x)$ is even) and the sine series (if $ f(x)$ is odd). Also, it will plot the partial F.S. Cesaro mean sums (a ``smoother" partial sum illustrating how the Gibbs phenomenon is mollified). 


```txt
sage: f1 = lambda x:-1
sage: f2 = lambda x:2
sage: f = Piecewise([[(0,pi/2),f1],[(pi/2,pi),f2]])
sage: f.fourier_series_cosine_coefficient(5,pi)
-3/(5*pi)
sage: f.fourier_series_sine_coefficient(2,pi)
-3/pi
sage: f.fourier_series_partial_sum(3,pi)
-3*sin(2*x)/pi + sin(x)/pi - 3*cos(x)/pi + 1/4
```
Plotting the partial sums is implemented: Typing `f.plot_fourier_series_partial_sum(15,pi,-5,5)` yields 

![http://sage.math.washington.edu/home/wdj/art/fourier-partial-sum1.png](http://sage.math.washington.edu/home/wdj/art/fourier-partial-sum1.png) 

and typing `f.plot_fourier_series_partial_sum_cesaro(15,pi,-5,5)` yields the much smoother version: 

![http://sage.math.washington.edu/home/wdj/art/fourier-partial-sum2.png](http://sage.math.washington.edu/home/wdj/art/fourier-partial-sum2.png) 


### Convergence, Dirichlet's theorem


### Fourier Sine Series, Fourier Cosine Series


### Heat Eqn. Ends at Zero


### Heat Eqn. Both Ends Insulated
