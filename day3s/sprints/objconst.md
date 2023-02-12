

# David Harvey: would like to experiment further with speeding up object construction


## Email announcing the project from David Harvey

hi people, 

Just want to float an idea for discussion and possibly a coding   sprint at SD3. 

Some background: Today I did some work on speeding up getting   coefficients out of NTL objects, specifically polynomials in Z[x].   It's much improved now; when you request a coefficient of an NTL ZZX   object, it copies the bytes directly into a new Integer object,   instead of what it used to do (which went via a C string in decimal,   and a python string, and a python long, etc etc). 

But still what is taking a lot of time is constructing the Integer   object. In fact, it's quite embarrasing: it takes us about half as   long to construct 100,000 Integer objects as NTL takes to *multiply*   two polynomials with 100,000 small coefficients: 
```txt
sage: time for i in range(100000): pass
CPU times: user 0.05 s, sys: 0.00 s, total: 0.05 s
 
sage: time for i in range(100000): x = None
CPU times: user 0.09 s, sys: 0.00 s, total: 0.09 s
 
sage: time for i in range(100000): x = int()
CPU times: user 0.16 s, sys: 0.00 s, total: 0.17 s
 
sage: time for i in range(100000): x = Integer()
CPU times: user 0.36 s, sys: 0.00 s, total: 0.36 s
 
sage: f = PolynomialRing(ZZ, "x")([ZZ.random_element() for _ in range 
(100000)])
sage: time g = f*f
CPU times: user 0.76 s, sys: 0.02 s, total: 0.79 s
```
This is despite all the work we put into this at SD2. 

It would be good to be able to optimise object construction in   general. Unfortunately I think the general case is a very difficult   problem. Anyone who worked on this at SD2 will agree, I'm sure  

On the other hand, I would wager that construction of Integer objects   is by far the most important. So perhaps we should give up some   beauty and unity of code to just get Integers working damn fast. So   here's what I propose: at SD3, let's try writing an experimental pure   C function for constructing Integers that gets inserted into whatever   tp_xyz slot is appropriate. I don't care if it has to deal directly   with mangled pyrex names or whatever. From memory, all it needs to do   is: (1) reference counting on the integer ring (ha ha we could even skip   this if we could guarantee that no-one else ever resets the parent,   and that there is always at least one reference to the integer ring   lying around somewhere) (2) malloc some space for the actual python object (3) fill in some fields, like the <a href="/TypeObject">TypeObject</a>* (4) mpz_init 

Let's skip all the function calls, all the crap that pyrex puts in,   etc etc. Basically the only stuff left that will really suck up time   is the two malloc calls. We could even try writing a buffering system   for mallocing space for a whole bunch of Integers at once, if that   proves to be taking up time. 

Similarly we would need a destructor. 

I'm sure it's not quite as simple as what I've put in the above list,   but let's just see what we can do. I would like it to be as close as   possible to the int() construction time. We still are a factor of > 2   away. 

David 


## Email back from William


```txt
> (1) reference counting on the integer ring (ha ha we could even skip
> this if we could guarantee that no-one else ever resets the parent,
> and that there is always at least one reference to the integer ring
> lying around somewhere)

There is my integer with the integer ring -- it should be immutable and
create at module load time and there should only ever be exactly one
copy of it.  I think we should definitely be allowed to forgot about
reference counting for it. 

> (2) malloc some space for the actual python object
> (3) fill in some fields, like the TypeObject*
> (4) mpz_init

You should put 
  (0) or (5) object pool
as an important step -- this "object pool" idea is one of the tricks
that Python uses for its ints.  For example, in your benchmark:

  time for i in range(10^5): x = int()

Python is looking up and returning exactly the same int (the 0) every time:
  sage: int() is int()
  True
  sage: a = 999038r; b=999038r
  sage: a is b
  True

In contrast, when you do Integer(), so is creating a new integer object
every time, and probably (?) also freeing one:
  sage: Integer() is Integer()
  False
  sage: a = 999038; b=999038
  sage: a is b
  False


> Let's skip all the function calls, all the crap that pyrex puts in,
> etc etc. Basically the only stuff left that will really suck up time
> is the two malloc calls. We could even try writing a buffering system
> for mallocing space for a whole bunch of Integers at once, if that
> proves to be taking up time.
>
> Similarly we would need a destructor.

Or return objects to the pool -- this can also speed up desctructing,
since you just don't do it!

> I'm sure it's not quite as simple as what I've put in the above list,
> but let's just see what we can do. I would like it to be as close as
> possible to the int() construction time. We still are a factor of > 2
> away.

This project is very very well worth pursing. 

  -- William
```

## Some Ideas from Robert Bradshaw


```txt
Some thoughts: I think a pool is a very important idea to consider. I
can think of two instances where 1000's of integer objects would be
created: first, in some large object such as a matrix or polynomial
(in which case there should be a specialized type) and second in some
huge loop (in which case a pool would help immensely).

Also, it'd be interesting to look at the distribution, but I wouldn't
be surprised if the majority of integers (ephemerally) created were
relatively small--say < 100s. Zero and one especially are used all
over. Similar to the pool idea, it might be worth allocating the
first 100 integers and whenever you want to create a "small" integer,
it would simply return one of these. (I think small one-limb mpz_t's
can be detected very easily with mpz_size and a bit mask.) Of course,
using python ints might be in order for many of these cases too.

A related idea came up in the discussion we had here on linear
algebra. Right now if one wants to optimize linear algebra over a new
ring one must re-implement matrix multiplication, addition, etc. The
generic algorithms request an entries (as a Python object), perform
the arithmetic, then store the resulting python object. This can be
hugely inefficient. Rather, what if the matrix had void* methods
_get_unsafe_raw(i,j) and _set_unsafe_raw(i,j), and the corresponding
ring had _add_raw(), _mul_raw(), etc. Also, the ring could have
_get_raw() and _create_from_raw(). For the integer ring, these would
return mpz_t* and, for instance, _mul_raw() could even be a macro to
mpz_mul. The generic base case would just pass around python objects.
The "reference counting" for these raw results would have to be done
manually. I would suggest giving them the same semantics as gmp. This
way one could implement generic polynomial/matrix/etc algorithms that
would be able to operate efficiently on any ring with the above
methods. For some cases (such as the integers) one would want actual
specialized matrices, etc. but it would greatly reduce the work to
get significant speedup for objects containing many elements of a
given generic ring. Also, it would make implementations for specific
ring elements easier to swap in and out (without having to change all
the types that access the element internals).
```