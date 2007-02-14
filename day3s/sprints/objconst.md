=  David Harvey: would like to experiment further with speeding up object construction =

 
hi people,
 
Just want to float an idea for discussion and possibly a coding  
sprint at SD3.
 
Some background: Today I did some work on speeding up getting  
coefficients out of NTL objects, specifically polynomials in Z[x].  
It's much improved now; when you request a coefficient of an NTL ZZX  
object, it copies the bytes directly into a new Integer object,  
instead of what it used to do (which went via a C string in decimal,  
and a python string, and a python long, etc etc).
 
But still what is taking a lot of time is constructing the Integer  
object. In fact, it's quite embarrasing: it takes us about half as  
long to construct 100,000 Integer objects as NTL takes to *multiply*  
two polynomials with 100,000 small coefficients:
{{{
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
}}}
This is despite all the work we put into this at SD2.
 
It would be good to be able to optimise object construction in  
general. Unfortunately I think the general case is a very difficult  
problem. Anyone who worked on this at SD2 will agree, I'm sure 
 
On the other hand, I would wager that construction of Integer objects  
is by far the most important. So perhaps we should give up some  
beauty and unity of code to just get Integers working damn fast. So  
here's what I propose: at SD3, let's try writing an experimental pure  
C function for constructing Integers that gets inserted into whatever  
tp_xyz slot is appropriate. I don't care if it has to deal directly  
with mangled pyrex names or whatever. From memory, all it needs to do  
is:
(1) reference counting on the integer ring (ha ha we could even skip  
this if we could guarantee that no-one else ever resets the parent,  
and that there is always at least one reference to the integer ring  
lying around somewhere)
(2) malloc some space for the actual python object
(3) fill in some fields, like the TypeObject*
(4) mpz_init
 
Let's skip all the function calls, all the crap that pyrex puts in,  
etc etc. Basically the only stuff left that will really suck up time  
is the two malloc calls. We could even try writing a buffering system  
for mallocing space for a whole bunch of Integers at once, if that  
proves to be taking up time.
 
Similarly we would need a destructor.
 
I'm sure it's not quite as simple as what I've put in the above list,  
but let's just see what we can do. I would like it to be as close as  
possible to the int() construction time. We still are a factor of > 2  
away.
 
David
