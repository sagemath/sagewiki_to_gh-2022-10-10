Sage is fully supported on the following platforms:

 * Linux on x86
 * Linux on x86-64, i.e. AMD's Athlon 64 & Opteron CPUs and Intel's CPUs with EMT64 extension
 * Linux on IA64
 * Linux on PPC (32 bit only)
 * MacOSX 10.4 and 10.5 on PPC (32 bit only)
 * MacOSX 10.4 and 10.5  on Intel (32 bit only)
 * VMWare via a 32 bit Linux image (we support a specific preconfigured image meant for use in Windows).

"Supported" means all doctests pass. If not, please report the problem to the Google group [http://groups.google.com/group/sage-devel sage-devel] or [http://groups.google.com/group/sage-support sage-support]. You can also report problems in the IRC channel #sage-devel on [http://freenode.net freenode].
 
The following platforms are feasible in the short term and depend mostly on somebody who is willing to do the job. If you intend to work on a specific port, please let the Sage people know.
ard)

 * Solaris 9 on Sparc 32 bit (ongoing, getting close, mabshoff is working on this)
 * Solaris 9 on Sparc 64 bit (work will start on this once the 32 bit port works)
 * Solaris 10 on Sparc 32 bit (ongoing, getting close, mabshoff is working on this)
 * Solaris 10 on Sparc 64 bit (work will start on this once the 32 bit port works)
 * Solaris 10 on x86 32 bit, Opteron/EMT64 32 bit (ongoing, getting close, mabshoff is working on this)
 * Solaris 10 on Opteron/EMT64 64 bit (work will start on this once the 32 bit port works)
 * BSD support on x86, x86-64: most likely FreeBSD
 * Windows/MSVC 32 & 64 bit: monumental undertaking, estimate: 1-2 man years, but we are receiving funding to do the port
 * Windows/Cygwin: this port was dropped due to numerous problems after the 2.5.0 release, but will be resurrected as a stepping stone in the MSVC port

The status of various ports can be followed in the following places:
 * the Solaris port can be followed at [:solaris:The Solaris port page].
 * the Windows ports can be followed at [:windows:The Windows port page].
 * the FreeBSD port can be followed at [:freebsd:The FreeBSD port page].
 * the AIX 64 bit port is in the early stages - it can be followed at [:AIX64:The AIX 64 bit port page]
 * the Linux ppc64 port can be followed at [:linuxPPC64:The Linux PPC64 port page]
 * the Linux Mips64 port can be followed at [:SiCortex:The SiCortex port page].
 * the 64 bit MacIntel port is ongoing, but needs some more work
