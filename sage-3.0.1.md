= Sage 3.0.1 Release Tour =
Sage 3.0.1 was released on May 4th, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see [http://sagemath.org/announce/sage-3.0.1.txt sage-3.0.1.txt].

== PBuild (Gary Furnish) ==
PBuild is the new parallel build system for the Sage library that is experimentally available in 3.0.1.  To turn it on, export SAGE_PBUILD=yes and optionally export SAGE_BUILD_THREADS=numthreads, where numthreads is the number of threads to work with.  PBuild does not currently work correctly with all of DSage (Bug #3097, to be fixed in 3.0.2).  PBuild will be replacing the standard non-parallel build system as soon as possible.  Please report any bugs encountered.

== Convex Hulls And Polyhedral Functions Improvements (Marshall Hampton) ==
 
== Lattice Polytope Update (Andrey Novoseltsev) ==

== zeta_function Method for Schemes (Kiran Kedlaya) ==

== More Debianization (Tim Abbott) ==

== Default Mode for Notebook no longer uses SSL (William Stein) ==
 
William Stein rewrote the notebook(...) command so that by default on localhost it does not use SSL.  This should resolve many problems people have been having when using the notebook, but will not compromise security.   This could cause some confusion though, so people should report any problems, since this is a significant change. 
