= Packaging and distributing SageMath =

'''''a Sage days 77 project'''''

Part of the [[days77|days 77]] workshop was dedicated to studying possible improvements to SageMath's package system and availability in popular distributions.

There is a cyclic interest in these issues. Past Sage Days that have also dealt with them were [[days4/projects/packaging|days 4]] and [[days7/DebianPackagingSprint|days 7]].

When talking about ''modularization'', ''packaging'', ''distribution'', etc., Sage devs may mean several different things at the same time:

 * Distributing SageMath as a set of packages for a popular distribution (e.g., Debian, Ubuntu, Arch, Anaconda, ...);
 * Improving the current module system built in SageMath (at the time of writing, SPKGs), and its interfaces with the build system and the development workflow;
 * Splitting the SageMath library into more granular modules, possibly making some modules optional;
 * Taking components out of SageMath and making them available to general purpose python code (e.g., via PyPI);
 
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

=== Arch ===

=== Guix/Nix ===

=== Anaconda ===

=== Common obstacles to packaging SageMath for distributions ===

- Sage-neutering: disabling packaging abilities of Sage
- put all the bits that are about packaging in a separate directory or project,
  with an option not to install it


== SageMath as a distribution, candidates to replace the SPKG system ==

== Discussions outside Days 77 ==

 * [[https://groups.google.com/forum/#!topic/sage-devel/29ndCD8z94k|how we develop sage]]
