= Packaging and distributing SageMath =

'''''a Sage days 77 project'''''

Part of the [[days77|days 77]] workshop was dedicated to studying possible improvements to SageMath's package system and availability in popular distributions.

There is a cyclic interest in these issues. Past Sage Days that have also dealt with them were [[days4/projects/packaging|days 4]] and [[days7/DebianPackagingSprint|days 7]].

When talking about ''modularization'', ''packaging'', ''distribution'', etc., Sage devs may mean several different things at the same time:

 * Distributing !SageMath as a set of packages for a popular distribution (e.g., Debian, Sage-on-Gentoo, Arch, Anaconda, ...);
 * Improving the current packaging system built in !SageMath (the system using `build/make/Makefile` and `spkg-install` scripts), and its interfaces with the development workflow;
 * Splitting the !SageMath library into more granular modules (which may or may not depend on some hypothetical !SageMath-core package), possibly making some modules optional and/or making them available to general purpose Python code (e.g., via PyPI);
 * Allowing users to share their !SageMath code without putting it inside !SageMath core.
 
Although these are separate problems, the interactions are non-trivial.

<<TableOfContents()>>

== Packaging SageMath for popular distributions ==

Package maintainers from several distributions were present, in person, or remotely, at Days 77:

 * Gentoo: François Bissey (remote),
 * Debian: Julien Cristau,
 * Arch: Antoine Teutsch, Antonio Rojas (via chat),
 * Guix: Andreas Enge,

