

# Packaging and distributing SageMath

_**a Sage days 77 project**_ 

Part of the <a href="/days77">days 77</a> workshop was dedicated to studying possible improvements to <a href="/SageMath">SageMath</a>'s package system and availability in popular distributions. 

There is a cyclic interest in these issues. Past Sage Days that have also dealt with them were <a href="/days4/projects/packaging">days 4</a> and <a href="/days7/DebianPackagingSprint">days 7</a>. 

When talking about _modularization_, _packaging_, _distribution_, etc., Sage devs may mean several different things at the same time: 

* Distributing SageMath as a set of packages for a popular distribution (e.g., Debian, Sage-on-Gentoo, Arch, Anaconda, ...); 
* Improving the current packaging system built in SageMath (the system using `build/make/Makefile` and `spkg-install` scripts), and its interfaces with the development workflow; 
* Splitting the SageMath library into more granular modules (which may or may not depend on some hypothetical SageMath-core package), possibly making some modules optional and/or making them available to general purpose Python code (e.g., via PyPI); 
* Allowing users to share their SageMath code without putting it inside SageMath core. 
Although these are separate problems, the interactions are non-trivial. 

[[_TOC_]] 


## Packaging SageMath for popular distributions

Package maintainers from several distributions were present, in person, or remotely, at Days 77: 

* Gentoo: François Bissey (remote), 
* Debian: Julien Cristau, 
* Arch: Antoine Teutsch, Antonio Rojas (via chat), 
* Guix: Andreas Enge, 
The workshop was the occasion to share knowledge and concerns on packaging <a href="/SageMath">SageMath</a> for Linux distributions. Given that some packagers are not involved in <a href="/SageMath">SageMath</a> development proper, it was decided to create a separate <a class="https" href="https://groups.google.com/forum/#!forum/sage-packaging">sage-packaging mailing list</a> exclusively devoted to packaging issues. 


### Gentoo

At the time of writing, <a href="/SageMath">SageMath</a> ebuilds (packages) have existed for Gentoo for six years. The layout follows closely the Sage layout: 

* One ebuild for the Sage library, 
* Each Sage package is in its own ebuild. 
They are distributed as an <a class="https" href="https://wiki.gentoo.org/wiki/Overlay">overlay</a>, though some individual ebuilds have made it into the standard distro.  

* <a class="https" href="https://github.com/cschwan/sage-on-gentoo">Sources for the Sage on Gentoo overlay</a>. 
At each new <a href="/SageMath">SageMath</a> beta, the Sage-on-Gentoo overaly is updated, usually in less than 24h. This requires a couple of hours of manual work on average: 

* Checking for upgraded packages, and upgrade them in the overlay tree; 
* Pull the git develop tree from SageMath; 
* Run some scripts (which ones?); 
* Build the sage library and run tests; 
* Fix the important failures, accept some minor-looking failures (e.g., because compiling against gmp instead of MPIR) (<a class="https" href="https://github.com/cschwan/sage-on-gentoo/wiki/Known-test-failures">list of known doctest failures</a>). 

#### Additional notes

* Optional packages are occasionally packaged as ebuilds, possibly in response to requests, or because they are already part of the Gentoo main tree. 
* Dependencies between ebuilds are inferred from `build/pkgs` metadata, plus manual cleaning. Build dependencies are mostly correct in `build/pkgs/.../dependencies`, runtime dependencies are much harder. 

### Debian

There have been repeated efforts to package <a href="/SageMath">SageMath</a> for debian, as shown by this (outdated) <a class="https" href="https://wiki.sagemath.org/devel/DebianSage">wiki page</a>. At some point in 2009, a Debian package existed in stable, installing the monolithic sage in /opt/sage; the package became unmaintained and was eventually removed. 

The <a href="/DebianScience">DebianScience</a> project maintains experimental packages for <a href="/SageMath">SageMath</a>, as documented in <a class="https" href="https://wiki.debian.org/DebianScience/Sage">this wiki page</a>. It also tracks dependency versions discrepancies for Debian vs Sagemath's <a class="https" href="https://people.debian.org/~thansen/debian-sage-status.html">master branch</a> and <a class="https" href="https://people.debian.org/~thansen/debian-sage-dev-status.html">develop branch</a>. (<a class="http" href="http://anonscm.debian.org/cgit/collab-maint/sage-status-page.git/">source code for the tracker</a>) 

