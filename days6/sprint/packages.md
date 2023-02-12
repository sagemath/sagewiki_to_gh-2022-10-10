

## Working Group Members

Michael Abshoff, Clement Pernet 


## Goals


### LinBox

At the Sage Days 6 coding spring: 

* fix bug fallout from the 1.1.4 release (mostly done) 
* fix Blas:MatrixHom memleak 
* determine which workarounds can be discarded from Sage's <a href="/LinBox">LinBox</a> wrapper library 
* Sage class that wraps <a href="/LinBox">LinBox</a> matrices directly - this should simplify automated testing of <a href="/LinBox">LinBox</a> via Sage 
* wrap solve and other interesting <a href="/BlackBoxes">BlackBoxes</a> 
* sort out gmpxx.h issues, i.e. NTL version detect is broken in <a href="/LinBox">LinBox</a> 1.1.4, but not in Sage 
* fix corner case when only netlib.org BLAS and Lapack are installed in default patch 
* fix test-zero-one segfault on Solaris  
* merge <a href="/LinBox">LinBox</a> wrapper library into driver's directory in Linbox, making the build simpler  
* properly format, i.e. fix indentations and wrap at 80 characters, "./configure --help"  
Short term, i.e. plans for a potential 1.1.5 <a href="/LinBox">LinBox</a> release in the next 3-4 weeks: 

* support threaded GoToBLAS 
* support (threaded) <a href="/SunPerfLib">SunPerfLib</a> on Solaris 
* print configuration also to stdout so that it is logged in the Sage build log 
* investigate slow iterator test on OSX (10 or more times slow than under Linux on the same hardware) 
* proper lround fix for Solaris via ACTEST 
* set up build bots for Cygwin and Solaris, wider range of gcc releases (mabshoff)  
* add STLPort debug build target to general <a href="/LinBox">LinBox</a> build 
* add and review Paul's fixes for a) string copy in case of exception b) missing inlines  
* detect special Debian ATLAS case 
* handle ATLAS compiled with G95, i.e. OpenSuSE 10.2 - see thread by Simon King 

### Givaro

* merge OSX 10.5 build fix by rpw 
* improved gcc 4.3 buidl fix: instead of string.h include cstring 
* merge fixes/improvements by malb from Sage's givaro.spkg: 

```txt
-- 2007-02-03 Martin Albrecht <malb@...>
  * new upstream release: 3.2.6
  * Changes to upstream (everything else below is irrelevant): 
   ./src/library/poly1/givpoly1factor.h (2006-10-21 fix)
   ./src/kernel/zpz/givgfq.inl (2006-10-21 fix)
   ./src/kernel/zpz/givgfq.h  (2006-10-21 fix)
   ./aclocal.m4 64-bit (2006-10-29 fix)
   ./src/library/poly1/givpoly1padic.h (2006-11-09 fix)
```

### ATLAS

* build ATLAS with netlib's Lapack per default 
* use sage_fortran as fortran compiler 
* update to the 3.8.0 release, apply install-dynamic-libs patch 
* build multi-threaded version of ATLAS on demand, too 