The workshop was the occasion to share knowledge and concerns on packaging SageMath for Linux distributions. Given that some packagers are not involved in SageMath development proper, it was decided to create a separate [[https://groups.google.com/forum/#!forum/sage-packaging|sage-packaging mailing list]] exclusively devoted to packaging issues.

=== Gentoo ===

At the time of writing, SageMath ebuilds (packages) have existed for Gentoo for six years. The layout follows closely the Sage layout:

 * One ebuild for the Sage library,
 * Each Sage package is in its own ebuild.

They are distributed as an [[https://wiki.gentoo.org/wiki/Overlay|overlay]], though some individual ebuilds have made it into the standard distro. 

 * [[https://github.com/cschwan/sage-on-gentoo|Sources for the Sage on Gentoo overlay]].

At each new SageMath beta, the Sage-on-Gentoo overaly is updated, usually in less than 24h. This requires a couple of hours of manual work on average:

 * Checking for upgraded packages, and upgrade them in the overlay tree;
 * Pull the git develop tree from !SageMath;
 * Run some scripts (which ones?);
 * Build the sage library and run tests;
 * Fix the important failures, accept some minor-looking failures (e.g., because compiling against gmp instead of MPIR) ([[https://github.com/cschwan/sage-on-gentoo/wiki/Known-test-failures|list of known doctest failures]]).


==== Additional notes ====

 * Optional packages are occasionally packaged as ebuilds, possibly in response to requests, or because they are already part of the Gentoo main tree.
 * Dependencies between ebuilds are inferred from `build/pkgs` metadata, plus manual cleaning. Build dependencies are mostly correct in `build/pkgs/.../dependencies`, runtime dependencies are much harder.

=== Debian ===

There have been repeated efforts to package SageMath for debian, as shown by this (outdated) [[https://wiki.sagemath.org/devel/DebianSage|wiki page]]. At some point in 2009, a Debian package existed in stable, installing the monolithic sage in /opt/sage; the package became unmaintained and was eventually removed.

The DebianScience project maintains experimental packages for SageMath, as documented in [[https://wiki.debian.org/DebianScience/Sage|this wiki page]]. It also tracks dependency versions discrepancies for Debian vs Sagemath's [[https://people.debian.org/~thansen/debian-sage-status.html|master branch]] and [[https://people.debian.org/~thansen/debian-sage-dev-status.html|develop branch]]. ([[http://anonscm.debian.org/cgit/collab-maint/sage-status-page.git/|source code for the tracker]])

At Days 77, Julien and others worked on:

 * Packaging the Jupyter/IPython stack,
 * Importing patches to SageMath from Gentoo,
 * Replacing build time patches to cython with runtime ones, and building cython modules (sage master) on debian.

More info available on [[https://www.logilab.org/blogentry/5540528|Logilab's blog]].

=== Arch ===

[[https://www.archlinux.org/people/trusted-users/#arojas|Antonio Rojas]] maintains a very up-to-date SageMath package for Arch/community (v7.1 at the time of writing). [[https://www.archlinux.de/?page=PackageStatistics|Arch stastics]] show that >3% of users (who report package statistics) have the package installed.

SageMath is split into separate packages, and [[https://projects.archlinux.org/svntogit/community.git/tree/trunk?h=packages/sagemath|some patches]] are applied.

==== Current issues ====

 * Because of its rolling-release style, Arch has no way to keep old versions of packages.
 * The SageMath package tends to be outdated, comparatively to the ArchLinux tradition (typically one month old).
 * There are about seven SageMath packages for Arch lying around, many of which are monolithic / broken.
 * The SageMath package needs non trivial patches to work with the versions of the dependencies provided by Arch.

'''Note:''' it would be hard to have a stable package that always work for all Arch environments. There are distributions based on Arch that aim at slower but more stable progress (e.g. Antergos). Aiming for a stable package for such would be more reasonable.


=== Guix/Nix ===

[[http://www.gnu.org/software/guix/|Guix]] and [[https://nixos.org/nix/|Nix]] are two very similar distribution agnostic ''functional'' package managers. Both projects focus on reproducible builds, in particular building/installing a package twice should give the same result byte-for-byte.

Efforts were started at Days 77 to package SageMath for Guix (Andreas Enge) and Nix (Julian Rüth). Andreas managed to make a Guix ''recipe'' for SageMath, and run it, but at the moment it is not up to Guix standards.

Citing Julian: "I am not sure that Nix/Guix will in the end help much with the problem
of distributing or developing Sage. Anyway, if we can get to the point
where an unpatched Sage builds in the very restrictive setting those two
impose, then it should be relatively easy to build for any distribution."

=== Anaconda ===

[[https://www.continuum.io/|Anaconda]] is a user-space distribution and package manager for scientific software. Born in the python ecosystem, it is becoming a ''de facto'' standard for scientific software.

Anaconda is mostly oriented towards binary packages, though Erik noted that nothing prevents shipping source packages with it. At the moment, no serious experiment with packaging SageMath for Anaconda has been done yet, but there was a consensus at the Days 77 that having SageMath in Anaconda is highly desirable, because of the overlapping interests with the Anaconda community, and because it has the potential to bridge the fracture between pure and applied math communities.

=== Common obstacles to packaging SageMath for distributions ===

 * Obviously, the main problem is Sage patching a lot of its dependencies.
 * Most packagers start by ''neutering'' the package system (spkg) of !SageMath. François suggets putting all the bits that are about packaging in a separate directory or project, with an option not to install them.
 * Only build-time dependencies in metadata, no run-time dependencies.
 * Some packagers would like the SageMath library to be a package like any other. This is virtually what is done for Gentoo.
 * Autogenerated files pose a problem too (having to run `make` in `<sage>/src/` is inconvenient for packagers). E.g.: Pari, Fastcallable.
 * SageMath relies too much on `is_package_installed`. See [[http://trac.sagemath.org/ticket/20377|#20377]] and  [[http://trac.sagemath.org/ticket/20382|#20382]].


== SageMath as a distribution, candidates to replace the `spkg-install` system ==

The second topic addressed at Sage Days 77 was ''internal packaging''. SageMath has its own package system, with its pros and cons. Here's some common complaints:

 * No way to uninstall, break when downgrading?
 * Homebrew system, incompatible with other distributions (e.g., Anaconda),
 * Even optional packages are published manually (via a Trac ticket), and must be reviewed. !SageMath has no official support for user-contributed code.

The workshop investigated possible alternatives to the packaging system. Two, mostly orthogonal, goals for such a system are:

 * Make it easy for the '''user''' to install/uninstall/reuse !SageMath components,
 * Make it easy for the '''developer''' to develop !SageMath components (with as little recompilation as possible).

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

The following systems where considered at Days 77: [[#Pip.2FPyPI]], [[#Anaconda-1]], [[#Guix.2FNix-1]], [[#Gentoo_prefix]], [[#HashDist]].

=== Pip/PyPI ===

Pip is '''NOT''' a package manager. Pip is just a Python module installer, it does very little to help install non-Python dependencies, and is not very smart about version handling.

However, many components of SageMath are stock python modules available on PyPI, and they could be installed by `pip install`. Work on this is underway, see [[http://trac.sagemath.org/ticket/20218|#20218]].

A common wish in the community is that more SageMath components which would be useful outside SageMath be shipped as separate Python/Cython modules on PyPI, so they benefit a larger community. This has recently happend with [[https://pypi.python.org/pypi/cysignals/|CySignals]], and is happening with the [[https://github.com/OpenDreamKit/OpenDreamKit/issues/83|Pari interface]].

To some extent, pip+PyPI already offer a way for users to distribute SageMath code via `sage -pip`. However this is not well documented, and not explicitly supported.

=== Anaconda ===

[[https://www.continuum.io/|Anaconda]] is a user-space distribution and package manager for scientific software. Born in the python ecosystem, it is becoming a ''de facto'' standard for scientific software.

Its most interesting features are

- Supports Linux, Windows, Mac.
- There is a [[https://conda.anaconda.org/binstar|condahub (binstar)]] where people can submit their packages, and communities create channels (see also [[https://anaconda.org/|Anaconda cloud]]).
- Very advanced dependency handling. Its developers say "Anaconda has solved the packaging problem".

However, as it is put [[https://asmeurer.github.io/blog/posts/scipy-2014/|here]]:

"Of course, solving the packaging problem and removing it are different things.
Conda does not make it easier to compile difficult packages. It only makes it so that fewer people have to do it.
And there is still work to be done before Conda really takes over the world."

Anaconda being mostly oriented towards binary packages, it does very little to help developers handle a modular distribution such as SageMath (it is possible in principle to package sources for Anaconda, though). Some people have explored options to make it easy to compile complex distributions, while (semi-)automatically generating Anaconda packages. Some pointers here :

 * [[https://asmeurer.github.io/blog/posts/scipy-2014/]],
 * [[http://technicaldiscovery.blogspot.fr/2013/12/why-i-promote-conda.html]].

although this seems to have stalled for the moment.

To some extent, with respect to its host system, Anaconda is a monolith as much as !SageMath, albeit with larger adoption, better integration, and a better packaging system. Among other things, transitioning to Anaconda would shift the "monolith blame" from !SageMath to Anaconda.

=== Gentoo prefix ===

[[Gentoo prefix|https://wiki.gentoo.org/wiki/Project:Prefix]] brings Gentoo portage package manager to other Linux distributions. Packages are installed in a ''prefix'', rather than in the system paths, allowing users to have different versions of the same library at the same time. Following Gentoo's philosophy, it targets source packages, although it is possible in principle to make it handle binaries.

On the plus side, SageMath being already packaged for gentoo, it is relatively easy to package it for prefix. Indeed, this was already done by Timo Kluck at Days 47. Prefix supports Linux and OS X (although the usual breakages happen on OS X updates).

On the minus side, prefix has no support for Windows. Being very powerful, it may look daunting at first. There are some concerns on stability, maturity and sustainability, and it is almost a one man show (Fabian Groffen).


=== Guix/Nix ===

[[http://www.gnu.org/software/guix/|Guix]] and [[https://nixos.org/nix/|Nix]] are two very similar distribution agnostic ''functional'' package managers. Both projects focus on reproducible builds, in particular building/installing a package twice should give the same result byte-for-byte. Like Gentoo prefix, the learning curve can be steep.

Both Guix and Nix can be used as system-level package mangers, or as user-space package managers. In user-space, they install everything starting from the build chain, only taking the kernel from the system.

Like Gentoo prefix, they do isolated builds, allowing the user to have many version of the same library. They also support binaries, but need to be root, or use a user-space chroot such as [[https://github.com/proot-me/PRoot/blob/master/doc/proot/manual.txt]] or [[https://github.com/lethalman/nix-user-chroot]].

Differences between Guix and Nix:

 * Guix is GNU, so it will never support OS X or Windows. Nix is less strict, and is reported to work on Mac OS. There is some limited [[https://nixos.org/wiki/Nix_on_Windows|Windows support]] for Nix too (see also [[https://ternaris.com/lab/nix-on-windows.html|this report]].
 * Guix uses a general purpose language (Guile, a Scheme) to describe packages. Nix uses a homebrew DSL.

Some more notes on Nix:

 * Sage 6.8 is packaged for NiX (but they are cheating, so the dependencies are not)

 * Packages can have parameters, so it is conceivable to have a parameter like "use-host" for packages such as python, blas, ... (To do this cleanly, these would probably rely on a tar of the relevant files from the system which then get put into the nix storage) (An example for parameters can be seen here https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/browsers/firefox/default.nix )

 * There is no built-in support to swap in host libraries or binaries but it can be done (then of course, you need to recompile all dependants) https://github.com/NixOS/nixpkgs/issues/305

=== HashDist ===

[[https://hashdist.github.io/|HashDist]] is an environment management tool whose promise is to "build only once". It uses concepts similar to Guix and Nix, but its focus is on build management, rather than reproducible builds (although it CAN do reproducible builds). A succinct abstract on HashDist's goals can be found [[http://adsabs.harvard.edu/abs/2014AGUFM.H51K0749A|here]].

[[https://github.com/hashdist/hashstack|HashStack]], HashDist's companion, is a collection of software profiles for HashDist.

HashDist works as a userspace tool, defining ''software stacks'' which allow isolated builds (like in prefix, guix, nix). Contrary to guix and nix, it does not insist on building a stack from the build chain up, but obviously one gives up reproducibility by relying on the system build tools. Any other library can be swapped between HashDist built libraries and system ones.

To avoid unneeded recompilations, HashDist computes hashes of the build steps, in a similar way to Guix/Nix.

HashDist has no support for binary packages, but has experimental support to generate Anaconda packages. It works on Linux and OS X, and has some experimental support for Cygwin.

Our own Volker is part of the HashDist community. He made an [[https://github.com/vbraun/sagestack|attempt in 2014]] to auto-convert `spkg-install` scripts to hashdist.


== Discussions outside Days 77 ==

Roughly in parallel with Days 77, a great deal of discussion on packaging-related topics took place in sage-devel:

 * [[https://groups.google.com/forum/#!topic/sage-devel/29ndCD8z94k|how we develop sage]]
 * [[https://groups.google.com/forum/#!topic/sage-devel/HAHulLZkKzw|Let's talk specifics (was Re: how we develop sage)]]
 * [[https://groups.google.com/forum/#!topic/sage-devel/C7-ho1zvEYU|Proposal: install all pip-installable components of Sage via pip, directly]]
 * [[https://groups.google.com/forum/#!topic/sage-devel/t11JSxxCgpw|Proposal: move SageNB back to Sage]]

It would be extremely useful to summarize these discussion, but a better place for this would be a separate wiki page.
