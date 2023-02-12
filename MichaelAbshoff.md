

# Michael Abshoff's Wiki SAGE page


## Contact Information

* For an email address check <a class="http" href="http://groups.google.com/groups/profile?enc_user=GGRP9BcAAAAZQo9hoMaeKCAqGq1BeY9EHqZiDvCVswhrZ6TQxKj0ww">this Google profile</a> 
* I hang out in #sage-devel on freenode 

## Involvement with Sage

In addition of heading the Solaris as well as Windows port of Sage I am also the main release manager. So far I have chaired 33 releases:  

* 2.8.11, 2.8.13-2.8.15 
* 2.9, 2.9.2-3 
* 2.10, 2.10.1-3, 2.10.4 (together with Robert Miller) 
* 2.11 
* 3.0, 3.0.1-6 
* 3.1, 3.1.1-4 
* 3.2, 3.2.1-3  
* 3.3 
* 3.4, 3.4.1-2 
I still study math at the University of Dortmund and one day will finish my degree :) 


## Sage Projects


### High Level

* Chairing the current Sage release 
* <a href="/solaris">Solaris port of Sage</a> 
* <a href="/freebsd">FreeBSD port of Sage</a> 
* <a href="/windows">MSVC port of Sage</a> 
* <a href="/windows">Cygwin re-port of Sage</a> 
* <a href="/osx64">64 bit OSX port of Sage</a> 
* <a href="/ps3">PS3 port of Sage</a> 
* hunt mem-leaks in C/C++ code of Sage 
* <a href="/DebianSAGE">DebianSAGE</a> 
* whatever else currently needs fixing 
* <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=new&amp;status=assigned&amp;status=reopened&amp;owner=mabshoff&amp;order=priority">My open trac tickets</a> (the idea was shamelessly stolen from Martin Albrecht) 
* Maintain the <a href="/sage.math/SageBinaries">collection</a> of Sage releases installed on sage.math. This can be useful to pinpoint regressions or just to use older Sage releases 

### Low Level: Build System Improvements

A list of things on my <a href="/ToDo">ToDo</a> list related to the build system. As things mature they will be moved to their own SEP: 

* compiler classes, i.e. gcc, icc, sun cc, MSVC 
* the construct 'export MAKE="make -j10"' is bad, we need something like SAGE_BUILD_THREADS and SAGE_MAKE and use those 
* Sage on 64 bit OSX 10.5 and higher, Solaris, FreeBSD 
* gcc 4.4 snapshots or whatever else is coming up 
* OSX 10.6 coming up 
* Cygwin support coming back 
* Fortran infrastructure rework - i.e. support for g77, g95, gfortran and the <a href="/SiCortex">SiCortex</a> Fortran compiler 
* SAGE_DEBUG mode - i.e. '-O0 -g' - but this also needs to work with SAGE64  
* Custom CFLAGS, CXXFLAGS 
* Custom CC, CXX, FORTRAN compilers, i.e. 'CC == gcc-4.2' 
* Tier 1 vs. Tier 2 support: Tier 1 - builds and passes doctests vs. Tier 2: builds, but can fail some doctests. For Tier 2 only some configs might even build 
* SAGE_BUILD_TMPDIR: 
   * use it instead of spkg/build  - this could be scratch space or a tmpfs disk 
   * write a script that does du -sch before deleting the spkg dir in build and then logs the amount of data, then we can use some common table in the sage_scripts repo to check for available space before building an spkg 
* spkg cleanup: split rpy.spkg from r.spkg, move the boost headers to its own spkg from polybori.spkg. 
* tmpfs like solutions for temp build dir: 
   * Solaris - tmp is automatically mounted as tmpfs 
   * Linux - tmpfs - <a href="http://en.wikipedia.org/wiki/TMPFS">http://en.wikipedia.org/wiki/TMPFS</a>: "Usage of tmpfs for example is "mount -t tmpfs -o size=1G,nr_inodes=10k,mode=0700 tmpfs /space" which will allow up to 1 GiB in RAM/swap with 10240 inodes and only accessible by the owner of the directory /space. The filesystem's maximum size can also be changed on-the-fly, like "mount -o remount,size=2G /space"." 
   * OSX: <a href="http://lists.apple.com/archives/darwin-kernel/2004/Sep/msg00004.html">http://lists.apple.com/archives/darwin-kernel/2004/Sep/msg00004.html</a> 

## Done Tasks

* <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=closed&amp;owner=mabshoff&amp;order=priority">My closed trac tickets</a> (the idea was shamelessly stolen from Martin Albrecht) 
* See the Changelog, the google groups sage-devel and sage-support and #sage-devel on freenode. 
* DMG installation image for MacOSX [other people did most of the work here] 
* make all packages using BLAS/Lapack use the Accelerate Framework on MacOSX. Patch for Linbox exists and will hopefully show up in Linbox svn soon 

# Other Software Interests

* Linbox with MSVC 
* Porting mathematical open source code to Solaris, Windows and any odd Unix out there. 

# Places where I can be found

* google groups sage-devel, sage-support, linbox-devel, group linbox-use 
* <a class="http" href="http://apcocoa.org/forum/">the ApCoCoA & CoCoA forum</a> 
* #sage-devel on freenode 


---

 

* <a href="/CategoryHomepage">CategoryHomepage</a> 