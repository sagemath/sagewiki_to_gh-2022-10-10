= Sage Days 24 Coding Sprint Projects =

This is a list of projects suitable for [[days24|Sage Days 24]]. Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this).

<<TableOfContents>>

== GIAC Factoring ==

'''People:''' Thomas, Burcin, Richard, William Stein (total anarchy, no leader!)

== Kovacic's Algorithm ==

'''People:''' '''Burcin''', Erocal, Felix

Implement Kovacic's algorithm in Sage.

== Hypergeometric Functions ==

'''People:''' Flavia Stan, Karen Kohl, '''Fredrik Johansson''', Zaf

Add a hypergeometric function class + simplifications

== Dynamic attributes for classes derived from Function ==

'''People:''' Simon, Burcin

Let {{{f}}} be an instance of a subclass of {{{BuiltinFunction}}}, and let {{{t}}} be obtained by calling {{{f(a,b,c)}}}. According to Burcin, for implementing hypergeometric functions it would be useful to be able to access the methods (say, 'foo') of {{{f}}} that are not methods of {{{BuiltinFunction}}}, so that calling {{{t.foo()}}} is the same as {{{f.foo(a,b,c)}}}. 

Of course, it would be nice to have 'foo' show up in tab completion and in {{{dir(t)}}}. The code we wrote seems to solve it, and should be posted to trac after adding some doctests. Here is an example.
Let {{{ExampleBuiltin(BuiltinFunction)}}} be a class that defines a method
{{{
    def some_function_name(self, *args):
        print self
        print args
        return len(args)
}}}
Then, one can do
{{{
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
}}}

== Plural support ==

'''People:''' '''Oleksandr Motsak''', Burcin Erocal, Alexander Dreyer, Simon King, Burkhard

Add support for Singular's noncommutative component Plural, finish [[http://trac.sagemath.org/sage_trac/ticket/4539|#4539]].

== Parallel Integration ==

'''People:''' '''Stefan Boethner''', Ralf, Burkhard, Burcin Erocal

Integrate Stefan Boettner's parallel integration code in Sage. There are several prerequisites for this, such as
 * algebraic function fields (transcendence degree > 1)
 * differential rings/fields
 * proper to_polynomial(), to_rational() functions for symbolic expressions

== Function Fields ==

The goal of this project is to get the basic infrastructure for function fields into Sage.   See [[daysff/curves|Hess's papers and talks]].

People: '''William Stein''', Sebastian P.

 * Trac 9054: [[http://trac.sagemath.org/sage_trac/ticket/9054|Create a class for basic function_field arithmetic for Sage]]
 * Trac 9069: [[http://trac.sagemath.org/sage_trac/ticket/9069|Weak Popov Form (reduction algorithm)]]
 * Trac 9094: [[http://trac.sagemath.org/sage_trac/ticket/9094|is_square and sqrt for polynomials and fraction fields]]
 * Trac 9095: [[http://trac.sagemath.org/sage_trac/ticket/9095|Heights of points on elliptic curves over function fields]]
 
Make sure to see [[daysff/curves|this page for more links]].

== Fast linear algebra over small extensions of GF(2) ==

'''People''': '''Martin Albrecht''', Ciaran Mullan, Robert Miller, Sebastian P., Thomas

Implement fast-ish linear algebra over GF(2^n) for n small. Here are some preliminary benchmarks.

|| n    || Sage    || NTL *2  || Magma || M4RIE ||
|| 1000 ||   49.49 ||   18.84 || 0.090 || 0.097 ||
|| 2000 ||  429.05 ||  149.11 || 0.510 || 0.529 ||
|| 3000 || 1494.33 ||  526.57 || 1.640 || 2.315 ||

[[days24/projects/gf2e|project page]]

== Generating Stuff ==

'''People:''' Robert Miller (self-determination!)

For a somewhat recent snapshot of what I'm doing (as recent as the last time I updated it...), look:

[[http://sage.math.washington.edu/home/rlmill/graph_gens.patch|PATCH]]

== Fix sage.functions ==

'''People:''' '''Frederik''', William Stein, Harald

== Easy ripping apart of symbolic expression trees ==

'''People:''' '''Burcin''', Thomas, Stefan, Frederik

== (done) Matrix group actions on polynomials ==

'''People:''' Simon

(review needed for [[http://trac.sagemath.org/sage_trac/ticket/4513|4513]])
So far, a matrix group could act on, e.g., vectors. If it tried to act on something else, it always tried to do a matrix multiplication - which is not what we want for an action on polynomials! The patch in trac allows to do:
{{{
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
}}}

== (done) Port the trial division example from William's cython talk from 'unsigned long' to 'mpz_t' ==

'''People:''' Thomas

This was a nice short exercise that I did during/after the cython tutorial to get a bit into cython. This is not a real coding sprint project, but code that I still want to share.

{{{
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
}}}

For n = 2011*201100000382049576589326756327967 (which is too large for an unsigned long), this code achieves about 50 µs compared to 2ms with the sage.rings.arith.trial_division function.

For the example from the tutorial, it takes about 45µs, which is significantly slower than the 'unsigned long' example, but still a lot faster than sage.rings.arith.trial_division.

== Patching Python: Sage-wide deactivation of setup-py's treamtment of user-defined installation prefixes ==

'''People:''' Alexander Dreyer
The python install programs ({{{setup.py}}} using {{{distutils}}}) suffer from the problem, that it picks the prefix from the ~/.pydistutils.cfg, which may point toi the user's python-path instead those of Sage. Therefore, we need a way for Sage-wide deactiving this feature.

See: http://trac.sagemath.org/sage_trac/ticket/9536
I backported the handling of setup.py --no-user-cfg from Python 2.7 to Python 2.6.4 and also added the handling of the environment variable DISTUTILS_NO_USER_CFG to python's distutils.

The new spkg can be found here:  http://sage.math.washington.edu/home/dreyer/suse101/python-2.6.4.p10.spkg

The last patch adds this variable to sage-env. 
