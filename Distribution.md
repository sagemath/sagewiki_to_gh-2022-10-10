= Distribution and packaging of SageMath =

Here are some links and information about distributing Sage.

Related pages: SupportedPlatforms, [[days77/packaging]]

<<TableOfContents()>>

= Source and pre-compiled binaries =

The release manager releases the source for each development release
and each public release. Binaries for a number of operating systems
are prepared by the release manager, and sometimes by more people.

  * source (public): http://www.sagemath.org/download-source.html
  * source (devel): http://www.sagemath.org/download-latest.html
  * binaries: http://www.sagemath.org/download.html

= Containers =

== Docker ==
  * url: https://hub.docker.com/u/sagemath/
  * admin: vbraun, sebasguts, nthiery, embray

== Virtualbox ==
  * see SageAppliance
  * people: vbraun

= Live USB =

== Sage Debian Live ==
  * admin: tmonteil
  * hosted at: http://sagedebianlive.metelu.net/
  * mailing list: https://sagedebianlive.metelu.net/mailman/listinfo/devel

== AIMS Desktop ==
  * url: https://launchpad.net/~aims/+archive/ubuntu/aims-desktop
  * admin: pipedream

== Clef agreg ==
  * url: http://clefagreg.dnsalias.org/
  * what: bootable "Linux + math software" environment for French "agrégation" exams
  * admin: François Boisson

= Anaconda / Conda / Conda Forge =

In preparation.

= Linux distros =
  * mailing-list: [[https://groups.google.com/forum/#!forum/sage-packaging|sage-packaging]]

== Arch-linux ==
  * hosted at: https://www.archlinux.org/packages/community/x86_64/sagemath/
  * wiki page: https://wiki.archlinux.org/index.php/SageMath
  * repo: https://git.archlinux.org/svntogit/community.git/?h=packages/sagemath
  * maintainer: Antonio Rojas

== Debian ==
  * wiki page: https://wiki.debian.org/DebianScience/Sage
  * (Sage-side) mailing list (dormant): [[https://groups.google.com/forum/#!forum/debian-sage|debian-sage]]
  * (Debian-side) mailing list (created 2016-08-10): https://lists.alioth.debian.org/mailman/listinfo/debian-science-sagemath
  * Debian-science mailing list (used before debian-science-sagemath was created): https://lists.debian.org/debian-science/
  * Some steps: https://www.logilab.org/blogentry/5540528
  * people: Julien Puydt (Snark), Julien Cristau, 

== Fedora package ==
  * hosted at: https://apps.fedoraproject.org/packages/sagemath
  * wiki page: https://fedoraproject.org/wiki/SIGs/SciTech/SAGE
  * see also: https://admin.fedoraproject.org/pkgdb/package/rpms/sagemath/
  * mailing list: https://lists.fedoraproject.org/archives/list/scitech@lists.fedoraproject.org/
  * maintainer: Paulo Cesar Pereira de Andrade (pcpa)

== Gentoo: Sage-on-Gentoo ==
  * repository: https://github.com/cschwan/sage-on-gentoo
  * Known test failures: https://github.com/cschwan/sage-on-gentoo/wiki/Known-test-failures
  * admin: fbissey, cschwan

== Guix/Nix ==
  * some info: [[days77/packaging]]
== RPM package (Fedora, Mandriva) ==
  * hosted at: http://rpmfind.net/linux/rpm2html/search.php?query=sagemath

== Ubuntu (PPA) ==
  * purpose: easy-to-install Ubuntu .deb packages
  * hosted at: launchpad.net
  * admin: pipedream
  * contact: https://launchpad.net/~aims/+archive/ubuntu/sagemath

= Windows =

== SageMath installer for Windows ==
  * in alpha stage
  * requires HAV activation in the BIOS
  * hosted at: https://github.com/embray/sage-windows/releases

== Porting to Cygwin ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+Cygwin|component: "porting: cygwin"]]
  * wiki pages on Sage's trac: [[https://trac.sagemath.org/wiki/CygwinPort|Cygwin32]], [[https://trac.sagemath.org/wiki/Cygwin64Port|Cygwin64]]

== Discussion ==
  * mailing list (dormant): [[https://groups.google.com/forum/#!forum/sage-windows|sage-windows]]

= Porting to exotic architectures =

  * trac-wiki: [[https://trac.sagemath.org/wiki/ExoticPorts|Porting SageMath to Exotic architectures]]
  
== BSD ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+BSD|component: "porting: BSD"]]

== Solaris ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+Solaris|component: "porting: Solaris"]]

== AIX, HP-UX ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+AIX+or+HP-UX|component: "porting: AIX or HP-UX"]]

= Using SageMath through other software =

Other software, such as Cantor and !TeXmacs, have interfaces to SageMath.

See [[https://wiki.sagemath.org/Interfaces#Interfaces_to_SageMath_in_other_software|Interfaces to Sage in other software]].

= Discussions =

  * Sage Days 77: https://wiki.sagemath.org/days77
