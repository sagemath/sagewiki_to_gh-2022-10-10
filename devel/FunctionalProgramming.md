

## Python Functional Programming for Mathematicians

This tutorial discusses some techniques of functional programming that might be of interest to mathematicians or people who use Python for scientific computation. We first start off with a brief overview of procedural and object-oriented programming, and then discuss functional programming techniques. The tutorial concludes with some resources on detailed information on functional programming using Python. This tutorial is also available at <a class="http" href="http://mvngu.wordpress.com/2009/12/12/python-functional-programming-for-mathematicians/">Wordpress</a>. 


### Styles of programming

Python supports several styles of programming. You could program in the procedural style by writing a program as a list of instructions. Say you want to implement addition and multiplication over the integers. A procedural program to do so would be as follows: 


```txt
sage: def add_ZZ(a, b):
....:     return a + b
sage: def mult_ZZ(a, b):
....:     return a * b
sage: add_ZZ(2, 3)
5
sage: mult_ZZ(2, 3)
6
```
The Python module `operator` defines several common arithmetic and comparison operators as named functions. Addition is defined in the built-in function `operator.add()` and multiplication is defined in `operator.mul()`. The above example can be worked through as follows: 


```txt
sage: from operator import add, mul
sage: add(2, 3)
5
sage: mul(2, 3)
6
```
Another common style of programming is called object-oriented programming. Think of an object as code that encapsulates both data and functionalities. You could encapsulate integer addition and multiplication as in the following object-oriented implementation: 


```txt
sage: class MyInteger:
....:     def __init__(self):
....:         self.cardinality = "infinite"
....:     def add(self, a, b):
....:         return a + b
....:     def mult(self, a, b):
....:         return a * b
....:     
sage: myZZ = MyInteger()
sage: myZZ.cardinality
'infinite'
sage: myZZ.add(2, 3)
5
sage: myZZ.mult(2, 3)
6
```

### Functional programming using map()

Functional programming is yet another style of programming in which a program is decomposed into various functions. The Python built-in functions <a class="https" href="https://docs.python.org/library/functions.html#map">map()</a>, <a class="https" href="https://docs.python.org/library/functions.html#reduce">reduce()</a> allow you to program in the functional style. The function 


```txt
map(func, seq1, seq2, ...)
```
takes a function `func` and one or more sequences, and apply `func` to elements of those sequences. In particular, you end up with an iterable, that will  

* generate the list: 

```txt
[func(seq1[0], seq2[0], ...), func(seq1[1], seq2[1], ...), ...]
```
In many cases, using `map()` allows you to express the logic of your program in a concise manner without using list comprehension. For example, say you have two lists of integers and you want to add them element-wise. A list comprehension to accomplish this would be as follows: 


```txt
sage: A = [1, 2, 3, 4]
sage: B = [2, 3, 5, 7]
sage: [a + b for a, b in zip(A, B)]
[3, 5, 8, 11]
```
Alternatively, you could use the Python built-in addition function `operator.add()` together with `map()` to achieve the same result: 


```txt
sage: list(map(add, A, B))
[3, 5, 8, 11]
```
An advantage of `map()` is that you do not need to explicitly define a `for` loop as was done in the above list comprehension. 


### Define small functions using lambda

There are times when you want to write a short, one-liner function. You could re-write the above addition function as follows: 


```txt
sage: def add_ZZ(a, b): return a + b
....:
```
Or you could use a <a class="https" href="https://docs.python.org/reference/expressions.html#lambda">lambda</a> statement to do the same thing in a much clearer style. The above addition and multiplication functions could be written using `lambda` as follows: 


```txt
sage: add_ZZ = lambda a, b: a + b
sage: mult_ZZ = lambda a, b: a * b
sage: add_ZZ(2, 3)
5
sage: mult_ZZ(2, 3)
6
```
Things get more interesting once you combine `map()` with the `lambda` statement. As an exercise, you might try to write a simple function that implements a constructive algorithm for the <a class="https" href="https://en.wikipedia.org/wiki/Chinese_remainder_theorem">Chinese Remainder Theorem</a>. You could use list comprehension together with `map()` and `lambda` as shown below. Here, the parameter `A` is a list of integers and `M` is a list of moduli. 


```txt
sage: def crt(A, M):
....:     Mprod = prod(M)
....:     Mdiv = list(map(lambda x: Integer(Mprod / x), M))
....:     X = map(inverse_mod, Mdiv, M)
....:     x = sum(A[i]*X[i]*Mdiv[i] for i in range(len(A)))
....:     return mod(x, Mprod).lift()
sage: A = [2, 3, 1]
sage: M = [3, 4, 5]
sage: x = crt(A, M); x
11
sage: mod(x, 3)
2
sage: mod(x, 4)
3
sage: mod(x, 5)
1
```
To produce a random matrix over a ring, say `ZZ`, you could start by defining a matrix space and then obtain a random element of that matrix space: 


