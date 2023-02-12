

# Sage Days 24 Projects: Algorithmic Differentiation

Examples of what you could imagine doing: 
```txt
sage: f(x,y,z)=sqrt(x^3+y)/(x-y^3*z)^(3/2)
sage: a = fast_callable(f,CDF)
sage: timeit('a(2,3,4)')
625 loops, best of 3: 24.2 µs per loop
sage: g = f.derivative(x,10)
sage: a = fast_callable(g,CDF)
sage: timeit('a(2,3,4)')
625 loops, best of 3: 1.21 ms per loop
```
I imagine that one could instead do: 
```txt
sage: f(x,y,z)=sqrt(x^3+y)/(x-y^3*z)^(3/2)
sage: a = fast_callable(g,CDF)
sage-fantasy: b = a.derivative(x,10)
sage-fantasy: timeit('b(2,3,4)')
625 loops, best of 3: 24.2 µs per loop
```
This is just a random example I made up, but it's the sort of massive performance one might hope for from AD; the literature should have better examples.    There are *tons* of potential Python libraries to consider, e.g., <a class="http" href="http://github.com/b45ch1/algopy">algopy</a> and <a class="http" href="http://www.coin-or.org/CppAD/">CppAD</a> (which has Python bindings).  

Obviously, differentiating short functions that use a restricted set of functions in sage would make sense. 

From Brad Bell:  
```txt
Have I sent you a link to the following web page which seems to be along the lines of what you are looking into:
       http://www.seanet.com/~bradbell/pycppad/runge_kutta_4_cpp.py.xml

Note that check at the bottom of the example:

       # check that C++ is always more than 20 times faster
       assert( 20. * cpp_sec <= python_sec )

The actual amout faster is often 100 or more.
```