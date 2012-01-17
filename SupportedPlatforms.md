<<TableOfContents>>

----
== Supported compilers ==
A miniumum of gcc 4.0.1 is needed to build Sage, though later releases are generally preferable.

== Supported Platforms ==

If you try to build Sage on most Linux or OS X systems, you should have few if any problems and if there are problems, plenty of people will be able to help you. Just ask on [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]] But some distributions are better supported than others - see below for details. 

Building Sage on Solaris or !OpenSolaris is a little tricky, but Sage works on those platforms. Ask for help on [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]] if you have problems. 

If you try to build Sage on something more exotic, you may find a Sage developer able to help you, but you can't be sure. 

Below are listed the supported platforms, along with the level of support given. There are 3 levels of support.

 * 1) Fully supported - Sage is ALWAYS checked on ALL these platforms before a release is made
 * 2) Expected to work -  Sage will probably work, but it is not always tested.
 * 3) Probably will not work - Porting work may be ongoing. 

Specific hardware and software for these 3 levels of support are given below.

=== Fully supported - Sage is ALWAYS checked on ALL these platforms before a release is made ===
Sage is fully supported on the following platforms. This means '''every''' single release of Sage is '''always''' tested on '''all''' these platforms. The testing is performed in an automated way using Buildbot. (You can see what systems we use at http://build.sagemath.org/sage/buildslaves) Failure to build on one of these platforms will stop a release of Sage being made. Usually all Sage's self-tests (doc-tests) will pass, though one or two failures on one or two platforms may occur, and will be documented in an [[errata|errata page]]. Any failures to either build or pass tests are considered very serious bugs. 

Also, we will always make binaries available for these platforms. 

If you wish to set up a server primarily or exclusively for using Sage, you would be advised to install one of these operating systems, rather than one on which Sage is not regularly tested. You should not assume that Sage will necessarily work on the latest release of these systems, though it usually will. 

To aid Sage developers, the hosts on which Sage is fully supported are listed, with a link to the Buildbot page. 

There are five requirements for Sage to work successfully on these fully supported platforms.

 * A full development system must be installed - a minimal install will probably not work if you wish to build from source.
 * The system must not have been mis-configured. Unfortunately, it is not unusual for Sage to fail to build on systems where someone has mis-configured the system. A fresh install of the operating system is not necessary, but any changes made since the installation must have been performed properly.
 * It is recommended to have at least 2 GB of RAM (you may get away with less, but you can not be sure).  In order to run all doctests, Sage needs up to 2.2 GB of memory.
 * You need at least 3 GB of free disk space.
 * gcc >= 4.0.1 for Sage versions of 4.6.2 or earlier. gcc 4.6.0 will not build Sage 4.7.0
 * All instructions must be followed.

====== Linux ======

 * Fedora 16 on x86 (64-bit). Tested on one or more of  [[http://build.sagemath.org/sage/buildslaves/eno-1|eno]], [[http://build.sagemath.org/sage/buildslaves/flavius-1|flavius]], [[http://build.sagemath.org/sage/buildslaves/lena-1|lena]], [[http://build.sagemath.org/sage/buildslaves/sextus-1|sextus]]
 * Fedora 15 on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/taurus-1|taurus]]
 * Fedora 15 on i686 (32-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/cicero-1|cicero]]
 * SUSE 10 SP1 on Itanium (64-bit)  Tested on [[http://build.sagemath.org/sage/buildslaves/iras-1|iras]]
 * Redhat 5.3 on Intel Itanium (64-bit).  Tested on [[http://build.sagemath.org/sage/buildslaves/cleo-1|cleo]]
 * Redhat 5.6 (Tikanga) on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/rosemary-1|rosemary]]
 * Ubuntu 8.04.4 LTS  on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/sage-1|sage]]
 * Ubuntu 10.04.3 LTS on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/redhawk-1|redhawk]]