At Days 77, Julien and others worked on: 

* Packaging the Jupyter/IPython stack, 
* Importing patches to <a href="/SageMath">SageMath</a> from Gentoo, 
* Replacing build time patches to cython with runtime ones, and building cython modules (sage master) on debian. 
More info available on <a class="https" href="https://www.logilab.org/blogentry/5540528">Logilab's blog</a>. 


### Arch

<a class="https" href="https://www.archlinux.org/people/trusted-users/#arojas">Antonio Rojas</a> maintains a very up-to-date <a href="/SageMath">SageMath</a> package for Arch/community (v7.1 at the time of writing). <a class="https" href="https://www.archlinux.de/?page=PackageStatistics">Arch stastics</a> show that >3% of users (who report package statistics) have the package installed. 

<a href="/SageMath">SageMath</a> is split into separate packages, and <a class="https" href="https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/sagemath">some patches</a> are applied. 


#### Current issues

* Because of its rolling-release style, Arch has no way to keep old versions of packages. 
* The <a href="/SageMath">SageMath</a> package tends to be outdated, comparatively to the <a href="/ArchLinux">ArchLinux</a> tradition (typically one month old). 
* There are about seven <a href="/SageMath">SageMath</a> packages for Arch lying around, many of which are monolithic / broken. 
* The <a href="/SageMath">SageMath</a> package needs non trivial patches to work with the versions of the dependencies provided by Arch. 
**Note:** it would be hard to have a stable package that always work for all Arch environments. There are distributions based on Arch that aim at slower but more stable progress (e.g. Antergos). Aiming for a stable package for such would be more reasonable. 


### Guix/Nix

<a class="http" href="http://www.gnu.org/software/guix/">Guix</a> and <a class="https" href="https://nixos.org/nix/">Nix</a> are two very similar distribution agnostic _functional_ package managers. Both projects focus on reproducible builds, in particular building/installing a package twice should give the same result byte-for-byte. 

Efforts were started at Days 77 to package <a href="/SageMath">SageMath</a> for Guix (Andreas Enge) and Nix (Julian Rüth). Andreas managed to make a Guix _recipe_ for <a href="/SageMath">SageMath</a>, and run it, but at the moment it is not up to Guix standards. 

Citing Julian: "I am not sure that Nix/Guix will in the end help much with the problem of distributing or developing Sage. Anyway, if we can get to the point where an unpatched Sage builds in the very restrictive setting those two impose, then it should be relatively easy to build for any distribution." 


### Windows

The topic of Sage on Windows of course stands distinctly apart from the previous sections which pertain solely to Linux distributions.  Where Windows is concerned there are two main issues, the first of which is generally not a deep problem on different flavors of Linux: 

1. Simply building Sage and its dependencies on Windows, and obtaining correct numerical results. 
1. Packaging and distribution of Sage and its dependencies. 
Most of our discussion about Windows pertained to the first issue, as it is still an open problem, and having a correctly functioning Sage on Windows is naturally a higher priority than issues with packaging and distribution per se.  However, easy installation on Windows remains a high priority as well due to the large number of potential Windows users for Sage, and general lack of standard user-friendly distribution mechanisms for software packages on Windows. 


#### Building on Windows

There is some confusion about the differences and relationships between systems for building and running *NIX based software on Windows.  These include Cygwin, MSYS2, and MinGW(-w64).  There are others but these are the only three we discussed.  There is also the recently announced Ubuntu-based Windows Subsystem for Linux (WSL), which will be discussed a little later. 


##### Cygwin