```txt
sage: MS = MatrixSpace(ZZ, nrows=5, ncols=3)
sage: MS.random_element()
[ 6  1  0]
[-1  5  0]
[-1  0  0]
[-5  0  1]
[ 1 -1 -3]
```
Or you could use the function `random_matrix()`: 


```txt
sage: random_matrix(ZZ, nrows=5, ncols=3)
[  2 -50   0]
[ -1   0  -6]
[ -4  -1  -1]
[  1   1   3]
[  2  -1  -1]
```
The next example uses `map()` to construct a list of random integer matrices: 


```txt
sage: rows = [randint(1, 10) for i in range(10)]
sage: cols = [randint(1, 10) for i in range(10)]
sage: rings = [ZZ]*10
sage: M = list(map(random_matrix, rings, rows, cols))
sage: M[0]
[ -1  -3  -1 -37   1  -1  -4   5]
[  2   1   1   5   2   1  -2   1]
[ -1   0  -4   0  -2   1  -2   1]
```
If you want more control over the entries of your matrices than the `random_matrix()` function permits, you could use `lambda` together with `map()` as follows: 


```txt
sage: rand_row = lambda n: [randint(1, 10) for i in range(n)]
sage: rand_mat = lambda nrows, ncols: [rand_row(ncols) for i in range(nrows)]
sage: matrix(rand_mat(5, 3))
[ 2  9 10]
[ 8  8  9]
[ 6  7  6]
[ 9  2 10]
[ 2  6  2]
sage: rows = [randint(1, 10) for i in range(10)]
sage: cols = [randint(1, 10) for i in range(10)]
sage: M = map(rand_mat, rows, cols)
sage: M = list(map(matrix, M))
sage: M[0]
[ 9  1  5  2 10 10  1]
[ 3  4  3  7  4  3  7]
[ 4  8  7  6  4  2 10]
[ 1  6  3  3  6  2  1]
[ 5  5  2  6  4  3  4]
[ 6  6  2  9  4  5  1]
[10  2  5  5  7 10  4]
[ 2  7  3  5 10  8  1]
[ 1  5  1  7  8  8  6]
```

### Reducing a sequence to a value

The function <a class="http" href="http://docs.python.org/library/functions.html#reduce">reduce()</a> takes a function of two arguments and apply it to a given sequence to reduce that sequence to a single value. The function <a class="http" href="http://docs.python.org/library/functions.html#sum">sum()</a> is an example of a `reduce()` function. The following sample code uses `reduce()` and the built-in function `operator.add()` to add together all integers in a given list. This is followed by using `sum()` to accomplish the same task: 


```txt
sage: L = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sage: reduce(add, L)
55
sage: sum(L)
55
```
In the following sample code, we consider a vector as a list of real numbers. The <a class="http" href="http://en.wikipedia.org/wiki/Dot_product">dot product</a> is then implemented using the functions `operator.add()` and `operator.mul()`, in conjunction with the built-in Python functions `reduce()` and `map()`. We then show how `sum()` and `map()` could be combined to produce the same result. 


```txt
sage: U = [1, 2, 3]
sage: V = [2, 3, 5]
sage: reduce(add, map(mul, U, V))
23
sage: sum(map(mul, U, V))
23
```
Or you could use Sage's built-in support for the dot product: 


```txt
sage: u = vector(U)
sage: v = vector(V)
sage: u.dot_product(v)
23
```
Here is an implementation of the Chinese Remainder Theorem without using `sum()` as was done previously. The version below uses `operator.add()` and defines `mul3()` to multiply three numbers instead of two. 


```txt
sage: def crt(A, M):
....:     Mprod = prod(M)
....:     Mdiv = map(lambda x: Integer(Mprod / x), M)
....:     X = map(inverse_mod, Mdiv, M)
....:     mul3 = lambda a, b, c: a * b * c
....:     x = reduce(add, map(mul3, A, X, Mdiv))
....:     return mod(x, Mprod).lift()
....: 
sage: A = [2, 3, 1]
sage: M = [3, 4, 5]
sage: x = crt(A, M); x
11
```

### Filtering with filter()

The Python built-in function `filter()` takes a function of one argument and a sequence. It then returns an iterable of all those items from the given sequence such that any item in the new list results in the given function returning `True`. In a sense, you are filtering out all items that satisfies some condition(s) defined in the given function. For example, you could use `filter()` to filter out all primes between 1 and 50, inclusive. 


