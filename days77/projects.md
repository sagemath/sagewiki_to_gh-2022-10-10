= Sage Days 77: projects =

== Sage developer days on packaging, portability, documentation tools ==

Tentative topics for [[days77|Sage Days 77]]. Please edit freely.

Add your name to topics you are interested in.


=== Packaging ===

Cross-platform (Linux, OS X, Windows, ...)

  * Docker
  * !ZeroInstall

Linux (see also [[https://wiki.sagemath.org/Infrastructure#Packaging_for_Linux|Infrastructure page]])

  * Arch-Linux
  * Debian
  * Fedora
  * Gentoo
  * NPM
  * RPM
  * Ubuntu PPA

OS X? (Fink, Homebrew, !MacPorts)

=== Relocating SageMath once built ===

  * See recent discussions on sage-devel, sage-release, sage-support around the relocate-once script

=== Windows port ===

  * Using Cygwin etc.
    * [[http://trac.sagemath.org/ticket/13841|Cygwin port metaticket on Sage trac]]
    * Cygwin32
    * Cygwin64: [[http://trac.sagemath.org/wiki/Cygwin64Port|Cygwin64 port notes on Sage trac wiki]]
    * MSYS2
    * MINGW

  * one-click install
    * windows one-click installer, using either Docker, or Cygwin etc, or a native port

=== SageMath Live ===

  * SageDebianLive
  * [[https://launchpad.net/~aims/+archive/ubuntu/aims-desktop|AIMS Desktop]] is an installer and LiveISO which includes Sagemath. Should soon be available as a public ISO. Will either recompile all Ubuntu binaries in order to be allowed to redistribute, or rebase on Debian.

=== Modularization ===

  * Make Sage more modular, using pip packages.
    * Make interrupt.pyx a stand-alone package: [[https://github.com/sagemath/cysignals]] and [[http://trac.sagemath.org/ticket/20002|Trac #20002]]

=== Documentation ===

  * [[https://github.com/OpenDreamKit/OpenDreamKit/issues/87|Sphinx]]
  * Memory requirements to build Sage documentation
    * http://gentoo.2317880.n4.nabble.com/sage-on-gentoo-Cannot-install-sage-doc-insufficient-memory-td285831.html
    * https://groups.google.com/d/msg/sage-release/81bxW-7_qX0/BGDs8bGEFQAJ