[[TableOfContents]]

= In Process of Updating... Check back 11/23/06 =
==  Introduction ==

The SAGE Graph Theory Project aims to implement Graph objects and algorithms in ["SAGE"].

The goal of the Graph Database is to implement constructors for many common graphs, as well as thorough docstrings that can be used for educational purposes.  Please check below for updates and note the section set aside for suggestions at the bottom of the page.

Emily Kirkman is working on this project.

== Class Docstrings ==

{{{
A collection of constructors of common graphs.

USES:
    A list of all graphs and graph structures in this database is available via tab completion.
    Type "graphs." and then hit tab to see which graphs are available.

    The docstrings include educational information about each named graph with the hopes that this
    database can be used as a reference.

PLOTTING:
    All graphs (i.e., networks) have an associated SAGE graphics object, which you can display:
        
        sage: G = WheelGraph(15)
        sage: p = G.plot()
        sage: is_Graphics(p)
        True

    When creating a graph in SAGE, the default positioning of nodes is determined using the spring-layout
    algorithm.  Often, it is more efficient to pre-set the positions in a dictionary.  Additionally, we can use
    this position dictionary to display the graph in an intuitive manner, whereas the spring-layout would 
    fail if the graph is not very symmetric.  For example, consider the Petersen graph with default node
    positioning vs. the Petersen graph constructed by this database:

        sage: petersen_spring = Graph({0:[1,4,5], 1:[0,2,6], 2:[1,3,7], 3:[2,4,8], 4:[0,3,9],\
                5:[0,7,8], 6:[1,8,9], 7:[2,5,9], 8:[3,5,6], 9:[4,6,7]})
        sage.: petersen_spring.show()
        sage: petersen_database = graphs.PetersenGraph()
        sage.: petersen_database.show()
    
    For all the constructors in this database (except the random and empty graphs), the position dictionary
    is filled, instead of using the spring-layout algorithm.

ORGANIZATION:
    The constructors available in this database are organized as follows:
        Basic Structures:
            - EmptyGraph
            - CycleGraph
            - StarGraph
            - WheelGraph
        Named Graphs:
            - PetersenGraph
        Families of Graphs:
            - CompleteGraph
            - CompleteBipartiteGraph
            - RandomGNP
            - RandomGNPFast

AUTHORS:
    -- Robert Miller (2006-11-05): initial version - empty, random, petersen
    -- Emily Kirkman (2006-11-12): basic structures, node positioning for all constructors
    -- Emily Kirkman (2006-11-19): docstrings, examples
    
TODO:
    [] more named graphs
    [] thorough docstrings and examples
    [] set properties (as they are implemented)
    [] add query functionality for large database
}}}

== Basic Structures ==

=== Empty Graphs ===

==== Info ====
 * Returns an empty graph (0 nodes and 0 edges).
 * This is useful for constructing graphs by adding edges and vertices individually or in a loop.  

==== Plotting ====
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.

==== Code ====
{{{
 return graph.Graph()
}}}
==== Examples ====

===== Add one vertex to an empty graph. =====
{{{
 sage: empty1 = graphs.EmptyGraph()
 sage: empty1.add_vertex()
 sage: empty1.show()
}}}

attachment:empty1.png

===== Use for loops to build a graph from an empty graph. =====
{{{
 sage: empty2 = graphs.EmptyGraph()
 sage: for i in range(5):
 ...    empty2.add_vertex() # add 5 nodes, labeled 0-4
 ...
 sage: for i in range(3):
 ...    empty2.add_edge(i,i+1) # add edges {[0:1],[1:2],[2:3]}
 ...
 sage: for i in range(4)[1:]:
 ...    empty2.add_edge(4,i) # add edges {[1:4],[2:4],[3:4]}
 ...
 sage: empty2.show()
}}}

attachment:empty2.png

=== Cycle Graphs ===

==== Info ====
 * Returns a cycle graph with n nodes.
 * A cycle graph is a basic structure which is also typically called an n-gon.
 * This constructor is dependant on vertices numbered 0 through n-1 in NetworkX cycle_graph()

