= Dynamics in Sage =

== Introduction ==

Different aspects of dynamical systems have to deal with computer

  * simulation and experimentation
  * prospection of combinatorial structure associated to dynamical systems (coded as infinite words, ...)
  * intrinsically discrete dynamics: shifts, cellular automata, ...

This page is an organization wiki for the implementation in Sage of various algorithm relative to dynamics. All the code produced is on the "combinat" public server and is accessible to anyone interested ([[combinat/Installation|installation instructions]]). For more information about development inside the combinat branch see [[combinat|following page]].

== Organization ==

We will create a repository *dynamics* in the root of Sage which would contain the following tree of repositories

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
