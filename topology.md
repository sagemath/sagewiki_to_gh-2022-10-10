

# Topology Related Software for Sage

Various people expressed the wish to have Algebraic Topology in Sage. This Wiki is for collecting suggestions. The first version is based on <a class="http" href="http://groups.google.com/group/sage-devel/browse_thread/thread/dadd2946ff1b1948?hl=en">this thread</a>. 

**Disclaimer:** Here we are not (yet) talking about _standard_ packages. Some of them can only be optional, due to lack of support for various platforms or due to licence problems. Also we do not claim that _all_ the suggestions below are interesting enough for considering inclusion. Please feel free to remove items if you think they are clearly inappropriate. 

One wish was to compute the homology of simplicial complexes, which might be doable with various packages. This is partially related with the study of point cloud data (_persistent_ homology). But there are also various pieces of software that are specialized on questions in Low-Dimensional Topology and are partially related with (riemannian) geometry and decision problems (e.g., 'determine whether or not two 3-manifolds are homeomorphic'). 


## List of Suggestions

There is one section for each of the items (follow the links). Many of our suggestions were taken from <a class="http" href="http://www.math.uiuc.edu/~nmd/computop/">Nathan Dunfield's list</a>. 

About algebraic topology (in the sense of homology, cohomology and stuff): 

* Polymake's <a href="/topology#topaz">topaz</a> module for simplicial homology 
* A <a href="/topology#palmieri">patch</a> of John Palmieri for computing simplicial homology 
* <a href="/topology#plex">Plex</a> for persistent homology 
* <a href="/topology#hap">Hap</a>, a Gap package due to G. Ellis and P. Smith. 
* A nearly completed <a href="/topology#king">spkg</a>  due to D. Green and S. King. 
* <a href="/topology#kenzo">Kenzo</a>, a Lisp program for computing homology, cohomology, and homotopy groups. 
* <a href="/topology#chomp">CHomP</a>, the Computational Homology Project. 
* <a href="/topology#dga">Differential graded algebras</a> 
About 2-dimensional topology: 

* <a href="/topology#circlepackings">Circle packings</a> by Ken Stephenson 
* Moira Chas's Java applets concerning <a href="/topology#surfacecurves">curves on surfaces</a> 
About 3-dimensional manifolds: 

* <a href="/topology#snap">Snap</a> for arithmetic invariants of hyperbolic 3-manifolds 
* <a href="/topology#t3m">t3m</a>, a Python framework for studying 3-manifolds due to Marc Culler and Nathan Dunfield. 
* The <a href="/topology#recognizer">3-manifold recognizer</a> that was developed by the research group of Sergei Matveev. 
* Much more is <a class="http" href="http://www.math.uiuc.edu/~nmd/computop/">here</a>! 
About knots 

* <a href="/topology#heegaardfloer">Heegaard-Floer link homology</a>  
* Much more is <a class="http" href="http://www.math.uiuc.edu/~nmd/computop/">here</a>! 
About homotopy theory 

* <a href="/topology#unstable">Unstable homotopy groups of spheres</a> 
* <a href="/topology#unstablemodule">Unstable modules over the Steenrod algebra</a> 
About algebra related to topology 

* <a href="/topology#ext">Ext over connected algebras</a> 
* <a href="/topology#gradedcommutative">Graded commutative rings</a> 
* <a href="/topology#fgl">Formal group laws</a> 
About visualization 

* _please insert your favourites here!_ 

# Brief descriptions of the individual packages


## Homology and Co.

<a name="topaz"></a> 
### topaz

This used to be a module of Polymake, but AFAIK it was removed due to build problems. <a class="http" href="http://www.math.tu-berlin.de/~lutz/">Frank Lutz</a> used the module in older versions of Polymake for his research. 

<a name="palmieri"></a> 
### Patch of John Palmieri

The patch is on the Trac server <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5386">here</a>. 

<a name="plex"></a> 
### Plex

<a class="http" href="http://comptop.stanford.edu/programs/jplex/index.html">Plex</a> is a software package for computing persistent homology of finite simplicial complexes, often generated from point cloud data. Originally developed for MATLAB, there is also a stand-alone Java version.   

<a name="hap"></a> 
### Hap

<a class="http" href="http://hamilton.nuigalway.ie/Hap/www/index.html">Hap</a> is a Gap package developed by Graham Ellis and Paul Smith. It can be used to make basic calculations in the cohomology of finite and infinite groups.  

<a name="king"></a> 
### Spkg of David Green and Simon King

Based on C-programs of David Green, Simon King created Cython modules for the computation of cohomology rings of finite p-groups with coefficients in GF(p). Currently this seems to be by far the most powerful framework for computing modular cohomology rings of finite p-groups. Results can be found <a class="http" href="http://users.minet.uni-jena.de/~king/cohomology/">here</a>. It seems that we are close to making a spkg out of it. Next project would be to study Steenrod actions. 

<a name="kenzo"></a> 
### Kenzo

<a class="http" href="http://www-fourier.ujf-grenoble.fr/~sergerar/Kenzo/">Kenzo</a> implements several spectral sequences, can build the first stages of the Whitehead and Postnikov towers, and has a particular emphasis on iterated loop spaces. It is in Lisp (may be a problem), and I have no idea about license.  

<a name="chomp"></a> 
### CHomP

<a class="http" href="http://chomp.rutgers.edu/">CHomP</a> has a set of tools for computing the homology of a collection of n-dimensional cubes, with a view towards applied applications in dynamical systems, chaos theory, and pattern characterization. Both sources and binaries are available. 