==== Plotting ====
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each cycle graph will be displayed with the first (0) node at the top, with the rest following in a counterclockwise manner.

 * The cycle graph is a good opportunity to compare efficiency of filling a position dictionary vs. using the spring-layout algorithm for plotting.  Because the cycle graph is very symmetric, the resulting plots should be similar (in cases of small n).

 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

==== Code ====

{{{
 pos_dict = {}
 for i in range(n):
     x = float(functions.cos((pi/2) + ((2*pi)/n)*i))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*i))
     pos_dict[i] = [x,y]
 G = NX.cycle_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Cycle graph on %d vertices"%n)
}}}

==== Examples ====

===== The following examples require NetworkX (to use default): =====
{{{
 sage: import networkx as NX
}}}

===== Compare the constructor speeds. =====
{{{
 time n = NX.cycle_graph(3989); spring3989 = Graph(n)
}}}

 CPU time: 0.05 s,  Wall time: 0.07 s[[BR]] (Time results will vary.)

{{{
 time posdict3989 = graphs.CycleGraph(3989)
}}}

 CPU time: 5.18 s,  Wall time: 6.17 s[[BR]] (Time results will vary.)

===== Compare the plotting speeds. =====
{{{
 sage: n = NX.cycle_graph(23)
 sage: spring23 = Graph(n)
 sage: posdict23 = graphs.CycleGraph(23)
}}}
{{{
 time spring23.show()
}}}

 CPU time: 2.04 s,  Wall time: 2.72 s[[BR]] (Time results will vary.)

attachment:cycle_spr23.png

{{{
 time posdict23.show()
}}}

 CPU time: 0.57 s,  Wall time: 0.71 s[[BR]] (Time results will vary.)

attachment:cycl_pd23.png


===== View many cycle graphs as a SAGE Graphics Array. =====

====== With the position dictionary filled: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    k = graphs.CycleGraph(i+3)
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
}}}

attachment:cycle_pd_array.png

====== With the spring-layout algorithm: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    spr = NX.cycle_graph(i+3)       
 ...    k = Graph(spr)
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
}}}

attachment:cycle_spr_array.png


=== Star Graphs ===

==== Info ====

 * Returns a star graph with n+1 nodes.
 * A Star graph is a basic structure where one node is connected to all other nodes.
 * This constructor is dependant on NetworkX numeric labels.

==== Plotting ====

 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each star graph will be displayed with the first (0) node in the center, the second node (1) at the top, with the rest following in a counterclockwise manner.  (0) is the node connected to all other nodes.
        
 * The star graph is a good opportunity to compare efficiency of filling a position dictionary vs. using the spring-layout algorithm for plotting.  As far as display, the spring-layout should push all other nodes away from the (0) node, and thus look very similar to this constructor's positioning.

 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

==== Code ====

{{{
 pos_dict = {}
 pos_dict[0] = [0,0]
 for i in range(n+1)[1:]:
     x = float(functions.cos((pi/2) + ((2*pi)/n)*(i-1)))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*(i-1)))
     pos_dict[i] = [x,y]
 G = NX.star_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Star graph on %d vertices"%(n+1))
}}}

==== Examples ====

===== The following examples require NetworkX (to use default): =====
{{{
 sage: import networkx as NX
}}}

===== Compare the constructor speeds. =====
{{{
 time n = NX.star_graph(3989); spring3989 = Graph(n)
}}}
 CPU time: 0.08 s,  Wall time: 0.10 s[[BR]] (Time Results will vary.)
{{{
 time posdict3989 = graphs.StarGraph(3989)
}}}
 CPU time: 5.43 s,  Wall time: 7.41 s[[BR]] (Time results will vary.)

===== Compare the plotting speeds. =====
{{{
 sage: n = NX.star_graph(23)
 sage: spring23 = Graph(n)
 sage: posdict23 = graphs.StarGraph(23)
}}}
{{{
 time spring23.show()
}}}
 CPU time: 2.31 s,  Wall time: 3.14 s[[BR]] (Time results will vary.)
attachment:star_spr23.png

{{{
 time posdict23.show()
}}}
 CPU time: 0.68 s,  Wall time: 0.80 s[[BR]] (Time results will vary.)
attachment:star_pd23.png