Cygwin is the oldest of these projects--its purpose is to provide a complete as possible set of POSIX standard interfaces built on top of Windows system calls. In many cases this is difficult, slow, and fragile, but doable (most famously problem of emulating `fork()`). The Cygwin project also distributes software built with and designed to run on Cygwin's POSIX emulation layer, including GCC, bintools, and other GNU development tools like the autotools suite--all running through Cygwin. And it includes a whole suite of other common open source *NIX software, including shells, built with Cygwin's tools.  For various reasons most software requires a little bit of porting specifically to work on Cygwin, but some requires little to no extra work at all.   

Because Cygwin provides emulation of many (most?) non-native (to Windows) POSIX features used by Sage and its dependencies, it is the lowest hanging fruit for building a Sage "for Windows".  To be clear, when one builds software in Cygwin they are building it in a sense _for_ Cygwin, as opposed to "for Windows" in that Cygwin is a POSIX-compatibility subsystem on top of Windows, and any software built for Cygwin can't be used without it.  That said, Cygwin itself can and often is  distributed as a single DLL. So a Sage distribution for Windows can include the Cygwin DLL, and the end result is mostly transparent to users. There may be performance degradation due to use of the POSIX-compatibility layer instead of native Windows system calls, but nobody has explored how that affects Sage. It would probably not be significant for pure numerical computation, but it may affect, for example, the performance of Sage's interfaces to other CAS's. 

Cygwin is also a bit outdated and can be difficult to set up. In particular, its packaging system is not very good, and the only (supported) way to install new packages for Cygwin is to re-run Cygwin's graphical installer and select additional packages.  There is however a third-party project called <a class="https" href="https://github.com/transcode-open/apt-cyg">apt-cyg</a> which provides a command-line installer for Cygwin packages. 

Jean-Pierre has documented his efforts at porting Sage (including dependencies, which are were most of the issues are) for Cygwin, both <a class="http" href="http://trac.sagemath.org/wiki/CygwinPort">32-bit</a> and <a class="http" href="http://trac.sagemath.org/wiki/Cygwin64Port">64-bit</a>. Sage has been built successfully on Cygwin in the past, but it has not worked consistently due to the lack of continuous integration on Cygwin. The full suite of doctests has never passed 100% on Cygwin either. 

Finally, we discussed some specific currently known blockers to building Sage on Cygwin. Erik Bray has volunteered to work on these, and any further Cygwin issues that arise.  These issues can be followed on Sage's issue tracker under the <a class="http" href="http://trac.sagemath.org/query?status=!closed&amp;component=porting%3A+Cygwin">"Porting: Cygwin" component</a>. 


##### MinGW(-w64)

MinGW is also a relatively old project--almost as old as Cygwin. It in fact started as a fork from Cygwin, but with very different goals.  MinGW only aims to provide a minimal GNU toolkit (gcc, bintools) for compiling native code on Windows. It does not rely or or include a POSIX-compatibility layer, and supports linking with MSCRT for minimal libc support.  MinGW-w64 is in turn a fork of the original MinGW project with 64-bit support, a more developer-friendly license, and a more active development community. 

It was agreed that building Sage with MinGW would be a good goal to have, as the end result is truly Windows-native software with no need for POSIX-emulation, and likely (but not proven) better performance.  However, some parts of Sage and its dependencies present a significant hurdle to this. Some of the major blockers we identified include: 

1. Sage's pexpect interfaces--pexpect has only experimental support for Windows, in the form of a wrapper for Python's `subprocess.Popen`, as opposed to communicating via pseudo-terminals (which is definitely not supported on Windows). What remains unclear at the moment is whether the use of ptys is strictly required for all of Sage's interfaces. 
1. Cysignals--the current implementation is not even applicable to Windows. However, some of its functionality--especially interrupt-handling--could be ported to Windows in principle.  At worst, outright disabled. 
1. GAP/libGAP--has Cython support but no native Windows support.  Erik has done some investigation and believes it should be possible to port GAP to Windows with some effort. 
1. PARI/GP--used to have problems, but now supposedly has support for building with MinGW-w64. 
Because of these issues it was generally agreed that the issue of building with MinGW should be tabled for now, and efforts should instead focus on the loose ends with Cygwin support before returning to it.  Much of the work done for building on Cygwin could also benefit the MinGW effort as well. 


