The SAGE [http://sage.math.washington.edu:9001/graph Graph Theory Project] aims to implement Graph objects and algorithms in ["SAGE"].

The goal of the Graph Database is to implement constructors for many common graphs, as well as thorough docstrings that can be used for reference.  The Graph Database will grow as the Graph Theory Project does.  Robert Miller has been working on a graphics primitive for SAGE Graph objects, which has allowed us to pre-set a position dictionary for the x-y coordinates of each node.  (Browse code and examples below).  We also have the ability to view graphs in a SAGE Graphics Array, write text on the graphs, etc. that we inherit from having an associated SAGE Graphics Object for each SAGE Graph.

As we implement algorithms into the Graph Theory Package, the constructors of known graphs would set their properties upon instantiation as well.  For example, if someone created a very large complete bipartite graph and then asked if it is a bipartite graph (not currently implemented), then instead of running through an algorithm to check it, we could return a value set at instantiation.  Further, this will improve the reference use of the docstrings as we would list the properties of each named graph.

I am also launching a [http://sage.math.washington.edu:9001/graph_db_survey survey] of existing graph database software.  I am looking for a substantially large database of graphs and their properties, so that users can query properties.  

Scroll down to see current status and examples.  There are lots of pictures, so I recommend using the Table of Contents to navigate.  Also, please note the suggestions section.  Posting suggestions there will be easiest for me to keep on top of.

Emily Kirkman is working on this project.

[[TableOfContents]]

= Suggestions =
 * ???

= Graphs I Plan to Add =

== Recently Added: Info Coming Soon ==
 * Barbell
 * Circular ladder
 * 2d Grid
 * Ladder
 * Lollipop
 * Path
 * Bull
 * Diamond
 * Dodecahedral
 * House
 * House x
 * Icosahedral
 * Krackhardt
 * Octahedral
 * Tetrahedral
 * Cubes


== Inherited from NetworkX ==
 *	Bipartite Generators
 *	Balanced tree
 *	Dorogovstev golstev mendes graph
 *	Grid (n-dim)
 *	Hypercube
 *	Chvatal
 *	Desargues
 *	Frucht
 *	Heawood
 *	Moebius kantor
 *	Pappus
 *	Sedgewick
 *	Truncated cube
 *	Truncated tetrahedron
 *	Tutte
 *	Also many more random generators and gens from degree sequence to sort through

== Families of Graphs ==
 * Generalized Petersen graphs
 * Petersen Graph family
 * Trees (Directed – not simple.  Maybe Balanced tree constructor and query isTree)
 * Cayley (Requires Edge Coloring)
 * Paley

== Named Graphs ==
 * Thomsen
 * Brinkman
 * Clebsch
 * Flower snark
 * Icosahedron
 * Grötzsch graph
 * Tutte eight-cage
 * Heawood graph
 * Szekeres snark
 * Thomassen graph
 * Johnson (maybe own class)
 * Turan



= Currently Implemented in Graph Database =

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

I. Info
 * Returns an empty graph (0 nodes and 0 edges).
 * This is useful for constructing graphs by adding edges and vertices individually or in a loop.  
I. Plotting
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.
I. Code
{{{
 return graph.Graph()
}}}
I. Examples
Add one vertex to an empty graph.
{{{
 sage: empty1 = graphs.EmptyGraph()
 sage: empty1.add_vertex()
 sage: empty1.show()
}}}
attachment:empty1.png
Use for loops to build a graph from an empty graph.
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
 * The Petersen Graph is a named graph that consists of 10 vertices and 14 edges, usually drawn as a five-point star embedded in a pentagon.
 * The Petersen Graph is a common counterexample.  For example, it is not Hamiltonian.
       
==== Plotting ====
 * When plotting the Petersen graph with the spring-layout algorithm, we see that this graph is not very symmetric and thus the display may not be very meaningful.  Efficiency of construction and plotting is not an issue, as the Petersen graph
only has 10 vertices and 14 edges.
 * Our labeling convention here is to start on the outer pentagon from the top, moving counterclockwise. Then the nodes on the inner star, starting at the top and moving counterclockwise.

==== Properties ====

==== Code ====
{{{
 pos_dict = {}
 for i in range(5):
     x = float(functions.cos(pi/2 + ((2*pi)/5)*i))
     y = float(functions.sin(pi/2 + ((2*pi)/5)*i))
     pos_dict[i] = [x,y]
 for i in range(10)[5:]:
     x = float(0.5*functions.cos(pi/2 + ((2*pi)/5)*i))
     y = float(0.5*functions.sin(pi/2 + ((2*pi)/5)*i))
     pos_dict[i] = [x,y]
 P = graph.Graph({0:[1,4,5], 1:[0,2,6], 2:[1,3,7], 3:[2,4,8], 4:[0,3,9],\
            5:[0,7,8], 6:[1,8,9], 7:[2,5,9], 8:[3,5,6], 9:[4,6,7]},\
            pos=pos_dict, name="Petersen graph")
 return P
}}}
==== Examples ====
===== Petersen Graph as constructed in this database =====
{{{
 sage: petersen_database = graphs.PetersenGraph()
 sage: petersen_database.show()
}}}
attachment:petersen_pos.png
====== Petersen Graph plotted using the spring layout algorithm ======
{{{
 sage: petersen_spring = Graph({0:[1,4,5], 1:[0,2,6], 2:[1,3,7], 3:[2,4,8], 4:[0,3,9],\
                    5:[0,7,8], 6:[1,8,9], 7:[2,5,9], 8:[3,5,6], 9:[4,6,7]})
 sage: petersen_spring.show()
}}}
attachment:petersen_spring.png

== Graph Families ==

=== Complete Graphs ===

==== Info ====
 * Returns a complete graph on n nodes.
 * A Complete Graph is a graph in which all nodes are connected to all other nodes.
 * This constructor is dependant on vertices numbered 0 through n-1 in NetworkX complete_graph()
        
==== Plotting ====
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each complete graph will be displayed with the first (0) node at the top, with the rest following in a counterclockwise manner.
 * In the complete graph, there is a big difference visually in using the spring-layout algorithm vs. the position dictionary used in this constructor.  The position dictionary flattens the graph, making it clear which nodes an edge is connected to.  But the complete graph offers a good example of how the spring-layout works.  The edges push outward (everything is connected), causing the graph to appear as a 3-dimensional pointy ball.  (See examples below).
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

==== Code ====
{{{
 pos_dict = {}
 for i in range(n):
     x = float(functions.cos((pi/2) + ((2*pi)/n)*i))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*i))
     pos_dict[i] = [x,y]
 G = NX.complete_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Complete graph on %d vertices"%n)
}}}