<a name="dga"></a> 
### DGAs

Justin Noel suggested that we implement differential graded algebras over fields, and their homology algebras. This might include Massey product calculations, also.  Perhaps something about A-infinity algebras could be done, too? 


## Surfaces

<a name="circlepackings"></a> 
### Circle packings

Just a link to the <a class="http" href="http://www.math.utk.edu/~kens/#software">Circle packings</a> software of Ken Stephenson... 

<a name="surfacecurves"></a> 
### Java applets for curves on surfaces

Here are some <a class="http" href="http://www.math.sunysb.edu/~moira/#Applets">Java applets</a> due to Moira Chas for dealing with curves on surfaces: Conjugacy problem in closed surface groups, a certain pairing that I can not name in this Wiki since the person inventing it has a name containing an expensive metal, minimal intersection number, Turaev cobracket,... 


## Three-Dimensional Manifolds

<a name="snap"></a> 
### Snap

<a class="http" href="http://sourceforge.net/projects/snap-pari/">Snap</a> seems to be evolved from SnapPea (see <a href="/topology#t3m">below</a>) and can compute arithmetic invariants of hyperbolic 3-manifolds. It seems to be a package for Pari, and is due to Oliver Goodman. 

<a name="t3m"></a> 
### t3m

<a class="http" href="http://www.math.uic.edu/~t3m">t3m</a> is a Python framework for doing computations in 3-manifolds. It includes SnapPea, which seems to be a quite mature project for computations concerning hyperbolic 3-manifolds. At least, when attending conferences about low-dimensional topology, quite a few speakers use it. SnapPea contains a census of small volume hyperbolic manifolds, and there are extensions (e.g., generating <a class="http" href="http://www.math.uiuc.edu/~nmd/snappea/index.html">link projections</a>) and data bases (e.g., <a class="http" href="http://www.math.uiuc.edu/%7Enmd/snappea/tables/index.html">tables of knots and links</a> in SnapPea format). 

t3m also includes a program of Berge that allows manipulation of Heegaard diagrams. Moreover, t3m provides tools for computing mod 2 Heegaard-Floer link homology (this is a _very hot topic_!).  

Last but not least, t3m can compute normal surfaces, which is a major brick for Wolfgang Haken's recognition algorithm of sufficiently large manifolds. For that purpose, FXrays is used. This is a small, fast C implementation of an algorithm for finding extremal rays of polyhedral cones with filtering, and **might be of independent interest** to Sage. 

<a name="recognizer"></a> 
### 3-manifold recognizer

The <a class="http" href="http://www.csu.ac.ru/~trk/spine/">3-manifold recognizer</a> was developed by the research group of Sergei Matveev at Chelyabinsk State University. It provides a very successful and fast heuristics for recognizing whether two given closed 3-dimensional manifolds are homeomorphic. Although there is no guarantee that it succeeds in all cases, it was able to classify all 13396 closed orientable irreducible manifolds that can be presented by (non-classical) triangulations of up to 11 tetrahedra.  

The source code for this program appears not to be publicly available, and a Windows binary from 2006 is the only version offered on the above webpage.   


## Knots

<a name="heegaardfloer"></a> 
### Heegaard-Floer link homology

This is one of the most interesting topics in knot theory. Heegaard-Floer link homology is quite difficult to compute. <a href="/topology#t3m">t3m</a> can do it modulo 2.    
 There is a <a class="http" href="http://www.math.columbia.edu/~wgillam/hfk">c++ program</a> written by by John Baldwin and William Gillam.   
 There is also a <a class="http" href="http://katlas.math.toronto.edu/wiki/Heegaard_Floer_Knot_Homology">Python program</a> (<a class="http" href="http://www.math.uzh.ch/user/jdroz/">sources</a>) due to Jean-Marie Droz and Anna Beliakova. It requires the Python package 'psyco'. 


## Homotopy theory

<a name="unstable"></a> 
### Unstable homotopy groups of spheres

<a class="http" href="http://neil-strickland.staff.shef.ac.uk/toda/">Neil Strickland</a> has written some Mathematica programs to reproduce some of Toda's calculations of stable homotopy groups of spheres, and these could be translated to Sage. 

<a name="unstablemodule"></a> 
### Unstable modules over the Steenrod algebra

Sage should know about modules (both ordinary and unstable) over the Steenrod algebra, and it could also have a database of some useful ones, e.g. Brown-Gitler modules or the mod p cohomology of some important spaces. 


## About algebra related to topology

<a name="ext"></a> 
### Ext over connected algebras

Computing Ext over connected algebras is important throughout algebra and topology. Ext over the Steenrod algebra, in particular, is useful in homotopy theory, because it is the E_2 term of the Adams spectral sequence converging to the stable homotopy groups of spheres.  <a class="http" href="http://www.math.wayne.edu/~rrb/cohom/index.html">Bob Bruner</a> has written C programs to do these sorts of computations.  Some related work is at <a class="http" href="http://www.nullhomotopie.de/">Christian Nassau's web site</a>.  Bob has expressed a strong interest in getting this stuff into Sage, or at least getting an interface between the two. 

<a name="gradedcommutative"></a> 
### Graded commutative rings

These ought to be implemented without going using some general noncommutative algebra package. 

<a name="fgl"></a> 
### Formal group laws

Justin Noel suggests: Functions for working with formal group laws: Expand a special formal group law or p-series (Honda fgl's, one of the universal formal group laws, the formal group law for BP); translating between Hazewinkel and Araki generators for BP.  
