= Topology Related Software for Sage =

Various people expressed the wish to have Algebraic Topology in Sage. This Wiki is for collecting suggestions. The first version is based on [[http://groups.google.com/group/sage-devel/browse_thread/thread/dadd2946ff1b1948?hl=en|this thread]].

'''Disclaimer:''' Here we are not (yet) talking about ''standard'' packages. Some of them can only be optional, due to lack of support for various platforms or due to licence problems. Also we do not claim that ''all'' the suggestions below are interesting enough for considering inclusion. Please feel free to remove items if you think they are clearly inappropriate.

One wish was to compute the homology of simplicial complexes, which might be doable with various packages. This is partially related with the study of point cloud data (''persistent'' homology). But there are also various pieces of software that are specialized on questions in Low-Dimensional Topology and are partially related with (riemannian) geometry and decision problems (e.g., 'determine whether or not two 3-manifolds are homeomorphic').

== List of Suggestions ==
There is one section for each of the items (follow the links). Many of our suggestions were taken from [[http://www.math.uiuc.edu/~nmd/computop/|Nathan Dunfield's list]].

About algebraic topology (in the sense of homology, cohomology and stuff):
 * Polymake's [[#topaz|topaz]] module for simplicial homology
 * A [[#palmieri|patch]] of John Palmieri for computing simplicial homology
 * [[#plex|Plex]] for persistent homology
 * [[#hap|Hap]], a Gap package due to G. Ellis and P. Smith.
 * A nearly completed [[#king|spkg]]  due to D. Green and S. King.
 * [[#kenzo|Kenzo]], a Lisp program for computing homology, cohomology, and homotopy groups.
 * [[#chomp|CHomP]], the Computational Homology Project.

About 2-dimensional topology:
 * [[#circlepackings|Circle packings]] by Ken Stephenson
 * Moira Chas's Java applets concerning [[#surfacecurves|curves on surfaces]]

About 3-dimensional manifolds:
 * [[#snap|Snap]] for arithmetic invariants of hyperbolic 3-manifolds
 * [[#t3m|t3m]], a Python framework for studying 3-manifolds due to Marc Culler and Nathan Dunfield.
 * The [[#recognizer|3-manifold recognizer]] that was developed by the research group of Sergei Matveev.
 * Much more is [[http://www.math.uiuc.edu/~nmd/computop/|here]]!

About knots
 * [[#heegaardfloer|Heegaard-Floer link homology]] 
 * Much more is [[http://www.math.uiuc.edu/~nmd/computop/|here]]!

About homotopy theory
 * [[#ext|Ext over connected algebras]]
 * [[#unstable|Unstable homotopy groups of spheres]]

About visualization
 * ''please insert your favourites here!''

= Brief descriptions of the individual packages =

== Homology and Co. ==

<<Anchor(topaz)>>
=== topaz ===
This used to be a module of Polymake, but AFAIK it was removed due to build problems. [[http://www.math.tu-berlin.de/~lutz/|Frank Lutz]] used the module in older versions of Polymake for his research.

<<Anchor(palmieri)>>
=== Patch of John Palmieri ===
The patch is [[http://sage.math.washington.edu/home/palmieri/homology.patch|here]]. John, could you provide a link to the corresponding ticket once you open it?

<<Anchor(plex)>>
=== Plex ===
[[http://comptop.stanford.edu/programs/jplex/index.html|Plex]] is a software package for computing persistent homology of finite
simplicial complexes, often generated from point cloud data. Originally developed for MATLAB, there is also a stand-alone Java version.  

<<Anchor(hap)>>
=== Hap ===
[[http://hamilton.nuigalway.ie/Hap/www/index.html|Hap]] is a Gap package developed by Graham Ellis and Paul Smith. It can be used to make basic calculations in the cohomology of finite and infinite groups. 

<<Anchor(king)>>
=== Spkg of David Green and Simon King ===
Based on C-programs of David Green, Simon King created Cython modules for the computation of cohomology rings of finite p-groups with coefficients in GF(p). Currently this seems to be by far the most powerful framework for computing modular cohomology rings of finite p-groups. Results can be found [[http://users.minet.uni-jena.de/~king/cohomology/|here]]. It seems that we are close to making a spkg out of it. Next project would be to study Steenrod actions.

<<Anchor(kenzo)>>
=== Kenzo ===
[[http://www-fourier.ujf-grenoble.fr/~sergerar/Kenzo/|Kenzo]] implements several spectral sequences, can build the first stages of the Whitehead and Postnikov towers, and has a particular emphasis on iterated loop spaces. It is in Lisp (may be a problem), and I have no idea about license. 

<<Anchor(chomp)>>
=== CHomP ===
[[http://chomp.rutgers.edu/|CHomP]] has a set of tools for computing the homology of a collection of n-dimensional cubes, with a view towards applied applications in dynamical systems, chaos theory, and pattern characterization. Both sources and binaries are available.

== Surfaces ==

<<Anchor(circlepackings)>>
=== Circle packings ===
Just a link to the [[http://www.math.utk.edu/~kens/#software|Circle packings]] software of Ken Stephenson...

<<Anchor(surfacecurves)>>
=== Java applets for curves on surfaces ===
Here are some [[http://www.math.sunysb.edu/~moira/#Applets|Java applets]] due to Moira Chas for dealing with curves on surfaces: Conjugacy problem in closed surface groups, a certain pairing that I can not name in this Wiki since the person inventing it has a name containing an expensive metal, minimal intersection number, Turaev cobracket,...

== Three-Dimensional Manifolds ==

<<Anchor(snap)>>
=== Snap ===
[[http://sourceforge.net/projects/snap-pari/|Snap]] seems to be evolved from !SnapPea (see [[#t3m|below]]) and can compute arithmetic invariants of hyperbolic 3-manifolds. It seems to be a package for Pari, and is due to Oliver Goodman.

<<Anchor(t3m)>>
=== t3m ===
[[http://www.math.uic.edu/~t3m|t3m]] is a Python framework for doing computations in 3-manifolds. It includes !SnapPea, which seems to be a quite mature project for computations concerning hyperbolic 3-manifolds. At least, when attending conferences about low-dimensional topology, quite a few speakers use it.
!SnapPea contains a census of small volume hyperbolic manifolds, and there are extensions (e.g., generating [[http://www.math.uiuc.edu/~nmd/snappea/index.html|link projections]]) and data bases (e.g., [[http://www.math.uiuc.edu/%7Enmd/snappea/tables/index.html|tables of knots and links]] in !SnapPea format).

t3m also includes a program of Berge that allows manipulation of Heegaard diagrams. Moreover, t3m provides tools for computing mod 2 Heegaard-Floer link homology (this is a ''very hot topic''!). 

Last but not least, t3m can compute normal surfaces, which is a major brick for Wolfgang Haken's recognition algorithm of sufficiently large manifolds. For that purpose, FXrays is used. This is a small, fast C implementation of an algorithm for finding extremal rays of polyhedral cones with filtering, and '''might be of independent interest''' to Sage.

<<Anchor(recognizer)>>
=== 3-manifold recognizer ===
The [[http://www.csu.ac.ru/~trk/spine/|3-manifold recognizer]] was developed by the research group of Sergei Matveev at Chelyabinsk State University. It provides a very successful and fast heuristics for recognizing whether two given closed 3-dimensional manifolds are homeomorphic. Although there is no guarantee that it succeeds in all cases, it was able to classify all 13396 closed orientable irreducible manifolds that can be presented by (non-classical) triangulations of up to 11 tetrahedra. 

The source code for this program appears not to be publicly available, and a Windows binary from 2006 is the only version offered on the above webpage.  

== Knots ==

<<Anchor(heegaardfloer)>>
=== Heegaard-Floer link homology ===
This is one of the most interesting topics in knot theory. Heegaard-Floer link homology is quite difficult to compute. [[#t3m|t3m]] can do it modulo 2. 
<<BR>>
There is a [[http://www.math.columbia.edu/~wgillam/hfk|c++ program]] written by by John Baldwin and William Gillam.
<<BR>>
There is also a [[http://katlas.math.toronto.edu/wiki/Heegaard_Floer_Knot_Homology|Python program]] ([[http://www.math.uzh.ch/user/jdroz/|sources]]) due to Jean-Marie Droz and Anna Beliakova. It requires the Python package 'psyco'.

== Homotopy theory ==
<<Anchor(ext)>>
=== Ext over connected algebras ===
Computing Ext over connected algebras is important throughout algebra and topology. Ext over the Steenrod algebra, in particular, is useful in homotopy theory, because it is the E_2 term of the Adams spectral sequence converging to the stable homotopy groups of spheres.  [[http://www.math.wayne.edu/~rrb/cohom/index.html|Bob Bruner]] has written C programs to do these sorts of computations.  Some related work is at [[http://www.nullhomotopie.de/|Christian Nassau's web site]].  Bob has expressed a strong interest in getting this stuff into Sage, or at least getting an interface between the two.

<<Anchor(unstable)>>
=== Unstable homotopy groups of spheres ===
[[http://neil-strickland.staff.shef.ac.uk/toda/|Neil Strickland]] has written some Mathematica programs to reproduce some of Toda's calculations of stable homotopy groups of spheres, and these could be translated to Sage.
