

# Sage Days 77: projects

****Sage developer days on packaging, portability, documentation tools**** 

[[_TOC_]] 

Tentative topics for <a href="/days77">Sage Days 77</a>. Please edit freely. 

Add your name to topics you are interested in. 


# Packaging

Cross-platform (Linux, OS X, Windows, ...) 

   * Docker 
   * ZeroInstall 
Linux (see also <a class="https" href="https://wiki.sagemath.org/Infrastructure#Packaging_for_Linux">Infrastructure page</a>) 

   * Arch-Linux 
   * Debian 
   * Fedora 
   * Gentoo 
   * NPM 
   * RPM 
   * Ubuntu PPA 
OS X? (Fink, Homebrew, MacPorts) 

![http://imgs.xkcd.com/comics/universal_install_script.png](http://imgs.xkcd.com/comics/universal_install_script.png) 

<a class="http" href="http://xkcd.com/1654/">http://xkcd.com/1654/</a> 


# Relocating SageMath once built

   * See recent discussions on sage-devel, sage-release, sage-support around the relocate-once script 

# Windows port

   * Using Cygwin etc. 
         * <a class="http" href="http://trac.sagemath.org/ticket/13841">Cygwin port metaticket on Sage trac</a> 
         * Cygwin32 
         * Cygwin64: <a class="http" href="http://trac.sagemath.org/wiki/Cygwin64Port">Cygwin64 port notes on Sage trac wiki</a> 
         * MSYS2 
         * MINGW 
   * one-click install 
         * windows one-click installer, using either Docker, or Cygwin etc, or a native port 
Note: Travis Scrimshaw would be happy to join brainstorms remotely: _I fly on Wednesday afternoon (Minneapolis time) and arrive Thursday afternoon (Germany time), but I am basically free all day Tuesday (and I wake up early). Thursday or Friday works too from Berlin_ 

François Bissey from sage-on-gentoo: I would be happy to join some brainstorming session remotely from New Zealand. At the time of the meeting I will be 10 hours. 9am for you will be 7pm for me, and 8pm for you will be 6am the next day for me. So I may able to connect during your morning for a little bit and if you have late (11pm+) sessions. 


# SageMath Live

   * <a href="/SageDebianLive">SageDebianLive</a> 
   * <a class="https" href="https://launchpad.net/~aims/+archive/ubuntu/aims-desktop">AIMS Desktop</a> is an installer and LiveISO which includes Sagemath. Should soon be available as a public ISO. Will either recompile all Ubuntu binaries in order to be allowed to redistribute, or rebase on Debian. 

# Modularization

   * Make Sage more modular, using pip packages. 
         * Make interrupt.pyx a stand-alone package: <a class="https" href="https://github.com/sagemath/cysignals">https://github.com/sagemath/cysignals</a> and <a class="http" href="http://trac.sagemath.org/ticket/20002">Trac #20002</a> 
         * Make the Sage <-> PARI interface a stand-alone package: <a class="http" href="http://trac.sagemath.org/ticket/20238">Trac #20238</a> 

# Documentation

   * <a class="https" href="https://github.com/OpenDreamKit/OpenDreamKit/issues/87">Sphinx</a> 
   * <a class="https" href="https://groups.google.com/d/topic/sphinx-users/TXOIeCvJh9k/discussion">Sphinx 1.4 release announcement on sphinx-users</a> 
   * <a class="http" href="http://trac.sagemath.org/ticket/18497">Sage trac ticket #18497 Update Sphinx to 1.3.5</a> (and now to 1.4) 
   * Memory requirements to build Sage documentation 
         * <a href="http://gentoo.2317880.n4.nabble.com/sage-on-gentoo-Cannot-install-sage-doc-insufficient-memory-td285831.html">http://gentoo.2317880.n4.nabble.com/sage-on-gentoo-Cannot-install-sage-doc-insufficient-memory-td285831.html</a> 
         * <a href="https://groups.google.com/d/msg/sage-release/81bxW-7_qX0/BGDs8bGEFQAJ">https://groups.google.com/d/msg/sage-release/81bxW-7_qX0/BGDs8bGEFQAJ</a> 