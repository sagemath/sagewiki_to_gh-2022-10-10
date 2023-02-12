

# Muppy Session


```txt
sage: get_memory_usage()
413.3515625
sage: for i in range(10):
....:         m = ModularSymbols(501,2).decomposition(3); 
....:     del m; ModularSymbols_clear_cache(); 
....:     get_memory_usage()
....: 
468.109375
491.76171875
514.79296875
537.8359375
560.86328125
583.88671875
607.765625
630.2421875
653.265625
676.29296875
sage: print "WTF?"


mabshoff@sage:/scratch/mabshoff/release-cycle/sage-3.1.3.final$ ./sage -sh

Starting subshell with Sage environment variables set.
Be sure to exit when you are done and do not do anything
with other copies of Sage!

mabshoff@sage:/scratch/mabshoff/release-cycle/sage-3.1.3.final$ cd ..
mabshoff@sage:/scratch/mabshoff/release-cycle$ mkdir muppy
mabshoff@sage:/scratch/mabshoff/release-cycle$ cd muppy/
mabshoff@sage:/scratch/mabshoff/release-cycle/muppy$ wget http://pypi.python.org/packages/source/m/muppy/muppy-0.1a2.tar.gz#md5=c963268ee88ae083ad3e8bc5044791a3
--12:08:02--  http://pypi.python.org/packages/source/m/muppy/muppy-0.1a2.tar.gz
           => `muppy-0.1a2.tar.gz'
Resolving pypi.python.org... 82.94.164.163
Connecting to pypi.python.org|82.94.164.163|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 128,402 (125K) [application/x-gzip]

100%[===============================================================================================================================================>] 128,402      150.42K/s             

