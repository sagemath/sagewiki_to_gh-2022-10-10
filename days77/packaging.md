= Packaging and distributing SageMath =

'''''a Sage days 77 project'''''

Part of the [[days77|days 77]] workshop was dedicated to studying possible improvements to SageMath's package system and availability in popular distributions.

There is a cyclic interest in these issues. Past Sage Days that have also dealt with them were [[days4/projects/packaging|days 4]] and [[days7/DebianPackagingSprint|days 7]].

When talking about ''modularization'', ''packaging'', ''distribution'', etc., Sage devs may mean several different things at the same time:

 * Distributing SageMath as a set of packages for a popular distribution (e.g., Debian, Ubuntu, Arch, Anaconda, ...);
 * Improving the current module system built in SageMath (at the time of writing, SPKGs), and its interfaces with the build system and the development workflow;
 * Splitting the SageMath library into more granular modules, possibly making some modules optional;
 * Taking components out of SageMath and making them available to general purpose python code (e.g., via PyPI);
 * Allowing users to share their SageMath code without putting it inside SageMath core.
 
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
 * Each spkg is in its own ebuild.

They are distributed as an [[https://wiki.gentoo.org/wiki/Overlay|overlay]], though some individual ebuilds have made it into the standard distro. 

 * [[https://github.com/cschwan/sage-on-gentoo|Sources for the Sage on Gentoo overlay]].

At each new SageMath beta, the Sage on Gentoo overaly is updated, usually in less than 24h. This requires a couple of hours of manual work on average:

 * Checking for upgraded spkgs, and upgrade them in the overlay tree;
 * Pull the git develop tree from SageMath;
 * Run some scripts (which ones?);
 * Build the sage library and run tests;
 * Fix the important failures, accept some minor-looking failures (e.g., because compiling against gmp instead of MPIR) ([[https://github.com/cschwan/sage-on-gentoo/wiki/Known-test-failures|list of known doctest failures]]).


==== Additional notes ====

 * Optional spkgs are occasionally packaged as ebuilds, possibly in response to requests, or because they are already part of the Gentoo main tree.
 * Dependencies between ebuilds are inferred from spkg metadata, plus manual cleaning. Build dependencies are mostly correct in spkg metadata, runtime dependencies are much harder.

=== Debian ===

There have been repeated efforts to package SageMath for debian, as shown by this (outdated) [[https://wiki.sagemath.org/devel/DebianSage|wiki page]]. At some point in 2009, a Debian package existed in stable, installing the monolithic sage in /opt/sage; the package became unmaintained and was eventually removed.

The DebianScience project maintains experimental packages for SageMath, as documented in [[https://wiki.debian.org/DebianScience/Sage|this wiki page]]. It also tracks dependency versions discrepancies for Debian vs Sagemath's [[https://people.debian.org/~thansen/debian-sage-status.html|master branch]] and [[https://people.debian.org/~thansen/debian-sage-dev-status.html|develop branch]]. ([[http://anonscm.debian.org/cgit/collab-maint/sage-status-page.git/|source code for the tracker]])

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

 * Most packagers start by ''neutering'' the package system (spkg) of SageMath. François suggets putting all the bits that are about packaging in a separate directory or project, with an option not to install them.


== SageMath as a distribution, candidates to replace the SPKG system ==

== Discussions outside Days 77 ==

Roughly in parallel with Days 77, a great deal of discussion on packaging-related topics took place in sage-devel:

 * [[https://groups.google.com/forum/#!topic/sage-devel/29ndCD8z94k|how we develop sage]]
 * [[https://groups.google.com/forum/#!topic/sage-devel/HAHulLZkKzw|Let's talk specifics (was Re: how we develop sage)]]
 * [[https://groups.google.com/forum/#!topic/sage-devel/C7-ho1zvEYU|Proposal: install all pip-installable components of Sage via pip, directly]]
 * [[https://groups.google.com/forum/#!topic/sage-devel/t11JSxxCgpw|Proposal: move SageNB back to Sage]]

It would be extremely useful to summarize these discussion, but a better place for this would be a separate wiki page.
