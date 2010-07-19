== Flat surfaces in Sage ==

=== Introduction ===

For general mathematic references see the [[https://lma.homelinux.org/wiki/FlatSurfaces/FlatSurfaces|Flat surfaces wiki]]. A flat surfaces can be seen either
 * as a union of polygons glued along pairs of parallel sides,
 * as a flat metric with no holonomy on a surface,
 * as a Riemann surface and a non zero Abelian (or quadratic) differential.

This page is aimed to be a roadmap for the implementations of various algorithm related to flat surfaces and more generally geometry of surfaces.

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
  * hyperelliptic curves (specifying the double cover over the sphere)
 * Unfoldings of rational billiards
 
=== Needed generic methods ===
 * switch between representations (the one where everybody can be converted is triangulated flat surface)
 * computing fundamental group and homology
 * maps between flat surfaces
 * action of SL(2,R) and isomorphisms

=== Hyperbolic geometry ===
 * the three 2D models: hyperbolic plane '''HH''', hyperbolic disc '''DD''' and the hyperboloïd
 * polygonal domains
 * tesselations (covering of HH by finite area convex polygonal domains)
 * Fuchsian groups and fundamental domains