```txt
sage: list(filter(is_prime, [1..50]))
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
```
For a given positive integer `n`, the <a class="https" href="https://en.wikipedia.org/wiki/Euler%27s_totient_function">Euler phi function</a> counts the number of integers `a`, with `1 <= a <= n`, such that `gcd(a, n) = 1`. You could use list comprehension to obtain all such `a`'s when `n = 20`: 


```txt
sage: [k for k in range(1, 21) if gcd(k, 20) == 1]
[1, 3, 7, 9, 11, 13, 17, 19]
```
A functional approach is to use `lambda` to define a function that determines whether or not a given integer is relatively prime to `20`. Then you could use `filter()` instead of list comprehension to obtain all the required `a`'s. 


```txt
sage: is_coprime = lambda k: gcd(k, 20) == 1
sage: list(filter(is_coprime, range(1, 21)))
[1, 3, 7, 9, 11, 13, 17, 19]
```
The function `primroots()` defined below returns all primitive roots modulo a given positive prime integer `p`. It uses `filter()` to obtain a list of integers between `1` and `p - 1`, inclusive, each integer in the list being relatively prime to the order of `(\mathbf{Z} / p\mathbf{Z})^{\ast}`. 


```txt
sage: def primroots(p):
....:     g = primitive_root(p)
....:     znorder = p - 1
....:     is_coprime = lambda x: gcd(x, znorder) == 1
....:     good_odd_integers = filter(is_coprime, [1..p-1, step=2])
....:     return sorted(power_mod(g, k, p) for k in good_odd_integers)
sage: primroots(3)
[2]
sage: primroots(5)
[2, 3]
sage: primroots(7)
[3, 5]
sage: primroots(11)
[2, 6, 7, 8]
sage: primroots(13)
[2, 6, 7, 11]
sage: primroots(17)
[3, 5, 6, 7, 10, 11, 12, 14]
sage: primroots(23)
[5, 7, 10, 11, 14, 15, 17, 19, 20, 21]
sage: primroots(29)
[2, 3, 8, 10, 11, 14, 15, 18, 19, 21, 26, 27]
sage: primroots(31)
[3, 11, 12, 13, 17, 21, 22, 24]
```

### Further resources

This has been a rather short introduction to functional programming with Python. The Python standard documentation has a list of <a class="http" href="http://docs.python.org/library/functions.html">built-in functions</a>, many of which are useful in functional programming. For example, you might want to read up on <a class="http" href="http://docs.python.org/library/functions.html#all">all()</a>, <a class="http" href="http://docs.python.org/library/functions.html#any">any()</a>, <a class="http" href="http://docs.python.org/library/functions.html#max">max()</a>, <a class="http" href="http://docs.python.org/library/functions.html#min">min()</a>, and <a class="http" href="http://docs.python.org/library/functions.html#zip">zip()</a>. The Python module <a class="http" href="http://docs.python.org/library/operator.html">operator</a> has numerous built-in arithmetic and comparison operators, each operator being implemented as a function whose name reflects its intended purpose. For arithmetic and comparison operations, it is recommended that you consult the `operator` module to determine if there is a built-in function that satisfies your requirement. The module <a class="http" href="http://docs.python.org/library/itertools.html">itertools</a> has numerous built-in functions to efficiently process sequences of items. The functions `filter()`, `map()` and `zip()` have their counterparts in `itertools` as `itertools.ifilter()`, `itertools.imap()` and `itertools.izip()`. 

Another useful resource for functional programming in Python is the <a class="http" href="http://docs.python.org/howto/functional.html">Functional Programming HOWTO</a> by A. M. Kuchling. Steven F. Lott's book <a class="http" href="http://homepage.mac.com/s_lott/books/python.html#book-python">Building Skills in Python</a> has a chapter on <a class="http" href="http://homepage.mac.com/s_lott/books/python/html/p02/p02c10_adv_seq.html">Functional Programming using Collections</a>. See also the chapter <a class="http" href="http://www.diveintopython3.org/functional_programming/index.html">Functional Programming</a> from Mark Pilgrim's book <a class="http" href="http://www.diveintopython3.org">Dive Into Python</a>. 

You might also want to consider experimenting with <a class="http" href="http://www.haskell.org">Haskell</a> for expressing mathematical concepts. For an example of Haskell in expressing mathematical algorithms, see J. Gibbons' article <a class="http" href="http://www.maa.org/pubs/monthly_apr06_toc.html">Unbounded Spigot Algorithms for the Digits of Pi</a> in the American Mathematical Monthly. 
