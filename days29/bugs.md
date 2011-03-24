Use this page to keep track of the bugs fixed during Sage Days 29.

  * William Stein:
     * [[http://trac.sagemath.org/sage_trac/ticket/10937|10937 -- bug in Dokchitser L.init_coeffs]]  (positive review -- Robert Bradshaw)
     * [[http://trac.sagemath.org/sage_trac/ticket/10975|10975 -- creation of certain prime finite fields is double dog slow (compared to Magma)]] (positive review -- David Roe)
     * [[http://trac.sagemath.org/sage_trac/ticket/9705|9705 -- trouble with long lines in notebook magma mode]] (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/8998|8998 -- galois_action on cusps has a bug]] (positive review)
  * Rob Beezer:
     * [[http://trac.sagemath.org/sage_trac/ticket/10974|10974 -- Overhaul, fix matrix augment, stack]]  (positive review -- Keshav Kini)
     * [[http://trac.sagemath.org/sage_trac/ticket/10470|10470 -- Don't list infinite vector spaces]] (positive review -- John Palmieri)
     * [[http://trac.sagemath.org/sage_trac/ticket/10737|10737 -- Extended echelon form]] (positive review -- John Palmieri)
  * John Palmieri:
     * [[http://trac.sagemath.org/sage_trac/ticket/4983|4983 -- replace subdivisions attribute for matrices with a function]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10752|10752 -- matrix pivots should be immutable]] (positive review -- Rob Beezer)
  * Rob Beezer and John Palmieri:
     * [[http://trac.sagemath.org/sage_trac/ticket/10595|10595 -- vector constructor fails on empty list]] (positive review -- Dmitrii Pasechnik, Rob Beezer, and John Palmieri)
  * Martin Raum:
     * [[http://trac.sagemath.org/sage_trac/ticket/5731|5731 -- update to NTL 5.5.2]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/10553|10553 -- Review: Diamond bracket operators are terribly slow]] (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/8614|8614 -- Optimize creation of modular symbols spaces by speeding up quotienting out by 2-term relations]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/4578|4578 -- Optimize modular symbols decomposition algorithm]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/10987|10987 -- Add optional arguement to decomposition_of_subspace making restrict not check the subspace]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/6670|6670 -- Port group algebras to the current coercion system]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/11017|11017 -- GP blocks files when reallocating memory; Workaround]] (needs review)
  * Moritz Minzlaff:
     * [[http://trac.sagemath.org/sage_trac/ticket/9053|9053 -- fixes computation of pivots]] (positive review -- Keshav Kini)
  * Maarten Derickx:
     * [[http://trac.sagemath.org/sage_trac/ticket/10570|10570 -- sage leaves a lot of stackframes alive at startup]] (needs review)
     * [[http://trac.sagemath.org/sage_trac/ticket/10933|10933 -- time fails inside function]] (positive review -- Martin Raum)
     * [[http://trac.sagemath.org/sage_trac/ticket/9094|9094 -- is_square and sqrt for polynomials and fraction fields]] (positive review -- Robert Bradshaw)
  * Robert Bradshaw
     * [[http://trac.sagemath.org/sage_trac/ticket/10548|10548 -- The coercion model is keeping references to tracebacks which causes memory leaks.]] (positive review -- Maarten Derickx)
  * Simon Spicer:
     * [[http://trac.sagemath.org/sage_trac/ticket/9028| 9028 -- Review: Basic Stats - Standard Deviation]] (positive review -- Simon Spicer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10799| 10799 -- Review: Solved the problem to compute resultants on certain variable orders]] (positive review -- Simon Spicer)
     * [[http://trac.sagemath.org/sage_trac/ticket/10601|10601 -- Fixed the QuaternionAlgebra constructor to accept Python ints, longs and floats as input.]] (positive review -- Rob Beezer)
     * [[http://trac.sagemath.org/sage_trac/ticket/9306|9306 -- Alters the round() command to defer to an element's .round() method if no precision is specified.]] (positive review -- Keshav Kini)
     * [[http://trac.sagemath.org/sage_trac/ticket/10761|10761 -- Fixed numerical_approx() when called on complex-valued AlgebraicNumbers]] (positive review -- Rob Beezer)
  * Gagan Sekhon
    *[[http://trac.sagemath.org/sage_trac/ticket/10832|10832 -- Simon 2-descent (all the work was done by Cremona, I just fixed some doctest)]] (positive review -- Jamie Weigandt)
  * John Cremona
    * [[http://trac.sagemath.org/sage_trac/ticket/10840|10840 -- bug in saturation for elliptic curves over Q]] (needs review)
    * [[http://trac.sagemath.org/sage_trac/ticket/10999|10999 -- Elliptic curve generators from the database lie on the wrong curve]] (needs review)
  * Michael Droettboom
    * [[http://trac.sagemath.org/sage_trac/ticket/8125|8125 -- problem with "text" in matplotlib]] Fixed in matplotlib
    * [[http://trac.sagemath.org/sage_trac/ticket/10717|10717 -- Prime typeset badly on plots]] Fixed in matplotlib
    * [[http://trac.sagemath.org/sage_trac/ticket/10980|10980 -- Make sure symbolic gridline values are okay]] Fixed in matplotlib
    * [[https://sourceforge.net/tracker/index.php?func=detail&aid=3236567&group_id=80706&atid=560720|mpl 3236567 -- backend_wx draws images at wrong position]]  Fixed in matplotlib
  * Ivan Andrus
    * [[http://trac.sagemath.org/sage_trac/ticket/11000|11000 -- GAP interface doesn't handle input with multiple lines correctly]] (needs review)
    * [[http://trac.sagemath.org/sage_trac/ticket/10469|10469 -- Don't source sage-env more than once]] (needs review)
    * [[http://trac.sagemath.org/sage_trac/ticket/7766|7766 -- Update valgrind]] (needs review, especially suppressions)
    * [[http://trac.sagemath.org/sage_trac/ticket/11009|11009 -- Allow notebook keybind customization]] (needs review)
  * Paul Ivanov
    * [[http://sourceforge.net/support/tracker.php?aid=3189536|mpl 3189536 -- radio_buttons example has only one (the last) button active]]  Fixed in matplotlib.
  * Keshav Kini and Maarten Derickx
    * [[http://trac.sagemath.org/sage_trac/ticket/11008|11008 -- spkg test suite successes are not correctly written to the appropriate file in spkg/installed]] (positive review -- John Palmieri)


  * IPython team (Fernando Perez, Min Ragan-Kelley, Thomas Kluyver) Issues Closed and Pull Requests merged (50) 
    * Closed: [[https://github.com/ipython/ipython/issues/3|3]] Implement PBS support in ipcluster
    * Closed: [[https://github.com/ipython/ipython/issues/15|15]] Implement SGE support in ipcluster
    * Closed: [[https://github.com/ipython/ipython/issues/18|18]] %cpaste freeze sync frontend
    * Closed: [[https://github.com/ipython/ipython/issues/24|24]] ipcluster does not start all the engines
    * Closed: [[https://github.com/ipython/ipython/issues/27|27]] generics.complete_object broken
    * Closed: [[https://github.com/ipython/ipython/issues/28|28]] Offer finer control for initialization of input streams
    * Closed: [[https://github.com/ipython/ipython/issues/31|31]] Issues in magic_whos code
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
    * Merged: [[https://github.com/ipython/ipython/pull/199|199]] Magic arguments
    * Closed: [[https://github.com/ipython/ipython/issues/200|200]] Unicode error when starting ipython in a folder with non-ascii path
    * Closed: [[https://github.com/ipython/ipython/issues/201|201]] use session.send throughout zmq code
    * Merged: [[https://github.com/ipython/ipython/pull/204|204]] Emacs completion bugfix
    * Closed: [[https://github.com/ipython/ipython/issues/205|205]] In the Qt console, Tab should insert 4 spaces when not completing
    * Closed: [[https://github.com/ipython/ipython/issues/212|212]] IPython ignores exceptions in the first evaulation of class attrs
    * Merged: [[https://github.com/ipython/ipython/pull/235|235]] Fix history magic command's bugs wrt to full history and add -O option to display full history
    * Merged: [[https://github.com/ipython/ipython/pull/236|236]] History minus p flag
    * Closed: [[https://github.com/ipython/ipython/issues/240|240]] Incorrect method displayed in %psource
    * Merged: [[https://github.com/ipython/ipython/pull/261|261]] Adapt magic commands to new history system.
    * Merged: [[https://github.com/ipython/ipython/pull/282|282]] SQLite history
    * Closed: [[https://github.com/ipython/ipython/issues/285|285]] ipcluster local -n 4 fails
    * Merged: [[https://github.com/ipython/ipython/pull/293|293]] Issue 133
