

## Chris Swierczewski

* University of Washington BS Mathematics with Distinction Email: cswiercz AT SPAMFREE gmail DOT com . Google Talk: cswiercz IRC: cswiercz 
The following is a missing piece of documentation for adding new `.pyx` to the _Sage_ library: See <a class="http" href="http://www.sagemath.org/doc/html/prog/node40.html">5.2</a> of the <a class="http" href="http://www.sagemath.org/doc/html/prog/prog.html">Sage Programming Guide</a>. 


# Cython


## Writing Optimized Compiled Code with Sage


### Examples


#### Creating .pyx Files in the Sage Library

Suppose you want a more permanent way of including your optimized Cython code in Sage. Perhaps you want to contribute to the Sage project? This guide will show you how to create a simple Cython module and then link it to the Sage library so that your code will appear in future versions of Sage. 


# Opentick

Opentick provides free real-time and historical market data for trading systems and trading platforms. See www.opentick.com. 

This package is used by the sage.finance module. 


### opentick1.1 (Chris Swierczewski, 27 Aug 2008)

* Checkout from `cvs -d :pserver:anonymous@cvs.opentick.com:/var/cvs co otfeed1.1-dev` (Note that this currently does not work! Results in following error message:) 
      * ```txt
   cvs [checkout aborted]: connect to cvs.opentick.com(64.210.196.151):2401 failed: No route to host
   
```
For now, download from <a href="http://cvs.opentick.com/cgi-bin/cvsweb.cgi/otfeed1.1-dev/otfeed1.1-dev.tar.gz?tarball=1">http://cvs.opentick.com/cgi-bin/cvsweb.cgi/otfeed1.1-dev/otfeed1.1-dev.tar.gz?tarball=1</a>. 

* Download patch from <a href="http://otfeed-patches.googlecode.com/files/otfeed1.1-dev-autotools.patch">http://otfeed-patches.googlecode.com/files/otfeed1.1-dev-autotools.patch</a> into top-level folder so that compiler can use GNU autotools. 
* Apply patch using the following command: 
      * ```txt
   $ patch -p1 < otfeed1.1-dev-autotools.patch 
     patching file Applications/HistCsv/Include/Makefile.am 
     patching file Applications/HistCsv/Makefile 
     patching file Applications/HistCsv/Makefile.am 
     patching file Applications/HistCsv/Sources/Makefile.am 
     patching file Applications/Makefile.am 
     patching file AUTHORS 
     patching file ChangeLog 
     patching file configure.ac 
     patching file COPYING 
     patching file Include/Makefile.am 
     patching file INSTALL 
     patching file Makefile.am 
     patching file NEWS 
     patching file OTFeed.CPP/Include/Makefile.am 
     patching file OTFeed.CPP/Makefile 
     patching file OTFeed.CPP/Makefile.am 
     patching file OTFeed.CPP/Sources/Makefile.am 
     patching file README 
     patching file Samples/Linux/Makefile 
     patching file Samples/Linux/Makefile.am 
     patching file Samples/Makefile.am
   
```
* Bootstrap the autotool build system: 
      * ```txt
   $ autoreconf -i 
     configure.ac:8: installing `./missing' 
     configure.ac:8: installing `./install-sh' 
     Applications/HistCsv/Sources/Makefile.am: installing `./depcomp'
   
```
* Configure, make, and install Opentick source in `src/` to `$SAGE_ROOT`. Libraries are put into `$SAGE_LOCAL/lib` and headers into  `$SAGE_LOCAL/include`: 
      * ```txt
   ./configure --prefix=$SAGE_LOCAL
   make 
   make install
   
```
* Make and install C++ binary, otwrapper. Binary is copied to `$SAGE_LOCAL/bin` 
      * ```txt
   cd otwrapper
   make
   make install
   
```


---

 

* <a href="/CategoryHomepage">CategoryHomepage</a> 