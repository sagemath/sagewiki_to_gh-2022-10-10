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

{{http://imgs.xkcd.com/comics/universal_install_script.png}}

[[http://xkcd.com/1654/]]

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

Note: Travis Scrimshaw would be happy to join brainstorms remotely:
''I fly on Wednesday afternoon (Minneapolis time) and arrive Thursday
afternoon (Germany time), but I am basically free all day Tuesday (and
I wake up early). Thursday or Friday works too from Berlin''

François Bissey from sage-on-gentoo: I would be happy to join some brainstorming session remotely from New Zealand. At the time of the meeting I will be 11 hours ahead if I am not mistaken. 9am for you will be 8pm for me, and 8pm for you will be 7am the next day for me. So I may able to connect during your morning for a little bit and if you have late (10pm+) sessions.

=== SageMath Live ===

  * SageDebianLive
  * [[https://launchpad.net/~aims/+archive/ubuntu/aims-desktop|AIMS Desktop]] is an installer and LiveISO which includes Sagemath. Should soon be available as a public ISO. Will either recompile all Ubuntu binaries in order to be allowed to redistribute, or rebase on Debian.

=== Modularization ===

  * Make Sage more modular, using pip packages.
    * Make interrupt.pyx a stand-alone package: [[https://github.com/sagemath/cysignals]] and [[http://trac.sagemath.org/ticket/20002|Trac #20002]]
    * Make the Sage <-> PARI interface a stand-alone package: [[http://trac.sagemath.org/ticket/20238|Trac #20238]]

=== Documentation ===

  * [[https://github.com/OpenDreamKit/OpenDreamKit/issues/87|Sphinx]]
  * Memory requirements to build Sage documentation
    * http://gentoo.2317880.n4.nabble.com/sage-on-gentoo-Cannot-install-sage-doc-insufficient-memory-td285831.html
    * https://groups.google.com/d/msg/sage-release/81bxW-7_qX0/BGDs8bGEFQAJ
