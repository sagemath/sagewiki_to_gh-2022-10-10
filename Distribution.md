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
  * wiki page: [[Conda]]

= Linux distros =
  * mailing-list: [[https://groups.google.com/forum/#!forum/sage-packaging|sage-packaging]]

== Arch-linux ==
  * hosted at: https://www.archlinux.org/packages/community/x86_64/sagemath/
  * wiki page: https://wiki.archlinux.org/index.php/SageMath
  * repo: https://git.archlinux.org/svntogit/community.git/?h=packages/sagemath
  * maintainer: Antonio Rojas

== Debian ==
  * wiki page: https://wiki.debian.org/DebianScience/Sage
  * packages: https://packages.debian.org/sagemath
  * build logs: https://buildd.debian.org/status/package.php?p=sagemath including ptestlong results
  * repo: https://anonscm.debian.org/cgit/debian-science/packages/sagemath.git
    * patches: https://anonscm.debian.org/cgit/debian-science/packages/sagemath.git/tree/debian/patches/
  * mailing list: https://lists.alioth.debian.org/mailman/listinfo/debian-science-sagemath
    * earlier discussions happened on the [[https://lists.debian.org/debian-science/|debian-science mailing list]]
    * Sage-side mailing list (dormant): [[https://groups.google.com/forum/#!forum/debian-sage|debian-sage]]
  * status pages: [[http://people.debian.org/~thansen/debian-sage-status.html|master branch]] [[http://people.debian.org/~thansen/debian-sage-dev-status.html|develop branch]] [[http://people.debian.org/~thansen/debian-sage-7.4-status.html|7.4]]
  * people: Tobias Hansen, Julien Puydt, Jerome Benoit, Ximin Luo

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

== Ubuntu ==
  * packages: http://packages.ubuntu.com/sagemath derived from the [[#Debian|Debian]] packages
  * earlier PPA: https://launchpad.net/~aims/+archive/ubuntu/sagemath
    * admin: pipedream

= Mac OS X / OS X / macOS =

== Homebrew ==

!SageMath can now be installed via Homebrew. This fetches the dmg for the app and installs the app.
See [[https://groups.google.com/d/msg/sage-devel/jdLfIKQ1M18/PVQqJUUqAgAJ|this post on sage-devel]].

= Windows =

== SageMath installer for Windows ==
  * see SageWindows
  * hosted at: https://github.com/sagemath/sage-windows/releases
  * based on the Cygwin port of Sage

== Porting to Cygwin ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+Cygwin|component: "porting: cygwin"]]
  * wiki pages on Sage's trac: [[https://trac.sagemath.org/wiki/CygwinPort|Cygwin32]], [[https://trac.sagemath.org/wiki/Cygwin64Port|Cygwin64]]

== Discussion ==
  * mailing list (dormant): [[https://groups.google.com/forum/#!forum/sage-windows|sage-windows]]

= Porting to exotic architectures =

  * trac-wiki: [[https://trac.sagemath.org/wiki/ExoticPorts|Porting SageMath to Exotic architectures]]
  
== BSD ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+BSD|component: "porting: BSD"]]
  * previous effort: [[https://svnweb.freebsd.org/ports/head/math/sage/|Sage on FreeBSD]]

== Solaris ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+Solaris|component: "porting: Solaris"]]

== AIX, HP-UX ==
  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+AIX+or+HP-UX|component: "porting: AIX or HP-UX"]]

= Using SageMath through other software =

Other software, such as Cantor and !TeXmacs, have interfaces to SageMath.

See [[https://wiki.sagemath.org/Interfaces#Interfaces_to_SageMath_in_other_software|Interfaces to Sage in other software]].

= Discussions =

  * Sage Days 77: https://wiki.sagemath.org/days77
