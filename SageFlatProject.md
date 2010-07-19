= Flat surfaces in Sage =

== Introduction ==

For general mathematic references see the [[https://lma.homelinux.org/wiki/FlatSurfaces/FlatSurfaces|Flat surfaces wiki]]. A flat surface can be seen either
 * as a union of polygons glued along pairs of parallel sides,
 * as a flat metric with no holonomy on a compact surface,
 * as a Riemann surface together with a non zero Abelian (or quadratic) differential.

This page is aimed to be a roadmap for the implementations of various algorithm related to flat surfaces and more generally geometry/combinatoric/dynamic of surfaces (Mapping class group, train track, pseudo-Anosov dynamic, ...). For the moment we share the [[http://wiki.sagemath.org/combinat|sage-combinat repository]] with mercurial for the development.

== General architecture ==

For now the main structure is as follows

 * sage.combinat.flat_surfaces (which contains various generic objects)
 * sage.combinat.flat_surfaces.iet (for interval exchange transformations stuff)
 * sage.combinat.flat_surfaces.origamis (for origamis/square tiled surfaces stuff)

== Roadmap ==

=== Port of other programs ===
 * Joshua Bowman program on iso-Delaunay tessellations (written in Java)
 * Finish Anton Zorich port of Interval Exchange Transformations and Linear Involutions (written in Mathematica)
 * Anton Zorich program for computing approximation of various Lyapunov exponents (written in C and Mathematica)
 * Alex Eskin program for analyzing saddle connections direction in a surface (written in C++)

=== Different representations/implementations for flat surfaces ===
 * (convex) polygonal surface
  * rectangulated surface
   * suspension of iet (and li) (almost in Sage)
   * Thurston-Veech construction
  * triangulated surface
   * Delaunay surface (?)
 * Algebraic curve with Abelian or quadratic differential
 * Coverings (make it relative)... need to implement maps between translation surfaces
  * square tiled surfaces/origamis (covering of the torus) (almost in Sage)
  * hyperelliptic curves (specifying a double cover of the sphere)
 * Unfoldings of rational billiards
 
=== Needed generic methods ===
 * switch between representations (the one to which everybody can be converted is triangulated flat surface)
 * computing fundamental group and homology
 * maps between flat surfaces
 * action of SL(2,R) and isomorphisms
 * Siegel Veech constants
 * Lyapunov exponents

=== Hyperbolic geometry ===
 * the three 2D models: hyperbolic plane, hyperbolic disc and the hyperboloïd
 * points, geodesics and polygonal domains
 * tesselations (covering of HH by finite area convex polygonal domains)
 * Fuchsian groups, their fundamental domains and their associated tesselations
