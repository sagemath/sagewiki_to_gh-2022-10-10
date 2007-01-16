[[TableOfContents]]

==  Introduction ==

The SAGE [http://sage.math.washington.edu:9001/graph Graph Theory Project] aims to implement Graph objects and algorithms in ["SAGE"].

Robert Miller is working on this project.

I'm integrating graph plotting fucntionality in ["SAGE"] one piece at a time.

So far, after small revisions to the graphics class, I've written a NetworkX primitive that takes a NetworkX graph on initialization, and renders that graph using NetworkX's native spring layout routine. In this routine, each edge is treated as a spring; after each node is randomly placed on the plot screen, fifty iterations allow the "springs" to align themselves in equilibrium, often revealing geometric symmetries of the graph (try plotting a Platonic solid...).

The ["SAGE"] graph class now comes with an optional positioning variable, so that if a user likes to think of a graph in a certain visual layout, that layout can be made part of the graph information. The graph class supports plotting via matplotlib, and soon will also support Tachyon plotting. In addition, the migration of NetworkX 0.32 -> 0.33 must be tested. Boundary nodes (soon to be implemented) will default to plot a different color, and edge labels will be supported. Pending another graphics primitive, soon graphics objects can be associated with nodes so that in the plots show up in place of the nodes when a graph is displayed.
