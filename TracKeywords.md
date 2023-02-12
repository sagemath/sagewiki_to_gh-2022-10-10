

# Standard keywords for Sage trac

You may specify any number of keywords on a given ticket, zero, one or more from any category. Also note that these keywords are mostly for defects rather than enhancements. This page documents some standard keywords, but feel free to use other keywords if you think they are relevant. 


## Kind of bug
**keyword** | **meaning**
build | Sage does not build
doctest | A failure in a doctest
segfault | `Unhandled SIGSEGV: A segmentation fault occurred in Sage` or similar like `Unhandled SIGBUS`
doesnotstart | Sage does not start up
exception | Some command yields an exception where it is not expected
wrongresult | Sage computes something, but the answer is wrong
longresult | Sage computes something but the answer is excessively long, and should be simplified, such as sin<sup>2</sup>(x) +cos<sup>2</sup>(x) instead of 1
memleak | A memory leak
slow | Something is very slow because of a clear bug (don't use this to mean that a whole new algoritm should be implemented to speed things up)
interrupt | Some computation cannot be interrupted or strange stuff happens if it is interrupted


## Where is the bug

When originally posting the bug, these keywords are usually guesses.  But that's okay if you have a strong suspicion. 
**keyword** | **meaning**
atlas, ..., zodb3 | An spkg name if you think the problem is in the spkg or should be fixed in the spkg
upstream | Problem exists upstream
gcc | A bug in gcc (the fact that gcc simply fails does not indicate a bug with gcc.  A good sign for a bug in gcc is if the compilation works with `-O0` but not with `-O3`)


## CPU
**keyword** | **meaning**
SPARC |  Sun SPARC processor
i386 | Intel 32-bit Pentium, or similar processors
x86_64 | Intel 64-bit Pentium, Core2, Xeon, Opteron or similar processors
ia64 | Intel Itanium
PPC | PowerPC processors
PA-RISC | PA-RISC
unknown | I'm not sure what CPU I have


## Operating system
**keyword** | **meaning**
fedora, debian, redhat, other_linux | Any particular distribution
OSX | Mac OS X
Solaris | Solaris
<a href="/OpenSolaris">OpenSolaris</a> | <a href="/OpenSolaris">OpenSolaris</a>
Cygwin | Microsoft Windows using Cygwin
MSCV | Native build using Microsoft or similar compiler
AIX | IBM's AIX
HP-UX | HP's HP-UX
FreeBSD | FreeBSD
Unknown | I'm not sure what operating system is being used


## Kind of patch

Since most patches simply patch the Sage library, we do not have a keyword for that. 
**keyword** | **meaning**
spkg | ticket changes an existing spkg (also put the actual spkg name (e.g. "atlas") as keyword)
newspkg | ticket adds a new spkg which did not exist before
scripts | ticket has a patch to sage_scripts
extcode | ticket has a patch to extcode
examples | ticket has a patch to examples
c_lib | ticket has some patch changing files in c_lib
sageroot | some file not in the sage library, not in any of the above (e.g. `Makefile`)