===== View many star graphs as a SAGE Graphics Array. =====
====== With the position dictionary filled: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    k = graphs.StarGraph(i+3)
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
}}}
attachment:star_array_pd.png

====== With the spring-layout algorithm: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    spr = NX.star_graph(i+3)       
 ...    k = Graph(spr)
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
}}}
attachment:star_array_spr.png



=== Wheel Graphs ===

==== Info ====

 * Returns a Wheel graph with n nodes.
 * A Wheel graph is a basic structure where one node is connected to all other nodes and those (outer) nodes are connected cyclically.
 * This constructor depends on NetworkX numeric labels.
        
==== Plotting ====

 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each wheel graph will be displayed with the first (0) node in the center, the second node at the top, and the rest following in a counterclockwise manner.
 * With the wheel graph, we see that it doesn't take a very large n at all for the spring-layout to give a counter-intuitive display.  (See Graphics Array examples below).
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

==== Code ====

{{{
pos_dict = {}
        pos_dict[0] = [0,0]
        for i in range(n)[1:]:
            x = float(functions.cos((pi/2) + ((2*pi)/(n-1))*(i-1)))
            y = float(functions.sin((pi/2) + ((2*pi)/(n-1))*(i-1)))
            pos_dict[i] = [x,y]
        G = NX.wheel_graph(n)
        return graph.Graph(G, pos=pos_dict, name="Wheel graph on %d vertices"%n)
}}}

==== Examples ====

===== The following examples require NetworkX (to use default): =====
{{{
 sage: import networkx as NX
}}}

===== Compare the constructor speeds. =====
{{{
 time n = NX.wheel_graph(3989); spring3989 = Graph(n)
}}}
 CPU time: 0.07 s,  Wall time: 0.09 s[[br]] (Time results will vary._

{{{
 time posdict3989 = graphs.WheelGraph(3989)
}}}
 CPU time: 5.99 s,  Wall time: 8.74 s[[br]] (Time results will vary.)

===== Compare the plotting speeds. =====
{{{
 sage: n = NX.wheel_graph(23)
 sage: spring23 = Graph(n)
 sage: posdict23 = graphs.WheelGraph(23)
}}}
{{{
 time spring23.show()
}}}
 CPU time: 2.24 s,  Wall time: 3.00 s[[br]] (Time results will vary.)
attachment:wheel_spr23.png

{{{
 time posdict23.show()
}}}
 CPU time: 0.68 s,  Wall time: 1.14 s[[br]] (Time results will vary.)
attachment:wheel_pd23.png

===== View many wheel graphs as a SAGE Graphics Array. =====
====== With the position dictionary filled: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    k = graphs.WheelGraph(i+3)
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
}}}
attachment:wheel_array_pd.png

====== With the spring-layout algorithm: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    spr = NX.wheel_graph(i+3)       
 ...    k = Graph(spr)
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
}}}
attachment:wheel_array_spr.png



== Named Graphs ==

=== Petersen ===

==== Info ====
==== Plotting ====
==== Properties ====
==== Code ====
==== Examples ====
 * Here is the Petersen Graph as constructed in the database
attachment:petersen_pos.png
 * And compare with the Petersen Graph plotted using the spring layout algorithm
attachment:petersen_spring.png

== Graph Families ==

=== Complete Graphs ===

==== Info ====
==== Plotting ====
==== Code ====
==== Examples ====

===== The following examples require NetworkX (to use default): =====
{{{
 sage: import networkx as NX
}}}

===== Compare the constructor speeds. =====
===== Compare the plotting speeds. =====
===== View many [cycle] graphs as a SAGE Graphics Array. =====
====== With the position dictionary filled: ======
====== With the spring-layout algorithm: ======





=== Complete Bipartite Graphs ===

==== Info ====
==== Plotting ====
==== Code ====
==== Examples ====

===== The following examples require NetworkX (to use default): =====
{{{
 sage: import networkx as NX
}}}

===== Compare the constructor speeds. =====
===== Compare the plotting speeds. =====
===== View many [cycle] graphs as a SAGE Graphics Array. =====
====== With the position dictionary filled: ======
====== With the spring-layout algorithm: ======





== Graphs I Plan to Add ==
== Suggestions ==
 * ???
