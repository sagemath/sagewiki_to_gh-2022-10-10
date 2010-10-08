= Dynamics in Sage =

== Introduction ==

Different aspect of dynamics has to deal with computer

  * simulation
  * prospection of combinatorial structure associated to dynamical systems (coding as infinite words, ...)
  * shifts, cellular automata

This page is aimed to be a roadmap for the implementations of various algorithm related to dynamics.

== Organization ==

We dedicate a repository dynamics which would contain the following tree of repositories

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
    * hamiltonian flows
      * logarithmic suspensions of iet
  * picewise
    * interval_exchange_transformations and linear_involutions
    * affine_iet
    * interval_translation
    * 2D (?)

== Subprojects ==

  * a project for flat surfaces [[SageFlatProject]]
