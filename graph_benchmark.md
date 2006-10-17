[[TableOfContents]]

==  Introduction ==

The SAGE [http://sage.math.washington.edu:9001/graph Graph Theory Project] aims to implement Graph objects and algorithms in ["SAGE"].

The main people working on this project are Emily Kirkman, Robert Miller and Bobby Moretti.

We will post results here as we get them.  And as always, we love feedback!

== Initial Benchmarks ==
 . Our initial tests are designed to compare the constructions and very basic functionality found in our [http://sage.math.washington.edu:9001/graph_survey survey of existing software].  At this stage in the game, we are testing to find the best way to construct graph objects in ["SAGE"].  For the first round of benchmarking we will only consider simple undirected graphs, and we will be comparing MAGMA, Mathematica (with Combinatorica), Maple, NetworkX, GRAPE, and nauty.

=== Algorithms ===
 . From a given database of graphs (sparse and dense), we will compute
 * Connectivity
 * Diameter
 * Girth
 * Chromatic number
