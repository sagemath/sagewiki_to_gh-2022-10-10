Emily Kirkman is working on this project.

The goal of the Graph Generators Class is to implement constructors for many common graphs, as well as thorough docstrings that can be used for reference.  The graph generators will grow as the Graph Theory Project does.  So please check back for additions and feel free to leave requests in the suggestions section.  

We currently have 30 constructors of named graphs and basic structures.  Most of these graphs are constructed with a preset dictionary of x-y coordinates of each node.  This is advantageous for both style and time.  (The default graph plotting in SAGE using the spring-layout algorithm).  SAGE graphs all have an associated graphics object, and examples of plotting options are shown on the graphs below.

As we implement algorithms into the Graph Theory Package, the constructors of known graphs would set their properties upon instantiation as well.  For example, if someone created a very large complete bipartite graph and then asked if it is a bipartite graph (not currently implemented), then instead of running through an algorithm to check it, we could return a value set at instantiation.  Further, this will improve the reference use of the docstrings as we would list the properties of each named graph.

Due to the volume of graphs now in the generators class, this wiki page is now intended to give status updates and serve as a gallery of graphs currently implemented.  To see information on a specific graph, run SAGE or the SAGE [http://sage.math.washington.edu:8100 notebook].  For a list of graph constructos, type "graphs." and hit tab.  For docstrings, type the graph name and one question mark (i.e.:  "graphs.!CubeGraph?") then shift + enter.  For source code, do likewise with two question marks.

The SAGE [http://sage.math.washington.edu:9001/graph Graph Theory Project] aims to implement Graph objects and algorithms in ["SAGE"].

[[TableOfContents]]

= Suggestions =
 * ???

= Graphs I Plan to Add =

== Inherited from NetworkX ==
 * Bipartite Generators
 * Balanced tree
 * Dorogovstev golstev mendes graph
 * Grid (n-dim)
 * Chvatal
 * Desargues
 * Pappus
 * Sedgewick
 * Truncated cube
 * Truncated tetrahedron
 * Tutte
 * Also many more random generators and gens from degree sequence to sort through

== Families of Graphs ==
 * Generalized Petersen graphs
 * Petersen Graph family
 * Trees (Directed – not simple.  Maybe Balanced tree constructor and query isTree)
 * Cayley (Requires Edge Coloring)
 * Paley

== Named Graphs ==
 * Brinkman
 * Clebsch
 * Icosahedron
 * Grötzsch graph
 * Tutte eight-cage
 * Szekeres snark
 * Thomassen graph
 * Johnson (maybe own class)
 * Turan

= Gallery of Graph Generators in SAGE =

== Named Graphs ==

=== Flower Snark ===

=== Frucht ===

=== Heawood ===

=== Moebius Kantor ===

=== Petersen ===

=== Thomsen ===

== Graph Families ==

=== Complete Bipartite Graphs ===

=== Complete Graphs ===

=== Cube Graphs ===

== Basic Structures ==

=== Barbell Graph ===

=== Bull Graph ===

=== Circular Ladder Graph ===

=== Claw Graph ===

=== Cycle Graphs ===

=== Diamond Graph ===

=== Dodecahedral Graph ===

=== Empty Graph ===

=== Grid 2d Graph ===

=== House Graph ===

=== House X Graph ===

=== Krackhardt Kite Graph ===

=== Ladder Graph ===

=== Lollipop Graph ===

=== Octahedral Graph ===

=== Path Graph ===

=== Star Graph ===

=== Tetrahedral Graph ===

=== Wheel Graph ===

== Random Generators ==

=== Random GNP ===

=== Random GNP Fast ===