==== Examples ====

===== The following examples require NetworkX (to use default): =====
{{{
 sage: import networkx as NX
}}}

===== Compare the constructor speeds. =====
{{{
 time n = NX.complete_graph(1559); spring1559 = Graph(n)
}}}
 CPU time: 6.85 s,  Wall time: 9.71 s[[BR]](Time results vary.)
{{{
 time posdict1559 = graphs.CompleteGraph(1559)
}}}
 CPU time: 9.67 s,  Wall time: 11.75 s[[BR]](Time results vary.)


===== Compare the plotting speeds. =====
{{{
 sage: n = NX.complete_graph(23)
 sage: spring23 = Graph(n)
 sage: posdict23 = graphs.CompleteGraph(23)
}}}
{{{
 time spring23.show()
}}}
 CPU time: 3.51 s,  Wall time: 4.29 s[[BR]](Time Results will vary.)
attachment:complete_spr23.png
{{{
 time posdict23.show()
}}}
 CPU time: 0.82 s,  Wall time: 0.96 s[[BR]](Time Results will vary.)
attachment:complete_pd23.png


===== View many Complete graphs as a SAGE Graphics Array. =====
====== With the position dictionary filled: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(9):
 ...    k = graphs.CompleteGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(3):
 ...    n = []
 ...    for m in range(3):
 ...        n.append(g[3*i + m].plot(node_size=50, with_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:complete_array_pd.png

====== With the spring-layout algorithm: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(9):
 ...    spr = NX.complete_graph(i+3)       
 ...    k = Graph(spr)
 ...    g.append(k)
 ...
 sage: for i in range(3):
 ...    n = []
 ...    for m in range(3):
 ...        n.append(g[3*i + m].plot(node_size=50, with_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:complete_array_spr.png



=== Complete Bipartite Graphs ===

==== Info ====
 * Returns a Complete Bipartite Graph sized n1+n2, with each of the nodes [0,(n1-1)] connected to each of the nodes [n1,(n2-1)] and vice versa.
 * A Complete Bipartite Graph is a graph with its vertices partitioned into two groups, V1 and V2.  Each v in V1 is connected to every v in V2, and vice versa.  

==== Plotting ====
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each complete bipartite graph will be displayed with the first n1 nodes on the top row (at y=1) from left to right.  The remaining n2 nodes appear at y=0, also from left to right.  The shorter row (partition with fewer nodes) is stretched to the same length as the longer row, unless the shorter row has 1 node; in which case it is centered.  The x values in the plot are in domain [0,max{n1,n2}].       
 * In the Complete Bipartite graph, there is a visual difference in using the spring-layout  algorithm vs. the position dictionary used in this constructor.  The position dictionary flattens the graph and separates the partitioned nodes, making it clear which nodes an edge is connected to.  The Complete Bipartite graph plotted with the spring-layout algorithm tends to center the nodes in n1 (see spring_med in examples below), thus overlapping its nodes and edges, making it typically hard to decipher.
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

==== Code ====
{{{
 pos_dict = {}
 c1 = 1 # scaling factor for top row
 c2 = 1 # scaling factor for bottom row
 c3 = 0 # pad to center if top row has 1 node
 c4 = 0 # pad to center if bottom row has 1 node
 if n1 > n2:
     if n2 == 1:
         c4 = (n1-1)/2
     else:
         c2 = ((n1-1)/(n2-1))
 elif n2 > n1:
     if n1 == 1:
         c3 = (n2-1)/2
     else:
         c1 = ((n2-1)/(n1-1))
 for i in range(n1):
     x = c1*i + c3
     y = 1
     pos_dict[i] = [x,y]
 for i in range(n1+n2)[n1:]:
      x = c2*(i-n1) + c4
      y = 0
      pos_dict[i] = [x,y]
 G = NX.complete_bipartite_graph(n1,n2)
 return graph.Graph(G, pos=pos_dict, name="Complete bipartite graph on %d vertices"%(n1+n2))
}}}

==== Examples ====

===== The following examples require NetworkX (to use default): =====
{{{
 sage: import networkx as NX
}}}

===== Compare the constructor speeds. =====
{{{
 time n = NX.complete_bipartite_graph(389,157); spring_big = Graph(n)
}}}
 CPU time: 9.28 s,  Wall time: 11.02 s[[BR]](Time results will vary.)
{{{
 time posdict_big = graphs.CompleteBipartiteGraph(389,157)
}}}
 CPU time: 10.72 s,  Wall time: 13.84 s[[BR]](Time results will vary.)

===== Compare the plotting speeds. =====
{{{
 sage: n = NX.complete_bipartite_graph(11,17)
 sage: spring_med = Graph(n)
 sage: posdict_med = graphs.CompleteBipartiteGraph(11,17)
}}}
{{{
 time spring_med.show()
}}}
 CPU time: 3.84 s,  Wall time: 4.49 s[[BR]](Time results will vary.)
attachment:compbip_spr_med.png

{{{
 time posdict_med.show()
}}}
 CPU time: 0.96 s,  Wall time: 1.14 s[[BR]](Time results will vary.)
attachment:compbip_pd_med.png


===== View many Complete Bipartite graphs as a SAGE Graphics Array. =====
====== With the position dictionary filled: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(9):
 ...    k = graphs.CompleteBipartiteGraph(i+1,4)
 ...    g.append(k)
 ...
 sage: for i in range(3):
 ...    n = []
 ...    for m in range(3):
 ...        n.append(g[3*i + m].plot(node_size=50, with_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:compbip_array_pd.png

====== With the spring-layout algorithm: ======
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(9):
 ...    spr = NX.complete_bipartite_graph(i+1,4)       
 ...    k = Graph(spr)
 ...    g.append(k)
 ...
 sage: for i in range(3):
 ...    n = []
 ...    for m in range(3):
 ...        n.append(g[3*i + m].plot(node_size=50, with_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:compbip_array.spr.png




== Random Graph Generators ==

=== RandomGNP ===

==== Info ====
 * Returns a Random graph on n nodes.  Each edge is inserted independently with probability p.
 * If p is small, use RandomGNPFast.  See NetworkX documentation.     
        C.f.
        P. Erdos and A. Renyi, On Random Graphs, Publ. Math. 6, 290 (1959).
        E. N. Gilbert, Random Graphs, Ann. Math. Stat., 30, 1141 (1959).
        
==== Plotting ====
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.

==== Code ====
{{{
 G = NX.gnp_random_graph(n, p, seed)
 return graph.Graph(G)
}}}
==== Examples ====
===== Compare the speed of RandomGNP and RandomGNPFast: =====
====== Sparse Graphs ======
{{{
 time regular_sparse = graphs.RandomGNP(1559,.22)
}}}
 CPU time: 31.79 s,  Wall time: 38.78 s[[BR]](Time results will vary.)
{{{
 time fast_sparse =  graphs.RandomGNPFast(1559,.22)
}}}
 CPU time: 21.72 s,  Wall time: 26.44 s[[BR]](Time results will vary.)
====== Dense Graphs ======
{{{ 
 time regular_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 38.75 s,  Wall time: 47.65 s[[BR]](Time results will vary.)
{{{
 time fast_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 39.15 s,  Wall time: 48.22 s[[BR]](Time results will vary.)

===== Plot a random graph on 12 nodes with p = .71 =====
{{{
 sage: gnp = graphs.RandomGNP(12,.71)
 sage: gnp.show()
}}}
attachment:rand_reg.png

===== View many random graphs using a SAGE Graphics Array =====
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    k = graphs.RandomGNP(i+3,.43)
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
attachment:rand_array_reg.png

=== RandomGNPFast ===
==== Info ====
 * Returns a Random graph on n nodes.  Each edge is inserted independently with probability p.
 * Use for small p (sparse graphs).  See NetworkX documentation.
        
==== Plotting ====
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.
        
==== Code ====
{{{
 G = NX.fast_gnp_random_graph(n, p, seed)
 return graph.Graph(G)
}}}

==== Examples ====
===== Compare the speed of RandomGNP and RandomGNPFast: =====
====== Sparse Graphs ======
{{{
 time regular_sparse = graphs.RandomGNP(1559,.22)
}}}
 CPU time: 31.79 s,  Wall time: 38.78 s[[BR]](Time results will vary.)
{{{
 time fast_sparse =  graphs.RandomGNPFast(1559,.22)
}}}
 CPU time: 21.72 s,  Wall time: 26.44 s[[BR]](Time results will vary.)

====== Dense Graphs ======
{{{ 
 time regular_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 38.75 s,  Wall time: 47.65 s[[BR]](Time results will vary.)
{{{
 time fast_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 39.15 s,  Wall time: 48.22 s[[BR]](Time results will vary.)

===== Plot a random graph on 12 nodes with p = .71 =====
{{{
 sage: fast = graphs.RandomGNPFast(12,.71)
 sage: fast.show()
}}}
attachment:rand_fast.png

===== View many random graphs using a SAGE Graphics Array =====
{{{
 sage: g = []
 sage: j = []
 sage: for i in range(16):
 ...    k = graphs.RandomGNPFast(i+3,.43)
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
attachment:rand_array_fast.png