##### MSYS2

MSYS2 is also a fork of Cygwin, and its goals are different from both Cygwin and MinGW.  A more complete overview of the differences can be read on the project's <a class="https" href="https://sourceforge.net/p/msys2/wiki/How%20does%20MSYS2%20differ%20from%20Cygwin/">wiki</a>.  In short, MSYS2 is less focused on the POSIX-emulation goals of Cygwin (but benefits directly from them, and regularly merges upstream changes from Cygwin), but is more focused on providing a friendly software development environment for developers used to working on *NIX system, including shells, common shell tools, etc. It also includes a port of Arch's "pacman" package manager for installing and managing software.  In other words, the MSYS2 project is more focused on the user experience, while the developers of the Cygwin project remain primarily focused on the POSIX-emulation part of the equation.  Another major selling point for MSYS2 is that includes support for both a Cygwin-like toolchain that includes POSIX emulation, as well as for the MinGW toolchain.  So one can develop software for both within the same development environment.  Software built with the MSYS2 toolchain uses POSIX-emulation, and must be shipped with an msys2 DLL, much like as software built for Cygwin must be shipped with cygwin.dll.  Software built with MSYS2's MinGW is no different from using the MinGW toolchain directly without using the rest of the MSYS2 environment. 

Therefore it is worth trying out, and targeting as an environment in which to develop Sage in Windows. That is, development documentation might include instructions for setting up MSYS2 for Sage development.  The Cygwin-specific porting effort should translate over to using MSYS2's compiler toolchain. And it might be a good environment for experimenting with MinGW support if/when we reach that point. 


##### MSVC

Another possibility for supporting Sage on Windows would be to build Sage on Microsoft's native compiler toolchain.  This was not discussed at length, though there was apparently an effort to investigate this some time ago, for which there are breadcrumbs of documentation under <a href="https://wiki.sagemath.org/windows">https://wiki.sagemath.org/windows</a>. 

Python extension modules, including those compiled from Cython, _can_ be built with MSVC.  Supporting this in Sage would mostly be a matter of ensuring that any modules that are configured to be built with specific compiler options first check what compiler is being used, and supply the appropriate options depending on the compiler (gcc, msvc, etc.).  However, many of Sage's dependencies do not already support building with the MS toolchain, so it's probably not worth the effort.  It's not clear whether there would be any immediate advantage to doing so. 


##### Windows Subsystem for Linux

Just before SD77 the Windows Subsystem for Linux (WSL) was publicly announced for the first time.  This provides an emulation layer for Linux system calls, and some other APIs, baked directly into the Windows Kernel (as opposed to something like Cygwin which runs entirely in userspace).  The initial release of the WSL was developed in cooperation with Canonical, and includes a base image based on Ubuntu, including APT, and (presumably) a repository specifically for software that can run (ostensibly) on Windows.  This includes any user-mode software that does not use a GUI (i.e. that does not require an X server).  To be clear: These are real ELF64 binaries straight from Ubuntu's repository, which can run on Windows through the WSL. 

The initial release of WSL will be available in Windows 10 users <a class="http" href="http://arstechnica.com/information-technology/2016/03/windows-10-270-million-users-binbash-supporting-anniversary-update-coming-summer/">in an update available this summer</a>.  This will obviously be worth pursuing as a way forward for supporting Windows in the future.  But there are some caveats, such that this does not obsolete ongoing efforts to support Windows: 

1. Currently this is only planned to be available on Windows 10 (and even then only after an update). It's not clear (and seems unlikely) that Microsoft has any plans to backport this to older Windows versions.  It's also not yet clear whether it will be available on Windows by default (with the appropriate updates) or if it will be available only after installing a separate add-on. 
1. Currently Microsoft is positioning this as a tool for developers _only_, and not for application deployment.  See <a class="http" href="http://arstechnica.com/information-technology/2016/04/why-microsoft-needed-to-make-windows-run-linux-software/">this article</a> that has more historical background on the WSL, and why it should be viewed primarily as a developer tool.  This is not to say that one _couldn't_ distribute software that uses the WSL, but we can't yet expect to have any support from Microsoft for that use case.  MS has not explicitly ruled this out as a possibility in the future either, but for now this is still considered very experimental. 

