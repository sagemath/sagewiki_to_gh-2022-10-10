

# Sage Days 24 Coding Sprint Projects

This is a list of projects suitable for <a href="/days24">Sage Days 24</a>. Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this). 

[[_TOC_]] 


## GIAC Factoring

**People:** Thomas, Burcin, Richard, **William Stein** 

See <a class="http" href="http://groups.google.com/group/sage-devel/browse_thread/thread/81de8a7cdd694077">this sage-devel discussion</a>. 


## Kovacic's Algorithm

**People:** **Burcin**, Felix, Frédéric 

Implement Kovacic's algorithm in Sage. 

We have code to determine the coefficients of the $m$-th symmetric power of an operator $L$ and a clear description of how to find rational solutions of a differential equation with rational coefficients using only polynomial operations. Burcin will implement this method _soon_. 


## Hypergeometric Functions

**People:** Flavia Stan, **Fredrik Johansson**, Zaf 

Add a hypergeometric function class + simplifications 

A patch (needs further work) is available here: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2516">http://trac.sagemath.org/sage_trac/ticket/2516</a> 


## Dynamic attributes for classes derived from Function

**People:** Simon, Burcin 

See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9556">Trac #9556</a> for this as well as an additional implementation using dynamic classes. 

Let `f` be an instance of a subclass of `BuiltinFunction`, and let `t` be obtained by calling `f(a,b,c)`. According to Burcin, for implementing hypergeometric functions it would be useful to be able to access the methods (say, 'foo') of `f` that are not methods of `BuiltinFunction`, so that calling `t.foo()` is the same as `f.foo(a,b,c)`.  

Of course, it would be nice to have 'foo' show up in tab completion and in `dir(t)`. The code we wrote seems to solve it, and should be posted to trac after adding some doctests. Here is an example. Let `ExampleBuiltin(BuiltinFunction)` be a class that defines a method 
```txt
    def some_function_name(self, *args):
        print self
        print args
        return len(args)
```
Then, one can do 
```txt
sage: ex_func = ExampleBuiltin()
sage: t = ex_func(x,x+1, x+2)
# introspection:
sage: 'some_function_name' in dir(t)
True
# tab completion
sage: import sagenb.misc.support as s
sage: s.completions('t.some', globals(), system='python')
['t.some_function_name']
# intended usage
sage: t.some_function_name()
ex_func
(x, x + 1, x + 2)
3
```

## (done/needs review) Plural support

**People:** **Oleksandr Motsak, Alexander Dreyer**, Burcin Erocal, Simon King, Burkhard 

Goal: add support for noncommutative Singular algebras: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4539">#4539</a>. 

Our <a class="http" href="http://trac.sagemath.org/sage_trac/attachment/ticket/4539/plural-wrapper-2010-07-22.patch">final folded patch</a> needs review. 

**Please review!** 

