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

=== Barbell Graph ===

Info
  * Returns a barbell graph with 2*n1 + n2 nodes.  n1 must be greater than or equal to 2.
        
  * A barbell graph is a basic structure that consists of a path graph of order n2 connecting two complete graphs of order n1 each.
        
  * This constructor depends on NetworkX numeric labels.  In this case, the (n1)th node connects to the path graph from one complete graph and the (n1+n2+1)th node connects to the path graph from the other complete graph.
        
Plotting

  * Upon construction, the position dictionary is filled to override the spring-layout algorithm. By convention, each barbell graph will be displayed with the two complete graphs in the lower-left and upper-right corners, with the path graph connecting diagonally between the two.  Thus the (n1)th node will be drawn at a 45 degree angle from the horizontal right center of the first complete graph, and the (n1+n2+1)th node will be drawn 45 degrees below the left horizontal center of the second complete graph. 

Code
{{{
 pos_dict = {}
        
 for i in range(n1):
     x = float(cos((pi/4) - ((2*pi)/n1)*i) - n2/2 - 1)
     y = float(sin((pi/4) - ((2*pi)/n1)*i) - n2/2 - 1)
     j = n1-1-i
     pos_dict[j] = [x,y]
 for i in range(n1+n2)[n1:]:
     x = float(i - n1 - n2/2 + 1)
     y = float(i - n1 - n2/2 + 1)
     pos_dict[i] = [x,y]
 for i in range(2*n1+n2)[n1+n2:]:
     x = float(cos((5*pi/4) + ((2*pi)/n1)*(i-n1-n2)) + n2/2 + 2)
     y = float(sin((5*pi/4) + ((2*pi)/n1)*(i-n1-n2)) + n2/2 + 2)
     pos_dict[i] = [x,y]
        
 import networkx
 G = networkx.barbell_graph(n1,n2)
 return graph.Graph(G, pos=pos_dict, name="Barbell graph")
}}}


==== Examples ====
{{{
 # Construct and show a barbell graph
 # Bar = 4, Bells = 9
 sage: g = graphs.BarbellGraph(9,4)
 sage: g.show()
}}}

attachment here


=== Bull Graph ===
Info

  * Returns a bull graph with 5 nodes.
        
  * A bull graph is named for its shape.  It's a triangle with horns.
        
  * This constructor depends on NetworkX numeric labeling.
        
Plotting

  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the bull graph is drawn as a triangle with the first node (0) on the bottom.  The second and third nodes (1 and 2) complete the triangle.  Node 3 is the horn connected to 1 and node 4 is the horn connected to node 2.

Code

{{{
 pos_dict = [[0,0],[-1,1],[1,1],[-2,2],[2,2]]
 import networkx
 G = networkx.bull_graph()
 return graph.Graph(G, pos=pos_dict, name="Bull Graph")
}}}

==== Examples ====
{{{
 # Construct and show a bull graph
 sage: g = graphs.BullGraph()
 sage: g.show()
}}}

attachment here


=== Circular Ladder Graph ===

Info

  * Returns a circular ladder graph with 2*n nodes.

  * A Circular ladder graph is a ladder graph that is connected at the ends, i.e.: a ladder bent around so that top meets bottom.  Thus it can be described as two parrallel cycle graphs connected at each corresponding node pair.
        
  * This constructor depends on NetworkX numeric labels.

Plotting

  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the circular ladder graph is displayed as an inner and outer cycle pair, with the first n nodes drawn on the inner circle.  The first (0) node is drawn at the top of the inner-circle, moving clockwise after that.  The outer circle is drawn with the (n+1)th node at the top, then counterclockwise as well.

Code
{{{
 pos_dict = {}
 for i in range(n):
     x = float(cos((pi/2) + ((2*pi)/n)*i))
     y = float(sin((pi/2) + ((2*pi)/n)*i))
     pos_dict[i] = [x,y]
 for i in range(2*n)[n:]:
     x = float(2*(cos((pi/2) + ((2*pi)/n)*(i-n))))
     y = float(2*(sin((pi/2) + ((2*pi)/n)*(i-n))))
     pos_dict[i] = [x,y]
 import networkx
 G = networkx.circular_ladder_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Circular Ladder graph")
}}}

==== Examples ====

{{{
 # Construct and show a circular ladder graph with 26 nodes
 sage: g = graphs.CircularLadderGraph(13)
 sage: g.show()
}}}

attachment here