### Anaconda

<a class="https" href="https://www.continuum.io/">Anaconda</a> is a user-space distribution and package manager for scientific software. Born in the python ecosystem, it is becoming a _de facto_ standard for scientific software. 

Anaconda is mostly oriented towards binary packages, though Erik noted that nothing prevents shipping source packages with it. At the moment, no serious experiment with packaging <a href="/SageMath">SageMath</a> for Anaconda has been done yet, but there was a consensus at the Days 77 that having <a href="/SageMath">SageMath</a> in Anaconda is highly desirable, because of the overlapping interests with the Anaconda community, and because it has the potential to bridge the fracture between pure and applied math communities. 


### Common obstacles to packaging SageMath for distributions

* Obviously, the main problem is Sage patching a lot of its dependencies. 
      * A side problem is to better isolate and document those dependencies that are _direct_ dependencies of sage-the-library 
            * and not sub-dependencies.  This does not reduce the overall complexity but would provided a slightly more tractable starting point for reasoning about what sage's dependencies are.  This includes better distinction between build-time and run-time dependencies as well. 
* Most packagers start by _neutering_ the package system (spkg) of SageMath. François suggets putting all the bits that are about packaging in a separate directory or project, with an option not to install them. 
* Only build-time dependencies in metadata, no run-time dependencies. 
* Some packagers would like the <a href="/SageMath">SageMath</a> library to be a package like any other. This is virtually what is done for Gentoo. 
* Autogenerated files pose a problem too (having to run `make` in `<sage>/src/` is inconvenient for packagers). E.g.: Pari, Fastcallable. 
* <a href="/SageMath">SageMath</a> relies too much on `is_package_installed`. See <a class="http" href="http://trac.sagemath.org/ticket/20377">#20377</a> and  <a class="http" href="http://trac.sagemath.org/ticket/20382">#20382</a>. 

## SageMath as a distribution, candidates to replace the `spkg-install` system

The second topic addressed at Sage Days 77 was _internal packaging_. <a href="/SageMath">SageMath</a> has its own package system, with its pros and cons. Here's some common complaints: 

* No way to uninstall, break when downgrading? 
* Homebrew system, incompatible with other distributions (e.g., Anaconda), 
* Even optional packages are published manually (via a Trac ticket), and must be reviewed. SageMath has no official support for user-contributed code. 
The workshop investigated possible alternatives to the packaging system. Two, mostly orthogonal, goals for such a system are: 

* Make it easy for the **user** to install/uninstall/reuse SageMath components, 
* Make it easy for the **developer** to develop SageMath components (with as little recompilation as possible). 
The two goals are not necessarily achieved by the same system. For example, Anaconda is a very good candidate for the first one, but it does very little for the second (and, potentially, it makes it worse). However, nothing prevents having two systems complementing each other (except that two such systems might not exist yet). 

Wanted features for an packaging replacement are: 

* Maturity and sustainability on the long run, 
* Be part of a greater community to benefit from preexisting packages 
* Support for many platforms (most importantly: Linux, Windows, MacOS) 
* Good support for building from source and for installing binaries 
* Support for dependencies, uninstall 
* Transparent for Sage users (e.g. installing Sage and additional packages) 
* Easy to learn for package writers / maintainers / ... 
Desirable features: 

* System integration: possibility to check if a package is already available from the system, and use it 
* Provide a hub where people can contribute packages (like PyPI, npm, ...) 
* In particular, make it easy for the average mathematician to write a simple package and make it accessible to his colleagues 
The following systems where considered at Days 77: <a href="/days77/packaging#Pip.2FPyPI">#Pip.2FPyPI</a>, <a href="/days77/packaging#Anaconda-1">#Anaconda-1</a>, <a href="/days77/packaging#Guix.2FNix-1">#Guix.2FNix-1</a>, <a href="/days77/packaging#Gentoo_prefix">#Gentoo_prefix</a>, <a href="/days77/packaging#HashDist">#HashDist</a>. 