Note that it assumes the latest Singular (due to <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8059">#8059</a>). 


## Parallel Integration

**People:** **Stefan Boettner**, Ralf, Burkhard, Burcin Erocal 

Integrate Stefan Boettner's parallel integration code in Sage. There are several prerequisites for this, such as 

* algebraic function fields (transcendence degree > 1) 
* differential rings/fields 
* proper to_polynomial(), to_rational() functions for symbolic expressions 

## Number Fields

* **People:** **William Stein**, Sebastian Pancratz 
Rewrite/refactor number fields so they can use FLINT and Singular, etc. for arithmetic, which will lead to cleaner code and massive, massive speedups.   See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9541">trac 9541</a>. 


## Function Fields

The goal of this project is to get the basic infrastructure for function fields into Sage.   See <a href="/daysff/curves">Hess's papers and talks</a>. 

People: **William Stein**, Sebastian P. 

* Trac 9054: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9054">Create a class for basic function_field arithmetic for Sage</a> 
* Trac 9069: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9069">Weak Popov Form (reduction algorithm)</a> 
* Trac 9094: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9094">is_square and sqrt for polynomials and fraction fields</a> 
* Trac 9095: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9095">Heights of points on elliptic curves over function fields</a> 
Make sure to see <a href="/daysff/curves">this page for more links</a>. 


## Fast linear algebra over small extensions of GF(2)

**People**: Martin Albrecht 

Implement fast-ish linear algebra over GF(2^n) for n small. 

<a href="/days24/projects/gf2e">project page</a> 


## Generating Stuff

**People:** Robert Miller (self-determination!) 

Now there is a trac ticket: 

<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9559">trac ticket #9559</a> 


## Fix sage.functions

**People:** **Frederik**, William Stein, Harald 

Move the remaining special functions in `sage.functions` to the new symbolics framework based on Pynac. This will make them work with symbolic input and be included in symbolic expressions. 

This task provides several small tasks to get acquainted with the symbolics framework. Some examples: 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9130">#9130</a> Access to beta function 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/3401">#3401</a> extend li to work with complex arguments 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7357">#7357</a> add non offset logarithmi 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8383">#8383</a> make symbolic versions of moebius, sigma and euler_phi 
* erf: 
      * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8983">http://trac.sagemath.org/sage_trac/ticket/8983</a> erf(0) should return 0 
      * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1173">http://trac.sagemath.org/sage_trac/ticket/1173</a> implement numerical evaluation of erf at complex arguments 
      * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8568">http://trac.sagemath.org/sage_trac/ticket/8568</a> cannot simplify derivative of erf 
* bessel: 
      * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/3426">http://trac.sagemath.org/sage_trac/ticket/3426</a> bessel_K function is broken 
      * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4320">http://trac.sagemath.org/sage_trac/ticket/4320</a> implement arbitrary precision Bessel Y 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4498">http://trac.sagemath.org/sage_trac/ticket/4498</a> symbolic arg function 

## Easy ripping apart of symbolic expression trees

**People:** **Burcin**, Thomas, Stefan, Frederik 

We plan to use `__getitem__` to access operands of symbolic expressions, and `.index[i:dim]` for indexed expressions. Tuple arguments to `__getitem__` will be equivalent to recursive calls, i.e., `t[1,1,2] = t[1][1][2]`. 

There is a preliminary implementation of `__getitem__` (which is commented out) already in `sage.symbolic.expression.Expression`. Uncommenting this leads to a few doctest errors, since symbolic expressions are now interpreted as iterable objects. 


## (done) Matrix group actions on polynomials

**People:** Simon 

(review needed for <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4513">4513</a>) So far, a matrix group could act on, e.g., vectors. If it tried to act on something else, it always tried to do a matrix multiplication - which is not what we want for an action on polynomials! The patch in trac allows to do: 
```txt
sage: M = Matrix(GF(3),[[1,2],[1,1]])
sage: N = Matrix(GF(3),[[2,2],[2,1]])
sage: G = MatrixGroup([M,N])
sage: m = G.0
sage: n = G.1
sage: R.<x,y> = GF(3)[]
# left action on polynomial
sage: m*x
x + y
# right action on polynomial
sage: x*m
x - y
# it really is left/right action!
sage: (n*m)*x == n*(m*x)
True
sage: x*(n*m) == (x*n)*m
True

# Action on vectors and matrices still works as it used to do
sage: x = vector([1,1])
sage: x*m
(2, 0)
sage: m*x
(0, 2)
# again, verify left/right action
sage: (n*m)*x == n*(m*x)
True
sage: x*(n*m) == (x*n)*m
True
sage: x = matrix([[1,2],[1,1]])
sage: x*m
[0 1]
[2 0]
sage: m*x
[0 1]
[2 0]
sage: (n*m)*x == n*(m*x)
True
sage: x*(n*m) == (x*n)*m
True
```

## (done) Port the trial division example from William's cython talk from 'unsigned long' to 'mpz_t'

**People:** Thomas 

This was a nice short exercise that I did during/after the cython tutorial to get a bit into cython. This is not a real coding sprint project, but code that I still want to share. 


```txt
%cython
from sage.libs.gmp.mpz cimport mpz_t, mpz_init_set, mpz_init, mpz_cmp_ui, mpz_fdiv_ui, mpz_mul, mpz_cmp, mpz_mod, mpz_clear, mpz_add_ui, mpz_init_set_ui
from sage.rings.integer cimport Integer

include "../ext/stdsage.pxi"

def trial_division_cython5(n):
    cdef Integer nn = <Integer>n
    cdef mpz_t nm
    mpz_init_set(nm, nn.get_value())
    cdef Integer r = PY_NEW(Integer)
    
    if not mpz_cmp_ui(nm, 1): return 1
    cdef unsigned long p
    if mpz_fdiv_ui(nm, 2) == 0: return 2
    if mpz_fdiv_ui(nm, 3) == 0: return 3
    if mpz_fdiv_ui(nm, 5) == 0: return 5
    # Algorithm: only trial divide by numbers that
    # are congruent to 1,7,11,13,17,29,23,29 mod 30=2*3*5.
    cdef unsigned long dif[8]
    dif[0]=6;dif[1]=4;dif[2]=2;dif[3]=4;dif[4]=2;dif[5]=4;dif[6]=6;dif[7]=2
    cdef unsigned long int i = 1
    
    cdef mpz_t m, m2
    mpz_init_set_ui(m, 7)
    mpz_init(m2)
    mpz_mul (m2, m, m)
    while mpz_cmp(m2, nm) <= 0:
        mpz_mod(m2, nm, m)
        if mpz_cmp_ui(m2, 0) == 0:
            r.set_from_mpz(m)
            mpz_clear(m)
            mpz_clear(m2)
            return r
        mpz_add_ui(m, m, dif[i])
        i = (i+1) % 8
        mpz_mul (m2, m, m)
    mpz_clear(m)
    mpz_clear(m2)
    return n
```
For n = 2011*201100000382049576589326756327967 (which is too large for an unsigned long), this code achieves about 50 µs compared to 2ms with the sage.rings.arith.trial_division function. 

For the example from the tutorial, it takes about 45µs, which is significantly slower than the 'unsigned long' example, but still a lot faster than sage.rings.arith.trial_division. 


## (needs review) Patching Python: Sage-wide deactivation of setup-py's treamtment of user-defined installation prefixes

**People:** Alexander Dreyer The python install programs (`setup.py` using `distutils`) suffer from the problem, that it picks the prefix from the ~/.pydistutils.cfg, which may point toi the user's python-path instead those of Sage. Therefore, we need a way for Sage-wide deactiving this feature. 

See: <a href="http://trac.sagemath.org/sage_trac/ticket/9536">http://trac.sagemath.org/sage_trac/ticket/9536</a> I backported the handling of setup.py --no-user-cfg from Python 2.7 to Python 2.6.4 and also added the handling of the environment variable DISTUTILS_NO_USER_CFG to python's distutils. 

The new spkg can be found here:  <a href="http://sage.math.washington.edu/home/dreyer/suse101/python-2.6.4.p10.spkg">http://sage.math.washington.edu/home/dreyer/suse101/python-2.6.4.p10.spkg</a> 

The last patch adds this variable to sage-env.  


## Recursive polynomials for SAGE

**People:** Thomas Bächler 

The Singular-based polynomial ring in SAGE uses a distributive polynomial representation, which is not optimal for multiplication. A goal is to implement a recursively represented polynomial ring into SAGE. 

The <a href="/CanonicalForm">CanonicalForm</a> class in Sigular's factory implements such a representation. A proof-of-concept implementation that supports addition, substraction, negation, multiplaction and exponentiation, as well as coerction from ZZ has been finished. 

Factory is very developer-unfriendly, thus a lot of technical hacks had to be applied, and a modified Singular package had to be used - this is not really in a state that makes it fit for being applied to SAGE's Singular spkg. (The kinds of problems that occur are very technical and partially specific to the GNU/Linux dynamic linker, I'll post details later). 

Timings of the proof-of-concept implementation for the multiplication of two dense random polynomials in four variables of total degree 25 (each about 23.000 terms): 

* Maple: 678s (11m, 18s) 
* sage.rings.polynomials.MPolynomial_libsingular: 91s 
* sage.rings.polynomials.MPolynomial_factory: 22s 
Multiplying ((x+y+z+1)<sup>50)*((x+y+z+1)</sup>50+1): 

* Maple: 1232s 
* sage.rings.polynomials.MPolynomial_libsingular: 603s 
* sage.rings.polynomials.MPolynomial_factory: 234s 
* Mathematica (different machine, a bit faster): 5s (!) 
* Magma (yet another different machine, also a bit faster): 143s 
By the way, exponentiation is _very_ slow in MPolynomial_factory, much slower than in MPolynomial_libsingular. Factory's <a href="/CanonicalForm">CanonicalForm</a> uses square-and-multiply, while Singular uses binomial coefficients to generate (head+tail)^n. I doubt this can be easily improved in factory. 

Preliminary conclusion: Investigating this further is definitely worthwhile. However, due to the various technical problems with Singular/factory, it would be good to find an actively-developped and fast library with a well-designed API - maybe it is best to wait until FLINT2 has viable multivariate multiplication code (which is on the roadmap for the release). 


## Lecture Scheduler

**People:** Harald Schilly 

One of my pet projects is a MILP model to schedule lectures at a university. Since we ship a MILP solver, we should  enable Sage to be able to do this, too. See <a class="http" href="http://sagenb.org/home/pub/2275/">here</a> for an example session. An additional idea is to build something similar for scheduling talks at conferences. 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9586">Lecture Scheduler ticket</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9587">Conference Scheduler ticket</a> 