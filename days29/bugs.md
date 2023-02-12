
Use this page to keep track of the bugs fixed during Sage Days 29. 

   * William Stein: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10937">10937 -- bug in Dokchitser L.init_Johncoeffs</a>  (positive review -- Robert Bradshaw) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10975">10975 -- creation of certain prime finite fields is double dog slow (compared to Magma)</a> (positive review -- David Roe) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9705">9705 -- trouble with long lines in notebook magma mode</a> (positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8998">8998 -- galois_action on cusps has a bug</a> (positive review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11007">11007 -- heegner points -- fix nonsquarefree case</a> (with patch; needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10836">10836 -- primitive root is broken</a> (positive review) 
   * Rob Beezer: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7852">7852 -- solve systems over CDF</a>  (bug, review in-progress, Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10470">10470 -- Don't list infinite vector spaces</a> (bug, positive review -- John Palmieri) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10545">10545 -- Add the outer product of two vectors</a> (enhancement, positive review -- John Palmieri) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10595">10595 -- vector constructor fails with empty list</a> (bug, positive review -- joint with John Palmieri) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10737">10737 -- Extended echelon form</a> (enhancement, positive review -- John Palmieri) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10746">10746 -- refactor matrix kernels</a> (bug, review in progress -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10765">10765 -- obliterate sage/matrix/misc.py</a> (orphaned) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10791">10791 -- fix and upgrade Gram-Schmidt</a> (bug, review in-progress -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10794">10794 -- QR decomposition over exact rings</a> (enhancement, positive review -- Simon Spicer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10802">10802 -- singular values over CDF</a> (enhancement, positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10837">10837 -- matrix and vector norms, condition number</a> (solves <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2512">2512</a>) (enhancement, positive review -- Simon Spicer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10848">10848 -- is_hermitian()</a> (enhancement, review in-progress -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10863">10863 -- is_unitary()</a> (enhancement, positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10974">10974 -- Overhaul, fix matrix augment, stack</a>  (bug, positive review -- Keshav Kini) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10977">10977 -- Document vector constructor behavior</a> (documentation, positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11004">11004 -- make subdivisions optional for tensor products of matrices</a> (enhancement, positive review -- John Palmieri) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11027">11027 -- Schur decomposition</a> (enhancement, review in-progress -- Martin Raum) 
   * John Palmieri: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4983">4983 -- replace subdivisions attribute for matrices with a function</a> (positive review -- Rob Beezer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7105">7105 -- open search results in new tabs</a> (needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9960">9960 -- require SAGE_CHECK to be "yes"</a> (positive review -- Leif Leonhardy, Ivan Andrus, David Kirkby).  This patch also fixes <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4029">4029 -- sage-env kills the shell when called from "wrong" directory</a>. 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10752">10752 -- matrix pivots should be immutable</a> (positive review -- Rob Beezer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10822">10822 -- sage -sh doesn't set the path right if default shell is zsh on OSX</a> (needs review) 
   * Rob Beezer and John Palmieri: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10595">10595 -- vector constructor fails on empty list</a> (positive review -- Dmitrii Pasechnik, Rob Beezer, and John Palmieri) 
   * Martin Raum: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5731">5731 -- update to NTL 5.5.2</a> (needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10553">10553 -- Review: Diamond bracket operators are terribly slow</a> (positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8614">8614 -- Optimize creation of modular symbols spaces by speeding up quotienting out by 2-term relations</a> (under review by John Cremona) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4578">4578 -- Optimize modular symbols decomposition algorithm</a> (needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10987">10987 -- Add optional arguement to decomposition_of_subspace making restrict not check the subspace</a> (positive review -- Rob Beezer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6670">6670 -- Port group algebras to the current coercion system</a> (needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11017">11017 -- GP blocks files when reallocating memory; Workaround</a> (positive review by John Cremona) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11024">11024 -- Update Dokchitser calculator to compiled version</a> (under review by John Cremona) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10863">10863 -- Review: Add check for orthogonal/unitary matrices</a>  (positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10802">10802 -- Review: Singular values of matrices over CDF</a> (positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10791">10791 -- Review: Fix and upgrade Gram-Schmidt</a> ( in progress ) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11027">11027 -- Review: Schur matrix decomposition over RDF/CDF</a> ( enhancement, in progress ) 
   * Moritz Minzlaff: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9053">9053 -- fixes computation of pivots</a> (positive review -- Keshav Kini) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9054">9054 -- create a class for basic function_field arithmetic</a> (in progress) 
   * Moritz Minzlaff and William Stein: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11034">11034 -- bug in the way vectors are created for submodules of free modules</a> (needs review) 
   * Maarten Derickx: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10570">10570 -- sage leaves a lot of stackframes alive at startup</a> (needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10933">10933 -- time fails inside function</a> (positive review -- Martin Raum) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9094">9094 -- is_square and sqrt for polynomials and fraction fields</a> (positive review -- Robert Bradshaw) 
   * Robert Bradshaw 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10548">10548 -- The coercion model is keeping references to tracebacks which causes memory leaks.</a> (positive review -- Maarten Derickx) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11040">11040 -- Sage startup time.</a> (needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11043">11043 -- Sage startup time (again).</a> (needs review) 
   * Robert Miller 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11033">11033 -- Fixes bugs in automorphism groups of linear codes.</a> (needs review) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10994">10994 -- Bug in permutation_automorphism_group for linear codes.</a> (fixed by #11033) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11032">11032 -- automorphism_group_binary_code crashes Sage when it can't allocate enough memory.</a> (fixed by #11033) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10976">10976 -- computing order of a certain subgroup of a permutation group is double dog slow (compared to Magma)</a> worked on <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10804">10804</a> which implements the first round of data structures designed to replace GAP in computations of this type 
   * Simon Spicer: 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9028">9028 -- Review: Basic Stats - Standard Deviation</a> (positive review -- Simon Spicer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10799">10799 -- Review: Solved the problem to compute resultants on certain variable orders</a> (positive review -- Simon Spicer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10601">10601 -- Fixed the QuaternionAlgebra constructor to accept Python ints, longs and floats as input.</a> (positive review -- Rob Beezer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9306">9306 -- Alters the round() command to defer to an element's .round() method if no precision is specified.</a> (positive review -- Keshav Kini) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10761">10761 -- Fixed numerical_approx() when called on complex-valued AlgebraicNumbers</a> (positive review -- Rob Beezer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10794">10794 -- Review: QR decomposition for matrices over exact rings</a> (positive review -- Simon Spicer) 
            * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10934">10934 -- Review: Implement is_maximal() for ideals of quotient rings of ZZ</a> (positive review -- Simon Spicer) 
   * Chris Swierczewski: 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6371">6371 -- Implement Riemann theta functions</a> (needs review) 
   * Gagan Sekhon 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10832">10832 -- Simon 2-descent (all the work was done by Cremona, I just fixed some doctest)</a> (positive review -- Jamie Weigandt) 
   * John Cremona 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10840">10840 -- bug in saturation for elliptic curves over Q</a> (positive review by Gagan Sekhon) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10999">10999 -- Elliptic curve generators from the database lie on the wrong curve</a> (needs review) 
         * Enhancement: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11005">11005 -- Update Simon's GP scripts and convert to use via gp2c</a> (under review by Martin Raum) 
   * Justin Walker 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4120">4120 -- New code for binary quadratic forms</a> (under review by John Cremona) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10521">10521 -- bug in integral_points (for elliptic curves over Q)</a> (May be fixed by 10973) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10973">10973 -- Integral points on elliptic curves over number fields</a> (Close, but needs work) 
   * Jamie Weigandt 
         * Enhancement: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9371">9371 -- Implemented 2-Torsion Rank over General Fields</a> 
   * Michael Droettboom 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8125">8125 -- problem with "text" in matplotlib</a> Fixed in matplotlib 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10717">10717 -- Prime typeset badly on plots</a> Fixed in matplotlib 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10980">10980 -- Make sure symbolic gridline values are okay</a> Fixed in matplotlib 
         * <a class="https" href="https://sourceforge.net/tracker/index.php?func=detail&amp;aid=3236567&amp;group_id=80706&amp;atid=560720">mpl 3236567 -- backend_wx draws images at wrong position</a>  Fixed in matplotlib 
   * Ivan Andrus 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11000">11000 -- GAP interface doesn't handle input with multiple lines correctly</a> (positive review -- Keshav Kini) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10469">10469 -- Don't source sage-env more than once</a> (positive review -- Ivan Andrus, Keshav Kini, John Palmieri) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7766">7766 -- Update valgrind</a> (needs review) 
   * Paul Ivanov 
         * Matplotlib work 
               * Fixed large memory leak fixed in matplotlib test suite (trunk) <a class="https" href="https://github.com/matplotlib/matplotlib/pull/59">pull request 56</a> 
               * Fixed memory leak in matplotlib-py3 caused be old version of CXX. <a class="https" href="https://github.com/matplotlib-py3/matplotlib/pull/23">pull request 23</a> 
               * Include matplotlib testsuite behave consistently using matplotlib.test() and nosetests <a class="https" href="https://github.com/matplotlib/matplotlib/pull/58">pull request 58</a> 
               * (enhancement) 'scrub' keyword for matplotlib clear figure command. <a class="https" href="https://github.com/matplotlib/matplotlib/pull/59">pull request 56</a> 
               * <a class="http" href="http://sourceforge.net/support/tracker.php?aid=3189536">mpl 3189536 -- radio_buttons example has only one (the last) button active</a>  Fixed in matplotlib. 
               * <a class="http" href="http://sourceforge.net/support/tracker.php?aid=3187521">mpl 3187521 -- Crash when enumerating fonts containing a dot in their name</a> fixed in matplotlib <a class="https" href="https://github.com/matplotlib/matplotlib/pull/59">pull request 59</a>.  
               * (work in progress) mpl 3187864 matplotlib with QGIS memory error on Suse 11.3 
               * (work in progress) mpl 3205391 gtkagg.so hanging plot creation 
         * Ipython work <a class="https" href="https://github.com/ipython/ipython/pull/309">IPython pull request 309</a> 
               * (work in progress) filed and added test for <a class="https" href="https://github.com/ipython/ipython/issues/306">GH-306</a> - multiline strings at end of input cause noop 
               * (work in progress) filed and added test for <a class="https" href="https://github.com/ipython/ipython/issues/207">GH-307</a> - lines ending with semicolon should not go to cache        
               * (work in progress) added test for <a class="https" href="https://github.com/ipython/ipython/issues/284">GH-284</a> - ensure In variable is works         
               * (work in progress) added test for <a class="https" href="https://github.com/ipython/ipython/issues/238">GH-238</a> - %run's aggressive name cleaning     
   * Keshav Kini and Maarten Derickx 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11008">11008 -- spkg test suite successes are not correctly written to the appropriate file in spkg/installed</a> (positive review -- John Palmieri) 
   * Volker Braun 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6391">6391 -- libGAP! -- create a Cython library interface to gap</a> first working version, needs review. 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9232">9232 -- jmol on commandline broken</a> (needs review) 
   * IPython team (Fernando Perez, Min Ragan-Kelley, Thomas Kluyver) Issues Closed and Pull Requests merged (66) 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/3">3</a> Implement PBS support in ipcluster 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/6">6</a> Update the Sphinx docs for the new ipcluster 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/9">9</a> Getting "<a href="/DeadReferenceError">DeadReferenceError</a>: Calling Stale Broker" after ipcontroller restart 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/15">15</a> Implement SGE support in ipcluster 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/18">18</a> %cpaste freeze sync frontend 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/24">24</a> ipcluster does not start all the engines 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/25">25</a> unicode bug - encoding input 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/27">27</a> generics.complete_object broken 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/28">28</a> Offer finer control for initialization of input streams 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/31">31</a> Issues in magic_whos code 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/43">43</a> Implement SSH support in ipcluster 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/44">44</a> Merge history from multiple sessions 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/46">46</a> Input to %timeit is not preparsed 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/51">51</a> Out not working with ipythonx 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/52">52</a> Document testing process better 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/53">53</a> Internal Python error in the inspect module 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/58">58</a> ipython change char '0xe9' to 4 spaces 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/60">60</a> Improve absolute import management for iptest.py 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/68">68</a> Problems with Control-C stopping ipcluster on Windows/Python2.6 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/74">74</a> Manager() [from multiprocessing module] hangs ipythonx but not ipython 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/77">77</a> ipython oops in cygwin 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/86">86</a> Make IPython work with multiprocessing 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/88">88</a> Error when inputting UTF8 CJK characters 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/93">93</a> when looping, cursor appears at leftmost point in newline 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/100">100</a> Overzealous introspection 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/108">108</a> ipython disables python logger 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/109">109</a> WinHPCLauncher is a hard dependency that causes errors in the test suite 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/111">111</a> Iterator version of <a href="/TaskClient">TaskClient</a>.map() that returns results as they become available 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/115">115</a> multiline specials not defined in 0.11 branch 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/120">120</a> inspect.getsource fails for functions defined on command line 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/121">121</a> If plot windows are closed via window controls, no more plotting is possible. 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/126">126</a> Can't transfer command line argument to script 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/127">127</a> %edit does not work on filenames consisted of pure numbers 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/130">130</a> Deadlock when importing a module that creates an IPython client 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/132">132</a> Ipython prevent south from working 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/133">133</a> whitespace after Source introspection 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/134">134</a> multline block scrolling 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/143">143</a> Ipython.gui.wx.ipython_view.IPShellWidget: ignores user*_ns arguments 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/145">145</a> Bug on MSW sytems: idle can not be set as default IPython editor. Fix Suggested. 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/182">182</a> ipython q4thread in version 10.1 not starting properly 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/191">191</a> Unbundle external libraries 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/196">196</a> IPython can't deal with unicode file name. 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/199">199</a> Magic arguments 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/200">200</a> Unicode error when starting ipython in a folder with non-ascii path 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/201">201</a> use session.send throughout zmq code 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/202">202</a> Matplotlib native 'MacOSX' backend broken in '-pylab' mode 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/204">204</a> Emacs completion bugfix 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/205">205</a> In the Qt console, Tab should insert 4 spaces when not completing 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/212">212</a> IPython ignores exceptions in the first evaulation of class attrs 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/235">235</a> Fix history magic command's bugs wrt to full history and add -O option to display full history 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/236">236</a> History minus p flag 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/240">240</a> Incorrect method displayed in %psource 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/252">252</a> Unicode issues 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/261">261</a> Adapt magic commands to new history system. 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/282">282</a> SQLite history 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/285">285</a> ipcluster local -n 4 fails 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/290">290</a> try/except/else clauses can't be typed, code input stops too early. 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/292">292</a> Issue 31 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/293">293</a> Issue 133 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/294">294</a> Issue 290 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/305">305</a> more readline shortcuts in qtconsole 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/308">308</a> Test suite should set sqlite history to work in :memory: 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/311">311</a> Qtconsole exit 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/312">312</a> History memory 
         * Merged: <a class="https" href="https://github.com/ipython/ipython/pull/313">313</a> Readline shortcuts 
         * Closed: <a class="https" href="https://github.com/ipython/ipython/issues/314">314</a> Multi-line, multi-block cells can't be executed. 
   * <a href="/NumPy">NumPy</a> (Chuck Harris, Mark Wiebe) From <a href="http://projects.scipy.org/numpy/timeline">http://projects.scipy.org/numpy/timeline</a> 
         * Bugs fixed: 
               * Ticket #1779 (array.tolist() speed enhancement) closed by mwiebe 
               * Ticket #1780 (nditer broadcasting test failure under python 2.4) closed by mwiebe 
               * Ticket #766 (fastCopyAndTranspose segfaults) closed by mwiebe 
               * Ticket #1675 (No support for `__format__` in scalars/arrays) closed by mwiebe 
         * Bugs closed from triage: 
               * Ticket #38 (strides accepted as an argument to records.array) closed by mwiebe 
               * Ticket #213 (<a href="/SharedLibrary">SharedLibrary</a> builder for numpy.distutils) closed by mwiebe 
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
               * Ticket #875 (numpy.lib.io.save fails with <a href="/NameError">NameError</a>) closed by mwiebe 
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
               * Ticket #1174 (FAIL: test_testUfuncRegression (test_old_ma.<a href="/TestUfuncs">TestUfuncs</a>)) closed by mwiebe 
               * Ticket #1180 (numpy.average: add an option to skip 'None' values from count) closed by mwiebe 
               * Ticket #1224 (discrepencies in found tests between numscons and distutils builds) closed by mwiebe 
               * Ticket #1225 (datetime64 and timedelta64 tests) closed by mwiebe 
               * Ticket #1265 (64bit System: take raises <a href="/TypeError">TypeError</a> when using int64 indices) closed by charris 
               * Ticket #1258 (numpy.array does not upconvert from float to store complex types) closed by mwiebe 
               * Ticket #1277 (Constructing real arrays with complex numbers leads to funny errors) closed by mwiebe 
               * Ticket #1304 (Bug in handling '|S0' format string) closed by mwiebe 
               * Ticket #1321 (A dtype should be immutable) closed by mwiebe 
               * Ticket #1718 ("shape mismatch" error is not informative) closed by mwiebe 
               * Ticket #1640 (structured array incorrectly gives a broadcast error) closed by mwiebe 