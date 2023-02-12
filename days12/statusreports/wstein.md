

# William Stein's Status Report for Sage Days 12


## I fixed the following bugs:


### Math

* #1234 -- analytic_rank crashes: fix use mwrank 
* #1867 -- factoring multivariate polynomials over finite fields is broken in Singular: wrote code to reduce to GF(p) case, then found that even that is buggy in Singular, _much to my surprise_. 
* #2020 -- change an error message when running a certain command and the elliptic curve database is too small: make a clean workaround. 
* #2601 -- problem with _mpoly_dict_recursive: had to understand some crazy code for multivariate polynomials, then fix it; a pretty serious bug... 
* #3544 -- <a href="/PermutationGroup">PermutationGroup</a> is_transitive broken: changed wrapping of a Gap function and documented better 
* #4274 -- assertion failure in rank for elliptic curves 
* #5001 -- kernels of integer matrices 
* #5092 -- `Primes()??` gets hung in len call; also bring coverage to 100% for primes.py 

### Graphics

* #2858 -- parametric_plot3d throws an error when the sum of the components cancels a variable: fixed by rewriting to check if is a <a href="/CallableSymbolicExpression">CallableSymbolicExpression</a>. 
* #4818 -- bug in list_plot3d -- invalid index: easy 

### System and Build

* #773 -- SAGE drops . from path: fixed by patching around a nasty bug in pexpect 
* #2129 -- implement "sage -t" for .spyx files; also fixed testing of .py, .sage, .pyx when out of tree to import file, build file, etc.  
* #2861 -- scripts do not exit with correct exit code when sys.exit() is used: i learned that `sys.exit(os.system('...')>>8)` !! 
* #4029 -- sage-env kills the shell when called from "wrong" directory: break sage-env into two files 
* #4734 -- sage -notebook option now broken: wrote something to wrap inputs 
* #4971 -- make get_memory_usage() return a float on all platforms 
* #4936 -- massive bloat: make something delete everything in ~/.sage/gap > 1 week old and untouched: fixed by modifying gap.py to do that. 
* #5041/4955 -- make it so the magma .sig files in extcode don't get written there by magma: fixed by copying files to a temp dir then loading 
* #5044 -- on some systems mwrank dumps core and crashes on exit when run under pexpect: fixed with kill -9 
* #5045 -- sage's "make check" should check that the sage build flags (in sage-flags.txt) are right; done, and involved fixing also a bunch of stupid broken return codes 

### Doctesting

* #3871 -- do not save pngs in SAGE_ROOT; extending #3759 -- pretty easy; just clean up using grep 
* #4588 -- doctest -- get rid of the "feature" where docstrings with require, optional, and package all in them are automatically marked optional: deleted that "feature", then spent "hours" putting #optionals in. 
* #4665 -- sage/misc/cython.py creates file sage/misc/hello.spyx in tree while doctesting: just fix that doctest (easy) 
* #5068 -- change_ring fails for polynomials over finite fields in many cases: subtle caching issues with finite fields, etc.  