Sage is fully supported on the following platforms:

 * Linux on x86
 * Linux on x86-64, i.e. AMD's Athlon 64 & Opteron CPUs and Intel's CPUs with EMT64 extension
 * Linux on IA64
 * MacOSX on PPC (32 bit only)
 * MacOSX on Intel (32 bit only)
 * VMWare via a 32 bit Linux image

Supported means all doctests pass. If not please report the problem to the Google group sage-devel or sage-support. You might also report problems in the IRC channel #sage-devel on freenode.
 
The following platforms are feasible in the short term an depend mostly on somebody who is willing to do the job. If you intend to work  on a specific port please let the Sage people know.

 * Linux PPC 32 bit [99.9% done, only open issue is DSage platform support, mabshoff is working on this]
 * Linux PPC 64 bit [planning, hardware access available]
 * MacOSX on PPC 64 bit
 * MacOSX on Intel 64 bit 
 * Solaris 9 on Sparc 32 bit [ongoing, getting close, mabshoff is working on this]]
 * Solaris 9 on Sparc 64 bit
 * Solaris 10 on Sparc 32 bit [ongoing, getting close, mabshoff is working on this]]
 * Solaris 10 on Sparc 64 bit
 * Solaris 10 on x86 32 bit
 * Solaris 10 on Opteron/EMT64 64 bit [ongoing, getting close, mabshoff is working on this]]

Wanted/wishlist:

 * AIX 64 bit [access to hardware missing]
 * Windows/MSVC 32 & 64 bit [monumental undertaking, estimate: 1-2 man years]

It used to be supported on:

 * Windows/Cygwin - this port was dropped due to numerous problems after the 2.5.0 release
