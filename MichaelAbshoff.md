= Michael Abshoff's Wiki SAGE page =
Hello, I study math at the University of Dortmund. Most of the time I spend with SAGE is dedicated around packages and their portability. I added valgrind support to Sage 2.8.3 and have been using various valgrind tools to investigate Sage's memory consumption.

I am the main release manager for Sage and I chaired a number of releases - 29 so far: 

 * 2.8.11, 2.8.13-2.8.15
 * 2.9, 2.9.2-3
 * 2.10, 2.10.1-3, 2.10.4 (together with Robert Miller)
 * 2.11
 * 3.0, 3.0.1-6
 * 3.1, 3.1.1-4
 * 3.2, 3.2.1-3 

== Sage Projects ==

=== High Level ===

 * Probably chairing the current Sage release
 * [[solaris|Solaris port of Sage]]
 * [[freebsd|FreeBSD port of Sage]]
 * [[windows|MSVC port of Sage]]
 * [[windows|Cygwin re-port of Sage]]
 * [[osx64|64 bit OSX port of Sage]]
 * hunt mem-leaks in C/C++ code of Sage
 * [[DebianSAGE]]
 * whatever else currently needs fixing
 * [[http://trac.sagemath.org/sage_trac/query?status=new&status=assigned&status=reopened&owner=mabshoff&order=priority|My open trac tickets]] (the idea was shamelessly stolen from Martin Albrecht)

=== Low Level: Build System Improvements ===

A list of things on my ToDo list related to the build system. As things mature they will be moved to their own SEP:

 * compiler classes, i.e. gcc, icc, sun cc, MSVC
 * the construct 'export MAKE="make -j10"' is bad, we need something like SAGE_BUILD_THREADS and SAGE_MAKE and use those
 * Sage on 64 bit OSX 10.5 and higher, Solaris, FreeBSD
 * gcc 4.4 snapshots or whatever else is coming up
 * OSX 10.6 coming up
 * Cygwin support coming back
 * Fortran infrastructure rework - i.e. support for g77, g95, gfortran and the SiCortex Fortran compiler
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
  * Linux - tmpfs - http://en.wikipedia.org/wiki/TMPFS: "Usage of tmpfs for example is "mount -t tmpfs -o size=1G,nr_inodes=10k,mode=0700 tmpfs /space" which will allow up to 1 GiB in RAM/swap with 10240 inodes and only accessible by the owner of the directory /space. The filesystem's maximum size can also be changed on-the-fly, like "mount -o remount,size=2G /space"."
  * OSX: http://lists.apple.com/archives/darwin-kernel/2004/Sep/msg00004.html


== Done Tasks ==
 * [[http://trac.sagemath.org/sage_trac/query?status=closed&owner=mabshoff&order=priority|My closed trac tickets]] (the idea was shamelessly stolen from Martin Albrecht)
 * See the Changelog, the google groups sage-devel and sage-support and #sage-devel on freenode.
 * DMG installation image for MacOSX [other people did most of the work here]
 * make all packages using BLAS/Lapack use the Accelerate Framework on MacOSX. Patch for Linbox exists and will hopefully show up in Linbox svn soon
= Other Software Interests =
 * Linbox with MSVC
 * Porting mathematical open source code to Solaris, Windows and any odd Unix out there.
= Places where I can be found =
 * google groups sage-devel, sage-support, linbox-devel, group linbox-use
 * [[http://apcocoa.org/forum/|the ApCoCoA & CoCoA forum]]
 * #sage-devel on freenode
----
 CategoryHomepage
