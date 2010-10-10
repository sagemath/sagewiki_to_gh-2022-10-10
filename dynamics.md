= Dynamics in Sage =

== Introduction ==

Different aspects of dynamical systems involve computers

  * simulation and experimentation
  * prospection of combinatorial structures associated to dynamical systems (coded as infinite words, ...)
  * intrinsically discrete dynamics: shifts, cellular automata, ...

This page is an organization wiki for the implementation in Sage of various algorithms relative to dynamics. All the code produced is on the "combinat" public server and is accessible to anyone interested ([[combinat/Installation|installation instructions]]). For more information about development inside the combinat branch see [[combinat|this page]].

== Organization ==

We plan to create a *dynamics* repository at the root of Sage subdivided according to the following hierarchy

  * cellular_automata (?)
  * complex_dynamics (?)
  * shifts
    * tilings (WangTile)
    * substitutive shift
      * self similar interval exchange map
    * s-adic shift
      * Sturmian
      * interval exchange maps
  * surface_dynamics
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
  * picewise
    * interval_exchange_transformations and linear_involutions
    * affine_iet
    * interval_translation
    * 2D (?)

== Subprojects ==

  * a project for flat surfaces [[dynamics/FlatSurfaces]]
