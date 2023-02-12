

# Sage 3.0.1 Release Tour

Sage 3.0.1 was released on May 4th, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see <a class="http" href="http://sagemath.org/announce/sage-3.0.1.txt">sage-3.0.1.txt</a>. 


## PBuild (Gary Furnish)

PBuild is the new parallel build system for the Sage library that is experimentally available in 3.0.1.  To turn it on, do `export SAGE_PBUILD=yes` and optionally `export SAGE_BUILD_THREADS=numthreads`, where numthreads is the number of threads to work with.  PBuild does not currently work correctly with all of DSage (Bug #3097, to be fixed in 3.0.2).  PBuild will be replacing the standard non-parallel build system as soon as possible.  Please report any bugs encountered. 


## Convex Hulls And Polyhedral Functions Improvements (Marshall Hampton)

This fixed a number of problems in the sage-native polyhedral code (that only uses cddlib), mainly with unbounded polytopes, and improved 3D plotting of polytopes (for example, in the gfan interface).  There are probably still some issues lurking with this code as its still pretty new and untested.  In the near future, major design decisions should be made on how polytopes will be handled in Sage: more Sage-native code or better coordination with Polymake and other external packages (LattE, 4ti2, lrs, etc) (or both)?   


## Lattice Polytope Update (Andrey Novoseltsev)

This update includes: change in the behavior of <a href="/LatticePolytope">LatticePolytope</a> constructor, now compute_vertices=True by default; <a href="/ReflexivePolytope">ReflexivePolytope</a>(s) - databases of all (representatives of GL(Z)-orbits of) reflexive polytopes in 2 and 3 dimensions with some precomputed data; <a href="/LatticePolytope">LatticePolytope</a>.index - search in the above databases for the representative of the GL(Z)-orbit of the given polytope; <a href="/LatticePolytope">LatticePolytope</a>.plot3d - 3D-plotting for 3-dimensional polytopes; convex_hull and minkowski_sum - without the requirement for points to span the ambient space, which <a href="/LatticePolytope">LatticePolytope</a> has; NEFPartition.dual - computing the dual NEF-partition; minor improvements to other functions and documentation, shortcuts like <a href="/LatticePolytope">LatticePolytope</a>.vertex. 


## zeta_function Method for Schemes (Kiran Kedlaya)

For C a scheme over GF(p) for p prime, C.zeta_series(n, t) will return the first n terms of the power series expansion of the zeta function of C, expressed as a power series in the variable t. This is a completely generic algorithm, and thus will be extremely slow for p or n large; we expect later to override this for specific classes of schemes (e.g., hyperelliptic curves). Also, we expect to support schemes over GF(q) once an improved coercion system is stably in place. 


## More Debianization (Tim Abbott)

The Debian packages for SAGE work again for the first time since SAGE 2.10.4.  The process for building Debian packages from the SAGE sources is now almost completely automated, and the quality of the Debian packaging has improved substantially, which should help the Debian packaging track the SAGE releases.  The Debian package distribution is approaching a viable installation option.  Many of the packages are also ready to be included in the main Debian archive; work has begun on moving those that are to Debian upstream and on writing patches implementing shared library versioning for those spkgs that need it. 


## Default Mode for Notebook no longer uses SSL (William Stein)

William Stein rewrote the notebook(...) command so that by default on localhost it does not use SSL.  This should resolve many problems people have been having when using the notebook, but will not compromise security.   This could cause some confusion though, so people should report any problems, since this is a significant change.  
