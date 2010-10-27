<<TableOfContents>>

----
== Supported Platforms ==

If you try to build Sage on most Linux or OS X systems, you should have few if any problems and if there are problems, plenty of people will be able to help you. Just ask on [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]] But some distributions are better supported than others - see below for details. 

Building Sage on Solaris or OpenSolaris is a little tricky, but Sage works on those platforms. Ask for help on [[http://groups.google.com/group/sage-support|sage-support@googlegroups.com]] if you have problems. 

If you try to build Sage on something more exotic, you may find a Sage developer able to help you, but you can't be sure. 

Below are listed the supported platforms, along with the level of support given. There are 3 levels of support.

 * 1) Fully supported - Sage is ALWAYS check on ALL these platforms BEFORE a release is made
 * 2) Expected to work -  Sage will probably work, but it is not always tested.
 * 3) Probably will not work - Porting work may be ongoing. 

Specific hardware and software for these 3 levels of support are given below.

=== Fully supported - Sage is ALWAYS check on ALL these platforms BEFORE a release is made ===
Sage is fully supported on the following platforms. This means '''every''' single release of Sage is '''always''' tested on '''all''' these platforms. The testing is performed in an automated way using Buildbot. (You can see what systems we use at http://build.sagemath.org/sage/buildslaves) Failure to build on one of these platforms will stop a release of Sage being made. Usually all Sage's self-tests (doc-tests) will pass, though one or two failures on one or two platforms may occur, and will be documented in an [[errata|errata page]]. Any failures to either build or pass tests are considered very serious bugs. 

Also, we will always make binaries available for these platforms. 

If you wish to set up a server primarily or exclusively for using Sage, you would be advised to install one of these operating systems, rather than one on which Sage is not regularly tested. You should not assume that Sage will necessarily work on the latest release of these systems, though it usually will. 

To aid Sage developers, the hosts on which Sage is fully supported are listed, with a link to the Buildbot page. 

There are five requirements for Sage to work successfully on these fully supported platforms.

 * A full development system must be installed - a minimal install will probably not work if you wish to build from source.
 * The system must not have been mis-configured. Unfortunately, it is not unusual for Sage to fail to build on systems where someone has mis-configured the system. A fresh install of the operating system is not necessary, but any changes made since the installation must have been performed properly.
 * You need at least 2 GB of RAM (you may get away with less, but you can not be sure. Sage has been built on systems with less than 2 GB RAM)
 * You need at least 2.5 GB of free disk space.
 * All instructions must be followed.

====== Linux ======

 * Fedora 13 on x86 (64-bit). Tested on one or more of  [[http://build.sagemath.org/sage/buildslaves/eno-1|eno]], [[http://build.sagemath.org/sage/buildslaves/flavius-1|flavius]], [[http://build.sagemath.org/sage/buildslaves/lena-1|lena]], [[http://build.sagemath.org/sage/buildslaves/sextus-1|sextus]] or  [[http://build.sagemath.org/sage/buildslaves/taurus-1|taurus]]
 * openSUSE 11.1 on x86 (64-bit)  Tested on [[http://build.sagemath.org/sage/buildslaves/iras-1|iras]]
 * openSUSE 11.1 on Itanium (64-bit)  Tested on [[http://build.sagemath.org/sage/buildslaves/menas-1|menas]]
 * Redhat 5.3 on Intel Itanium (64-bit).  Tested on [[http://build.sagemath.org/sage/buildslaves/cleo-1|cleo]]
 * Ubuntu 8.04.4 LTS  on x86 (64-bit). Tested on [[http://build.sagemath.org/sage/buildslaves/sage-1|sage]]
 * Ubuntu 10.04.1 LTS on x86 (64-bit). Tested on  [[http://build.sagemath.org/sage/buildslaves/redhawk-1|redhawk]]


====== Mac OS X ======
 * OS X 10.6 (Snow Leopard) 64-bit. Tested on [[http://build.sagemath.org/sage/buildslaves/bsd-1|bsd]]

====== OpenSolaris ======
 * 06/2009 updated to build 134 on x86 (32-bit only). Tested on [[http://build.sagemath.org/sage/buildslaves/hawk-1|hawk]]

====== Solaris ======
 * Solaris 10 update 1 on SPARC processors (32-bit only) Tested on one or more of  [[http://build.sagemath.org/sage/buildslaves/mark-1|mark]] or [[http://build.sagemath.org/sage/buildslaves/mark2-1|mark2]]
 * Solaris 10 update 5 on x86 processors (32-bit only). Tested on [[http://build.sagemath.org/sage/buildslaves/fulvia-1|fulvia]]

=== Expected to work -  Sage will probably work, but it is not always tested. ===
In addition to the above systems where Sage will work, Sage will probably work on the following operating systems, though we can't guarantee that, as it is impractical to test each Sage release on all these systems. Failure to build on these systems will be considered a bug, but we may not have the resources to solve any problems. Sage developers should be able to offer assistance to anyone who can't get Sage to work properly on one of these platforms, but since they might not necessarily have access to the platform, that may be difficult.

If anyone is able to test on these systems, we would particularly appreciate reports of failures, since Sage really should work on these systems. We expect to set up an automated system where people can mail successful build reports, and to generate a web page showing successful builds. But currently neither are in place. 

====== Linux ======
 * Arch on x86 (Both 32-bit and 64-bit) 
 * CentOS  on x86 (Both 32-bit and 64-bit) 
 * Debian 5.0 on x86 (Both 32-bit and 64-bit)
 * Fedora 11, 12 or (Both 32-bit and 64-bit). 
 * Gentoo. The Sage on Gentoo project (http://github.com/cschwan/sage-on-gentoo) is aimed at properly integrating Sage to the Gentoo system, so is quite different to how Sage builds on all other platforms. This is designed for end users, not developers. However, a recent Sage should build from the source on Gentoo, but that would not be the normal way to use Sage on Gentoo. 
 * openSUSE 11.2 and 11.3 are known not to work currently, though these issues should be fixed for Sage 4.6. 
 * Red Hat Enterprise Linux Server 5.3 or later. 
 * SUSE Linux Enterprise Server 10 or later on Intel Itanium processors 
 * Ubuntu 8 or later. 
 

Other Linux distributions, such as Slackware are never tested, so may or may not work. 

====== Solaris ======
 * Solaris 10 03/2005 or any later Solaris 10 release on SPARC processors in 32-bit mode. (Note Solaris 10 update 1 is fully supported)
 * Solaris 10 03/2005 or any later Solaris 10 release on x86 processors in 32-bit mode. (Note Solaris 10 update 5 is fully supported)

====== Mac OS X ======
 * OS X 10.4 (Tiger) and 10.5 (Leopard). Note that OS X 10.6 (Snow Leopard) is fully supported. 

====== Microsoft Windows ======
 * VMware images can be downloaded from http://www.sagemath.org/download-windows.html These should be reliable, though we do not test these prior to releasing Sage. 

=== Probably will not work - Porting work may be ongoing ===
None of these systems have a complete fully reliable port. In some cases completed ports are highly likely. In other cases, the porting effort is not very significant, and there may be insufficient effort to actually complete a port. 

If anyone has the time to help on these ports, it would be greatly appreciated. 

===== AIX =====
 * A little work has been done on an AIX port. This can be followed at the [[AIX_port| AIX port page]]. It is not currently clear if this will ever be completed, as there is not a significant effort taking place. If you wish to help, that would be appreciated. If you do not have access to AIX hardware, [[http://www.metamodul.com/|Metamodul]] will provide free public access for open-source development. A couple of Sage developers have used this. The AIX port can be followed at [[AIX_port|The AIX port page]] Trac ticket [[http://trac.sagemath.org/sage_trac/ticket/9999|9999]] has the latest list of known issues.

====== FreeBSD ======
 * FreeBSD 8.1 (Substantial work has been done on this, and a port during 2010 is highly likely)

More information about the status of the FreeBSD port can be found at [[freebsd|Sage port to FreeBSD]].

===== Linux =====
 * Mips64 The Mips64 port can be followed at [[SiCortex|The SiCortex port page]].
 * PPC64 The 64-bit PowerPC port can be followed at [[linuxPPC64|the linux PPC64 port page]]
 * Fedora 13 (32-bit). A buildbot for this [[http://build.sagemath.org/sage/buildslaves/cicero-1|cicero]] has never had a successful build. We hope to resolve this. 

===== HP-UX =====
 * Some work has been done on an HP-UX port to the PA-RISC processor. At least three Sage developers have tested their code on HP-UX.
 * Some work has been done on HP-UX on the Itanium processor.
More information on the HP-UX port can be found on the [[HP-UX]] page. 

===== Microsoft Windows =====
 * Microsoft Windows using Cygwin (Substantial work has been done on this. A port can be expected in 2010). More information about the status of the Cygwin port can be found at [[http://trac.sagemath.org/sage_trac/wiki/CygwinPort ]] and on the [[http://groups.google.com/group/sage-windows sage-windows]] mailing list.
 * Microsoft Windows using Microsoft's compiler. This will be a full native port. There are some efforts at this. 

===== OpenSolaris =====
 * !OpenSolaris 06/2009 on x86 in 64-bit mode.  (Substantial work has been done on this. A port can be expected in 2010). 

===== Solaris =====
 * Solaris 10 on x86 processors in 64-bit mode. (Substantial work has been done on this. A port can be expected in 2010).
 * Solaris 10 on SPARC processors in 64-bit mode. (Substantial work has been done on this. A port can be expected in 2010).

More information about the status of the Solaris ports can be found on the [[solaris|Solaris]] page of the Sage Wiki. There's also some notes about installing [[solaris-binaries|Solaris binaries]]
