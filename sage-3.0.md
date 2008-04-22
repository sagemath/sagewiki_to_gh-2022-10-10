= Sage 3.0 Release Tour =
Sage 3.0 was released on XXXX, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see [http://sagemath.org/announce/sage-3.0.txt sage-3.0.txt].

== Random Numbers ==

Sage has a new random number framwork (by Carl Witty) with a global random number state, so that results using pseudo-random numbers can be reproducible.  Randomized doctests are now actually tested, instead of having their results ignored.  Use set_random_seed(n) to set a new random number seed, and initial_seed() to find the most recently set seed (or the seed set at Sage startup, if no new seed has been set).  For much more information on the new random number framework, type "sage.misc.randstate?".

= FIXME =
