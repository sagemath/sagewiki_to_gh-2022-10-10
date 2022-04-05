= Distribution and packaging of SageMath =

Here are some links and information about distributing Sage.

Related pages: [[days77/packaging]], [[Infrastructure]]

<<TableOfContents()>>

= Source and pre-compiled binaries =

The release manager releases the source for each development release
and each public release. Binaries for a number of operating systems
are prepared by the release manager, and sometimes by more people.

  * source (public): http://www.sagemath.org/download-source.html
  * source (devel): http://www.sagemath.org/download-latest.html
  * binaries: http://www.sagemath.org/download.html

= Containers =

== Binder ==

  * url: https://github.com/sagemath/sage-binder-env

== Docker images ==

=== Official SageMath Docker images ===

  * url: https://hub.docker.com/u/sagemath/
  * admin: vbraun, sebasguts, nthiery, embray

=== Computational topology Sage Docker image ===

  * ships: !SageMath, !SnapPy, Regina, PHCPack, pandas, pe, gridlink, flipper, curver, heegaard, pygraphviz
  * url: https://hub.docker.com/r/computop/sage/
  * bitbucket repo: https://bitbucket.org/t3m/sagedocker
  * dockerfile: https://bitbucket.org/t3m/sagedocker/src/tip/sage/Dockerfile
  * people: Nathan Dunfield

=== CoCalc Docker images ===

Official !CoCalc Docker image:

  * ships !CoCalc, including !SageMath
  * url: https://hub.docker.com/r/sagemathinc/cocalc/
  * !GitHub repo: https://github.com/sagemathinc/cocalc-docker
  * people: wstein

Other !CoCalc Docker images might ship !SageMath too:

  * https://hub.docker.com/search/?q=cocalc

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

= Package managers =

