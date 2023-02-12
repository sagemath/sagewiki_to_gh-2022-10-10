

# Sage Doc Day 3

**Saturday, August 30, 2008** 

We will focus mostly on doctests Doc Days 3.   Our goal is to raise the coverage score for the Sage library to 60%, since this is a central goal for September.   We need about 460 new doctests to get to 60% coverage (compared to mabshoff's 3.1.2.alpha3 merge tree as of 10am PST) 


## Meetups


## Names

Add your name here if you're going to be involved, and mention what Sage module you're going to work on! 

* Timothy Clemans, hand-tests for the notebook 
* Michael Abshoff: merging and reviewing patches 

## Modules

Coverage scores by module for sage-3.1.2.alpha2  I made this with the following script run in devel/sage/sage/: 
```txt
#!/usr/bin/python
import os
for D in os.listdir('.'):
    if os.path.isdir(D):
        cmd = "cd %s; sage -coverage .|tail -2"%D
        r = os.popen(cmd).read()
        r = r.lstrip()
        print D.upper() + ": " + r
```

```txt
PROBABILITY: Overall weighted coverage score:  3.0%
Total number of functions:  30

GRAPHS: Overall weighted coverage score:  94.6%
Total number of functions:  478

MISC: Overall weighted coverage score:  45.5%
Total number of functions:  641

PLOT: Overall weighted coverage score:  23.2%
Total number of functions:  626

CATEGORIES: Overall weighted coverage score:  14.4%
Total number of functions:  313

STATS: Overall weighted coverage score:  100.0%
Total number of functions:  41

CRYPTO: Overall weighted coverage score:  69.5%
Total number of functions:  220

GAMES: Overall weighted coverage score:  33.0%
Total number of functions:  3

ALGEBRAS: Overall weighted coverage score:  41.9%
Total number of functions:  313

FINANCE: Overall weighted coverage score:  100.0%
Total number of functions:  85

TESTS: Overall weighted coverage score:  0.0%
Total number of functions:  135

GEOMETRY: Overall weighted coverage score:  87.7%
Total number of functions:  131

CODING: Overall weighted coverage score:  84.9%
Total number of functions:  150

GSL: Overall weighted coverage score:  29.9%
Total number of functions:  80

LFUNCTIONS: Overall weighted coverage score:  52.0%
Total number of functions:  38

PARALLEL: Overall weighted coverage score:  75.0%
Total number of functions:  8

COMBINAT: Overall weighted coverage score:  97.5%
Total number of functions:  2682

QUADRATIC_FORMS: Overall weighted coverage score:  32.0%
Total number of functions:  50

MONOIDS: Overall weighted coverage score:  54.8%
Total number of functions:  87

FUNCTIONS: Overall weighted coverage score:  58.1%
Total number of functions:  412

LIBS: Overall weighted coverage score:  58.1%
Total number of functions:  1116

CALCULUS: Overall weighted coverage score:  53.2%
Total number of functions:  511

MATRIX: Overall weighted coverage score:  64.2%
Total number of functions:  722

SCHEMES: Overall weighted coverage score:  49.3%
Total number of functions:  863

INTERFACES: Overall weighted coverage score:  39.5%
Total number of functions:  1183

SERVER: Overall weighted coverage score:  28.3%
Total number of functions:  995

RINGS: Overall weighted coverage score:  58.1%
Total number of functions:  5267

GROUPS: Overall weighted coverage score:  59.3%
Total number of functions:  462

MEDIA: Overall weighted coverage score:  0.0%
Total number of functions:  26

CATALOGUE:
SETS: Overall weighted coverage score:  81.2%
Total number of functions:  72

NUMERICAL: Overall weighted coverage score:  85.0%
Total number of functions:  7

DATABASES: Overall weighted coverage score:  19.3%
Total number of functions:  221

LOGIC: Overall weighted coverage score:  16.0%
Total number of functions:  18

MODULES: Overall weighted coverage score:  67.8%
Total number of functions:  413

STRUCTURE: Overall weighted coverage score:  35.4%
Total number of functions:  577

EXT: Overall weighted coverage score:  60.1%
Total number of functions:  78

MODULAR: Overall weighted coverage score:  67.2%
Total number of functions:  1347
```

### Files with 0% Coverage

The snapshot is from 3.1.2.alpha2. interfaces looks much better in the soon to be released 3.1.2.alpha3. 

These are all candidates for buggy/dead code. 


```txt
algebras/quaternion_order_element.py: 0% (0 of 8)
algebras/quaternion_order_ideal.py: 0% (0 of 6)
algebras/algebra_order_frac_ideal.py: 0% (0 of 17)
algebras/all.py: 0% (0 of 1)
algebras/algebra_order_ideal.py: 0% (0 of 21)
algebras/free_algebra_quotient_element.py: 0% (0 of 13)
algebras/algebra_ideal.py: 0% (0 of 19)
algebras/algebra_order_element.py: 0% (0 of 13)
algebras/algebra_order_ideal_element.py: 0% (0 of 1)
algebras/algebra_ideal_element.py: 0% (0 of 1)
algebras/quaternion_order_ideal_element.py: 0% (0 of 1)
algebras/algebra_element.py: 0% (0 of 1)
algebras/quaternion_order.py: 0% (0 of 9)
algebras/algebra_order.py: 0% (0 of 16)
all_cmdline.py: 0% (0 of 1)
all.py: 0% (0 of 2)
categories/action.pyx: 0% (0 of 31)
categories/morphism.pyx: 0% (0 of 21)
combinat/posets/lattices.py: 0% (0 of 13)
crypto/cryptosystem.py: 0% (0 of 9)
crypto/mq/mpolynomialsystemgenerator.py: 0% (0 of 10)
crypto/cipher.py: 0% (0 of 9)
databases/install.py: 0% (0 of 8)
databases/conway.py: 0% (0 of 7)
databases/tables.py: 0% (0 of 6)
databases/stein_watkins.py: 0% (0 of 15)
databases/lincodes.py: 0% (0 of 1)
databases/compressed_storage.py: 0% (0 of 7)
databases/kohel.py: 0% (0 of 7)
databases/symbolic_data.py: 0% (0 of 7)
databases/db.py: 0% (0 of 21)
databases/odlyzko.py: 0% (0 of 1)
databases/conv.py: 0% (0 of 8)
databases/bz2Pickle.py: 0% (0 of 4)
databases/gamma0wt2.py: 0% (0 of 7)
databases/db_modular_polynomials.py: 0% (0 of 11)
ext/sig.pyx: 0% (0 of 1)
ext/multi_modular.pyx: 0% (0 of 15)
ext/arith.pyx: 0% (0 of 7)
functions/spike_function.py: 0% (0 of 9)
graphs/linearextensions.py: 0% (0 of 7)
groups/pari_group.py: 0% (0 of 7)
groups/matrix_gps/homset.py: 0% (0 of 3)
groups/group_homset.py: 0% (0 of 6)
gsl/ode.pyx: 0% (0 of 5)
gsl/interpolation.pyx: 0% (0 of 9)
gsl/gsl_array.pyx: 0% (0 of 6)
gsl/callback.pyx: 0% (0 of 1)
interfaces/get_sigs.py: 0% (0 of 3)
interfaces/mupad.py: 0% (0 of 29)
interfaces/lisp.py: 0% (0 of 32)
interfaces/tests.py: 0% (0 of 3)
interfaces/gnuplot.py: 0% (0 of 11)
interfaces/cleaner.py: 0% (0 of 2)
interfaces/povray.py: 0% (0 of 3)
interfaces/gfan.py: 0% (0 of 1)
interfaces/mwrank.py: 0% (0 of 8)
interfaces/tachyon.py: 0% (0 of 4)
interfaces/quit.py: 0% (0 of 3)
interfaces/psage.py: 0% (0 of 13)
interfaces/magma_sim.py: 0% (0 of 1)
libs/linbox/linbox.pyx: 0% (0 of 10)
libs/pari/functional.py: 0% (0 of 191)
libs/pari/gen_py.py: 0% (0 of 2)
libs/pari/bg.py: 0% (0 of 1)
libs/libecm.pyx: 0% (0 of 1)
matrix/benchmark.py: 0% (0 of 29)
matrix/solve.pyx: 0% (0 of 2)
matrix/docs.py: 0% (0 of 3)
matrix/matrix_misc.py: 0% (0 of 1)
matrix/matrix_window.pyx: 0% (0 of 8)
matrix/matrix_integer_sparse.pyx: 0% (0 of 7)
matrix/matrix_integer_2x2.pyx: 0% (0 of 13)
media/channels.pyx: 0% (0 of 1)
media/wav.py: 0% (0 of 25)
misc/mathml.py: 0% (0 of 7)
misc/pager.py: 0% (0 of 2)
misc/sh.py: 0% (0 of 3)
misc/benchmark.py: 0% (0 of 9)
misc/darcs.py: 0% (0 of 23)
misc/multireplace.py: 0% (0 of 1)
misc/typecheck.py: 0% (0 of 7)
misc/cache.py: 0% (0 of 6)
misc/all.py: 0% (0 of 3)
misc/func_persist.py: 0% (0 of 3)
misc/defaults.py: 0% (0 of 3)
misc/cython_c.pyx: 0% (0 of 1)
misc/viewer.py: 0% (0 of 6)
misc/log.py: 0% (0 of 42)
misc/copying.py: 0% (0 of 3)
misc/db.py: 0% (0 of 5)
misc/search.pyx: 0% (0 of 1)
misc/attach.py: 0% (0 of 2)
misc/preparser_ipython.py: 0% (0 of 4)
misc/getusage.py: 0% (0 of 4)
misc/dist.py: 0% (0 of 1)
misc/persist.py: 0% (0 of 4)
misc/profiler.py: 0% (0 of 5)
misc/file_to_worksheet.py: 0% (0 of 1)
modular/hecke/element.py: 0% (0 of 11)
modular/hecke/homspace.py: 0% (0 of 3)
modular/hecke/morphism.py: 0% (0 of 6)
modular/modsym/g1list.py: 0% (0 of 6)
modular/modsym/element.py: 0% (0 of 15)
modular/modsym/modular_symbols.py: 0% (0 of 12)
modular/modsym/ghlist.py: 0% (0 of 6)
modular/modsym/heilbronn.pyx: 0% (0 of 14)
modules/free_module_morphism.py: 0% (0 of 3)
monoids/monoid.py: 0% (0 of 2)
plot/tri_plot.py: 0% (0 of 20)
plot/java3d.py: 0% (0 of 1)
plot/texture.py: 0% (0 of 6)
plot/graph.py: 0% (0 of 80)
plot/plot3dsoya.py: 0% (0 of 15)
quadratic_forms/genera/genus.py: 0% (0 of 34)
rings/field_element.py: 0% (0 of 1)
rings/integer_ring_python.py: 0% (0 of 1)
rings/euclidean_domain.py: 0% (0 of 1)
rings/dedekind_domain.py: 0% (0 of 1)
rings/integral_domain.py: 0% (0 of 1)
rings/padics/padic_lazy_ring_generic.py: 0% (0 of 1)
rings/padics/padic_ring_generic.py: 0% (0 of 6)
rings/padics/padic_lazy_field_generic.py: 0% (0 of 1)
rings/padics/padic_ext_element.pyx: 0% (0 of 1)
rings/padics/padic_extension_generic.py: 0% (0 of 20)
rings/padics/padic_lazy_generic.py: 0% (0 of 2)
rings/padics/rigid_functions.pyx: 0% (0 of 37)
rings/padics/padic_ring_base_generic.py: 0% (0 of 3)
rings/padics/padic_extension_leaves.py: 0% (0 of 8)
rings/padics/capped_relative_generic.py: 0% (0 of 1)
rings/padics/padic_ring_fixed_mod.py: 0% (0 of 5)
rings/padics/lazy_generic.py: 0% (0 of 3)
rings/padics/padic_ring_capped_absolute.py: 0% (0 of 5)
rings/padics/unramified_extension_generic.py: 0% (0 of 20)
rings/padics/padic_field_generic.py: 0% (0 of 14)
rings/padics/capped_absolute_generic.py: 0% (0 of 1)
rings/padics/padic_ring_capped_relative.py: 0% (0 of 5)
rings/padics/fixed_mod_generic.py: 0% (0 of 1)
rings/padics/eisenstein_extension_generic.py: 0% (0 of 26)
rings/padics/misc.py: 0% (0 of 2)
rings/padics/valuation.py: 0% (0 of 114)
rings/padics/padic_lazy_element.py: 0% (1 of 110)
rings/padics/padic_base_generic_element.pyx: 0% (0 of 1)
rings/principal_ideal_domain_element.py: 0% (0 of 1)
rings/bernoulli.py: 0% (0 of 2)
rings/dedekind_domain_element.py: 0% (0 of 1)
rings/big_oh.py: 0% (0 of 1)
rings/coerce_python.py: 0% (0 of 5)
rings/memory.pyx: 0% (0 of 1)
rings/commutative_ring.py: 0% (0 of 1)
rings/number_field/maps.py: 0% (0 of 50)
rings/sparse_poly.pyx: 0% (0 of 41)
rings/field.py: 0% (0 of 1)
rings/ideal_monoid.py: 0% (0 of 6)
rings/real_interval_field.py: 0% (0 of 4)
rings/integral_domain_element.py: 0% (0 of 1)
rings/polynomial/polynomial_fateman.py: 0% (0 of 3)
rings/polynomial/polynomial_compiled.pyx: 0% (0 of 19)
rings/commutative_ring_element.py: 0% (0 of 1)
rings/commutative_algebra.py: 0% (0 of 1)
rings/euclidean_domain_element.py: 0% (0 of 1)
rings/principal_ideal_domain.py: 0% (0 of 1)
schemes/plane_quartics/quartic_constructor.py: 0% (0 of 1)
schemes/plane_quartics/quartic_generic.py: 0% (0 of 3)
schemes/hyperelliptic_curves/constructor.py: 0% (0 of 1)
schemes/hyperelliptic_curves/hyperelliptic_rational_field.py: 0% (0 of 2)
schemes/hyperelliptic_curves/jacobian_g2.py: 0% (0 of 1)
schemes/hyperelliptic_curves/jacobian_generic.py: 0% (0 of 5)
schemes/hyperelliptic_curves/kummer_surface.py: 0% (0 of 1)
schemes/hyperelliptic_curves/hyperelliptic_g2_generic.py: 0% (0 of 4)
schemes/hyperelliptic_curves/jacobian_constructor.py: 0% (0 of 1)
schemes/jacobians/abstract_jacobian.py: 0% (0 of 6)
schemes/generic/point.py: 0% (0 of 15)
schemes/generic/glue.py: 0% (0 of 3)
schemes/generic/divisor_group.py: 0% (0 of 8)
schemes/generic/hypersurface.py: 0% (0 of 7)
schemes/generic/ambient_space.py: 0% (0 of 16)
schemes/elliptic_curves/sea.py: 0% (0 of 1)
schemes/elliptic_curves/rational_torsion.py: 0% (0 of 3)
schemes/elliptic_curves/kodaira_symbol.py: 0% (0 of 5)
schemes/elliptic_curves/magma_3descent.py: 0% (0 of 2)
schemes/elliptic_curves/mod5family.py: 0% (0 of 1)
schemes/elliptic_curves/padic_height.py: 0% (0 of 6)
schemes/elliptic_curves/ell_padic.py: 0% (0 of 3)
server/notebook/applet.py: 0% (0 of 2)
server/notebook/colorize.py: 0% (0 of 4)
server/notebook/js.py: 0% (0 of 10)
server/notebook/tutorial.py: 0% (0 of 1)
server/notebook/wiki2html.py: 0% (0 of 60)
server/notebook/keyboards.py: 0% (0 of 10)
server/notebook/avatars.py: 0% (0 of 12)
server/notebook/register.py: 0% (0 of 3)
server/notebook/smtpsend.py: 0% (0 of 5)
server/notebook/user_db.py: 0% (0 of 3)
server/notebook/worksheet_conf.py: 0% (0 of 1)
server/notebook/compress/SourceMap.py: 0% (0 of 4)
server/notebook/compress/BaseConvert.py: 0% (0 of 3)
server/notebook/compress/JavaScriptCompressor.py: 0% (0 of 15)
server/notebook/gnutls_socket_ssl.py: 0% (0 of 5)
server/notebook/run_notebook.py: 0% (0 of 6)
server/notebook/jquery.py: 0% (0 of 4)
server/notebook/mailsender.py: 0% (0 of 10)
server/notebook/template.py: 0% (0 of 5)
server/notebook/server_conf.py: 0% (0 of 1)
server/notebook/user_conf.py: 0% (0 of 1)
server/notebook/conf.py: 0% (0 of 6)
server/notebook/guard.py: 0% (0 of 31)
server/trac/trac.py: 0% (0 of 2)
server/introspect.py: 0% (0 of 4)
server/wiki/moin.py: 0% (0 of 4)
sets/primes.py: 0% (0 of 7)
structure/element_py.py: 0% (0 of 1)
structure/element_verify.py: 0% (0 of 10)
structure/nonexact.py: 0% (0 of 3)
structure/wrapper_parent.pyx: 0% (0 of 13)
structure/gens_py.py: 0% (0 of 2)
tests/benchmark.py: 0% (0 of 135)
```