### Pip/PyPI

Pip is **NOT** a package manager. Pip is just a Python module installer, it does very little to help install non-Python dependencies, and is not very smart about version handling. 

However, many components of <a href="/SageMath">SageMath</a> are stock python modules available on PyPI, and they could be installed by `pip install`. Work on this is underway, see <a class="http" href="http://trac.sagemath.org/ticket/20218">#20218</a>. 

A common wish in the community is that more <a href="/SageMath">SageMath</a> components which would be useful outside <a href="/SageMath">SageMath</a> be shipped as separate Python/Cython modules on PyPI, so they benefit a larger community. This has recently happend with <a class="https" href="https://pypi.python.org/pypi/cysignals/">CySignals</a>, and is happening with the <a class="https" href="https://github.com/OpenDreamKit/OpenDreamKit/issues/83">Pari interface</a>. 

To some extent, pip+PyPI already offer a way for users to distribute <a href="/SageMath">SageMath</a> code via `sage -pip`. However this is not well documented, and not explicitly supported. 


### Anaconda

<a class="https" href="https://www.continuum.io/">Anaconda</a> is a user-space distribution and package manager for scientific software. Born in the python ecosystem, it is becoming a _de facto_ standard for scientific software. 

Its most interesting features are 

- Supports Linux, Windows, Mac. - There is a <a class="https" href="https://conda.anaconda.org/binstar">condahub (binstar)</a> where people can submit their packages, and communities create channels (see also <a class="https" href="https://anaconda.org/">Anaconda cloud</a>). - Very advanced dependency handling. Its developers say "Anaconda has solved the packaging problem". 

However, as it is put <a class="https" href="https://asmeurer.github.io/blog/posts/scipy-2014/">here</a>: 

"Of course, solving the packaging problem and removing it are different things. Conda does not make it easier to compile difficult packages. It only makes it so that fewer people have to do it. And there is still work to be done before Conda really takes over the world." 

Anaconda being mostly oriented towards binary packages, it does very little to help developers handle a modular distribution such as <a href="/SageMath">SageMath</a> (it is possible in principle to package sources for Anaconda, though). Some people have explored options to make it easy to compile complex distributions, while (semi-)automatically generating Anaconda packages. Some pointers here : 

* <a class="https" href="https://asmeurer.github.io/blog/posts/scipy-2014/">https://asmeurer.github.io/blog/posts/scipy-2014/</a>, 
* <a class="http" href="http://technicaldiscovery.blogspot.fr/2013/12/why-i-promote-conda.html">http://technicaldiscovery.blogspot.fr/2013/12/why-i-promote-conda.html</a>. 
although this seems to have stalled for the moment. 

To some extent, with respect to its host system, Anaconda is a monolith as much as SageMath, albeit with larger adoption, better integration, and a better packaging system. Among other things, transitioning to Anaconda would shift the "monolith blame" from SageMath to Anaconda. 


### Gentoo prefix

<a href="/Gentoo%20prefix">https://wiki.gentoo.org/wiki/Project:Prefix</a> brings Gentoo portage package manager to other Linux distributions. Packages are installed in a _prefix_, rather than in the system paths, allowing users to have different versions of the same library at the same time. Following Gentoo's philosophy, it targets source packages, although it is possible in principle to make it handle binaries. 

On the plus side, <a href="/SageMath">SageMath</a> being already packaged for gentoo, it is relatively easy to package it for prefix. Indeed, this was already done by Timo Kluck at Days 47. Prefix supports Linux and OS X (although the usual breakages happen on OS X updates). 

On the minus side, prefix has no support for Windows. Being very powerful, it may look daunting at first. There are some concerns on stability, maturity and sustainability, and it is almost a one man show (Fabian Groffen). 


### Guix/Nix

<a class="http" href="http://www.gnu.org/software/guix/">Guix</a> and <a class="https" href="https://nixos.org/nix/">Nix</a> are two very similar distribution agnostic _functional_ package managers. Both projects focus on reproducible builds, in particular building/installing a package twice should give the same result byte-for-byte. Like Gentoo prefix, the learning curve can be steep. 