====== Mac OS X ======
 * OS X 10.4 (Tiger) on PPC.  There is one known problem with the Maxima interface, this will be fixed in sage-5.0, see [[http://trac.sagemath.org/sage_trac/ticket/9361|Trac #9361]].
 * OS X 10.6 (Snow Leopard) 32-bit or 64-bit, with XCode 3 (XCode 4.0.1 is known to produce an executable that does not work).  Tested on [[http://build.sagemath.org/sage/buildslaves/bsd-1|bsd]]

====== OpenSolaris x86 32-bit ======
 * 06/2009 updated to build 134 on x86 (32-bit only). Tested on [[http://build.sagemath.org/sage/buildslaves/hawk-1|hawk]]

=== Expected to work -  Sage will probably work, but it is not always tested. ===
In addition to the above systems where Sage will work, Sage will probably work on the following operating systems, though we can't guarantee that, as it is impractical to test each Sage release on all these systems. Failure to build on these systems will be considered a bug, but we may not have the resources to solve any problems. Sage developers should be able to offer assistance to anyone who can't get Sage to work properly on one of these platforms, but since they might not necessarily have access to the platform, that may be difficult.

If anyone is able to test on these systems, we would particularly appreciate reports of failures, since Sage really should work on these systems. We expect to set up an automated system where people can mail successful build reports, and to generate a web page showing successful builds. But currently neither are in place. 

====== Linux ======
 * Arch on x86 (Both 32-bit and 64-bit) 
 * CentOS  on x86 (Both 32-bit and 64-bit) 
 * Debian 5.0 on x86 (Both 32-bit and 64-bit)
 * Fedora 11 or 12 (Both 32-bit and 64-bit). 
 * Gentoo. The Sage on Gentoo project (http://github.com/cschwan/sage-on-gentoo) is aimed at properly integrating Sage to the Gentoo system, so is quite different to how Sage builds on all other platforms. This is designed for end users, not developers. However, a recent Sage should build from the source on Gentoo, but that would not be the normal way to use Sage on Gentoo. 
 * Red Hat Enterprise Linux Server 5.3 or later. 
 * SUSE Linux Enterprise Server 10 or later on Intel Itanium processors 
 * Ubuntu 8 or later.
 * Ubuntu 11.10 will be supported in sage-4.8.

Other Linux distributions, such as Slackware are never tested, so may or may not work. 

====== Mac OS X ======
 * OS X 10.4 (Tiger) and 10.5 (Leopard), both PPC and Intel chips.  Note that 10.4 PPC is fully supported.

====== Solaris ======
 * Solaris 10 03/2005 or any later Solaris 10 release on SPARC processors in 32-bit mode.
 * Solaris 10 03/2005 or any later Solaris 10 release on x86 processors in 32-bit mode.
 * Solaris 10 on x86 processors in 32-bit mode.
 * Solaris 11 Express on x86 (32-bit has been tested).
 * Solaris 11 Express on SPARC (Never tested).

====== Microsoft Windows ======
 * VMware images can be downloaded from http://www.sagemath.org/download-windows.html These should be reliable, though we do not test these prior to releasing Sage. 

=== Probably will not work - Porting work may be ongoing ===
None of these systems have a complete fully reliable port. In some cases completed ports are highly likely. In other cases, the porting effort is not very significant, and there may be insufficient effort to actually complete a port. 

If anyone has the time to help on these ports, it would be greatly appreciated. 

===== AIX =====
 * A little work has been done on an AIX port. This can be followed at the [[AIX| AIX port page]]. It is not currently clear if this will ever be completed, as there is not a significant effort taking place. If you wish to help, that would be appreciated. If you do not have access to AIX hardware, [[http://www.metamodul.com/|Metamodul]] will provide free public access for open-source development. A couple of Sage developers have used this. Trac ticket [[http://trac.sagemath.org/sage_trac/ticket/9999|Trac #9999]] has the latest list of known issues.

====== FreeBSD ======
 * FreeBSD 8.1 (Substantial work has been done on this)

More information about the status of the FreeBSD port can be found at [[freebsd|Sage port to FreeBSD]].

===== Linux (ARM, Mips64 and PPC64 processors) =====
 * Mips64 The Mips64 port can be followed at [[SiCortex|The SiCortex port page]].
 * PPC64 The 64-bit PowerPC port can be followed at [[http://trac.sagemath.org/sage_trac/ticket/11705|Trac #11705]]

===== HP-UX =====
 * Some work has been done on an HP-UX port to the PA-RISC processor. At least three Sage developers have tested their code on HP-UX.
 * Some work has been done on HP-UX on the Itanium processor.
More information on the HP-UX port can be found on the [[HP-UX]] page. 

===== Microsoft Windows =====
 * Microsoft Windows using Cygwin (Substantial work has been done on this). More information about the status of the Cygwin port can be found at [[http://trac.sagemath.org/sage_trac/wiki/CygwinPort ]] and on the [[http://groups.google.com/group/sage-windows sage-windows]] mailing list.
 * Microsoft Windows using Microsoft's compiler. This will be a full native port. There are some efforts at this. 

===== OpenSolaris 64-bit =====
 * !OpenSolaris 06/2009 on x86 in 64-bit mode.  (Substantial work has been done on this). 

===== Solaris 10 64-bit =====
 * Solaris 10 on x86 processors in 64-bit mode. (Substantial work has been done on this).
 * Solaris 10 on SPARC processors in 64-bit mode. (Substantial work has been done on this).

More information about the status of the Solaris ports can be found on the [[solaris|Solaris]] page of the Sage Wiki. There's also some notes about installing [[solaris-binaries|Solaris binaries]]

====== Mac OS X (XCode 4) ======
 * XCode 4.0.1 is known to produce a Sage executable that segfaults. This needs work. Even more work needs to be done if one wants to use Clang-based compilers that come with it: they cannot even build the whole of Sage.
