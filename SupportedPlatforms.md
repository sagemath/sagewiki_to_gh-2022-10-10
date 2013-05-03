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

= Sage 5.9 =

== Fully supported ==
Sage is fully supported on the following platforms. This means '''every''' single '''release''' of Sage is '''always tested''' on all these platforms. The testing is performed in an automated way using Buildbot. (You can see what systems we use at http://build.sagemath.org/sage/buildslaves) Failure to build on one of these platforms will stop a release of Sage being made. Any failures to either build or pass tests are considered serious bugs. 

Also, we will usually make binaries available for these platforms. 

If you wish to set up a server primarily or exclusively for using Sage, you would be advised to install one of these operating systems, rather than one on which Sage is not regularly tested. You should not assume that Sage will necessarily work on the latest release of these systems, though it usually will. 

There are several requirements for Sage to work successfully on these fully supported platforms.

 * A full development system must be installed - a minimal install will probably not work if you wish to build from source.
 * The system must not have been mis-configured. Unfortunately, it is not unusual for Sage to fail to build on systems where someone has mis-configured the system. A fresh install of the operating system is not necessary, but any changes made since the installation must have been performed properly.
 * It is recommended to have at least 2 GB of RAM to build Sage (you may get away with less, but you can not be sure).  In order to run all doctests, Sage needs up to 2.2 GB of virtual memory (RAM + swap).
 * You need 4 GB of free disk space.
 * You need to have the [[http://sagemath.org/doc/installation/source.html|prerequisites]] for building Sage.
 * All instructions must be followed.

=== Linux ===
 * Fedora 16 on x86 (64-bit). Tested on one or more of  [[http://build.sagemath.org/sage/buildslaves/eno-1|eno]], [[http://build.sagemath.org/sage/buildslaves/flavius-1|flavius]], [[http://build.sagemath.org/sage/buildslaves/taurus-1|taurus]]
 * Fedora 16 on i686 (32-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/cicero-1|cicero]]
 * SUSE 10 SP1 on Itanium (64-bit)  Tested on [[http://build.sagemath.org/sage/buildslaves/iras-1|iras]]
 * Redhat 5.6 (Tikanga) on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/rosemary-1|rosemary]]
 * Ubuntu 8.04.4 LTS  on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/sage-1|sage]]
 * Ubuntu 10.04.3 LTS on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/redhawk-1|redhawk]]
 * Ubuntu 12.04 on x86 (64-bit). Make sure that the ''dpkg-dev'' package is installed. Tested on [[http://build.sagemath.org/sage/buildslaves/snapperkob|snapperkob]]
 * Ubuntu 12.10 on x86 (32-bit). Make sure that the ''dpkg-dev'' package is installed. Tested on [[http://build.sagemath.org/sage/buildslaves/arando-1|arando]]

=== Mac OS X ===
 * OS X 10.4 (Tiger) on PPC. The pexpect interfaces tend to be less reliable than other platforms, so you might see some unreproducible doctest failures. Also, the "Mac App" doesn't work on OS X 10.4, but building from source or non-App binaries should work. Tested on [[http://build.sagemath.org/sage/buildslaves/moufang-1|moufang]]
 * OS X 10.6 (Snow Leopard) 64-bit, with XCode 3. Tested on [[http://build.sagemath.org/sage/buildslaves/bsd-1|bsd]]
 * OS X 10.8 (Mountain Lion) 64-bit, with XCode 4.  Tested on [[http://build.sagemath.org/sage/buildslaves/dehaye|dehaye]]

=== OpenSolaris x86 32-bit ===
 * 06/2009 updated to build 134 on x86 (32-bit only), with gcc as well as the Sun compiler. Tested on [[http://build.sagemath.org/sage/buildslaves/hawk-1|hawk]]

=== Solaris SPARC 32-bit ===
 * Solaris 10 on SPARC processors in 32-bit mode. You need to use the '''Solaris linker''' in /usr/ccs/bin/ld (this is normally the default), the GNU linker is not supported. Tested on [[http://build.sagemath.org/sage/buildslaves/mark-1|mark]]

== Expected to work ==
In addition to the above systems where Sage will work, Sage will probably work on the following operating systems, though we can't guarantee that, as it is impractical to test each Sage release on all these systems. Failure to build on these systems will be considered a bug, but we may not have the resources to solve any problems. Sage developers should be able to offer assistance to anyone who can't get Sage to work properly on one of these platforms, but since they might not necessarily have access to the platform, that may be difficult.

If anyone is able to test on these systems, we would particularly appreciate reports of failures, since Sage really should work on these systems. We expect to set up an automated system where people can mail successful build reports, and to generate a web page showing successful builds. But currently neither are in place. 

=== Linux ===
 * Arch on x86 (Both 32-bit and 64-bit).
 * CentOS  on x86 (Both 32-bit and 64-bit).
 * Debian 5.0 or 6.0 on x86 (Both 32-bit and 64-bit).
 * Fedora 11 or later (Both 32-bit and 64-bit). 
 * Gentoo. The Sage on Gentoo project (http://github.com/cschwan/sage-on-gentoo) is aimed at properly integrating Sage to the Gentoo system, so is quite different to how Sage builds on all other platforms. This is designed for end users, not developers. However, a recent Sage should build from source on Gentoo.
 * openSUSE 12.1 on x86 (Both 32-bit and 64-bit).
 * Red Hat Enterprise Linux Server 5.3 or later.
 * SUSE Linux Enterprise Server 10 or later on Intel Itanium processors 
 * Ubuntu 8 or later.  For Ubuntu 12.04, make sure the ''dpkg-dev'' package is installed.

Other Linux distributions, such as Slackware are never tested, so may or may not work. 

=== Mac OS X ===
 * OS X 10.4 (Tiger), 10.5 (Leopard), both PPC and Intel chips.  Note that 10.4 PPC is fully supported.
 * OS X 10.7 (Lion), provided you use a sufficiently recent version of XCode.

=== Solaris ===
 * Solaris 10 03/2005 or any later Solaris 10 release on x86 processors in 32-bit mode.
 * Solaris 10 on x86 processors in 32-bit mode.
 * Solaris 11 Express on x86 (32-bit has been tested).
 * Solaris 11 Express on SPARC (Never tested).

=== Microsoft Windows ===
 * [[https://www.virtualbox.org/|VirtualBox]] images can be downloaded from http://www.sagemath.org/download-windows.html These should be reliable, though we do not test these prior to releasing Sage.

== Almost works ==
This lists systems on which Sage builds, but there are a few doctest errors.  However, most of the functionality of Sage should work.  If the doctest failures are fixed, these systems will move to the "fully supported" or "expected to work" categories.

=== Linux ===
 * ARM processors.  All the issues are numerical, where some computations (in particular of the gamma function) yield results with less numerical precision than expected.  See [[http://trac.sagemath.org/sage_trac/ticket/10285|Trac #10285]].
 * ppc64: The 64-bit PowerPC port can be followed at [[http://trac.sagemath.org/sage_trac/ticket/11705|Trac #11705]].

=== FreeBSD ===
 * Sage now works on FreeBSD 8.3 and 9, with only a few doctest errors.  One needs to use the system atlas, and a few other scripts, as well as many patches.   See [[http://www.freebsd.org/cgi/cvsweb.cgi/ports/math/sage/|here for a FreeBSD port]] of Sage, which should include most of this information.  Older information about the status of the FreeBSD port is archived at [[freebsd|Sage port to FreeBSD]].

=== Microsoft Windows ===
 * Microsoft Windows using Cygwin; see [[http://trac.sagemath.org/sage_trac/ticket/6743|the metaticket for this]].  Sage compiles from source and has only a few doctest failures with only some rebasing issues and one or two unusual prerequisites (currently the mpfr-4 and a few lapack Cygwin packages).  Some slightly old information about the status of the Cygwin port can be found at [[http://trac.sagemath.org/sage_trac/wiki/CygwinPort ]] and on the [[http://groups.google.com/group/sage-windows|sage-windows]] mailing list.

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

=== Microsoft Windows ===
 * Microsoft Windows using Microsoft's compiler. This would be a full native port. There are some efforts at this, but none for quite some time.

=== OpenSolaris 64-bit ===
 * !OpenSolaris 06/2009 on x86 in 64-bit mode.  (Substantial work has been done on this). 

=== Solaris 10 64-bit ===
 * Solaris 10 on x86 processors in 64-bit mode. (Substantial work has been done on this).
 * Solaris 10 on SPARC processors in 64-bit mode. (Substantial work has been done on this).

More information about the status of the Solaris ports can be found on the [[solaris|Solaris]] page of the Sage wiki. There's also some notes about installing [[solaris-binaries|Solaris binaries]].
