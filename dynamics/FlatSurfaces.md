

# Sage flat surfaces wiki

[[_TOC_ 2]] 


# Flat surfaces in Sage


## What is a flat surface ? What are we doing here ?

A flat surface can be seen either 

   * as a union of polygons glued along pairs of parallel sides, 
   * as a flat metric with trivial SO(2) holonomy on a compact surface, 
   * as a Riemann surface together with a nonzero Abelian (or quadratic) differential, 
   * as a non zero tangent vector to the Teichmüller space, 
   * ... 
This page is an organization wiki for the implementation of various algorithms related to flat surfaces and more generally geometry/combinatorics/dynamics of surfaces (mapping class group, train tracks, pseudo-Anosov dynamics, ...). If you have a special request do not hesitate to edit <a href="/dynamics/FlatSurfaces#Wishes">wishes</a>. 


## Links

   * <a href="/dynamics">dynamics</a>: the wider project sage-dynamics (look at it in particular for installation) 
   * <a href="/dynamics/examples">dynamics/examples</a> : examples of code that uses the algorithms developed here 
   * <a class="https" href="https://lma.homelinux.org/wiki/FlatSurfaces/FlatSurfaces">Flat surfaces wiki</a> : a wiki dedicated to flat surfaces The main work is now happening in the **flatsurf** package: <a class="http" href="http://www.labri.fr/perso/vdelecro/flatsurf.html">flatsurf homepage</a> and <a class="https" href="https://github.com/videlec/sage-flatsurf">github repository</a>.


## Problems for student or anybody interested


### The Bucky ball problem (William Veech, Barak Weiss)

Let S be the translation surface obtained from the (finite cover) of the bucky ball. Is it a Veech surface ? 


### Connection points

Does the middle point of the regular heptagon a connection point ? Is there any connection point on the heptagon ? 


# Global organization


## Architecture

We need to review the architecture of flat surfaces repository to fit with the general framework for <a href="/dynamics">dynamics</a>. In is now as follows and should be quickly changed 

* sage.combinat.flat_surfaces (various generic objects) 
* sage.combinat.flat_surfaces.iet (interval exchange transformations) 
* sage.combinat.flat_surfaces.origamis (origamis/square-tiled surfaces) 
* sage.geometry.hyperbolic_geometry (hyperbolic spaces) 
* sage.groups.surface_gps (abstract surface groups) 

## What should be a Sage flat surface ?

We aim to allow different implementation for flat surfaces and full compatibility between them. Here is a draft of what we expect. 


### Different representations/implementations for flat surfaces

* (convex) polygonal surface 
      * rectangulated surface 
            * suspension of iet (and li) (almost in Sage) 
            * Thurston-Veech construction 
      * triangulated surface 
            * Delaunay surface (?) 
* algebraic curve with Abelian or quadratic differential 
* coverings (make it relative)... need to implement homomorphism between translation surfaces 
      * square-tiled surfaces/origamis (torus coverings) (almost in Sage) 
      * pillow-case covers (almost in Sage) 
      * hyperelliptic curves (specifying a double cover of the sphere) 
* unfoldings of rational billiards 

### Needed generic methods

   * switch between representations (the one to which everybody can be converted is triangulated flat surface) 
   * compute fundamental group, relative homology, and homology (as well as functors between them) 
   * maps between flat surfaces (and functors to fundamental groups and homologies) 
   * action of SL(2,R) and isomorphisms (and functors) 
   * Siegel-Veech constants and volumes 
   * Lyapunov exponents 

# Roadmap / Concrete tasks

We need to rebase some of the code and create new one. Here is what do we want to be done. 


## Wishes

Write here what you need for your research work (no precision on implementations is needed). 

   * volume of strata and Siegel Veech constants 
   * sum of Lyapunov exponents in various context 

## Interval exchange transformations


### Mathematical prerequisite

Interval exchange transformations can be seen from different point of vue 

   * combinatoric : a permutation and some moves associated to Rauzy induction 
   * dynamic of interval (one dimensional datum over each label) 
   * first return map of a translation flow (two dimensional datum over each label) 

