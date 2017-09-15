<<TableOfContents>>

----

= Supported platforms =

If you try to build Sage on most Linux or OS X systems, you should have few problems and if there are problems, plenty of people will be able to help you. Just ask on [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]] But some distributions are better supported than others - see below for details. 

Building Sage on Solaris or !OpenSolaris is a little tricky, but Sage (mostly) works on those platforms. Ask for help on [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]] if you have problems. 

If you try to build Sage on something more exotic, you may find a Sage developer able to help you, but you can't be sure. 

Below are listed the supported platforms, along with the level of support given. There are 4 levels of support.

 1. [[#Fully_supported|Fully supported]] - Sage is ALWAYS checked on ALL these platforms before a release is made.
 2. [[#Expected_to_work|Expected to work]] -  Sage will probably work, but it is not always tested.
 3. [[#Almost_works|Almost works]] - Sage builds on these platforms, but there are some known issues.  However, most functionality of Sage should still work.
 4. [[#Probably_will_not_work|Probably will not work]] - Porting work may be ongoing.

Specific hardware and software for these levels of support are given below.

== Fully supported ==
Sage is fully supported on the following platforms. This means '''every''' single '''release''' of Sage is '''always tested''' on all these platforms. The testing is performed in an automated way using Buildbot. (You can see what systems we use at http://build.sagemath.org/#/workers) Failure to build on one of these platforms will stop a release of Sage being made. Any failures to either build or pass tests are considered serious bugs. 

Also, we will usually make binaries available for these platforms. 

If you wish to set up a server primarily or exclusively for using Sage, you would be advised to install one of these operating systems, rather than one on which Sage is not regularly tested. You should not assume that Sage will necessarily work on the latest release of these systems, though it usually will. 

There are several requirements for Sage to work successfully on these fully supported platforms.

 * A full development system must be installed - a minimal install will probably not work if you wish to build from source.
 * The system must not have been mis-configured. Unfortunately, it is not unusual for Sage to fail to build on systems where someone has mis-configured the system. A fresh install of the operating system is not necessary, but any changes made since the installation must have been performed properly.
 * It is recommended to have at least 2 GB of RAM to build Sage (but you may get away with less).  Building in parallel requires additional memory.  In order to run all doctests, Sage needs up to 2.5 GB of virtual memory (RAM + swap).
 * You need 4.5 GB of free disk space.
 * You need to have the [[http://sagemath.org/doc/installation/source.html#prerequisites|prerequisites]] for building Sage.
 * All instructions must be followed.

=== Linux ===
For the most up to date version see http://build.sagemath.org/#/workers any differences between this list and what is listed below should be reported to [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]].
 * Debian 7.1 x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/plantain|plantain]]
 * Fedora 16 on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/eno-1|eno]], [[http://build.sagemath.org/sage/buildslaves/flavius-1|flavius]], [[http://build.sagemath.org/sage/buildslaves/lena-1|lena]], [[http://build.sagemath.org/sage/buildslaves/sextus-1|sextus]]
 * Fedora 16 on i686 (32-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/cicero-1|cicero]]
 * Fedora 20 on x84 (64-bit). Make sure that the {{{perl-ExtUtils-MakeMaker}}} rpm is installed. Tested on [[http://build.sagemath.org/sage/buildslaves/volker-desktop-fedora|volker-desktop]]
 * SUSE 10 SP1 on Itanium (64-bit)  Tested on [[http://build.sagemath.org/sage/buildslaves/iras-1|iras]]
 * Ubuntu 8.04.4 LTS  on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/mod|mod]]
 * Ubuntu 10.04.3 LTS on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/redhawk-1|redhawk]]
 * Ubuntu 13.04 on x86 (32-bit). Make sure that the {{{dpkg-dev}}} package is installed. Tested on [[http://build.sagemath.org/sage/buildslaves/arando-1|arando]]
 * Ubuntu 14.04 on x86 (64-bit). Make sure that the {{{dpkg-dev}}} package is installed. Tested on [[http://build.sagemath.org/sage/buildslaves/snapperkob|snapperkob]]

=== Mac OS X ===
For the most up to date version see http://build.sagemath.org/#/workers any differences between this list and what is listed below should be reported to [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]].
 * OSX 10.6 (Snow Leopard) 64-bit, with XCode 3. Tested on [[http://build.sagemath.org/sage/buildslaves/bsd-1|bsd]]
 * OSX 10.9 (Mavericks) 64-bit, wich XCode 5.1.1. Tested on [[http://build.sagemath.org/sage/buildslaves/volker-desktop-osx|volker-osx]]

=== Solaris SPARC 32-bit ===
For the most up to date version see http://build.sagemath.org/#/workers any differences between this list and what is listed below should be reported to [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]].
 * Solaris 10 on SPARC processors in 32-bit mode. You need to use the '''Solaris linker''' in /usr/ccs/bin/ld (this is normally the default), the GNU linker is not supported. Tested on [[http://build.sagemath.org/sage/buildslaves/mark-1|mark]]

== Expected to work ==
In addition to the above systems where Sage will work, Sage will probably work on the following operating systems, though we can't guarantee that, as it is impractical to test each Sage release on all these systems. Failure to build on these systems will be considered a bug, but we may not have the resources to solve any problems. Sage developers should be able to offer assistance to anyone who can't get Sage to work properly on one of these platforms, but since they might not necessarily have access to the platform, that may be difficult.

If anyone is able to test on these systems, we would particularly appreciate reports of failures, since Sage really should work on these systems. We expect to set up an automated system where people can mail successful build reports, and to generate a web page showing successful builds. But currently neither are in place. 

=== Linux ===
 * Arch on x86 (Both 32-bit and 64-bit).
 * CentOS  on x86 (Both 32-bit and 64-bit).
 * Debian 5.0 or 6.0 on x86 (Both 32-bit and 64-bit).
 * Fedora 11 or later (Both 32-bit and 64-bit). 
 * Gentoo. The Sage on Gentoo project (http://github.com/cschwan/sage-on-gentoo) is aimed at properly integrating Sage to the Gentoo system, so is quite different to how Sage builds on all other platforms. This is designed for end users, not developers. However, Sage should simply build from source on Gentoo.
 * openSUSE 12.1 on x86 (Both 32-bit and 64-bit).
 * Red Hat Enterprise Linux Server 5.3 or later.
 * SUSE Linux Enterprise Server 10 or later on Intel Itanium processors 
 * Ubuntu 8.04 or later.  For Ubuntu 12.04 or later, make sure the ''dpkg-dev'' package is installed.

Other Linux distributions, such as Slackware are never tested, so may or may not work. 

=== Mac OS X ===
 * OSX 10.4 (Tiger) on PPC will build except for the rpy2 package; you can build the "Mac App" and it should work as well. The pexpect interfaces tend to be less reliable than other platforms, so you might see some unreproducible doctest failures.
 * OSX 10.5 (Leopard), both PPC and Intel chips.  
 * OSX 10.7 (Lion) and 10.8 (Mountain Lion) provided you use a sufficiently recent version of XCode.
 * OS X 10.10 (Yosemite) is work in progress and should be supported soon.

=== Solaris ===
 * Solaris 10 03/2005 or any later Solaris 10 release on x86 processors in 32-bit mode.
 * Solaris 10 on x86 processors in 32-bit mode.
 * Solaris 11 Express on x86 (32-bit has been tested).

=== Microsoft Windows (VM) ===
 * [[https://www.virtualbox.org/|VirtualBox]] images can be downloaded from http://www.sagemath.org/download-windows.html These should be reliable, though we do not test these prior to releasing Sage.

== Almost works ==
This lists systems on which Sage builds, but there are a few doctest errors.  However, most of the functionality of Sage should work.  If the doctest failures are fixed, these systems will move to the "fully supported" or "expected to work" categories.

=== Linux ===
 * ARM processors.  All the issues are numerical, where some computations (in particular of the gamma function) yield results with less numerical precision than expected.  See [[http://trac.sagemath.org/sage_trac/ticket/10285|Trac #10285]].
 * ppc64: The 64-bit PowerPC port can be followed at [[http://trac.sagemath.org/sage_trac/ticket/11705|Trac #11705]]. Tested on [[http://build.sagemath.org/sage/buildslaves/silius-1|silius]]

=== FreeBSD ===
 * Sage now works on FreeBSD 8.3 and 9, with only a few doctest errors.  One needs to use the system atlas, and a few other scripts, as well as many patches.   See [[http://www.freebsd.org/cgi/cvsweb.cgi/ports/math/sage/|here for a FreeBSD port]] of Sage, which should include most of this information.  Older information about the status of the FreeBSD port is archived at [[freebsd|Sage port to FreeBSD]].

=== Microsoft Windows (Cygwin) ===
 * Microsoft Windows using Cygwin; see [[http://trac.sagemath.org/sage_trac/ticket/13841|the metaticket for this]].  Sage compiles from source and has only a few doctest failures with only some rebasing issues and one or two unusual prerequisites (currently the mpfr-4 and a few lapack Cygwin packages).  Some slightly old information about the status of the Cygwin port can be found at [[http://trac.sagemath.org/sage_trac/wiki/CygwinPort ]] and on the [[http://groups.google.com/group/sage-windows|sage-windows]] mailing list.

=== OpenSolaris x86 32-bit ===
 * 06/2009 updated to build 134 on x86 (32-bit only), with gcc as well as the Sun compiler.

== Probably will not work ==
None of these systems have a complete fully reliable port. In some cases completed ports are highly likely. In other cases, the porting effort is not very significant, and there may be insufficient effort to actually complete a port. 

If anyone has the time to help on these ports, it would be greatly appreciated. 

=== AIX ===
 * A little work has been done on an AIX port. This can be followed at the [[AIX| AIX port page]]. It is not currently clear if this will ever be completed, as there is not a significant effort taking place. If you wish to help, that would be appreciated. If you do not have access to AIX hardware, [[http://www.metamodul.com/|Metamodul]] will provide free public access for open-source development. A couple of Sage developers have used this. Trac ticket [[http://trac.sagemath.org/sage_trac/ticket/9999|Trac #9999]] has the latest list of known issues.

=== Linux ===
 * Mips64: The Mips64 port can be followed at the [[SiCortex|SiCortex port page]].

=== HP-UX ===
 * Some work has been done on an HP-UX port to the PA-RISC processor. At least three Sage developers have tested their code on HP-UX.
 * Some work has been done on HP-UX on the Itanium processor.
More information on the HP-UX port can be found on the [[HP-UX]] page. 

=== Microsoft Windows (native) ===
 * Microsoft Windows using Microsoft's compiler. This would be a full native port. There are some efforts at this, but none for quite some time.

=== OpenSolaris 64-bit ===
 * !OpenSolaris 06/2009 on x86 in 64-bit mode.  (Substantial work has been done on this). 

=== Solaris 10 64-bit ===
 * Solaris 10 on x86 processors in 64-bit mode. (Substantial work has been done on this).
 * Solaris 10 on SPARC processors in 64-bit mode. (Substantial work has been done on this).

More information about the status of the Solaris ports can be found on the [[solaris|Solaris]] page of the Sage wiki.