This section is about SageMath packages in package managers, which can be
related to particular Linux distributions, or macOS-specific (like Homebrew),
or distribution-agnostic, or even OS-agnostic.

  * general SageMath packaging mailing list:
    [[https://groups.google.com/forum/#!forum/sage-packaging|sage-packaging]]

== Arch-linux ==

  * hosted at: https://www.archlinux.org/packages/community/x86_64/sagemath/
  * wiki page: https://wiki.archlinux.org/index.php/SageMath
  * repo: https://git.archlinux.org/svntogit/community.git/?h=packages/sagemath
  * to install: ```sudo pacman -S sagemath```
  * maintainer: Antonio Rojas

== Conda / Anaconda / Miniconda / Conda Forge ==

  * wiki page: [[Conda]]
  * people: isuruf, saraedum

== Debian ==

  * wiki page: https://wiki.debian.org/DebianScience/Sage
  * packages: https://packages.debian.org/sagemath
  * package tracker: https://tracker.debian.org/teams/debian-sagemath/
  * build logs: https://buildd.debian.org/status/package.php?p=sagemath including ptestlong results
  * repo: https://anonscm.debian.org/cgit/debian-science/packages/sagemath.git
    * patches: https://anonscm.debian.org/cgit/debian-science/packages/sagemath.git/tree/debian/patches/
  * mailing list: https://lists.alioth.debian.org/mailman/listinfo/debian-science-sagemath
    * earlier discussions happened on the [[https://lists.debian.org/debian-science/|debian-science mailing list]]
    * Sage-side mailing list (dormant): [[https://groups.google.com/forum/#!forum/debian-sage|debian-sage]]
  * status pages: [[http://people.debian.org/~thansen/debian-sage-status.html|master branch]] [[http://people.debian.org/~thansen/debian-sage-dev-status.html|develop branch]] [[http://people.debian.org/~thansen/debian-sage-7.4-status.html|7.4]]
  * bug tracker: [[https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=sagemath|Debian bugs: package sagemath]]
  * people: Tobias Hansen, Julien Puydt, Jerome Benoit, Ximin Luo

== Fedora package ==

  * hosted at: https://apps.fedoraproject.org/packages/sagemath
  * wiki page: https://fedoraproject.org/wiki/SIGs/SciTech/SAGE
  * see also: https://admin.fedoraproject.org/pkgdb/package/rpms/sagemath/
  * mailing list: https://lists.fedoraproject.org/archives/list/scitech@lists.fedoraproject.org/
  * maintainer: Paulo Cesar Pereira de Andrade (pcpa)

== Gentoo: Sage-on-Gentoo ==

  * repository: https://github.com/cschwan/sage-on-gentoo
  * Issues: https://github.com/cschwan/sage-on-gentoo/issues
  * Maintainer: François Bissey (fbissey/kiwifb)

== Homebrew ==

!SageMath can now be installed on macOS via Homebrew by running
{{{
brew cask install sage
}}}
This fetches the dmg for the app, and installs the app from that dmg.
See [[https://groups.google.com/d/msg/sage-devel/jdLfIKQ1M18/PVQqJUUqAgAJ|this post on sage-devel]].

== Nix ==

  * Nix package manager: https://nixos.org/nix/
  * Sage package: https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/science/math/sage
  * Distribution-agnostic, functional, declarative package managing.
  * Should always have 0 doctest failures. To achieve that, [[https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/science/math/sage/default.nix|some]] dependency versions are pinned. That is not an issue because Nix allows multiple versions of a package to be installed at the same time. However the goal is to minimize the amount of pinned dependencies.
  * Should work on most Linux distributions. More precisely any Linux distro where the Nix package manager is available, e.g. [[https://aur.archlinux.org/packages/nix|ArchLinux]], Debian, [[https://nixos.org/nix/|others]] -- definitely works on [[https://nixos.org/|NixOS]].
  * Tested on x86 Linux. Probably works on ARM but that is as of yet untested.
  * Could run on Darwin, but currently doesn't since some dependencies don't have Darwin-specific patches. If you're a Darwin user, help with that would be very much appreciated. This is [[https://github.com/NixOS/nixpkgs/pull/45364|work in progress]].
  * Might even work with the "Windows Subsystem for Linux", but probably needs some patches. Absolutely untested.
  * Allows user-installs, given that the nix package manager is already installed.
  * To install: `nix-env -iA nixpkgs.sage` or on NixOS just add sage to your `environment.systemPackages`
  * Betas are usually packaged in [[https://github.com/NixOS/nixpkgs/pull/44527|a PR]] until the release is final.
  * Currently (2018-07-26) maintained by timokau. Any help is appreciated. If you are interested (even if you don't know anything about nix yet), [[open an issue||https://github.com/NixOS/nixpkgs/issues/new]] pinging @timokau and I'll help you get started.

== RPM package (Fedora, Mandriva) ==

  * hosted at: http://rpmfind.net/linux/rpm2html/search.php?query=sagemath

== Ubuntu ==

  * packages: http://packages.ubuntu.com/sagemath derived from the [[#Debian|Debian]] packages
  * earlier PPA: https://launchpad.net/~aims/+archive/ubuntu/sagemath

== Other ==

Please edit this wiki or email slelievre if you know about other package managers
providing !SageMath... See
[[https://en.wikipedia.org/wiki/List_of_software_package_management_systems|wikipedia's list of package managers]].

= Windows =

== SageMath installer for Windows ==

  * see SageWindows
  * hosted at: https://github.com/sagemath/sage-windows/releases
  * based on the Cygwin port of Sage

== Porting to Cygwin ==

  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+Cygwin|component: "porting: cygwin"]]
  * wiki pages on Sage's trac: [[https://trac.sagemath.org/wiki/CygwinPort|Cygwin32]], [[https://trac.sagemath.org/wiki/Cygwin64Port|Cygwin64]]

== Windows subsystem for Linux ==

  * Under Windows 10, one can run the "Windows Subsystem for Linux" to "run Linux under Windows", and install !SageMath binaries for Linux.

== Discussion ==

  * mailing list (dormant): [[https://groups.google.com/forum/#!forum/sage-windows|sage-windows]]

= Porting to exotic architectures =

  * trac-wiki: [[https://trac.sagemath.org/wiki/ExoticPorts|Porting SageMath to Exotic architectures]]
  * outdated: SupportedPlatforms

== BSD ==

  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+BSD|component: "porting: BSD"]]
  * previous effort: [[https://svnweb.freebsd.org/ports/head/math/sage/|Sage on FreeBSD]]

== Solaris ==

  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+Solaris|component: "porting: Solaris"]]

== AIX, HP-UX ==

  * pending tickets: [[https://trac.sagemath.org/query?status=!closed&component=porting%3A+AIX+or+HP-UX|component: "porting: AIX or HP-UX"]]


= Discussion =

  * Sage Days 77: https://wiki.sagemath.org/days77