Both Guix and Nix can be used as system-level package mangers, or as user-space package managers. In user-space, they install everything starting from the build chain, only taking the kernel from the system. 

Like Gentoo prefix, they do isolated builds, allowing the user to have many version of the same library. They also support binaries, but need to be root, or use a user-space chroot such as <a class="https" href="https://github.com/proot-me/PRoot/blob/master/doc/proot/manual.txt">https://github.com/proot-me/PRoot/blob/master/doc/proot/manual.txt</a> or <a class="https" href="https://github.com/lethalman/nix-user-chroot">https://github.com/lethalman/nix-user-chroot</a>. 

Differences between Guix and Nix: 

* Guix is GNU, so it will never support OS X or Windows. Nix is less strict, and is reported to work on Mac OS. There is some limited <a class="https" href="https://nixos.org/wiki/Nix_on_Windows">Windows support</a> for Nix too (see also <a class="https" href="https://ternaris.com/lab/nix-on-windows.html">this report</a>. 
* Guix uses a general purpose language (Guile, a Scheme) to describe packages. Nix uses a homebrew DSL. 
Some more notes on Nix: 

* Sage is <a class="https" href="https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/science/math/sage">packaged</a> for Nix and passes its testsuite. Due to lack of a darwin maintainer, it is currently only tested on linux. 
* Packages can have parameters, so it is conceivable to have a parameter like "use-host" for packages such as python, blas, ... (To do this cleanly, these would probably rely on a tar of the relevant files from the system which then get put into the nix storage) (An example for parameters can be seen here <a href="https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/browsers/firefox/default.nix">https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/browsers/firefox/default.nix</a> ) 
* There is no built-in support to swap in host libraries or binaries but it can be done (then of course, you need to recompile all dependants) <a href="https://github.com/NixOS/nixpkgs/issues/305">https://github.com/NixOS/nixpkgs/issues/305</a> 

### HashDist

<a class="https" href="https://hashdist.github.io/">HashDist</a> is an environment management tool whose promise is to "build only once". It uses concepts similar to Guix and Nix, but its focus is on build management, rather than reproducible builds (although it CAN do reproducible builds). A succinct abstract on <a href="/HashDist">HashDist</a>'s goals can be found <a class="http" href="http://adsabs.harvard.edu/abs/2014AGUFM.H51K0749A">here</a>. 

<a class="https" href="https://github.com/hashdist/hashstack">HashStack</a>, <a href="/HashDist">HashDist</a>'s companion, is a collection of software profiles for <a href="/HashDist">HashDist</a>. 

<a href="/HashDist">HashDist</a> works as a userspace tool, defining _software stacks_ which allow isolated builds (like in prefix, guix, nix). Contrary to guix and nix, it does not insist on building a stack from the build chain up, but obviously one gives up reproducibility by relying on the system build tools. Any other library can be swapped between <a href="/HashDist">HashDist</a> built libraries and system ones. 

To avoid unneeded recompilations, <a href="/HashDist">HashDist</a> computes hashes of the build steps, in a similar way to Guix/Nix. 

<a href="/HashDist">HashDist</a> has no support for binary packages, but has experimental support to generate Anaconda packages. It works on Linux and OS X, and has some experimental support for Cygwin. 

Our own Volker is part of the <a href="/HashDist">HashDist</a> community. He made an <a class="https" href="https://github.com/vbraun/sagestack">attempt in 2014</a> to auto-convert `spkg-install` scripts to hashdist. 


## Discussions outside Days 77

Roughly in parallel with Days 77, a great deal of discussion on packaging-related topics took place in sage-devel: 

* <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/29ndCD8z94k">how we develop sage</a> 
* <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/HAHulLZkKzw">Let's talk specifics (was Re: how we develop sage)</a> 
* <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/C7-ho1zvEYU">Proposal: install all pip-installable components of Sage via pip, directly</a> 
* <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/t11JSxxCgpw">Proposal: move SageNB back to Sage</a> 
It would be extremely useful to summarize these discussion, but a better place for this would be a separate wiki page. 
