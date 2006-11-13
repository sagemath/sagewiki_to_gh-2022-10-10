[[TableOfContents]]

==  Introduction ==

The SAGE Graph Theory Project aims to implement Graph objects and algorithms in ["SAGE"].

The goal of the Graph Database is to implement constructors for many common graphs, as well as thorough docstrings that can be used for educational purposes.  Please check below for updates and note the section set aside for suggestions at the bottom of the page.

Emily Kirkman is working on this project.

== Basic Structures ==
We've begun to implement some basic graph constructors with (hopefully) intuitive graphics.  Please browse below and for more information on graph plotting, look at Rober Miller's [http://sage.math.washington.edu:9001/graph_plotting wiki].

=== Complete Graphs ===
 * The Complete Graph constructor takes an integer argument, which is the number of vertices to be in the graph.
 * The chosen convention is to display this graph in a cyclic manner with the first node at the top and counterclockwise direction (via a position dictionary of [x,y] tuples).

==== Examples ====
 * Here is a complete graph with n=16
attachment:complete_16.png
 * Below, we used the SAGE !GraphicsArray to show 16 complete graphs at once, starting at n=3 and through n=18.
attachment:complete_array.png

=== Complete Bipartite Graphs ===
 * I'm still working on the scaling but I have examples up of the current results
 * The constructor takes two integer arguments, n1 and n2, and results in a Complete Bipartite Graph with n1+n2 nodes.  
 * n1 nodes appear as the top row and the numeric labels begin left to right.  Similarly, the numeric labels on the bottom row appear left to right.
 * In a complete bipartite graph, every node from the n1 partition is connected only to every node in the n2 partition, and vice versa.

==== Examples ====
 * Here is a complete bipartite graph with n1=9 and n2=6 
attachment:complete_bipartite_9_6.png
 * Below, we used the SAGE !GraphicsArray to show 16 complete bipartite graphs at once, iterating from (2,2) to (5,5)
attachment:complete_bipartite_array.png

=== Cycle Graphs ===
 * The Cycle Graph constructor takes an integer argument, which is to be the number of vertices in the graph.
 * The chosen convention is to display this graph in a cyclic manner with the first node at the top and counterclockwise direction.

==== Examples ====
 * Here is a cycle graph with n=10
attachment:cycle_10.png
 * Below, we used the SAGE !GraphicsArray to show 9 cycle graphs at once, starting at n=3 and through n=11
attachment:cycle_array.png

=== Star Graphs ===
 * The Star Graph constructor takes an integer argument, which is to be the number of outer vertices of the star.  (Including the center, we will have n+1 nodes).
 * The chosen convention is to place the first node in the center and have all outer nodes connect to it, starting with the second directly above and moving counterclockwise about the center.

==== Examples ====
 * Here is a star graph with n=32 (i.e. 33 vertices)
attachment:star_33.png
 * Below, we used the SAGE !GraphicsArray to show 16 star graphs at once, starting at n=3 (4 nodes) and through n=18 (19 nodes).
attachment:star_array.png

=== Wheel Graphs ===
 * The Wheel Graph constructor takes an integer argument, which is to be the total number of nodes in the wheel graph.
 * A wheel graph has a center node (the first by convention), which is connected to all other nodes (similar to the star graph).
 * Also, a wheel graph has its outer nodes connected similar to a cycle graph.
 * The chosen convention is to label the center node first, then directly above it and counterclockwise.

==== Examples ====
 * Here is a wheel graph with n=32
attachment:wheel_32.png
 * Below, we used the SAGE !GraphicsArray to show 16 wheel graphs at once, starting at n=4 and through n=19
attachment:wheel_array.png

== Named Graphs ==

=== Petersen ===
 * The Petersen Graph is commonly known and often used as a counterexample.  
 * This is actually the graph that inspired the desire for conventional, intuitive graphics - compare below the spring layout versus a planned dictionary of [x,y] tuples.
 * Our labeling convention here is to start on the outer pentagon from the top, moving counterclockwise.  Then the nodes on the inner star, starting at the top and moving counterclockwise.

==== Examples ====
 * Here is the Petersen Graph as constructed in the database
attachment:petersen_pos.png
 * And compare with the Petersen Graph plotted using the spring layout algorithm
attachment:petersen_spring.png

== Graph Families ==

== Suggestions ==
 * ???