12:08:04 (150.06 KB/s) - `muppy-0.1a2.tar.gz' saved [128402/128402]

mabshoff@sage:/scratch/mabshoff/release-cycle/muppy$ tar xjf muppy-0.1a2.tar.gz 
bzip2: (stdin) is not a bzip2 file.
tar: Child returned status 2
tar: Error exit delayed from previous errors
mabshoff@sage:/scratch/mabshoff/release-cycle/muppy$ tar xzf muppy-0.1a2.tar.gz 
mabshoff@sage:/scratch/mabshoff/release-cycle/muppy$ cd muppy-0.1a2
mabshoff@sage:/scratch/mabshoff/release-cycle/muppy/muppy-0.1a2$ ls -la
total 48
drwxr-xr-x 5 mabshoff 1090  4096 2008-08-12 03:13 .
drwxr-xr-x 3 mabshoff 1090  4096 2008-11-09 12:08 ..
drwxr-xr-x 6 mabshoff 1090  4096 2008-08-12 03:13 doc
-rw-r--r-- 1 mabshoff 1090 11358 2008-08-06 05:23 LICENSE
drwxr-xr-x 3 mabshoff 1090  4096 2008-08-12 03:13 muppy
-rw-r--r-- 1 mabshoff 1090   404 2008-08-06 05:23 NOTICE
-rw-r--r-- 1 mabshoff 1090  1222 2008-08-12 03:13 PKG-INFO
-rw-r--r-- 1 mabshoff 1090   204 2008-08-11 09:18 README
-rw-r--r-- 1 mabshoff 1090  2481 2008-08-12 03:06 setup.py
drwxr-xr-x 2 mabshoff 1090  4096 2008-08-12 03:13 test
mabshoff@sage:/scratch/mabshoff/release-cycle/muppy/muppy-0.1a2$ python setup.py install
running install
running build
running build_py
creating build
creating build/lib
creating build/lib/muppy
copying muppy/refbrowser_gui.py -> build/lib/muppy
copying muppy/muppy.py -> build/lib/muppy
copying muppy/tracker.py -> build/lib/muppy
copying muppy/__init__.py -> build/lib/muppy
copying muppy/summary.py -> build/lib/muppy
copying muppy/refbrowser.py -> build/lib/muppy
copying muppy/mprofile.py -> build/lib/muppy
copying muppy/metadata.py -> build/lib/muppy
creating build/lib/muppy/utils
copying muppy/utils/__init__.py -> build/lib/muppy/utils
copying muppy/utils/asizeof.py -> build/lib/muppy/utils
running install_lib
creating /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/refbrowser_gui.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/muppy.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/tracker.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/__init__.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/summary.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/refbrowser.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/mprofile.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
copying build/lib/muppy/metadata.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy
creating /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/utils
copying build/lib/muppy/utils/__init__.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/utils
copying build/lib/muppy/utils/asizeof.py -> /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/utils
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/refbrowser_gui.py to refbrowser_gui.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/muppy.py to muppy.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/tracker.py to tracker.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/__init__.py to __init__.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/summary.py to summary.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/refbrowser.py to refbrowser.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/mprofile.py to mprofile.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/metadata.py to metadata.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/utils/__init__.py to __init__.pyc
byte-compiling /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy/utils/asizeof.py to asizeof.pyc
running install_egg_info
Writing /scratch/mabshoff/release-cycle/sage-3.1.3.final/local/lib/python2.5/site-packages/muppy-0.1a2-py2.5.egg-info
mabshoff@sage:/scratch/mabshoff/release-cycle/muppy/muppy-0.1a2$ cd ../../sage-3.1.3.final/
mabshoff@sage:/scratch/mabshoff/release-cycle/sage-3.1.3.final$ ./sage
----------------------------------------------------------------------
| Sage Version 3.2.alpha2, Release Date: 2008-10-31                  |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------

sage: import muppy
sage: 
sage: all_objects = muppy.get_objects()
sage: len(all_objects)
241386
sage: from muppy import summary
sage: sum1 = summary.summarize(all_objects)
sage: summary.print_(sum1)
                                          types |   # objects |   total size
=============================================== | =========== | ============
                                            str |       76516 |     12689275
                                           dict |        9165 |      7525584
                                           list |        3013 |      6542360
                                          tuple |       81491 |      6420616
                              method_descriptor |        5044 |       322816
                                        weakref |        3436 |       274880
                             wrapper_descriptor |        2488 |       179136
    instance(<class weakref.WeakKeyDictionary>) |         286 |        85472
                              getset_descriptor |        1221 |        78144
                                        unicode |         220 |        76082
                               module(sage.all) |           1 |        74936
                       module(sage.all_cmdline) |           1 |        74888
                                            int |        2664 |        63936
  module(sage.dsage.dist_functions.dist_factor) |           1 |        56168
                                  module(numpy) |           1 |        25112
sage: from muppy import refbrowser
sage: def foo():
....:         m = ModularSymbols(501,2).decomposition(3); 
....:     del m; ModularSymbols_clear_cache(); 
....:     get_memory_usage()
....: 
sage: foo?
Type:           function
Base Class:     <type 'function'>
String Form:    <function foo at 0x4299f10>
Namespace:      Interactive
File:           /scratch/mabshoff/release-cycle/sage-3.1.3.final/<ipython console>
Definition:     foo()
Docstring:
    x.__init__(...) initializes x; see x.__class__.__doc__ for signature

sage: bar=muppy.get_usage(foo)
---------------------------------------------------------------------------
AttributeError                            Traceback (most recent call last)

/scratch/mabshoff/release-cycle/sage-3.1.3.final/<ipython console> in <module>()

AttributeError: 'module' object has no attribute 'get_usage'
sage: def foo():
....:         m = ModularSymbols(501,2).decomposition(3); del m; ModularSymbols_clear_cache(); get_memory_usage()
....: 
sage: foo()
sage: bar=muppy.get_usage(foo)
---------------------------------------------------------------------------
AttributeError                            Traceback (most recent call last)

/scratch/mabshoff/release-cycle/sage-3.1.3.final/<ipython console> in <module>()

AttributeError: 'module' object has no attribute 'get_usage'
sage: get_memory_usage()
485.1875
sage: for i in range(10):
....:        m = ModularSymbols(501,2).decomposition(3); del m; ModularSymbols_clear_cache(); get_memory_usage()
....: 
498.4375
517.35546875
532.78515625
545.8125
562.06640625
581.51171875
597.58984375
610.60546875
629.6171875
645.66015625
sage: sum2 = summary.summarize(muppy.get_objects())
sage: diff = summary.get_diff(sum1, sum2)
 sage:  summary.print_(diff)
                                                       types |   # objects |   total size
============================================================ | =========== | ============
                                                        list |       15216 |     16260520
                                                        dict |       14993 |      5151760
                                                       tuple |       32241 |      2139440
                                                         str |       17191 |      1377044
    sage.modules.vector_rational_dense.Vector_rational_dense |        6424 |       513920
                                                         int |       20812 |       499488
       <class 'sage.modular.modsym.manin_symbols.ManinSymbol |        8635 |       483560
                                sage.rings.rational.Rational |        5011 |       440968
                                                     unicode |         543 |       105986
  <class 'sage.rings.integer_mod_ring.IntegerModRing_generic |         337 |       105144
   <class 'sage.modular.modsym.element.ModularSymbolsElement |        1243 |        89496
                 <class 'sage.structure.formal_sum.FormalSum |        1243 |        89496
                                                     weakref |         891 |        71280
     sage.matrix.matrix_rational_dense.Matrix_rational_dense |         382 |        61120
                                  sage.rings.integer.Integer |        1215 |        58320
sage: diff[:30]

[['list', 15216, 16260520],
 ['dict', 14993, 5151760],
 ['tuple', 32241, 2139440],
 ['str', 17191, 1377044],
 ['sage.modules.vector_rational_dense.Vector_rational_dense', 6424, 513920],
 ['int', 20812, 499488],
 ["<class 'sage.modular.modsym.manin_symbols.ManinSymbol", 8635, 483560],
 ['sage.rings.rational.Rational', 5011, 440968],
 ['unicode', 543, 105986],
 ["<class 'sage.rings.integer_mod_ring.IntegerModRing_generic", 337, 105144],
 ["<class 'sage.modular.modsym.element.ModularSymbolsElement", 1243, 89496],
 ["<class 'sage.structure.formal_sum.FormalSum", 1243, 89496],
 ['weakref', 891, 71280],
 ['sage.matrix.matrix_rational_dense.Matrix_rational_dense', 382, 61120],
 ['sage.rings.integer.Integer', 1215, 58320],
 ["<class 'sage.modules.free_module.FreeModule_submodule_field", 195, 53040],
 ['sage.rings.integer_mod.IntegerMod_int', 675, 48600],
 ['sage.matrix.matrix_integer_dense.Matrix_integer_dense', 233, 31688],
 ['sage.rings.integer_mod.NativeIntStruct', 337, 29656],
 ["<class 'sage.modular.modsym.subspace.ModularSymbolsSubspace", 99, 26928],
 ["<class 'sage.rings.ideal.Ideal_pid", 337, 24264],
 ['sage.structure.mutability.Mutability', 673, 21536],
 ["<class 'sage.modules.free_module_homspace.FreeModuleHomspace", 80, 17920],
 ["<class 'sage.structure.sequence.Sequence", 209, 16720],
 ["<class 'sage.matrix.matrix_space.MatrixSpace_generic", 57, 15048],
 ['sage.libs.pari.gen.gen', 144, 11520],
 ['long', 333, 10656],
 ['sage.categories.action.PrecomposedAction', 80, 9600],
 ['wrapper_descriptor', 104, 7488],
 ['sage.categories.morphism.CallMorphism', 81, 7128]]
```