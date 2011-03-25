Use this page to keep track of the bugs fixed during Sage Days 29.

  * William Stein:
     * [[http://trac.sagemath.org/sage_trac/ticket/10937|10937 -- bug in Dokchitser L.init_Johncoeffs]]  (positive review -- Robert Bradshaw)
     * [[http://trac.sagemath.org/sage_trac/ticket/10975|10975 -- creation of certain prime finite fields is double dog slow (compared to Magma)]] (positive review -- David Roe)
     * [[http://trac.sagemath.org/sage_trac/ticket/9705|9705 -- trouble with long lines in notebook magma mode]] (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/8998|8998 -- galois_action on cusps has a bug]] (positive review)
     * [[http://trac.sagemath.org/sage_trac/ticket/11007|11007 -- heegner points -- a nonsquarefree case]] (not finished)
     * [[http://trac.sagemath.org/sage_trac/ticket/10836|10836 -- primitive root is broken]] (positive review)

  * Rob Beezer:
     * [[http://trac.sagemath.org/sage_trac/ticket/10974|10974 -- Overhaul, fix matrix augment, stack]]  (positive review -- Keshav Kini)
     * [[http://trac.sagemath.org/sage_trac/ticket/10470|10470 -- Don't list infinite vector spaces]] (positive review -- John Palmieri)
     * [[http://trac.sagemath.org/sage_trac/ticket/10545|10545 -- Add the outer product of two vectors]] (positive -- John Palmieri)
     * [[http://trac.sagemath.org/sage_trac/ticket/10737|10737 -- Extended echelon form]] (positive review -- John Palmieri)
     * [[http://trac.sagemath.org/sage_trac/ticket/10977|10977 -- Document vector constructor behavior]] (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/11004|11004 -- make subdivisions optional for tensor products of matrices]] (positive review -- John Palmieri)
  * John Palmieri:
     * [[http://trac.sagemath.org/sage_trac/ticket/4983|4983 -- replace subdivisions attribute for matrices with a function]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/7105|7105 -- open search results in new tabs]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/9960|9960 -- require SAGE_CHECK to be "yes"]] (positive review -- Leif Leonhardy, Ivan Andrus, David Kirkby).  This patch also fixes [[http://trac.sagemath.org/sage_trac/ticket/4029|4029 -- sage-env kills the shell when called from "wrong" directory]].
     * [[http://trac.sagemath.org/sage_trac/ticket/10752|10752 -- matrix pivots should be immutable]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10822|10822 -- sage -sh doesn't set the path right if default shell is zsh on OSX]] (needs review)
  * Rob Beezer and John Palmieri:
     * [[http://trac.sagemath.org/sage_trac/ticket/10595|10595 -- vector constructor fails on empty list]] (positive review -- Dmitrii Pasechnik, Rob Beezer, and John Palmieri)
  * Martin Raum:
     * [[http://trac.sagemath.org/sage_trac/ticket/5731|5731 -- update to NTL 5.5.2]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/10553|10553 -- Review: Diamond bracket operators are terribly slow]] (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/8614|8614 -- Optimize creation of modular symbols spaces by speeding up quotienting out by 2-term relations]] (under review by John Cremona)
     * [[http://trac.sagemath.org/sage_trac/ticket/4578|4578 -- Optimize modular symbols decomposition algorithm]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/10987|10987 -- Add optional arguement to decomposition_of_subspace making restrict not check the subspace]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/6670|6670 -- Port group algebras to the current coercion system]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/11017|11017 -- GP blocks files when reallocating memory; Workaround]] (positive review by John Cremona)
     * [[http://trac.sagemath.org/sage_trac/ticket/11024|11024 -- Update Dokchitser calculator to compiled version]] (under review by John Cremona)
     * [[http://trac.sagemath.org/sage_trac/ticket/10863|10863 -- Review: Add check for orthogonal/unitary matrices]]  (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/10802|10802 -- Review: Singular values of matrices over CDF]] (positive review -- Martin Raum)
  * Moritz Minzlaff:
     * [[http://trac.sagemath.org/sage_trac/ticket/9053|9053 -- fixes computation of pivots]] (positive review -- Keshav Kini)
  * Maarten Derickx:
     * [[http://trac.sagemath.org/sage_trac/ticket/10570|10570 -- sage leaves a lot of stackframes alive at startup]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/10933|10933 -- time fails inside function]] (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/9094|9094 -- is_square and sqrt for polynomials and fraction fields]] (positive review -- Robert Bradshaw)
  * Robert Bradshaw
     * [[http://trac.sagemath.org/sage_trac/ticket/10548|10548 -- The coercion model is keeping references to tracebacks which causes memory leaks.]] (positive review -- Maarten Derickx)
  * Robert Miller
     * [[http://trac.sagemath.org/sage_trac/ticket/11033|11033 -- Fixes bugs in automorphism groups of linear codes.]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/10994|10994 -- Bug in permutation_automorphism_group for linear codes.]] (fixed by #11033)
     * [[http://trac.sagemath.org/sage_trac/ticket/11032|11032 -- automorphism_group_binary_code crashes Sage when it can't allocate enough memory.]] (fixed by #11033)
     * [[http://trac.sagemath.org/sage_trac/ticket/10976|10976 -- computing order of a certain subgroup of a permutation group is double dog slow (compared to Magma)]] worked on [[http://trac.sagemath.org/sage_trac/ticket/10804|10804]] which implements the first round of data structures designed to replace GAP in computations of this type
  * Simon Spicer:
     * [[http://trac.sagemath.org/sage_trac/ticket/9028| 9028 -- Review: Basic Stats - Standard Deviation]] (positive review -- Simon Spicer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10799| 10799 -- Review: Solved the problem to compute resultants on certain variable orders]] (positive review -- Simon Spicer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10601|10601 -- Fixed the QuaternionAlgebra constructor to accept Python ints, longs and floats as input.]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/9306|9306 -- Alters the round() command to defer to an element's .round() method if no precision is specified.]] (positive review -- Keshav Kini)
     * [[http://trac.sagemath.org/sage_trac/ticket/10761|10761 -- Fixed numerical_approx() when called on complex-valued AlgebraicNumbers]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10794|10794 -- Review: QR decomposition for matrices over exact rings]] (positive review -- Simon Spicer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10934|10934 -- Review: Implement is_maximal() for ideals of quotient rings of ZZ]] (positive review -- Simon Spicer)
  * Chris Swierczewski:
    *  [[http://trac.sagemath.org/sage_trac/ticket/6371|6371 -- Implement Riemann theta functions]] (needs review)
 
  * Gagan Sekhon
    *[[http://trac.sagemath.org/sage_trac/ticket/10832|10832 -- Simon 2-descent (all the work was done by Cremona, I just fixed some doctest)]] (positive review -- Jamie Weigandt)

  * John Cremona
    * [[http://trac.sagemath.org/sage_trac/ticket/10840|10840 -- bug in saturation for elliptic curves over Q]] (positive review by Gagan Sekhon)
    * [[http://trac.sagemath.org/sage_trac/ticket/10999|10999 -- Elliptic curve generators from the database lie on the wrong curve]] (needs review)
    * Enhancement: [[http://trac.sagemath.org/sage_trac/ticket/11005|11005 -- Update Simon's GP scripts and convert to use via gp2c]] (under review by Martin Raum)

  * Justin Walker
    * [[http://trac.sagemath.org/sage_trac/ticket/4120|4120 -- New code for binary quadratic forms]] (under review by John Cremona)
    * [[http://trac.sagemath.org/sage_trac/ticket/10521|10521 -- bug in integral_points (for elliptic curves over Q)]] (May be fixed by 10973)
    * [[http://trac.sagemath.org/sage_trac/ticket/10973|10973 -- Integral points on elliptic curves over number fields]] (Close, but needs work)

  * Michael Droettboom
    * [[http://trac.sagemath.org/sage_trac/ticket/8125|8125 -- problem with "text" in matplotlib]] Fixed in matplotlib
    * [[http://trac.sagemath.org/sage_trac/ticket/10717|10717 -- Prime typeset badly on plots]] Fixed in matplotlib
    * [[http://trac.sagemath.org/sage_trac/ticket/10980|10980 -- Make sure symbolic gridline values are okay]] Fixed in matplotlib
    * [[https://sourceforge.net/tracker/index.php?func=detail&aid=3236567&group_id=80706&atid=560720|mpl 3236567 -- backend_wx draws images at wrong position]]  Fixed in matplotlib
  * Ivan Andrus
    * [[http://trac.sagemath.org/sage_trac/ticket/11000|11000 -- GAP interface doesn't handle input with multiple lines correctly]] (positive review -- Keshav Kini)
    * [[http://trac.sagemath.org/sage_trac/ticket/10469|10469 -- Don't source sage-env more than once]] (positive review -- Ivan Andrus, Keshav Kini, John Palmieri)
    * [[http://trac.sagemath.org/sage_trac/ticket/7766|7766 -- Update valgrind]] (needs review, especially suppressions)
  * Paul Ivanov
    * [[http://sourceforge.net/support/tracker.php?aid=3189536|mpl 3189536 -- radio_buttons example has only one (the last) button active]]  Fixed in matplotlib.
    * (work in progress) mpl 3187864 matplotlib with QGIS memory error on Suse 11.3
    * (work in progress) mpl 3205391  	gtkagg.so hanging plot creation

  * Keshav Kini and Maarten Derickx
    * [[http://trac.sagemath.org/sage_trac/ticket/11008|11008 -- spkg test suite successes are not correctly written to the appropriate file in spkg/installed]] (positive review -- John Palmieri)


  * IPython team (Fernando Perez, Min Ragan-Kelley, Thomas Kluyver) Issues Closed and Pull Requests merged (66)
    * Closed: [[https://github.com/ipython/ipython/issues/3|3]] Implement PBS support in ipcluster
    * Closed: [[https://github.com/ipython/ipython/issues/6|6]] Update the Sphinx docs for the new ipcluster
    * Closed: [[https://github.com/ipython/ipython/issues/9|9]] Getting "DeadReferenceError: Calling Stale Broker" after ipcontroller restart
    * Closed: [[https://github.com/ipython/ipython/issues/15|15]] Implement SGE support in ipcluster
    * Closed: [[https://github.com/ipython/ipython/issues/18|18]] %cpaste freeze sync frontend
    * Closed: [[https://github.com/ipython/ipython/issues/24|24]] ipcluster does not start all the engines
    * Closed: [[https://github.com/ipython/ipython/issues/25|25]] unicode bug - encoding input
    * Closed: [[https://github.com/ipython/ipython/issues/27|27]] generics.complete_object broken
    * Closed: [[https://github.com/ipython/ipython/issues/28|28]] Offer finer control for initialization of input streams
    * Closed: [[https://github.com/ipython/ipython/issues/31|31]] Issues in magic_whos code
    * Closed: [[https://github.com/ipython/ipython/issues/43|43]] Implement SSH support in ipcluster
    * Closed: [[https://github.com/ipython/ipython/issues/44|44]] Merge history from multiple sessions
    * Closed: [[https://github.com/ipython/ipython/issues/46|46]] Input to %timeit is not preparsed
    * Closed: [[https://github.com/ipython/ipython/issues/51|51]] Out not working with ipythonx
    * Closed: [[https://github.com/ipython/ipython/issues/52|52]] Document testing process better
    * Closed: [[https://github.com/ipython/ipython/issues/53|53]] Internal Python error in the inspect module
    * Closed: [[https://github.com/ipython/ipython/issues/58|58]] ipython change char '0xe9' to 4 spaces
    * Closed: [[https://github.com/ipython/ipython/issues/60|60]] Improve absolute import management for iptest.py
    * Closed: [[https://github.com/ipython/ipython/issues/68|68]] Problems with Control-C stopping ipcluster on Windows/Python2.6
    * Closed: [[https://github.com/ipython/ipython/issues/74|74]] Manager() [from multiprocessing module] hangs ipythonx but not ipython
    * Closed: [[https://github.com/ipython/ipython/issues/77|77]] ipython oops in cygwin
    * Closed: [[https://github.com/ipython/ipython/issues/86|86]] Make IPython work with multiprocessing
    * Closed: [[https://github.com/ipython/ipython/issues/88|88]] Error when inputting UTF8 CJK characters
    * Closed: [[https://github.com/ipython/ipython/issues/93|93]] when looping, cursor appears at leftmost point in newline
    * Closed: [[https://github.com/ipython/ipython/issues/100|100]] Overzealous introspection
    * Closed: [[https://github.com/ipython/ipython/issues/108|108]] ipython disables python logger
    * Closed: [[https://github.com/ipython/ipython/issues/109|109]] WinHPCLauncher is a hard dependency that causes errors in the test suite
    * Closed: [[https://github.com/ipython/ipython/issues/111|111]] Iterator version of TaskClient.map() that returns results as they become available
    * Closed: [[https://github.com/ipython/ipython/issues/115|115]] multiline specials not defined in 0.11 branch
    * Closed: [[https://github.com/ipython/ipython/issues/120|120]] inspect.getsource fails for functions defined on command line
    * Closed: [[https://github.com/ipython/ipython/issues/121|121]] If plot windows are closed via window controls, no more plotting is possible.
    * Closed: [[https://github.com/ipython/ipython/issues/126|126]] Can't transfer command line argument to script
    * Closed: [[https://github.com/ipython/ipython/issues/127|127]] %edit does not work on filenames consisted of pure numbers
    * Closed: [[https://github.com/ipython/ipython/issues/130|130]] Deadlock when importing a module that creates an IPython client
    * Closed: [[https://github.com/ipython/ipython/issues/132|132]] Ipython prevent south from working
    * Closed: [[https://github.com/ipython/ipython/issues/133|133]] whitespace after Source introspection
    * Closed: [[https://github.com/ipython/ipython/issues/134|134]] multline block scrolling
    * Closed: [[https://github.com/ipython/ipython/issues/143|143]] Ipython.gui.wx.ipython_view.IPShellWidget: ignores user*_ns arguments
    * Closed: [[https://github.com/ipython/ipython/issues/145|145]] Bug on MSW sytems: idle can not be set as default IPython editor. Fix Suggested.
    * Closed: [[https://github.com/ipython/ipython/issues/182|182]] ipython q4thread in version 10.1 not starting properly
    * Merged: [[https://github.com/ipython/ipython/pull/191|191]] Unbundle external libraries
    * Closed: [[https://github.com/ipython/ipython/issues/196|196]] IPython can't deal with unicode file name.
    * Merged: [[https://github.com/ipython/ipython/pull/199|199]] Magic arguments
    * Closed: [[https://github.com/ipython/ipython/issues/200|200]] Unicode error when starting ipython in a folder with non-ascii path
    * Closed: [[https://github.com/ipython/ipython/issues/201|201]] use session.send throughout zmq code
    * Closed: [[https://github.com/ipython/ipython/issues/202|202]] Matplotlib native 'MacOSX' backend broken in '-pylab' mode
    * Merged: [[https://github.com/ipython/ipython/pull/204|204]] Emacs completion bugfix
    * Closed: [[https://github.com/ipython/ipython/issues/205|205]] In the Qt console, Tab should insert 4 spaces when not completing
    * Closed: [[https://github.com/ipython/ipython/issues/212|212]] IPython ignores exceptions in the first evaulation of class attrs
    * Merged: [[https://github.com/ipython/ipython/pull/235|235]] Fix history magic command's bugs wrt to full history and add -O option to display full history
    * Merged: [[https://github.com/ipython/ipython/pull/236|236]] History minus p flag
    * Closed: [[https://github.com/ipython/ipython/issues/240|240]] Incorrect method displayed in %psource
    * Merged: [[https://github.com/ipython/ipython/pull/252|252]] Unicode issues
    * Merged: [[https://github.com/ipython/ipython/pull/261|261]] Adapt magic commands to new history system.
    * Merged: [[https://github.com/ipython/ipython/pull/282|282]] SQLite history
    * Closed: [[https://github.com/ipython/ipython/issues/285|285]] ipcluster local -n 4 fails
    * Closed: [[https://github.com/ipython/ipython/issues/290|290]] try/except/else clauses can't be typed, code input stops too early.
    * Merged: [[https://github.com/ipython/ipython/pull/292|292]] Issue 31
    * Merged: [[https://github.com/ipython/ipython/pull/293|293]] Issue 133
    * Merged: [[https://github.com/ipython/ipython/pull/294|294]] Issue 290
    * Closed: [[https://github.com/ipython/ipython/issues/305|305]] more readline shortcuts in qtconsole
    * Closed: [[https://github.com/ipython/ipython/issues/308|308]] Test suite should set sqlite history to work in :memory:
    * Merged: [[https://github.com/ipython/ipython/pull/311|311]] Qtconsole exit
    * Merged: [[https://github.com/ipython/ipython/pull/312|312]] History memory
    * Merged: [[https://github.com/ipython/ipython/pull/313|313]] Readline shortcuts
    * Closed: [[https://github.com/ipython/ipython/issues/314|314]] Multi-line, multi-block cells can't be executed.
  * NumPy (Chuck Harris, Mark Wiebe) From http://projects.scipy.org/numpy/timeline
    * Bugs fixed:
      * Ticket #1779 (array.tolist() speed enhancement) closed by mwiebe
      * Ticket #1780 (nditer broadcasting test failure under python 2.4) closed by mwiebe
      * Ticket #766 (fastCopyAndTranspose segfaults) closed by mwiebe
      * Ticket #1675 (No support for `__format__` in scalars/arrays) closed by mwiebe
    * Bugs closed from triage:
      * Ticket #38 (strides accepted as an argument to records.array) closed by mwiebe
      * Ticket #213 (SharedLibrary builder for numpy.distutils) closed by mwiebe
      * Ticket #244 (Build fails with Intel Visual Fortran compiler) closed by mwiebe
      * Ticket #260 (Add mechanism for registering objects to be deallocated and memory-to-be ...) closed by mwiebe
      * Ticket #338 (Valgrind warning when calling scipy.interpolate.interp1d) closed by mwiebe
      * Ticket #398 (Compatibility loader for old Numeric pickles) closed by mwiebe
      * Ticket #400 (C API access to fft for C scipy extension ?) closed by mwiebe
      * Ticket #402 (newaxis incompatible with array indexing) closed by mwiebe
      * Ticket #416 (The docstrings of functions which take an out= parameter should mention ...) closed by mwiebe
      * Ticket #417 (Numpy 1.0.1 compilation fails on IRIX 6.5) closed by mwiebe
      * Ticket #468 (Use ellipses to auto complete indices for slice assignments) closed by mwiebe
      * Ticket #619 (remove split_quoted in numpy.distutils.ccompiler) closed by mwiebe
      * Ticket #695 (No test for r4836) closed by mwiebe
      * Ticket #721 (0-dimensional boolean arrays should work as masks for array scalars) closed by mwiebe
      * Ticket #722 (Write tests to confirm that methods preserve arrays/matrices) closed by mwiebe
      * Ticket #741 (Extend numpy.dot() to accept more than 2 arrays.) closed by mwiebe
      * Ticket #756 (String conversion should be supported for arithmetic operators.) closed by mwiebe
      * Ticket #758 (g3 f2py clean up) closed by mwiebe
      * Ticket #762 (Figure out why fixing #743 fixed #733 too.) closed by mwiebe
      * Ticket #772 (Valgrind warning when running test for compress2d) closed by mwiebe
      * Ticket #819 (.flat reorders data) closed by mwiebe
      * Ticket #1608 (numpy.sort on x.flat modifies x) closed by mwiebe
      * Ticket #867 (Array generation fail) closed by mwiebe
      * Ticket #875 (numpy.lib.io.save fails with NameError) closed by mwiebe
      * Ticket #909 (fromstring() / fromfile() Enhancements) closed by mwiebe
      * Ticket #980 (NaN's are silenty converted to ints) closed by mwiebe
      * Ticket #982 (Problem accessing data attribute of ndarray object created with certain ...) closed by mwiebe
      * Ticket #987 (random.exponential() seems to use the reciprocal rate prarameter instead ...) closed by mwiebe
      * Ticket #1012 (dtype attributes change after an arithmetic operation involving a scalar) closed by mwiebe
      * Ticket #1024 (Untested changes to numpy.lib.io in r6345) closed by mwiebe
      * Ticket #1032 (Crash on fastputmask on win32) closed by mwiebe
      * Ticket #1035 (Fix up Nan handling for max/amax/argmax/fmac + min/sort equivalent) closed by mwiebe
      * Ticket #1037 (Pickling/unpickling empty unicode types does not work) closed by mwiebe
      * Ticket #1046 (+SKIP option to doctests is not supported by python 2.4) closed by mwiebe
      * Ticket #1054 (Feature request: intent(transpose) option in f2py) closed by mwiebe
      * Ticket #1056 (typedef npy_intp to Py_ssize_t (cf. PEP353)) closed by mwiebe
      * Ticket #1097 (polydiv should be duck-typing safe) closed by charris
      * Ticket #1081 (Strange behavior of array() in a corner case) closed by charris
      * Ticket #1068 (numpy crashes on long double computation on windows for amd64) closed by charris
      * Ticket #1082 (numpybook doesn't build) closed by mwiebe
      * Ticket #1091 (crackfortran patch needed) closed by mwiebe
      * Ticket #1094 (masked array autotest fails with bus error) closed by mwiebe
      * Ticket #1136 (Multiplying Python float to numpy.array of objects works but fails with a ...) closed by mwiebe
      * Ticket #1174 (FAIL: test_testUfuncRegression (test_old_ma.TestUfuncs)) closed by mwiebe
      * Ticket #1180 (numpy.average: add an option to skip 'None' values from count) closed by mwiebe
      * Ticket #1224 (discrepencies in found tests between numscons and distutils builds) closed by mwiebe
      * Ticket #1225 (datetime64 and timedelta64 tests) closed by mwiebe
      * Ticket #1265 (64bit System: take raises TypeError when using int64 indices) closed by charris
      * Ticket #1258 (numpy.array does not upconvert from float to store complex types) closed by mwiebe
      * Ticket #1277 (Constructing real arrays with complex numbers leads to funny errors) closed by mwiebe
      * Ticket #1304 (Bug in handling '|S0' format string) closed by mwiebe
      * Ticket #1321 (A dtype should be immutable) closed by mwiebe
      * Ticket #1718 ("shape mismatch" error is not informative) closed by mwiebe
      * Ticket #1640 (structured array incorrectly gives a broadcast error) closed by mwiebe
