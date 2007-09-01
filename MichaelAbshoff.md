= Michael Abshoff's Wiki SAGE page =

Hello, I study math at the University of Dortmund. Most of the time I spend with SAGE is dedicated around packages and their portability. I added valgrind support to Sage 2.8.3 and have been using various valgrind tools to investigate Sage's memory consumption.


== Task Table ==

=== Currently Working on ===
 * hunt mem-leaks in C/C++ code of Sage 
 * Solaris port of SAGE.
 * DMG installation image for MacOSX
 * optional spkgs: CoCoA 4.7.x, ApCoCoALib & CoCoALib, g++ 4.2
 
=== Short Term ===
 * build unified Setup.py for gdmodule
 * multivariate polynomial arithmetic via CoCoALib
 * computation of approximate vanishing ideals via ApCoCoALib (needs multivariate polynomial arithmetic via CoCoALib)
 * check targets for various SAGE packages like gmp and linbox
 * make all packages using BLAS/Lapack use the Accelerate Framework on MacOSX. Patch for Linbox exists and will hopefully show up in Linbox svn soon

=== Long Term ===
 * F4/F5 in CoCoALib with interface to  SAGE

=== Interesting Ideas ===
 * port SAGE code to MinGW/MSVC - probably done when hell freezes over - but one can at least dream.
 * fix pari issue on cygwin - details FIXME

== Done Tasks ==
 * See the Changelog, the google groups sage-devel and sage-support and #sage-devel on freenode.

= Other Software Interests =
 * Windows gmp port
 * Linbox with MSVC
 * Porting mathematical open source code to Solaris, Windows and any odd Unix out there. 

= Places where I can be found =
 * google group sage-devel
 * google group linbox-devel
 * google group linbox-use
 * [http://cocoa.mathematik.uni-dortmund.de/forum/ the CoCoA forum]
 * #sage-devel on freenode

----
CategoryHomepage
