[[TableOfContents]]

==  Introduction ==

The SAGE Graph Theory Project aims to implement Graph objects and algorithms in ["SAGE"].

The goal of the Graph Database is to implement constructors for many common graphs, as well as thorough docstrings that can be used for educational purposes.  Please check below for updates and note the section set aside for suggestions at the bottom of the page.

Emily Kirkman is working on this project.

== Basic Structures ==
We've begun to implement some basic graph constructors with (hopefully) intuitive graphics.  Please browse below and for more information on graph plotting, look at Rober Miller's [http://sage.math.washington.edu:9001/graph_plotting wiki].

=== Complete Graphs ===

Below, we used the SAGE GraphicsArray to show 16 complete graphs at once, starting at n=3 and through n=18.
    sage: g = []
    sage: j = []
    sage: for i in range(16):
    ...    k = graphs.CompleteGraph(i+3)
    ...    g.append(k)
    ...
    sage: for i in range(4):
    ...    n = []
    ...    for m in range(4):
    ...        n.append(g[4*i + m].plot(node_size=50, with_labels=False))
    ...    j.append(n)
    ...
    sage: G = sage.plot.plot.GraphicsArray(j)
    sage: G.show()
attachment:complete_array.png

== Named Graphs ==

=== Petersen ===

== Suggestions ==
 * ???
