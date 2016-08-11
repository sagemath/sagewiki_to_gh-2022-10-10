= Distribution and packaging of SageMath =

Here are some links about distributing Sage.

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
  * admin: tmonteil
  * hosted at: http://sagedebianlive.metelu.net/
  * mailing list: https://sagedebianlive.metelu.net/mailman/listinfo/devel

= Linux distros =

  * mailing-list: [[https://groups.google.com/forum/#!forum/sage-packaging|sage-packaging]]

== Arch-linux ==
  * hosted at: https://www.archlinux.org/packages/community/x86_64/sagemath/
  * wiki page: https://wiki.archlinux.org/index.php/SageMath
  * maintainer: Antonio Rojas

== Debian ==
  * wiki page: https://wiki.debian.org/DebianScience/Sage
  * people: Julien Puydt (Snark)
  * (Sage-side) mailing list (dormant): [[https://groups.google.com/forum/#!forum/debian-sage|debian-sage]]
  * (Debian-side) mailing list (created 2016-08-10): https://lists.alioth.debian.org/mailman/listinfo/debian-science-sagemath
  * Debian-science mailing list (used before debian-science-sagemath was created): https://lists.debian.org/debian-science/

== Fedora package ==
  * hosted at: https://apps.fedoraproject.org/packages/sagemath
  * wiki page: https://fedoraproject.org/wiki/SIGs/SciTech/SAGE
  * see also: https://admin.fedoraproject.org/pkgdb/package/rpms/sagemath/
  * maintainer: Paulo Cesar Pereira de Andrade (pcpa)

== Gentoo: Sage-on-Gentoo ==
  * repository: https://github.com/cschwan/sage-on-gentoo
  * admin: fbissey, cschwan

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

== Cantor ==

  * home page: https://edu.kde.org/cantor/
  * author: https://arieder.wordpress.com
  * wiki page here: https://wiki.sagemath.org/Cantor

== TeXmacs ==

  * wiki page here: https://wiki.sagemath.org/TeXmacs
  * wiki page there: http://www.texmacs.org/tmweb/plugins/cas.en.html

= Discussions =

  * Sage Days 77: https://wiki.sagemath.org/days77
