
[[_TOC_ 2]] 


# Sage Days 11 Projects

These are projects for <a href="/days11">Sage Days 11</a>. 


## Native Implementation of Dokchitser's Algorithm

People: Craig Citro, William Stein, Sourav Sen Gupta, Michael Rubinstein, Rishi Kesh, Gonzalo Tornaria 

<a href="/days11/projects/dokchitser">More details.</a> 

<a href="http://sage.math.washington.edu/home/was/tmp/dokchitser.tar.bz2">http://sage.math.washington.edu/home/was/tmp/dokchitser.tar.bz2</a> 

Lots of progress.  Lots and lots to do.  Mostly Sourav. 


## Cython Wrapping of Rubinstein's L-calc

People: William Stein, Sourav Sen Gupta, Michael Rubinstein, Craig Citro, Rishi 

   * Michael Abshoff -- update to latest version of lcalc, i.e. the 1.2 release 

## Screencasts, Documentation, and Video Interviews

People: Timothy Clemans 

Other projects instead... 


## Trac Tickets 3580 and 4249

People: John Voight, Craig Citro, someone with a system similar to Cremona's 

Totally DONE!    Real root finding subtleties -- proof = False? 


## Work on IPython topics that affect Sage directly

People: Fernando Perez, William Stein to provide list of topics and feedback. 

* (tricky -- startup time issues!!) %timeit isn't preparsed.  See <a href="https://bugs.launchpad.net/ipython/+bug/296116">https://bugs.launchpad.net/ipython/+bug/296116</a> 
* mabshoff -- upgrade to latest release (get 0.9.1 -- has "ipython1"; missing snippet of code to make this "usable" for idiots). 
* $HOME/sage.init -- wthread issue; problem is -wthread has to be first option. Solution: sage should kludge around.  
* way nicer writing out of history as an option (seg faulting, crashing, invidual history overlap): personally, Stein, would be happy basically having the option to have a *merged* history; basically I view the history as a "set"-ish thing, so I don't care about the history being complete and linear for each session.  Watch out about history switching for debugging -- have a temp file with history for just this session.   See <a href="https://bugs.launchpad.net/ipython/+bug/296113">https://bugs.launchpad.net/ipython/+bug/296113</a> and <a href="https://bugs.launchpad.net/ipython/+bug/296114">https://bugs.launchpad.net/ipython/+bug/296114</a> 
* (progress, startup time issues) annoying valgrind crap? 
* (done) exception on startup of sage look lame.  See <a href="https://bugs.launchpad.net/ipython/+bug/295798">https://bugs.launchpad.net/ipython/+bug/295798</a> 
* (progress) testing framework/robustness improvements 

## test ATLAS 3.9.4 with NumPy, SciPy and Sage

People: Michael Abshoff, Fernando Perez 

didn't do anything yet. 


## Enumeration of relative quadratic extensions

People: John Voight, Jon Hanke 

???? 


## High Level Memory Profiling and Modular Forms Memory Caching Issues

People: Michael Abshoff - understanding of guppy and muppy ought to be helpful; William Stein 

wrote a talk. 

have a demo. 


## Optimize Modular Symbols

People: Craig Citro, William Stein 

   * tell us what sucks 
   * Jon Hanke came up with some nice examples of issues, and is doing a lot more.  Coming along. 

## Quadratic forms

People: Jon Hanke, Craig Citro, Gonzalo Tornaria, Michael Abshoff 

Lay some groundwork.  What is out there?   E.g., Hanke's code, etc. 

* substantial progress; cleanup going on; splitting good and bad; start reviewing good.   
* general quadratic modules/lattices class 
* goal: in Sage before Sage Days UGA. 
See also <a href="http://trac.sagemath.org/sage_trac/ticket/4470">http://trac.sagemath.org/sage_trac/ticket/4470</a> 


## Optimize sage -br

People: Gonzalo Tornaria, Craig Citro, David Harvey, (Robert Bradshaw) 

* For the Cython side of things, see <a href="http://trac.sagemath.org/sage_trac/ticket/4480">http://trac.sagemath.org/sage_trac/ticket/4480</a> 
* add two tickets 
* substantial progress: order(s) of magnitude speedup 
* excellent progress 

## Elliptic Curves and Drinfeld Modular Forms over Function Fields

People: Chris Hall and Sal Butt 

   * char >= 5, GF(q)[t] 
   * goal: L-series 
   * in progress 