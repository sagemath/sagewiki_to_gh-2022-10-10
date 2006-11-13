[[TableOfContents]]

==  Introduction ==

The SAGE Graph Theory Project aims to implement Graph objects and algorithms in ["SAGE"].

The goal of the Graph Database is to implement constructors for many common graphs, as well as thorough docstrings that can be used for educational purposes.  Please check below for updates and note the section set aside for suggestions at the bottom of the page.

Emily Kirkman is working on this project.

== Basic Structures ==
We've begun to implement some basic graph constructors with (hopefully) intuitive graphics.  Please browse below and for more information on graph plotting, look at Rober Miller's [http://sage.math.washington.edu:9001/graph_plotting wiki].

=== Complete Graphs ===
The Complete Graph constructor takes an integer argument n, which is the number of vertices to be in the graph.  The chosen convention is to display this graph in a cyclic manner with the first node at the top (via a position dictionary).  Here's the constructor from the py file:
    def CompleteGraph(self, n):
        """
        Returns a complete graph with n nodes and cyclic positioning
        Dependant on vertices numbered 0 through n-1 in NetworkX complete_graph()
        """
        pos_dict = {}
        for i in range(n):
            x = float(cos((pi/2) + ((2*pi)/n)*i))
            y = float(sin((pi/2) + ((2*pi)/n)*i))
            pos_dict[i] = [x,y]
        G = NX.complete_graph(n)
        return Graph(G, pos=pos_dict, name="Complete graph on %d vertices"%n)


Below, we used the SAGE !GraphicsArray to show 16 complete graphs at once, starting at n=3 and through n=18.
attachment:complete_array.png

== Named Graphs ==

=== Petersen ===

== Suggestions ==
 * ???
