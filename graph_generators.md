Emily Kirkman is working on this project.  [http://sage.math.washington.edu:9001/graph Back to main wiki.]

The goal of the Graph Generators Class is to implement constructors for many common graphs, as well as thorough docstrings that can be used for reference.  The graph generators will grow as the Graph Theory Project does.  So please check back for additions and feel free to leave requests in the suggestions section.

We currently have 30 constructors of named graphs and basic structures.  Most of these graphs are constructed with a preset dictionary of x-y coordinates of each node.  This is advantageous for both style and time.  (The default graph plotting in SAGE uses the spring-layout algorithm).  SAGE graphs all have an associated graphics object, and examples of plotting options are shown on the graphs below.

As we implement algorithms into the Graph Theory Package, the constructors of known graphs would set their properties upon instantiation as well.  For example, if someone created a very large complete bipartite graph and then asked if it is a bipartite graph (not currently implemented), then instead of running through an algorithm to check it, we could return a value set at instantiation.  Further, this will improve the reference use of the docstrings as we would list the properties of each named graph.

Due to the volume of graphs now in the generators class, this wiki page is now intended to give status updates and serve as a gallery of graphs currently implemented.  To see information on a specific graph, run SAGE or the SAGE [http://sage.math.washington.edu:8100 notebook].  For a list of graph constructors, type "graphs." and hit tab.  For docstrings, type the graph name and one question mark (i.e.:  "graphs.!CubeGraph?") then shift + enter.  For source code, do likewise with two question marks.

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
{{{
sage: flower_snark = graphs.FlowerSnark()
sage: flower_snark.set_boundary([15,16,17,18,19])
sage: flower_snark.show(figsize=[4,4], graph_border=True)
}}}
attachment:flower.png

=== Frucht ===
{{{
sage: frucht = graphs.FruchtGraph()
sage: frucht.show(figsize=[4,4], graph_border=True)
}}}
attachment:frucht.png

=== Heawood ===
{{{
sage: heawood = graphs.HeawoodGraph()
sage: heawood.show(figsize=[4,4], graph_border=True)
}}}
attachment:heawood.png


=== Möbius Kantor ===
{{{
sage: moebius_kantor = graphs.MoebiusKantorGraph()
sage: moebius_kantor.show(figsize=[4,4], graph_border=True)
}}}
attachment:moebiuskantor.png

=== Petersen ===
{{{
sage: petersen = graphs.PetersenGraph()
sage: petersen.show(figsize=[4,4], graph_border=True)
}}}
attachment:petersen.png

=== Thomsen ===
{{{
sage: thomsen = graphs.ThomsenGraph()
sage: thomsen.show(figsize=[4,4], graph_border=True)
}}}
attachment:thomsen.png

== Graph Families ==

=== Complete Bipartite Graphs ===
{{{
sage: comp_bip_list = []
sage: for i in range (2):
... for j in range (4):
...  comp_bip_list.append(graphs.CompleteBipartiteGraph(i+3,j+1))
...
sage: graphs_list.show_graphs(comp_bip_list)
}}}
attachment:compbip.png

=== Complete Graphs ===
{{{
sage: comp_list = []
sage: for i in range(13)[1:]:
... comp_list.append(graphs.CompleteGraph(i))
...
sage: graphs_list.show_graphs(comp_list)
}}}
attachment:complete.png

=== Cube Graphs ===
{{{
sage: cube_list = []
sage: for i in range(6)[2:]:
... cube_list.append(graphs.CubeGraph(i))
...
sage: graphs_list.show_graphs(cube_list)
}}}
attachment:cube.png

{{{
sage: bigger_cube = graphs.CubeGraph(8)
sage: bigger_cube.show(figsize=[8,8], node_size=20, vertex_labels=False, graph_border=True)
}}}
attachment:biggercube.png

== Basic Structures ==

=== Barbell Graph ===
{{{
sage: barbell_list = []
sage: for i in range (4):
... for j in range (2):
...  barbell_list.append(graphs.BarbellGraph(i+3, j+2))
...
sage: graphs_list.show_graphs(barbell_list)
}}}
attachment:barbell.png

=== Bull Graph ===
{{{
sage: bull = graphs.BullGraph()
sage: bull.show(figsize=[4,4], graph_border=True)
}}}
attachment:bull.png

=== Circular Ladder Graph ===
{{{
sage: circ_ladder = graphs.CircularLadderGraph(9)
sage: circ_ladder.show(figsize=[4,4], graph_border=True)
}}}
attachment:circladder.png


=== Claw Graph ===
{{{
sage: claw = graphs.ClawGraph()
sage: claw.show(figsize=[4,4], graph_border=True)
}}}
attachment:claw.png

=== Cycle Graphs ===
{{{
sage: cycle = graphs.CycleGraph(17)
sage: cycle.show(figsize=[4,4], graph_border=True)
}}}
attachment:cycle.png

=== Diamond Graph ===
{{{
sage: diamond = graphs.DiamondGraph()
sage: diamond.show(figsize=[4,4], graph_border=True)
}}}
attachment:diamond.png

=== Dodecahedral Graph ===
{{{
sage: dodecahedral = graphs.DodecahedralGraph()
sage: dodecahedral.show(figsize=[4,4], vertex_labels=False, node_size=50, graph_border=True)
}}}
attachment:dodecahedral.png


=== Empty Graph ===
{{{
sage: empty = graphs.EmptyGraph()
sage: empty.show(figsize=[1,1], graph_border=True)
}}}
attachment:empty.png

=== Grid 2d Graph ===
{{{
sage: grid = graphs.Grid2dGraph(3,5)
sage: grid.show(figsize=[5,3])
}}}
attachment:grid.png

=== House Graph ===
{{{
sage: house = graphs.HouseGraph()
sage: house.show(figsize=[4,4], graph_border=True)
}}}
attachment:house.png

=== House X Graph ===
{{{
sage: houseX = graphs.HouseXGraph()
sage: houseX.show(figsize=[4,4], graph_border=True)
}}}
attachment:housex.png

=== Krackhardt Kite Graph ===
{{{
sage: krackhardt = graphs.KrackhardtKiteGraph()
sage: krackhardt.show(figsize=[4,4], graph_border=True)
}}}
attachment:krack.png

=== Ladder Graph ===
{{{
sage: ladder = graphs.LadderGraph(5)
sage: ladder.show(figsize=[4,4], graph_border=True)
}}}
attachment:ladder.png

=== Lollipop Graph ===
{{{
sage: lollipop_list = []
sage: for i in range (4):
... for j in range (2):
...  lollipop_list.append(graphs.LollipopGraph(i+3, j+2))
...
sage: graphs_list.show_graphs(lollipop_list)
}}}
attachment:lollipop.png

=== Octahedral Graph ===
{{{
sage: octahedral = graphs.OctahedralGraph()
sage: octahedral.show(figsize=[4,4], vertex_labels=False, node_size=50, graph_border=True)
}}}
attachment:octahedral.png


=== Path Graph ===
{{{
sage: path_line = graphs.PathGraph(5)
sage: path_circle = graphs.PathGraph(15)
sage: path_maze = graphs.PathGraph(45)
sage: path_list = [path_line, path_circle, path_maze]
sage: graphs_list.show_graphs(path_list)
}}}
attachment:path.png

=== Star Graph ===
{{{
sage: star_list = []
sage: for i in range (12)[4:]:
... star_list.append(graphs.StarGraph(i))
...
sage: graphs_list.show_graphs(star_list)
}}}
attachment:star.png

=== Tetrahedral Graph ===
{{{
sage: tetrahedral = graphs.TetrahedralGraph()
sage: tetrahedral.show(figsize=[4,4], graph_border=True)
}}}
attachment:tetrahedral.png

=== Wheel Graph ===
{{{
sage: wheel_list = []
sage: for i in range (12)[4:]:
... wheel_list.append(graphs.WheelGraph(i))
...
sage: graphs_list.show_graphs(wheel_list)
}}}
attachment:wheel.png

== Random Generators ==

=== Random GNP ===
Use for dense graphs:
{{{
time
sage: (graphs.RandomGNP(16,.77)).show(figsize=[4,4], graph_border=True)
}}}
My results:
CPU time: 0.74 s,  Wall time: 0.73 s
attachment:random.png

=== Random GNP Fast ===
Use for sparse graphs:
{{{
time
sage: (graphs.RandomGNPFast(16,.19)).show(figsize=[4,4], graph_border=True)
}}}
My results:
CPU time: 0.63 s,  Wall time: 0.62 s
attachment:randomfast.png