### Done

The following are yet implemented in Sage 

   * permutations for interval exchange transformations (iet) and linear involutions (li) 
   * computation of Rauzy diagrams 
   * relation between iet/li and Rauzy induction : given the lengths of the intervals compute the steps of the Rauzy induction, given the steps compute the lengths. 

### To do

   * rebase reduced permutations to be systematically on the alphabet 0, ..., n (we can think about an optional possibility of allowing an alphabet, but it should be optional) 
   * rebase labeled permutations with more focus on labels as a marking of the surface  
   * make Rauzy diagrams lazy (we do NOT want to compute all permutations at initialization) 
         * provide generators for standard permutations in each Rauzy diagrams 
         * add the formula for the cardinality 
         * ... 
   * stratum <-> Rauzy diagrams: we should provide a uniform framework for the correspondance between various Rauzy diagrams and strata of Abelian/quadratic differential 
   * interval exchange transformations are not fast enough to do any simulation 
         * computation of the language and the measure of the clopens (i.e. decompose T^n) 
         * quantitative recurrence (how to deal with approximations here) 
         * ... 

## Fast permutations in C : interfacing GAP ?

We really need fast permutation objects and other group theoretical stuff based on permutations (computation of centralizers, iteration of elements in conjugacy classes, ...). The most convenient would be to use <a class="http" href="http://www.gap-system.org/">GAP (Groups, Algorithms, Programming)</a> which is completely written in C and has a lot of efficient algorithms for permutations and group theory. Moreover, the implementation of permutation in GAP is as we expect: a bijection of $\{0, \ldots, n-1\}$. Here is a part of the preambule of permutat.c in GAP sources 


```txt
**  Mathematically a permutation is a bijective mapping  of a finite set onto
**  itself.  In \GAP\ this subset must always be of the form [ 1, 2, .., N ],
**  where N is at most $2^16$.
**
**  Internally a permutation  is viewed as a mapping  of [ 0,  1,  .., N-1 ],
**  because in C indexing of  arrays is done with the origin  0 instead of 1.
**  A permutation is represented by a bag of type 'T_PERM' of the form
**
**      +-------+-------+-------+-------+- - - -+-------+-------+
**      | image | image | image | image |       | image | image |
**      | of  0 | of  1 | of  2 | of  3 |       | of N-2| of N-1|
**      +-------+-------+-------+-------+- - - -+-------+-------+
**
**  The entries of the bag are of type  'UInt2'  (defined in 'system.h' as an
**  at least 16 bit   wide unsigned integer  type).   The first entry is  the
**  image of 0, the second is the image of 1, and so  on.  Thus, the entry at
**  C index <i> is the image of <i>, if we view the permutation as mapping of
**  [ 0, 1, 2, .., N-1 ] as described above.
```
* We also need other kind of objects 
            * - permutations (standard operations) - tuple of permutations up to conjugacy - constellations (prod_n d_i = 1) - generalized constellations of genus g (prod_g [a_i,b_i] prod_n d_i = 1) 
* C interface to gap <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6391">ticket #6391</a> 

### References

   * <a class="http" href="http://www.gap-system.org/Manuals/doc/htm/prg/chapters.htm">GAP programming tutorial</a> 
   * <a class="http" href="http://www.gap-system.org/Manuals/doc/htm/ext/CHAP001.htm">GAP extension documentation</a> 

## Separatrix diagrams / Cylinder diagrams and other markings in relative homolgy


### Mathematical prerequisite

Different contexts 

   * the set of horizontal saddle connections in a flat surface $S$ gives rise to a subset in $H_1(S, \Sigma; \mathbb{Z})$ 
   * a suspension of iet carries a canonic basis of $H_1(S, \Sigma; \mathbb{Z})$ 
We want to provide a uniform framework for dealing with markings of $H_1(S, \mathbb{Z})$ in relation with the flat structure. In each case, this marking is a Ribbon graph in which we specify an order on outgoing separatrices as well as an angle between separatrices. In the case of cylinder diagrams, there is also a supplementary data of the association bottom of cylinder - top of cylinder. 


