[[TableOfContents]]

==  Introduction ==

The SAGE Graph Theory Project aims to implement Graph objects and algorithms in ["SAGE"].

The goal of the Graph Database is to implement constructors for many common graphs, as well as thorough docstrings that can be used for educational purposes.  Please check below for updates and note the section set aside for suggestions at the bottom of the page.

Emily Kirkman is working on this project.

== Basic Structures ==
We've begun to implement some basic graph constructors with (hopefully) intuitive graphics.  Please browse below and for more information on graph plotting, look at Rober Miller's [http://sage.math.washington.edu:9001/graph_plotting wiki].

=== Complete Graphs ===
 * The Complete Graph constructor takes an integer argument, which is the number of vertices to be in the graph.  The chosen convention is to display this graph in a cyclic manner with the first node at the top and counterclockwise direction (via a position dictionary of [x,y] tuples).

==== Examples ====
 * Here is a complete graph with n=16
attachment:complete_16.png
 * Below, we used the SAGE !GraphicsArray to show 16 complete graphs at once, starting at n=3 and through n=18.
attachment:complete_array.png

=== Cycle Graphs ===
 * The Cycle Graph constructor takes an integer argument, which is to be the number of vertices in the graph.  The chosen convention is to display this graph in a cyclic manner with the first node at the top and counterclockwise direction.

==== Examples ====
 * Here is a cycle graph with n=10
attachment:cycle_10.png
 * Below, we used the SAGE !GraphicsArray to show 9 cycle graphs at once, starting at n=3 and through n=11
attachment:cycle_array.png

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

== Suggestions ==
 * ???
