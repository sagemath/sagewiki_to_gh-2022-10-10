[[TableOfContents]]

==  Introduction ==

The SAGE [http://sage.math.washington.edu:9001/graph Graph Theory Project] aims to implement Graph objects and algorithms in ["SAGE"].

Robert Miller is working on this project.

I'm integrating graph plotting fucntionality in ["SAGE"] one piece at a time.

So far, after small revisions to the graphics class, I've written a NetworkX primitive that takes a NetworkX graph on initialization, and renders that graph using NetworkX's native spring layout routine. In this routine, each edge is treated as a spring; after each node is randomly placed on the plot screen, fifty iterations allow the "springs" to align themselves in equilibrium, often revealing geometric symmetries of the graph (try plotting a Platonic solid...). This is only the beginning of a true graph plotting interface, since there must be routines and objects that will deal with the ["SAGE"] graph class. When completed, this NetworkX primitive should take advantage of as much NetworkX functionality as possible.
