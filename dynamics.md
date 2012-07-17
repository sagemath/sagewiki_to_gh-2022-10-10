= Dynamics in Sage =

== Introduction ==

Different aspects of dynamical systems involving computers

  * simulation and experimentation
  * prospection of combinatorial structures associated to dynamical systems (coded as infinite words, ...)
  * intrinsically discrete dynamics: shifts, cellular automata, ...
  * numerical algorithms seen as dynamical systems
  * ...

This page is an organization wiki for the implementation in Sage of various algorithms related to dynamics. All of the code is accessible to anyone interested. Where marked the code is available on the "sage-combinat" public server.

== Quick links ==

  * [[combinat|combinat wiki]]: the wiki page of the combinat community
    * [[combinat/Installation|installation instructions]]: how to install sage-combinat on your computer
  * [[dynamics/examples]]: examples that are produced with the code of sage-dynamics
  * [[https://lma.metelu.net/mailman/listinfo/sage-dynamics|sage-dynamics]]:  lma.metelu.net mailing-list
  * [[http://groups.google.com/group/sage-dynamics | sage-dynamics]]: Google group (web forum + mailing list)

== Organization ==

We plan to create a *dynamics* repository at the root of Sage subdivided according to the following hierarchy

  * arithmetic_dynamics (?)
  * cellular_automata (?)
  * complex_dynamics (?)
  * shifts (sage-combinat)
    * tilings (WangTile)
    * substitutive shift
      * self similar interval exchange map
    * s-adic shift
      * Sturmian
      * interval exchange maps
  * surface_dynamics (sage-combinat)
    * flat_surfaces
      * origamis
      * veech_surfaces
      * linear suspensions of iet
    * train_tracks
    * hyperbolic_dynamics
      * geodesic flow
      * Fuchsian groups
    * hamiltonian flows
      * logarithmic suspensions of iet
  * picewise (sage-combinat)
    * interval_exchange_transformations and linear_involutions
    * affine_iet
    * interval_translation
    * 2D (?)

== Subprojects ==

  * [[dynamics/ArithmeticAndComplex|Arithmetic and Complex Dynamics]]
  * [[dynamics/FlatSurfaces]]
  * [[LanguagesAndTilings]]