{{{            
 # Create several circular ladder graphs in a SAGE graphics array
 sage: g = []
 sage: j = []
 sage: for i in range(9):
 ...    k = graphs.CircularLadderGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(3):
 ...    n = []
 ...    for m in range(3):
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

attachment here



=== Cycle Graphs ===

Info

 * Returns a cycle graph with n nodes.
 * A cycle graph is a basic structure which is also typically called an n-gon.
 * This constructor is dependant on vertices numbered 0 through n-1 in NetworkX cycle_graph()

Plotting
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each cycle graph will be displayed with the first (0) node at the top, with the rest following in a counterclockwise manner.

 * The cycle graph is a good opportunity to compare efficiency of filling a position dictionary vs. using the spring-layout algorithm for plotting.  Because the cycle graph is very symmetric, the resulting plots should be similar (in cases of small n).

 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

Code

{{{
 import networkx as NX
 pos_dict = {}
 for i in range(n):
     x = float(functions.cos((pi/2) + ((2*pi)/n)*i))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*i))
     pos_dict[i] = [x,y]
 G = NX.cycle_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Cycle graph on %d vertices"%n)
}}}

==== Examples ====

The following examples require NetworkX (to use default):
{{{
 sage: import networkx as NX
}}}

Compare the constructor speeds.
{{{
 time n = NX.cycle_graph(3989); spring3989 = Graph(n)
}}}

 CPU time: 0.05 s,  Wall time: 0.07 s[[BR]] (Time results will vary.)

{{{
 time posdict3989 = graphs.CycleGraph(3989)
}}}

 CPU time: 5.18 s,  Wall time: 6.17 s[[BR]] (Time results will vary.)

Compare the plotting speeds.
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


View many cycle graphs as a SAGE Graphics Array.

With the position dictionary filled:
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
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

attachment:cycle_pd_array.png

With the spring-layout algorithm:
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

---- /!\ '''Edit conflict - other version:''' ----
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''Edit conflict - your version:''' ----
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''End of edit conflict''' ----
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

attachment:cycle_spr_array.png


=== Diamond Graph ===

Info

  * Returns a diamond graph with 4 nodes.

  * A diamond graph is a square with one pair of diagonal nodes connected.

  * This constructor depends on NetworkX numeric labeling.

Plotting

  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the diamond graph is drawn as a diamond, with the first node on top, second on the left, third on the right, and fourth on the bottom; with the  second and third node connected.

Code
{{{
 pos_dict = [[0,1],[-1,0],[1,0],[0,-1]]
 import networkx
 G = networkx.diamond_graph()
 return graph.Graph(G, pos=pos_dict, name="Diamond Graph")
}}}

==== Examples ====
{{{
 # Construct and show a diamond graph
 sage: g = graphs.DiamondGraph()
 sage: g.show()
}}}

attachment here

=== Empty Graphs ===

Info

 * Returns an empty graph (0 nodes and 0 edges).
 * This is useful for constructing graphs by adding edges and vertices individually or in a loop.

Plotting

 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.

Code

{{{
 return graph.Graph()
}}}

==== Examples ====

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

=== Grid2d Graphs ===
Info

  * Returns a 2-dimensional grid graph with n1*n2 nodes (n1 rows and n2 columns).

  * A 2d grid graph resembles a 2 dimensional grid.  All inner nodes are connected to their 4 neighbors.  Outer (non-corner) nodes are connected to their 3 neighbors.  Corner nodes are connected to their 2 neighbors.

  * This constructor depends on NetworkX numeric labels.

Plotting

  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, nodes are labelled in (row, column) pairs with (0, 0) in the top left corner.  Edges will always be horizontal and vertical - another advantage of filling the position dictionary.

Code
{{{
 pos_dict = {}
 for i in range(n1):
     y = -i
     for j in range(n2):
         x = j
         pos_dict[i,j] = [x,y]
 import networkx
 G = networkx.grid_2d_graph(n1,n2)
 return graph.Graph(G, pos=pos_dict, name="2D Grid Graph")
}}}

==== Examples ====
{{{
 # Construct and show a grid 2d graph
 # Rows = 5, Columns = 7
 sage: g = graphs.Grid2dGraph(5,7)
 sage: g.show()
}}}

attachment here


---- /!\ '''Edit conflict - other version:''' ----
=== House Graph ===

---- /!\ '''Edit conflict - your version:''' ----
=== House Graph ===

---- /!\ '''End of edit conflict''' ----

Info


---- /!\ '''Edit conflict - other version:''' ----
  * Returns a house graph with 5 nodes.

  * A house graph is named for its shape.  It is a triange (roof) over a square (walls).

  * This constructor depends on NetworkX numeric labeling.

---- /!\ '''Edit conflict - your version:''' ----
  * Returns a house graph with 5 nodes.

  * A house graph is named for its shape.  It is a triange (roof) over a square (walls).

  * This constructor depends on NetworkX numeric labeling.

---- /!\ '''End of edit conflict''' ----

Plotting


---- /!\ '''Edit conflict - other version:''' ----
  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the house graph is drawn with the first node in the lower-left corner of the house, the second in the lower-right corner of the house.  The third node is in the upper-left corner connecting the roof to the wall, and the fourth is in the upper-right corner connecting the roof to the walll.  The fifth node is the top of the roof, connected only to the third and fourth.

Code
==== This has been updated!  Change! ====
{{{
 pos_dict = [[-1,0],[1,0],[-1,1],[1,1],[0,2]]
 import networkx
 G = networkx.house_graph()
 return graph.Graph(G, pos=pos_dict, name="House Graph")

---- /!\ '''Edit conflict - your version:''' ----
  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the house graph is drawn with the first node in the lower-left corner of the house, the second in the lower-right corner of the house.  The third node is in the upper-left corner connecting the roof to the wall, and the fourth is in the upper-right corner connecting the roof to the walll.  The fifth node is the top of the roof, connected only to the third and fourth.

Code
==== This has been updated!  Change! ====
{{{
 pos_dict = [[-1,0],[1,0],[-1,1],[1,1],[0,2]]
 import networkx
 G = networkx.house_graph()
 return graph.Graph(G, pos=pos_dict, name="House Graph")

---- /!\ '''End of edit conflict''' ----
}}}

==== Examples ====

---- /!\ '''Edit conflict - other version:''' ----
{{{
 # Construct and show a house graph
 sage: g = graphs.HouseGraph()
 sage: g.show()
}}}

attachment here

=== House X Graph ===

---- /!\ '''Edit conflict - your version:''' ----
{{{
 # Construct and show a house graph
 sage: g = graphs.HouseGraph()
 sage: g.show()
}}}

attachment here

=== House X Graph ===

---- /!\ '''End of edit conflict''' ----

Info


---- /!\ '''Edit conflict - other version:''' ----
  * Returns a house X graph with 5 nodes.

  * A house X graph is a house graph with two additional edges.  The upper-right corner is connected to the lower-left.  And the upper-left corner is connected to the lower-right.

  * This constructor depends on NetworkX numeric labeling.

Plotting

  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the house X graph is drawn with the first node in the lower-left corner of the house, the second in the lower-right corner of the house.  The third node is in the upper-left corner connecting the roof to the wall, and the fourth is in the upper-right corner connecting the roof to the walll.  The fifth node is the top of the roof, connected only to the third and fourth.

==== Code, has been updated! ====
{{{
 pos_dict = [[-1,0],[1,0],[-1,1],[1,1],[0,2]]
 import networkx
 G = networkx.house_x_graph()
 return graph.Graph(G, pos=pos_dict, name="House Graph")

---- /!\ '''Edit conflict - your version:''' ----
  * Returns a house X graph with 5 nodes.

  * A house X graph is a house graph with two additional edges.  The upper-right corner is connected to the lower-left.  And the upper-left corner is connected to the lower-right.

  * This constructor depends on NetworkX numeric labeling.

Plotting

  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the house X graph is drawn with the first node in the lower-left corner of the house, the second in the lower-right corner of the house.  The third node is in the upper-left corner connecting the roof to the wall, and the fourth is in the upper-right corner connecting the roof to the walll.  The fifth node is the top of the roof, connected only to the third and fourth.

==== Code, has been updated! ====
{{{
 pos_dict = [[-1,0],[1,0],[-1,1],[1,1],[0,2]]
 import networkx
 G = networkx.house_x_graph()
 return graph.Graph(G, pos=pos_dict, name="House Graph")

---- /!\ '''End of edit conflict''' ----
}}}

==== Examples ====

---- /!\ '''Edit conflict - other version:''' ----
{{{
 # Construct and show a house X graph
 sage: g = graphs.HouseXGraph()
 sage.: g.show()
}}}

attachment here

=== Krackhardt Kite Graph ===

Info
  * Returns a Krackhardt kite graph with 10 nodes.

  * This constructor depends on NetworkX numeric labeling.

  * The Krackhardt kite graph was originally developed by David Krackhardt for the purpose of studying social networks.  It is used to show the distinction between:  degree centrality, betweeness centrality, and closeness centrality.  For more information read the plotting section below in conjunction with the example.  

References 
  * Kreps, V. (2002). "Social Network Analysis". [http://www.fsu.edu/~spap/water/network/intro.htm Link]

Plotting
  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the graph is drawn left to right, in top to bottom row sequence of [2, 3, 2, 1, 1, 1] nodes on each row.  This places the fourth node (3) in the center of the kite, with the highest degree.  

  * But the fourth node only connects nodes that are otherwise connected, or those in its clique (i.e.: Degree Centrality).  

  * The eigth (7) node is where the kite meets the tail.  It has degree = 3, less than the average, but is the only connection between the kite and tail (i.e.: Betweenness Centrality).  

  * The sixth and seventh nodes (5 and 6) are drawn in the third row and have degree = 5.  These nodes have the shortest path to all other nodes in the graph (i.e.: Closeness Centrality).  Please execute the example for visualization.

Code
{{{
 pos_dict = [[-1,4],[1,4],[-2,3],[0,3],[2,3],[-1,2],[1,2],[0,1],[0,0],[0,-1]]
 import networkx
 G = networkx.krackhardt_kite_graph()
 return graph.Graph(G, pos=pos_dict, name="Krackhardt Kite Graph")
}}}

==== Examples ====
{{{
 # Construct and show a Krackhardt kite graph
 sage: g = graphs.KrackhardtKiteGraph()
 sage.: g.show()
}}}

attachment here

=== Ladder Graph ===

---- /!\ '''Edit conflict - your version:''' ----
{{{
 # Construct and show a house X graph
 sage: g = graphs.HouseXGraph()
 sage.: g.show()
}}}

attachment here

=== Krackhardt Kite Graph ===

Info
  * Returns a Krackhardt kite graph with 10 nodes.

  * This constructor depends on NetworkX numeric labeling.

  * The Krackhardt kite graph was originally developed by David Krackhardt for the purpose of studying social networks.  It is used to show the distinction between:  degree centrality, betweeness centrality, and closeness centrality.  For more information read the plotting section below in conjunction with the example.  

References 
  * Kreps, V. (2002). "Social Network Analysis". [http://www.fsu.edu/~spap/water/network/intro.htm Link]

Plotting
  * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, the graph is drawn left to right, in top to bottom row sequence of [2, 3, 2, 1, 1, 1] nodes on each row.  This places the fourth node (3) in the center of the kite, with the highest degree.  

  * But the fourth node only connects nodes that are otherwise connected, or those in its clique (i.e.: Degree Centrality).  

  * The eigth (7) node is where the kite meets the tail.  It has degree = 3, less than the average, but is the only connection between the kite and tail (i.e.: Betweenness Centrality).  

  * The sixth and seventh nodes (5 and 6) are drawn in the third row and have degree = 5.  These nodes have the shortest path to all other nodes in the graph (i.e.: Closeness Centrality).  Please execute the example for visualization.

Code
{{{
 pos_dict = [[-1,4],[1,4],[-2,3],[0,3],[2,3],[-1,2],[1,2],[0,1],[0,0],[0,-1]]
 import networkx
 G = networkx.krackhardt_kite_graph()
 return graph.Graph(G, pos=pos_dict, name="Krackhardt Kite Graph")
}}}

==== Examples ====
{{{
 # Construct and show a Krackhardt kite graph
 sage: g = graphs.KrackhardtKiteGraph()
 sage.: g.show()
}}}

attachment here

=== Ladder Graph ===

---- /!\ '''End of edit conflict''' ----




---- /!\ '''Edit conflict - other version:''' ----
=== Lollipop Graph ===



=== Path Graph ===

=== Star Graphs ===

Info

 * Returns a star graph with n+1 nodes.
 * A Star graph is a basic structure where one node is connected to all other nodes.
 * This constructor is dependant on NetworkX numeric labels.

Plotting

 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each star graph will be displayed with the first (0) node in the center, the second node (1) at the top, with the rest following in a counterclockwise manner.  (0) is the node connected to all other nodes.
        
 * The star graph is a good opportunity to compare efficiency of filling a position dictionary vs. using the spring-layout algorithm for plotting.  As far as display, the spring-layout should push all other nodes away from the (0) node, and thus look very similar to this constructor's positioning.


---- /!\ '''Edit conflict - your version:''' ----
=== Lollipop Graph ===



=== Path Graph ===

=== Star Graphs ===

Info

 * Returns a star graph with n+1 nodes.
 * A Star graph is a basic structure where one node is connected to all other nodes.
 * This constructor is dependant on NetworkX numeric labels.

Plotting

 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each star graph will be displayed with the first (0) node in the center, the second node (1) at the top, with the rest following in a counterclockwise manner.  (0) is the node connected to all other nodes.
        
 * The star graph is a good opportunity to compare efficiency of filling a position dictionary vs. using the spring-layout algorithm for plotting.  As far as display, the spring-layout should push all other nodes away from the (0) node, and thus look very similar to this constructor's positioning.


---- /!\ '''End of edit conflict''' ----
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

Code

---- /!\ '''Edit conflict - other version:''' ----

{{{
 import networkx as NX
 pos_dict = {}
 pos_dict[0] = [0,0]
 for i in range(n+1)[1:]:
     x = float(functions.cos((pi/2) + ((2*pi)/n)*(i-1)))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*(i-1)))
     pos_dict[i] = [x,y]
 G = NX.star_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Star graph on %d vertices"%(n+1))

---- /!\ '''Edit conflict - your version:''' ----

{{{
 import networkx as NX
 pos_dict = {}
 pos_dict[0] = [0,0]
 for i in range(n+1)[1:]:
     x = float(functions.cos((pi/2) + ((2*pi)/n)*(i-1)))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*(i-1)))
     pos_dict[i] = [x,y]
 G = NX.star_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Star graph on %d vertices"%(n+1))

---- /!\ '''End of edit conflict''' ----
}}}

==== Examples ====

The following examples require NetworkX (to use default):
{{{
 sage: import networkx as NX
}}}

Compare the constructor speeds.
{{{

---- /!\ '''Edit conflict - other version:''' ----
 time n = NX.star_graph(3989); spring3989 = Graph(n)
}}}
 CPU time: 0.08 s,  Wall time: 0.10 s[[BR]] (Time Results will vary.)
{{{
 time posdict3989 = graphs.StarGraph(3989)
}}}
 CPU time: 5.43 s,  Wall time: 7.41 s[[BR]] (Time results will vary.)

---- /!\ '''Edit conflict - your version:''' ----
 time n = NX.star_graph(3989); spring3989 = Graph(n)
}}}
 CPU time: 0.08 s,  Wall time: 0.10 s[[BR]] (Time Results will vary.)
{{{
 time posdict3989 = graphs.StarGraph(3989)
}}}
 CPU time: 5.43 s,  Wall time: 7.41 s[[BR]] (Time results will vary.)

---- /!\ '''End of edit conflict''' ----

Compare the plotting speeds.
{{{

---- /!\ '''Edit conflict - other version:''' ----
 sage: n = NX.star_graph(23)
 sage: spring23 = Graph(n)
 sage: posdict23 = graphs.StarGraph(23)

---- /!\ '''Edit conflict - your version:''' ----
 sage: n = NX.star_graph(23)
 sage: spring23 = Graph(n)
 sage: posdict23 = graphs.StarGraph(23)

---- /!\ '''End of edit conflict''' ----
}}}
{{{
 time spring23.show()
}}}

---- /!\ '''Edit conflict - other version:''' ----
 CPU time: 2.31 s,  Wall time: 3.14 s[[BR]] (Time results will vary.)
attachment:star_spr23.png


---- /!\ '''Edit conflict - your version:''' ----
 CPU time: 2.31 s,  Wall time: 3.14 s[[BR]] (Time results will vary.)
attachment:star_spr23.png


---- /!\ '''End of edit conflict''' ----
{{{
 time posdict23.show()
}}}

---- /!\ '''Edit conflict - other version:''' ----
 CPU time: 0.68 s,  Wall time: 0.80 s[[BR]] (Time results will vary.)
attachment:star_pd23.png

View many star graphs as a SAGE Graphics Array.

---- /!\ '''Edit conflict - your version:''' ----
 CPU time: 0.68 s,  Wall time: 0.80 s[[BR]] (Time results will vary.)
attachment:star_pd23.png

View many star graphs as a SAGE Graphics Array.

---- /!\ '''End of edit conflict''' ----
With the position dictionary filled:
{{{
 sage: g = []
 sage: j = []

---- /!\ '''Edit conflict - other version:''' ----
 sage: for i in range(16):
 ...    k = graphs.StarGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''Edit conflict - your version:''' ----
 sage: for i in range(16):
 ...    k = graphs.StarGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''End of edit conflict''' ----
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

---- /!\ '''Edit conflict - other version:''' ----
attachment:star_array_pd.png

---- /!\ '''Edit conflict - your version:''' ----
attachment:star_array_pd.png

---- /!\ '''End of edit conflict''' ----

With the spring-layout algorithm:
{{{
 sage: g = []
 sage: j = []

---- /!\ '''Edit conflict - other version:''' ----
 sage: for i in range(16):
 ...    spr = NX.star_graph(i+3)       

---- /!\ '''Edit conflict - your version:''' ----
 sage: for i in range(16):
 ...    spr = NX.star_graph(i+3)       

---- /!\ '''End of edit conflict''' ----
 ...    k = Graph(spr)
 ...    g.append(k)
 ...

---- /!\ '''Edit conflict - other version:''' ----
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''Edit conflict - your version:''' ----
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''End of edit conflict''' ----
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

---- /!\ '''Edit conflict - other version:''' ----
attachment:star_array_spr.png


=== Wheel Graphs ===

Info

 * Returns a Wheel graph with n nodes.
 * A Wheel graph is a basic structure where one node is connected to all other nodes and those (outer) nodes are connected cyclically.
 * This constructor depends on NetworkX numeric labels.
        
Plotting

 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each wheel graph will be displayed with the first (0) node in the center, the second node at the top, and the rest following in a counterclockwise manner.
 * With the wheel graph, we see that it doesn't take a very large n at all for the spring-layout to give a counter-intuitive display.  (See Graphics Array examples below).

---- /!\ '''Edit conflict - your version:''' ----
attachment:star_array_spr.png


=== Wheel Graphs ===

Info

 * Returns a Wheel graph with n nodes.
 * A Wheel graph is a basic structure where one node is connected to all other nodes and those (outer) nodes are connected cyclically.
 * This constructor depends on NetworkX numeric labels.
        
Plotting

 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each wheel graph will be displayed with the first (0) node in the center, the second node at the top, and the rest following in a counterclockwise manner.
 * With the wheel graph, we see that it doesn't take a very large n at all for the spring-layout to give a counter-intuitive display.  (See Graphics Array examples below).

---- /!\ '''End of edit conflict''' ----
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

Code

---- /!\ '''Edit conflict - other version:''' ----

{{{
 import networkx as NX
 pos_dict = {}
 pos_dict[0] = [0,0]
 for i in range(n)[1:]:
     x = float(functions.cos((pi/2) + ((2*pi)/(n-1))*(i-1)))
     y = float(functions.sin((pi/2) + ((2*pi)/(n-1))*(i-1)))
     pos_dict[i] = [x,y]
 G = NX.wheel_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Wheel graph on %d vertices"%n)

---- /!\ '''Edit conflict - your version:''' ----

{{{
 import networkx as NX
 pos_dict = {}
 pos_dict[0] = [0,0]
 for i in range(n)[1:]:
     x = float(functions.cos((pi/2) + ((2*pi)/(n-1))*(i-1)))
     y = float(functions.sin((pi/2) + ((2*pi)/(n-1))*(i-1)))
     pos_dict[i] = [x,y]
 G = NX.wheel_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Wheel graph on %d vertices"%n)

---- /!\ '''End of edit conflict''' ----
}}}

==== Examples ====

The following examples require NetworkX (to use default):
{{{
 sage: import networkx as NX
}}}

Compare the constructor speeds.
{{{

---- /!\ '''Edit conflict - other version:''' ----
 time n = NX.wheel_graph(3989); spring3989 = Graph(n)
}}}
 CPU time: 0.07 s,  Wall time: 0.09 s[[br]] (Time results will vary._

{{{
 time posdict3989 = graphs.WheelGraph(3989)
}}}
 CPU time: 5.99 s,  Wall time: 8.74 s[[br]] (Time results will vary.)

---- /!\ '''Edit conflict - your version:''' ----
 time n = NX.wheel_graph(3989); spring3989 = Graph(n)
}}}
 CPU time: 0.07 s,  Wall time: 0.09 s[[br]] (Time results will vary._

{{{
 time posdict3989 = graphs.WheelGraph(3989)
}}}
 CPU time: 5.99 s,  Wall time: 8.74 s[[br]] (Time results will vary.)

---- /!\ '''End of edit conflict''' ----

Compare the plotting speeds.
{{{

---- /!\ '''Edit conflict - other version:''' ----
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

View many wheel graphs as a SAGE Graphics Array.

---- /!\ '''Edit conflict - your version:''' ----
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

View many wheel graphs as a SAGE Graphics Array.

---- /!\ '''End of edit conflict''' ----
With the position dictionary filled:
{{{
 sage: g = []
 sage: j = []

---- /!\ '''Edit conflict - other version:''' ----
 sage: for i in range(16):
 ...    k = graphs.WheelGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''Edit conflict - your version:''' ----
 sage: for i in range(16):
 ...    k = graphs.WheelGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''End of edit conflict''' ----
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

---- /!\ '''Edit conflict - other version:''' ----
attachment:wheel_array_pd.png

---- /!\ '''Edit conflict - your version:''' ----
attachment:wheel_array_pd.png

---- /!\ '''End of edit conflict''' ----

With the spring-layout algorithm:
{{{
 sage: g = []
 sage: j = []

---- /!\ '''Edit conflict - other version:''' ----
 sage: for i in range(16):
 ...    spr = NX.wheel_graph(i+3)       

---- /!\ '''Edit conflict - your version:''' ----
 sage: for i in range(16):
 ...    spr = NX.wheel_graph(i+3)       

---- /!\ '''End of edit conflict''' ----
 ...    k = Graph(spr)
 ...    g.append(k)
 ...

---- /!\ '''Edit conflict - other version:''' ----
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''Edit conflict - your version:''' ----
 sage: for i in range(4):
 ...    n = []
 ...    for m in range(4):
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''End of edit conflict''' ----
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

---- /!\ '''Edit conflict - other version:''' ----
attachment:wheel_array_spr.png

---- /!\ '''Edit conflict - your version:''' ----
attachment:wheel_array_spr.png

---- /!\ '''End of edit conflict''' ----




---- /!\ '''Edit conflict - other version:''' ----
== Named Graphs ==

=== Petersen ===

Info
 * The Petersen Graph is a named graph that consists of 10 vertices and 14 edges, usually drawn as a five-point star embedded in a pentagon.
 * The Petersen Graph is a common counterexample.  For example, it is not Hamiltonian.
       
Plotting
 * When plotting the Petersen graph with the spring-layout algorithm, we see that this graph is not very symmetric and thus the display may not be very meaningful.  Efficiency of construction and plotting is not an issue, as the Petersen graph
only has 10 vertices and 14 edges.
 * Our labeling convention here is to start on the outer pentagon from the top, moving counterclockwise. Then the nodes on the inner star, starting at the top and moving counterclockwise.

---- /!\ '''Edit conflict - your version:''' ----
== Named Graphs ==

=== Petersen ===

Info
 * The Petersen Graph is a named graph that consists of 10 vertices and 14 edges, usually drawn as a five-point star embedded in a pentagon.
 * The Petersen Graph is a common counterexample.  For example, it is not Hamiltonian.
       
Plotting
 * When plotting the Petersen graph with the spring-layout algorithm, we see that this graph is not very symmetric and thus the display may not be very meaningful.  Efficiency of construction and plotting is not an issue, as the Petersen graph
only has 10 vertices and 14 edges.
 * Our labeling convention here is to start on the outer pentagon from the top, moving counterclockwise. Then the nodes on the inner star, starting at the top and moving counterclockwise.

---- /!\ '''End of edit conflict''' ----

Code
{{{

---- /!\ '''Edit conflict - other version:''' ----
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
Petersen Graph as constructed in this class:
{{{
 sage: petersen_database = graphs.PetersenGraph()
 sage: petersen_database.show()
}}}
attachment:petersen_pos.png
Petersen Graph plotted using the spring layout algorithm:
{{{
 sage: petersen_spring = Graph({0:[1,4,5], 1:[0,2,6], 2:[1,3,7], 3:[2,4,8], 4:[0,3,9],\
                    5:[0,7,8], 6:[1,8,9], 7:[2,5,9], 8:[3,5,6], 9:[4,6,7]})
 sage: petersen_spring.show()
}}}
attachment:petersen_spring.png

== Graph Families ==

=== Complete Graphs ===

Info
 * Returns a complete graph on n nodes.
 * A Complete Graph is a graph in which all nodes are connected to all other nodes.
 * This constructor is dependant on vertices numbered 0 through n-1 in NetworkX complete_graph()
        
Plotting
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each complete graph will be displayed with the first (0) node at the top, with the rest following in a counterclockwise manner.
 * In the complete graph, there is a big difference visually in using the spring-layout algorithm vs. the position dictionary used in this constructor.  The position dictionary flattens the graph, making it clear which nodes an edge is connected to.  But the complete graph offers a good example of how the spring-layout works.  The edges push outward (everything is connected), causing the graph to appear as a 3-dimensional pointy ball.  (See examples below).
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

Code
{{{
 import networkx as NX
 pos_dict = {}
 for i in range(n):
     x = float(functions.cos((pi/2) + ((2*pi)/n)*i))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*i))
     pos_dict[i] = [x,y]
 G = NX.complete_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Complete graph on %d vertices"%n)

---- /!\ '''Edit conflict - your version:''' ----
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
Petersen Graph as constructed in this class:
{{{
 sage: petersen_database = graphs.PetersenGraph()
 sage: petersen_database.show()
}}}
attachment:petersen_pos.png
Petersen Graph plotted using the spring layout algorithm:
{{{
 sage: petersen_spring = Graph({0:[1,4,5], 1:[0,2,6], 2:[1,3,7], 3:[2,4,8], 4:[0,3,9],\
                    5:[0,7,8], 6:[1,8,9], 7:[2,5,9], 8:[3,5,6], 9:[4,6,7]})
 sage: petersen_spring.show()
}}}
attachment:petersen_spring.png

== Graph Families ==

=== Complete Graphs ===

Info
 * Returns a complete graph on n nodes.
 * A Complete Graph is a graph in which all nodes are connected to all other nodes.
 * This constructor is dependant on vertices numbered 0 through n-1 in NetworkX complete_graph()
        
Plotting
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each complete graph will be displayed with the first (0) node at the top, with the rest following in a counterclockwise manner.
 * In the complete graph, there is a big difference visually in using the spring-layout algorithm vs. the position dictionary used in this constructor.  The position dictionary flattens the graph, making it clear which nodes an edge is connected to.  But the complete graph offers a good example of how the spring-layout works.  The edges push outward (everything is connected), causing the graph to appear as a 3-dimensional pointy ball.  (See examples below).
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

Code
{{{
 import networkx as NX
 pos_dict = {}
 for i in range(n):
     x = float(functions.cos((pi/2) + ((2*pi)/n)*i))
     y = float(functions.sin((pi/2) + ((2*pi)/n)*i))
     pos_dict[i] = [x,y]
 G = NX.complete_graph(n)
 return graph.Graph(G, pos=pos_dict, name="Complete graph on %d vertices"%n)

---- /!\ '''End of edit conflict''' ----
}}}

==== Examples ====

---- /!\ '''Edit conflict - other version:''' ----

The following examples require NetworkX (to use default):
{{{
 sage: import networkx as NX
}}}

Compare the constructor speeds.
{{{
 time n = NX.complete_graph(1559); spring1559 = Graph(n)
}}}
 CPU time: 6.85 s,  Wall time: 9.71 s[[BR]](Time results vary.)
{{{
 time posdict1559 = graphs.CompleteGraph(1559)
}}}
 CPU time: 9.67 s,  Wall time: 11.75 s[[BR]](Time results vary.)


Compare the plotting speeds.
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


View many Complete graphs as a SAGE Graphics Array.
With the position dictionary filled:

---- /!\ '''Edit conflict - your version:''' ----

The following examples require NetworkX (to use default):
{{{
 sage: import networkx as NX
}}}

Compare the constructor speeds.
{{{
 time n = NX.complete_graph(1559); spring1559 = Graph(n)
}}}
 CPU time: 6.85 s,  Wall time: 9.71 s[[BR]](Time results vary.)
{{{
 time posdict1559 = graphs.CompleteGraph(1559)
}}}
 CPU time: 9.67 s,  Wall time: 11.75 s[[BR]](Time results vary.)


Compare the plotting speeds.
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


View many Complete graphs as a SAGE Graphics Array.
With the position dictionary filled:

---- /!\ '''End of edit conflict''' ----
{{{
 sage: g = []
 sage: j = []

---- /!\ '''Edit conflict - other version:''' ----
 sage: for i in range(9):
 ...    k = graphs.CompleteGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(3):
 ...    n = []
 ...    for m in range(3):
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''Edit conflict - your version:''' ----
 sage: for i in range(9):
 ...    k = graphs.CompleteGraph(i+3)
 ...    g.append(k)
 ...
 sage: for i in range(3):
 ...    n = []
 ...    for m in range(3):
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))

---- /!\ '''End of edit conflict''' ----
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}

---- /!\ '''Edit conflict - other version:''' ----
attachment:complete_array_pd.png

With the spring-layout algorithm:
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
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:complete_array_spr.png



=== Complete Bipartite Graphs ===

Info
 * Returns a Complete Bipartite Graph sized n1+n2, with each of the nodes [0,(n1-1)] connected to each of the nodes [n1,(n2-1)] and vice versa.
 * A Complete Bipartite Graph is a graph with its vertices partitioned into two groups, V1 and V2.  Each v in V1 is connected to every v in V2, and vice versa.  

Plotting
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each complete bipartite graph will be displayed with the first n1 nodes on the top row (at y=1) from left to right.  The remaining n2 nodes appear at y=0, also from left to right.  The shorter row (partition with fewer nodes) is stretched to the same length as the longer row, unless the shorter row has 1 node; in which case it is centered.  The x values in the plot are in domain [0,max{n1,n2}].       
 * In the Complete Bipartite graph, there is a visual difference in using the spring-layout  algorithm vs. the position dictionary used in this constructor.  The position dictionary flattens the graph and separates the partitioned nodes, making it clear which nodes an edge is connected to.  The Complete Bipartite graph plotted with the spring-layout algorithm tends to center the nodes in n1 (see spring_med in examples below), thus overlapping its nodes and edges, making it typically hard to decipher.
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

Code
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

The following examples require NetworkX (to use default):
{{{
 sage: import networkx as NX
}}}

Compare the constructor speeds.
{{{
 time n = NX.complete_bipartite_graph(389,157); spring_big = Graph(n)
}}}
 CPU time: 9.28 s,  Wall time: 11.02 s[[BR]](Time results will vary.)
{{{
 time posdict_big = graphs.CompleteBipartiteGraph(389,157)
}}}
 CPU time: 10.72 s,  Wall time: 13.84 s[[BR]](Time results will vary.)

Compare the plotting speeds.
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


View many Complete Bipartite graphs as a SAGE Graphics Array.
With the position dictionary filled:
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
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:compbip_array_pd.png

With the spring-layout algorithm:
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
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:compbip_array.spr.png




== Random Graph Generators ==

=== RandomGNP ===

Info
 * Returns a Random graph on n nodes.  Each edge is inserted independently with probability p.
 * If p is small, use RandomGNPFast.  See NetworkX documentation.     
        C.f.
        P. Erdos and A. Renyi, On Random Graphs, Publ. Math. 6, 290 (1959).
        E. N. Gilbert, Random Graphs, Ann. Math. Stat., 30, 1141 (1959).
        
Plotting
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.

Code
{{{
 import networkx as NX
 G = NX.gnp_random_graph(n, p, seed)
 return graph.Graph(G)
}}}
==== Examples ====
Compare the speed of RandomGNP and RandomGNPFast:
Sparse Graphs
{{{
 time regular_sparse = graphs.RandomGNP(1559,.22)
}}}
 CPU time: 31.79 s,  Wall time: 38.78 s[[BR]](Time results will vary.)
{{{
 time fast_sparse =  graphs.RandomGNPFast(1559,.22)
}}}
 CPU time: 21.72 s,  Wall time: 26.44 s[[BR]](Time results will vary.)
Dense Graphs
{{{ 
 time regular_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 38.75 s,  Wall time: 47.65 s[[BR]](Time results will vary.)
{{{
 time fast_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 39.15 s,  Wall time: 48.22 s[[BR]](Time results will vary.)

Plot a random graph on 12 nodes with p = .71
{{{
 sage: gnp = graphs.RandomGNP(12,.71)
 sage: gnp.show()
}}}
attachment:rand_reg.png

View many random graphs using a SAGE Graphics Array
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
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:rand_array_reg.png

=== RandomGNPFast ===
Info
 * Returns a Random graph on n nodes.  Each edge is inserted independently with probability p.
 * Use for small p (sparse graphs).  See NetworkX documentation.
        
Plotting
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.
        
Code
{{{
 import networkx as NX
 G = NX.fast_gnp_random_graph(n, p, seed)
 return graph.Graph(G)
}}}

==== Examples ====
Compare the speed of RandomGNP and RandomGNPFast:
Sparse Graphs
{{{
 time regular_sparse = graphs.RandomGNP(1559,.22)
}}}
 CPU time: 31.79 s,  Wall time: 38.78 s[[BR]](Time results will vary.)
{{{
 time fast_sparse =  graphs.RandomGNPFast(1559,.22)
}}}
 CPU time: 21.72 s,  Wall time: 26.44 s[[BR]](Time results will vary.)

Dense Graphs
{{{ 
 time regular_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 38.75 s,  Wall time: 47.65 s[[BR]](Time results will vary.)
{{{
 time fast_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 39.15 s,  Wall time: 48.22 s[[BR]](Time results will vary.)

Plot a random graph on 12 nodes with p = .71
{{{
 sage: fast = graphs.RandomGNPFast(12,.71)
 sage: fast.show()
}}}
attachment:rand_fast.png

View many random graphs using a SAGE Graphics Array
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
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:rand_array_fast.png

---- /!\ '''Edit conflict - your version:''' ----
attachment:complete_array_pd.png

With the spring-layout algorithm:
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
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:complete_array_spr.png



=== Complete Bipartite Graphs ===

Info
 * Returns a Complete Bipartite Graph sized n1+n2, with each of the nodes [0,(n1-1)] connected to each of the nodes [n1,(n2-1)] and vice versa.
 * A Complete Bipartite Graph is a graph with its vertices partitioned into two groups, V1 and V2.  Each v in V1 is connected to every v in V2, and vice versa.  

Plotting
 * Upon construction, the position dictionary is filled to override the spring-layout algorithm.  By convention, each complete bipartite graph will be displayed with the first n1 nodes on the top row (at y=1) from left to right.  The remaining n2 nodes appear at y=0, also from left to right.  The shorter row (partition with fewer nodes) is stretched to the same length as the longer row, unless the shorter row has 1 node; in which case it is centered.  The x values in the plot are in domain [0,max{n1,n2}].       
 * In the Complete Bipartite graph, there is a visual difference in using the spring-layout  algorithm vs. the position dictionary used in this constructor.  The position dictionary flattens the graph and separates the partitioned nodes, making it clear which nodes an edge is connected to.  The Complete Bipartite graph plotted with the spring-layout algorithm tends to center the nodes in n1 (see spring_med in examples below), thus overlapping its nodes and edges, making it typically hard to decipher.
 * Filling the position dictionary in advance adds O(n) to the constructor.  Feel free to race the constructors below in the examples section.  The much larger difference is the time added by the spring-layout algorithm when plotting.  (Also shown in the example below).  The spring model is typically described as O(n^3), as appears to be the case in the NetworkX source code.

Code
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

The following examples require NetworkX (to use default):
{{{
 sage: import networkx as NX
}}}

Compare the constructor speeds.
{{{
 time n = NX.complete_bipartite_graph(389,157); spring_big = Graph(n)
}}}
 CPU time: 9.28 s,  Wall time: 11.02 s[[BR]](Time results will vary.)
{{{
 time posdict_big = graphs.CompleteBipartiteGraph(389,157)
}}}
 CPU time: 10.72 s,  Wall time: 13.84 s[[BR]](Time results will vary.)

Compare the plotting speeds.
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


View many Complete Bipartite graphs as a SAGE Graphics Array.
With the position dictionary filled:
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
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:compbip_array_pd.png

With the spring-layout algorithm:
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
 ...        n.append(g[3*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:compbip_array.spr.png




== Random Graph Generators ==

=== RandomGNP ===

Info
 * Returns a Random graph on n nodes.  Each edge is inserted independently with probability p.
 * If p is small, use RandomGNPFast.  See NetworkX documentation.     
        C.f.
        P. Erdos and A. Renyi, On Random Graphs, Publ. Math. 6, 290 (1959).
        E. N. Gilbert, Random Graphs, Ann. Math. Stat., 30, 1141 (1959).
        
Plotting
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.

Code
{{{
 import networkx as NX
 G = NX.gnp_random_graph(n, p, seed)
 return graph.Graph(G)
}}}
==== Examples ====
Compare the speed of RandomGNP and RandomGNPFast:
Sparse Graphs
{{{
 time regular_sparse = graphs.RandomGNP(1559,.22)
}}}
 CPU time: 31.79 s,  Wall time: 38.78 s[[BR]](Time results will vary.)
{{{
 time fast_sparse =  graphs.RandomGNPFast(1559,.22)
}}}
 CPU time: 21.72 s,  Wall time: 26.44 s[[BR]](Time results will vary.)
Dense Graphs
{{{ 
 time regular_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 38.75 s,  Wall time: 47.65 s[[BR]](Time results will vary.)
{{{
 time fast_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 39.15 s,  Wall time: 48.22 s[[BR]](Time results will vary.)

Plot a random graph on 12 nodes with p = .71
{{{
 sage: gnp = graphs.RandomGNP(12,.71)
 sage: gnp.show()
}}}
attachment:rand_reg.png

View many random graphs using a SAGE Graphics Array
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
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:rand_array_reg.png

=== RandomGNPFast ===
Info
 * Returns a Random graph on n nodes.  Each edge is inserted independently with probability p.
 * Use for small p (sparse graphs).  See NetworkX documentation.
        
Plotting
 * When plotting, this graph will use the default spring-layout algorithm, unless a position dictionary is specified.
        
Code
{{{
 import networkx as NX
 G = NX.fast_gnp_random_graph(n, p, seed)
 return graph.Graph(G)
}}}

==== Examples ====
Compare the speed of RandomGNP and RandomGNPFast:
Sparse Graphs
{{{
 time regular_sparse = graphs.RandomGNP(1559,.22)
}}}
 CPU time: 31.79 s,  Wall time: 38.78 s[[BR]](Time results will vary.)
{{{
 time fast_sparse =  graphs.RandomGNPFast(1559,.22)
}}}
 CPU time: 21.72 s,  Wall time: 26.44 s[[BR]](Time results will vary.)

Dense Graphs
{{{ 
 time regular_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 38.75 s,  Wall time: 47.65 s[[BR]](Time results will vary.)
{{{
 time fast_dense = graphs.RandomGNP(1559,.88)
}}}
 CPU time: 39.15 s,  Wall time: 48.22 s[[BR]](Time results will vary.)

Plot a random graph on 12 nodes with p = .71
{{{
 sage: fast = graphs.RandomGNPFast(12,.71)
 sage: fast.show()
}}}
attachment:rand_fast.png

View many random graphs using a SAGE Graphics Array
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
 ...        n.append(g[4*i + m].plot(node_size=50, vertex_labels=False))
 ...    j.append(n)
 ...
 sage: G = sage.plot.plot.GraphicsArray(j)
 sage: G.show()
}}}
attachment:rand_array_fast.png

---- /!\ '''End of edit conflict''' ----
