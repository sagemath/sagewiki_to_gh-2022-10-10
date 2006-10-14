[[TableOfContents]]

==  Introduction ==

The SAGE [http://sage.math.washington.edu:9001/graph Graph Theory Project] aims to implement Graph objects and algorithms in ["SAGE"].

The main people working on this project are Emily Kirkman, Robert Miller and Bobby Moretti.

Our initial tests are designed to compare the constructions and very basic functionality found in our [http://sage.math.washington.edu:9001/graph_survey survey of existing software].  At this stage in the game, we are testing to find the best way to construct graph objects in ["SAGE"].

We will post results here as we get them.  And as always, we love feedback!

== Initial Benchmarks ==
 . For the first round of benchmarking, we will be comparing MAGMA, Mathematica (with Combinatorica), Maple, NetworkX, GRAPE, and nauty.

=== Generic Constructor ===
 * Create a graph with n nodes and no edges

=== Edge Storage ===
 * Fill in and then delete all edges one by one

=== Specific Constructors ===
==== Complete ====
==== Complete bipartite ====
==== Cycle ====

=== Basic Algorithms ===
==== Connectivity ====
==== Diameter ====
==== Girth ====
==== Chromatic number ====