### To do

* implement separatrix diagrams / cylinder diagrams for quadratic differentials 
* compute homology from a cylinder diagrams and compute the Lagrangian subspace generated by the cylinders (its dimension is involved in Forni's criterion for the non degeneracy of Lyapunov spectrum) 
* allows partial saddle connection configurations (see Eskin, Masur, Zorich 2003) 

## Origami and coverings


### Mathematical prerequisite

An origami is a cover of an elliptic curve ramified at the origin. 


### Done

   * origami as a couple of permutation 
   * pillow case cover as a constellation of degree $4$ 
   * cylinder diagram 
   * computation of Veech group and various algorithm related to it (Lyapunov exponents, geometry of the Teichmüller curve, ...) 

### To do

* sparse implementation of origamis (just store what happens at the cone points of a cylinder diagram, i.e. add integer coordinates to a cylinder diagram). 
* sparse implementation of pillow-case cover 
* homorphisms between origamis 
* C implementation of data structure for $\sigma_h$ and $\sigma_v$. The type of .SLedges() should then be origamis and not tuples. (dependent of permutations in C). 
* affine group as an extension of the Veech group 
* field of definition of origamis and computation of algebraic equations (case of cyclic covers, general case Swinnerton-Dyer, ...) 
* primitivity <=> compute the lattice generated by the set of holonomy of saddle connections. 

## Surface groups and mapping class group

They are needed from two points of view: the group of the surface itself and the flat surface's stabilizer under the action of SL(2,R) or PSL(2,R). There must be some software for dealing with surface groups. We need to look at 

* <a class="http" href="http://www.warwick.ac.uk/~mareg/download/kbmag2/">kbmag</a>: Knuth-Bendix in monoids and automatic groups, implemented by Derek Holt 

### Surface group and covers

To deal with coverings we need some stuff about constellations (of genus $g$ and degree $d$) which are (ordered) tuples of permutations $(\alpha_i, \beta_i)_{i \in \{1, ldots, g\}}$ and $(\delta_i)_{i \in \{1, \ldots, k\}}$ in the symmetric group $S_d$ such that 

   * the group generated by them is transitive (not fully needed) <=> connectivity of the cover 
   * they verify the surface relation: $\prod_i [\alpha_i, \beta_i] \prod_i \delta_i = 1$ 
A constellation has to be thought "up to conjugacy". For any tuple of permutations, one can compute a normal form for it in polynomial time. Most of the time, one would like to choose the conjugacy classes of the $\delta_i$ and fix the degree of the cover. There exists explicit formula for counting involving Frobenius formula but is there any fast generation method ? 

   * A Grothendieck dessin d'enfants is a genus 0 degree 3 constellation 
   * a pillow case cover is a genus 0 degree 4 constellation 
   * an origami is a genus 1 degree 1 constellation 

### Mapping class group

Is there any library somewhere to work with the mapping class group? 


## Hyperbolic geometry

This part is roughly implemented in <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9439">trac #9439</a> 

   * the three 2D models: hyperbolic plane, hyperbolic disc and the hyperboloïd 
   * points, geodesics and polygonal domains 
   * tessellations (covering of HH by finite area convex polygonal domains) 
   * Fuchsian groups, their fundamental domains and their associated tessellations 
The <a class="http" href="http://egl.math.umd.edu/">Experimental geometry lab</a> (University of Maryland) published a lot of Mathematica packages/worksheets to deal with Kleinian and Fuchsian groups, hyperbolic tessellations, etc. 


## Port of other programs

* Joshua Bowman's program on iso-Delaunay tessellations (written in Java) 
* Finish porting Anton Zorich's programs on interval exchange transformations and linear involutions (written in Mathematica) 
* Anton Zorich's program for computing approximations of various Lyapunov exponents (written in C and Mathematica) 
* Alex Eskin's program for analyzing saddle connection directions in a surface (written in C++) 