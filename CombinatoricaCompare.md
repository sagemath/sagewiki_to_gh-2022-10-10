

# Combinatorica Comparison

This page compares the functionality in SAGE 2.8.10 (November 2007) with that of the Combinatorica package in Mathematica.  We compare to Mathematica version 6 and  Combinatorica version 2.1.0.  Feel free to update this page. 


## Sage functions

This table lists the functions available in SAGE and the equivalent Combinatorica functions.  It also has some notes about the implementation and suggestions on how to make SAGE better. 
**SAGE Class   **  | **      SAGE function    **  | **      Combinatorica   **  | **      Combinatorica Notes     **  | **      SAGE notes      ** 
      GenericGraph  |   |   |   |  
  |       add_vertex  |       AddVertex  |       Can specify coordinates for new vertices  |  
  |       add_vertices  |       AddVertices  |       Can specify coordinates and graphical info for new vertices  |  
  |       am  |       ToAdjacencyMatrix  |       Can return edge weight matrix and matrix counting loops/multiple edges as well  |  
  | antisymmetric  | AntiSymmetricQ  |   |  
  |       associate  |   |   |       Can we add this functionality to the add_vertex functions? 
  |       breadth_first_search  |       BreadthFirstTraversal  |       Returns list of vertices, edges, the tree, or just the levels of traversal  |  
  |       cartesian_product  |       GraphProduct  |   |       How are vertex properties transferred?  How are loops/multiple edges handled? 
  |       center  |       GraphCenter  |   |  
  |       clear  |   |   |       Is this more efficient than just setting the graph to the empty graph? 
  |       clique_number  |   |   |  
  |       cliques  |       MaximumClique  |   |       Can find a k-clique, not just a maximum clique 
  |       cliques_containing_vertex  |   |   |  
  |       cliques_get_clique_bipartite  |   |   |  
  |       cliques_get_max_clique_graph  |   |   |  
  |       cliques_vertex_clique_number  |   |   |  
  |       cliques_number_of  |   |   |  
  |       cluster_transitivity  |       TransitiveQ  |       I think these two functions are/can be made equivalent  |  
  |       cluster_triangles  |   |   |  
  |       clustering_average  |   |   |  
  |       clustering_coeff  |   |   |  
  |       complement  |       GraphComplement  |   |       Pick a convention to deal with loops and make an option to switch conventions.  We can also make an option for a max number of edges to set a convention for multiple edges 
  |       cores  |   |   |  
  |       delete_vertex  |       DeleteVertex  |   |  
  |       delete_vertices  |       DeleteVertices  |   |  
  |       density  |   |   |  
  |       depth_first_search  |       DepthFirstTraversal  |       Returns list of vertices, edges, or the traversal tree  |  
  |       diameter  |       Diameter  |   |       max( {} ) isn't right in the latex version 
  |       disjoint_union  |       GraphUnion  |       not restricted to two graphs, and can easily make copies of the same graph  |  
  |       disjunctive_product  |   |   |  
  |       distance  |       Distances  |       Returns list of distances to every other vertex  |  
  |       eccentricity  |       Eccentricity  |   |       Much more complete 
  |       get_boundary  |   |   | The boundary functions let you make a set of vertices special.  You can then get or set the boundary of a graph. 
  |       has_vertex  |   |   |  
  | is_clique  | CliqueQ and CompleteQ  |   | is_clique(directed_clique=True) is equivalent to CompleteQ 
  | is_independent_set  | IndependetSetQ and EmptyQ  |   |  
  |       lexicographic_product  |   |   |  
  |   |   |   |  
  | line_graph  | <a href="/LineGraph">LineGraph</a>  |   |  
  |       loop_vertices  |   |   |  
  |   |   |   |  
  |       loops  |       SelfLoopsQ  |   |  
  |       name  |   |   |  
  |       neighbors  |       Neighborhood  |       can return neighbors distance k or less, not just immediate neighbors  |  
  |       networkx_graph  |   |   |  
  |       networkx_info  |   |   |  
  |       obj  |   |   |  
  |       order  |       V  |   |  
  |       periphery  |   |   |  
  |       plot  |       ShowGraph  |   |       Plotting differences should be looked at more carefully. 
  |       radius  |       Radius  |   |  
  |       random_subgraph  |   |   |  
  |       relabel  |       PermuteSubgraph  |       can relabel a subgraph, not just entire graph  |  
  |       set_boundary  |   |   |  
  |       shortest_path  |       ShortestPath  |       Also uses BellmanFord algorithm?  Automatically switches between this and Dijkstra depending on whether the graph has negative weights and the density of the graph  |  
  |       shortest_path_all_pairs  |   |   |  
  |       shortest_path_length  |   |   |       what is the difference between this and distance? 
  |       shortest_path_lengths  |   |   |  
  |       shortest_paths  |   |   |  
  |       show  |       ShowGraph  |   |       what is the difference between this and the plot function? 
  |       size  |       M  |   |  
  |       strong_product  |   |   |  
  |       tensor_product  |   |   |  
  |  to_simple  |  MakeSimple  |   |  
  | transitive_closure  | TransitiveClosure  |   |  
  |       union  |   |   |       What does “common vertices will be renamed” mean in the docs? 
  |       vertex_boundary  |   |   |  
  |       vertex_iterator  |   |   |  
  |       vertices  |       Range[V[#]]&  |       Since vertices are always numerically numbered, the range gives the list of vertices  |  
  |       <ins></ins><ins>cmp</ins>  |       IdenticalQ  |       IdenticalQ isn't quite the same, I don't think it cares about loops/multiple edge settings, just the actual edge list.  |  
  |       <ins>contains</ins>  |   |   |       extend this to handle edges? 
  |       _matrix_  |   |   | This is the adjacency matrix. 
  |   |   |   |  
      Graph  |   |   |   |  
  |       add_cycle  |   |   |  
  |       add_edge  |       AddEdge  |   |  
  |       add_edges  |       AddEdges  |   |  
  |       add_path  |   |   |  
  |       adjacency_matrix  |       ToAdjacencyMatrix  |   |  
  |       all_paths  |   |   |  
  |       automorphism_group  |       Automorphisms  |   |  
  | bipartite_color, bipartite_sets  | <a href="/TwoColor">TwoColor</a>  |   |  
  |       canonical_label  |   |   |  
  |       centrality_betweenness  |   |   |  
  |       centrality_closeness  |   |   |  
  |       centrality_degree  |   |   |  
  |       connected_component_containing_vertex  |   |   |  
  |       connected_components  |       ConnectedComponents  |   |  
  |       connected_components_number  |   |   |  
  |       connected_components_subgraphs  |   |   |  
  |       copy  |   |   |  
  |       degree  |       DegreeSequence, Degrees  |   |       can return only some degrees. 
  |       degree_histogram  |   |   |  
  |       degree_iterator  |   |   |  
  |       delete_edge  |       DeleteEdge  |       nondestructive; “All” Option to delete all multiple edges  |  
  |       delete_edges  |       DeleteEdges  |       nondestructive; “All” Option to delete all multiple edges  |  
  |       delete_multiedge  |       DeleteEdge  |   |       can we make this an option in delete_edge and delete_edges? 
  |       edge_boundary  |   |   |  
  |       edge_iterator  |   |   |  
  |       edge_label  |   |   |  
  |       edge_labels  |       GetEdgeLabels  |   |  
  |       edges  |       Edges  |   |  
  |       edges_incident  |   |   |  
  | eulerian_circuit | <a href="/EulerianCycle">EulerianCycle</a> |   |  
  |       genus  |   |   |  
  |       graph6_string  |   |   |       extend this to handle bigger graphs 
  |       has_edge  |   |   |  
  |       incidence_matrix  |       IncidenceMatrix  |   |       example shows a 0,1,-1 matrix.  Should this be 0,1 matrix? 
  |       interior_paths  |   |   |  
  | is_bipartite  | BipartiteQ  |   |  
  |       is_circular_planar  |   |   |       write an outer_planar function using this. 
  |       is_connected  |       ConnectedQ  |   |  
  |       is_directed  |       Not[UndirectedQ[#]]&  |   |  
  | is_eulerian | EulerianQ |   |  
  |       is_isomorphic  |       IsomorphicQ  |   |       examine the differences between Combinatorica and SAGE later 
  |       kirchhoff_matrix  |   |   |  
  |       loop_edges  |   |   |  
  | min_spanning_tree | <a href="/MinimumSpanningTree">MinimumSpanningTree</a> | Implements Kruskal's algorithm | has three algorithms implemented (Kruskal's and two variants of Prim's)
  |       multiple_edges  |       MultipleEdgesQ  |   |  
  |       neighbor_iterator  |   |   |  
  |       number_of_loops  |   |   |  
  |       plot3d  |   |   |  
  |       remove_loops  |       RemoveSelfLoops  |   |       can remove loops from selected vertices 
  |       remove_multiple_edges  |       RemoveMultipleEdges  |   |       extend to just remove multiple edges between sets of vertices 
  |       set_edge_label  |       SetEdgeLabels  |   |       How does this handle multiedges? 
  |       show3d  |   |   |  
  |       sparse6_string  |   |   |       extend this to handle bigger graphs 
  |       spectrum  |       Spectrum  |   |  
  |       subgraph  |       InduceSubgraph  |   |  
  |       to_directed  |       MakeDirected  |       “All” option to transfer edge attributes to both directed edges  |  
  |       to_undirected  |       MakeUndirected  |   |  
  |       weighted_adjacency_matrix  |   |   |       make an option in “adjacency_matrix” 
  |       write_to_eps  |   |   |  
  |   |   |   |  
      DiGraph  |   |   |   |  
  |       add_edge  |       AddEdge  |   |  
  |       add_edges  |       AddEdges  |   |  
  |       adjacency_matrix  |       ToAdjacencyMatrix  |   |  
  |       edge_boundary  |   |   |  
  |       edge_iterator  |   |   |  
  |       edge_label  |   |   |  
  |       edge_labels  |       GetEdgeLabels  |   |  
  |       edges  |       Edges  |   |  
  |       automorphism_group  |       Automorphisms  |   |  
  |       canonical_label  |   |   |  
  |       connected_component_containing_vertex  |   |   |  
  |       connected_components  |       ConnectedComponents  |   |  
  |       connected_components_number  |   |   |  
  |       connected_components_subgraphs  |   |   |  
  |       copy  |   |   |  
  |       degree  |   |   |  
  |       degree_iterator  |   |   |  
  |       delete_edge  |       DeleteEdge  |       nondestructive; “All” Option to delete all multiple edges  |  
  |       delete_edges  |       DeleteEdges  |       nondestructive; “All” Option to delete all multiple edges  |  
  |       delete_multiedge  |       DeleteEdge  |   |       can we make this an option in delete_edge and delete_edges? 
  |       dig6_string  |   |   |  
  |       has_edge  |   |   |  
  |       in_degree  |       InDegree  |   |  
  |       in_degree_iterator  |   |   |  
  |       incidence_matrix  |       IncidenceMatrix  |       Convention for sign is opposite (1 means outgoing in Combinatorica)  |  
  |       incoming_edge_iterator  |   |   |  
  |       incoming_edges  |   |   |  
  |       is_connected  |       ConnectedQ  |       Options for strong or weakly connected  |  
  |       is_directed  |   |   |  
  |       is_directed_acyclic  |       DirectedQ and AcyclicQ  |       Can do acyclic test for undirected graphs too  |  
  | is_eulerian | EulerianQ |   |  
  |       is_isomorphic  |       IsomorphicQ  |   |  
  |       loop_edges  |   |   |  
  |       multiple_edges  |       MultipleEdgesQ  |   |  
  |       neighbor_iterator  |   |   |       make option for “out” edges or “in” edges 
  |       number_of_loops  |   |   |  
  |       out_degree  |       OutDegree  |   |  
  |       out_degree_iterator  |   |   |  
  |       outgoing_edge_iterator  |   |   |  
  |       outgoing_edges  |   |   |  
  |       plot3d  |   |   |  
  |       predecessor_iterator  |   |   |       make this an option for neighbor_iterator and neighbors 
  |       predecessors  |   |   |       make this an option for neighbor_iterator and neighbors 
  |       remove_loops  |       RemoveSelfLoops  |   |  
  |       remove_multiple_edges  |       RemoveMultipleEdges  |   |  
  |       reverse  |       ReverseEdges  |   |  
  |       set_edge_label  |       SetEdgeLabels  |   |  
  |       show3d  |   |   |  
  |       subgraph  |       InduceSubgraph  |   |  
  |       successor_iterator  |   |   |       make this an option for neighbor_iterator and neighbors 
  |       successors  |   |   |       make this an option for neighbor_iterator and neighbors 
  |       to_directed  |       MakeDirected  |   |  
  |       to_undirected  |       MakeUndirected  |   |  
  |       topological_sort  |       TopologicalSort  |   |  
  |       topological_sort_generator  |   |   |  
  |   |   |   |  
      graphs  |   |   |   |  
  |       BalancedTree  |       CompleteKaryTree  |       can specify the total number of vertices  |       can specify the height 
  |       BarbellGraph  |   |   |  
  |       BullGraph  |   |   |  
  |       ChvatalGraph  |       ChvatalGraph  |   |       put “smallest triangle-free, 4-regular, 4-chromatic graph.” in docs? 
  |       CircularLadderGraph  |   |   |  
  | <a href="/CirculantGraph">CirculantGraph</a>  | <a href="/CirculantGraph">CirculantGraph</a>  |   |  
  |       ClawGraph  |   |   |  
  |       CompleteBipartiteGraph  |       CompleteKPartiteGraph  |       can create complete multipartite graph  |  
  |       CompleteGraph  |       CompleteGraph  |   |  
  |       CubeGraph  |       Hypercube  |   |  
  |       CycleGraph  |       Cycle  |   |  
  |       DegreeSequence  |       RealizeDegreeSequence  |   |       should “random” be “semirandom”, like in the Combinatorica documentation? 
  |       DegreeSequenceConfigurationModel  |   |   |       Can this be an option in DegreeSequence? 
  |       DegreeSequenceExpected  |   |   |       Can this be an option in DegreeSequence? 
  |       DegreeSequenceTree  |   |   |       Can this be an option in DegreeSequence? 
  |       DesarguesGraph  |   |   |  
  |       DiamondGraph  |   |   |  
  |       DodecahedralGraph  |       DodecahedralGraph  |   |  
  |       DorogovtsevGoltsevMendesGraph  |   |   |  
  |       EmptyGraph  |       EmptyGraph[0]  |       can give a number of vertices to include (empty means no edges)  |  
  |       FlowerSnark  |   |   |  
  |       FruchtGraph  |       FruchtGraph  |   |  
  |       Grid2dGraph  |       GridGraph  |   |  
  |       GridGraph  |       GridGraph  |       Only does up to 3 dimensions  |  
  |       HeawoodGraph  |       HeawoodGraph  |       smallest (6, 3)-cage  |  
  |       HexahedralGraph  |   |   |  
  |       HouseGraph  |   |   |  
  |       HouseXGraph  |   |   |  
  |       IcosahedralGraph  |       IcosahedralGraph  |   |  
  |       KrackhardtKiteGraph  |   |   |  
  |       LadderGraph  |   |   |  
  |       LCFGraph  |   |   |  
  |       LollipopGraph  |   |   |  
  |       MoebiusKantorGraph  |   |   |  
  |       OctahedralGraph  |       OctahedralGraph  |   |  
  |       PappusGraph  |   |   |  
  |       PathGraph  |       Path  |   |  
  |       PetersenGraph  |       PetersenGraph  |   |  
  |       RandomBarabasiAlbert  |   |   |  
  |       RandomDirectedGN  |   |   |  
  |       RandomDirectedGNC  |   |   |  
  |       RandomDirectedGNR  |   |   |  
  |       RandomGNM  |   |   |  
  |       RandomGNP  |       RandomGraph?  |   |  
  |       RandomHolmeKim  |   |   |  
  |       RandomLobster  |   |   |  
  |       RandomNewmanWattsStrogatz  |   |   |  
  |       RandomRegular  |   |   |  
  |       RandomShell  |   |   |  
  |       RandomTreePowerlaw  |   |   |  
  |       StarGraph  |       Star  |   |  
  |       TetrahedralGraph  |       TetrahedralGraph  |   |  
  |       ThomsenGraph  |   |   |  
  |       WheelGraph  |       Wheel  |   |  


## Combinatorica functions not in SAGE

These functions are implemented in Combinatorica, but not in SAGE.  Feel free to implement them! 

Note that this is outdated, and many of the features listed here are already implemented. 

* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/AlternatingPaths.html">AlternatingPaths</a>[g, start, ME] returns the alternating paths in graph g with respect to the matching ME, starting at the vertices in the list start. The paths are returned in the form of a forest containing trees rooted at vertices in start. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/AnimateGraph.html">AnimateGraph</a>[g, l] displays graph g with each element in the list l successively highlighted. Here l is a list containing vertices and edges of g. An optional flag, which takes on the values All and One, can be used to inform the function about whether objects highlighted earlier will continue to be highlighted or not. The default value of flag is All. All the options allowed by the function Highlight are permitted by <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/AnimateGraph.html">AnimateGraph</a>, as well. See the usage message of Highlight for more details. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ApproximateVertexCover.html">ApproximateVertexCover</a>[g] produces a vertex cover of graph g whose size is guaranteed to be within twice the optimal size. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ArticulationVertices.html">ArticulationVertices</a>[g] gives a list of all articulation vertices in graph g. These are vertices whose removal will disconnect the graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html">BellmanFord</a>[g, v] gives a shortest-path spanning tree and associated distances from vertex v of graph g. The shortest-path spanning tree is given by a list in which element i is the predecessor of vertex i in the shortest-path spanning tree. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html">BellmanFord</a> works correctly even when the edge weights are negative, provided there are no negative cycles. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BiconnectedComponents.html">BiconnectedComponents</a>[g] gives a list of the biconnected components of graph g. If g is directed, the underlying undirected graph is used. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BipartiteMatching.html">BipartiteMatching</a>[g] gives the list of edges associated with a maximum matching in bipartite graph g. If the graph is edge weighted, then the function returns a matching with maximum total weight. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BipartiteMatchingAndCover.html">BipartiteMatchingAndCover</a>[g] takes a bipartite graph g and returns a matching with maximum weight along with the dual vertex cover. If the graph is not weighted, it is assumed that all edge weights are 1. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BiconnectedQ.html">BiconnectedQ</a>[g] yields True if graph g is biconnected. If g is directed, the underlying undirected graph is used. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BooleanAlgebra.html">BooleanAlgebra</a>[n] gives a Hasse diagram for the Boolean algebra on n elements. The function takes two options: Type and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a>, with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a> is set to True, labels are produced for the vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BrelazColoring.html">BrelazColoring</a>[g] returns a vertex coloring in which vertices are greedily colored with the smallest available color in decreasing order of vertex degree. 
* Bridges[g] gives a list of the bridges of graph g, where each bridge is an edge whose removal disconnects the graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ButterflyGraph.html">ButterflyGraph</a>[n] returns the n-dimensional butterfly graph, a directed graph whose vertices are pairs (w, i), where w is a binary string of length n and i is an integer in the range 0 through n and whose edges go from vertex (w, i) to (w', i+1), if w' is identical to w in all bits with the possible exception of the (i+1)th bit. Here bits are counted left to right. An option <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a>, with default setting False, is allowed. When this option is set to True, vertices are labeled with strings (w, i). 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CageGraph.html">CageGraph</a>[k, r] gives a smallest k-regular graph of girth r for certain small values of k and r. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CageGraph.html">CageGraph</a>[r] gives <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CageGraph.html">CageGraph</a>[3, r]. For k = 3, r can be 3, 4, 5, 6, 7, 8, or 10. For k = 4 or 5, r can be 3, 4, 5, or 6. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ChangeEdges.html">ChangeEdges</a>[g, e] replaces the edges of graph g with the edges in e. e can have the form {{s1, t1}, {s2, t2}, ...} or the form { {{s1, t1}, gr1}, {{s2, t2}, gr2}, ...}, where {s1, t1}, {s2, t2}, ... are endpoints of edges and gr1, gr2, ... are graphics information associated with edges. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ChangeVertices.html">ChangeVertices</a>[g, v] replaces the vertices of graph g with the vertices in the given list v. v can have the form {{x1, y1}, {x2, y2}, ...} or the form { {{x1, y1}, gr1}, {{x2, y2}, gr2}, ...}, where {x1, y1}, {x2, y2}, ... are coordinates of points and gr1, gr2, ... are graphics information associated with vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ChromaticNumber.html">ChromaticNumber</a>[g] gives the chromatic number of the graph, which is the fewest number of colors necessary to color the graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ChromaticPolynomial.html">ChromaticPolynomial</a>[g, z] gives the chromatic polynomial P(z) of graph g, which counts the number of ways to color g with, at most, z colors. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CircularEmbedding.html">CircularEmbedding</a>[n] constructs a list of n points equally spaced on a circle. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CircularEmbedding.html">CircularEmbedding</a>[g] embeds the vertices of g equally spaced on a circle. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CodeToLabeledTree.html">CodeToLabeledTree</a>[l] constructs the unique labeled tree on n vertices from the Prufer code l, which consists of a list of n-2 integers between 1 and n. 
* Contract[g, {x, y}] gives the graph resulting from contracting the pair of vertices {x, y} of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CostOfPath.html">CostOfPath</a>[g, p] sums up the weights of the edges in graph g defined by the path p. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CoxeterGraph.html">CoxeterGraph</a> gives a non-Hamiltonian graph with a high degree of symmetry such that there is a graph automorphism taking any path of length 3 to any other. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CubeConnectedCycle.html">CubeConnectedCycle</a>[d] returns the graph obtained by replacing each vertex in a d-dimensional hypercube by a cycle of length d. Cube-connected cycles share many properties with hypercubes but have the additional desirable property that for d > 1 every vertex has degree 3. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DegreesOf2Neighborhood.html">DegreesOf2Neighborhood</a>[g, v] returns the sorted list of degrees of vertices of graph g within a distance of 2 from v. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DeleteCycle.html">DeleteCycle</a>[g, c] deletes a simple cycle c from graph g. c is specified as a sequence of vertices in which the first and last vertices are identical. g can be directed or undirected. If g does not contain c, it is returned unchanged; otherwise g is returned with c deleted." 
* Dijkstra[g, v] gives a shortest-path spanning tree and associated distances from vertex v of graph g. The shortest-path spanning tree is given by a list in which element i is the predecessor of vertex i in the shortest-path spanning tree. Dijkstra does not work correctly when the edge weights are negative; <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html">BellmanFord</a> should be used in this case. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DilateVertices.html">DilateVertices</a>[v, d] multiplies each coordinate of each vertex position in list v by d, thus dilating the embedding. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DilateVertices.html">DilateVertices</a>[g, d] dilates the embedding of graph g by the factor d. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DominationLattice.html">DominationLattice</a>[n] returns a Hasse diagram of the partially ordered set on integer partitions of n in which p < q if q dominates p. The function takes two options: Type and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a>, with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a> is set to True, labels are produced for the vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeChromaticNumber.html">EdgeChromaticNumber</a>[g] gives the fewest number of colors necessary to color each edge of graph g, so that no two edges incident on the same vertex have the same color. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeColoring.html">EdgeColoring</a>[g] uses Brelaz's heuristic to find a good, but not necessarily minimal, edge coloring of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeConnectivity.html">EdgeConnectivity</a>[g] gives the minimum number of edges whose deletion from graph g disconnects it. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeConnectivity.html">EdgeConnectivity</a>[g, Cut] gives a set of edges of minimum size whose deletion disconnects the graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeWeight.html">EdgeWeight</a> is an option that allows the user to associate weights with edges. 1 is the default weight. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeWeight.html">EdgeWeight</a> can be set as part of the graph data structure. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EquivalenceRelationQ.html">EquivalenceRelationQ</a>[r] yields True if the matrix r defines an equivalence relation. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EquivalenceRelationQ.html">EquivalenceRelationQ</a>[g] tests whether the adjacency matrix of graph g defines an equivalence relation. 
* Equivalences[g, h] lists the vertex equivalence classes between graphs g and h defined by their vertex degrees. Equivalences[g] lists the vertex equivalences for graph g defined by the vertex degrees. Equivalences[g, h, f1, f2, ...] and Equivalences[g, f1, f2, ...] can also be used, where f1, f2, ... are functions that compute other vertex invariants. It is expected that for each function fi, the call fi[g, v] returns the corresponding invariant at vertex v in graph g. The functions f1, f2, ... are evaluated in order, and the evaluation stops either when all functions have been evaluated or when an empty equivalence class is found. Three vertex invariants, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DegreesOf2Neighborhood.html">DegreesOf2Neighborhood</a>, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOf2Paths.html">NumberOf2Paths</a>, and Distances are Combinatorica functions and can be used to refine the equivalences. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ExactRandomGraph.html">ExactRandomGraph</a>[n, e] constructs a random labeled graph of exactly e edges and n vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ExtractCycles.html">ExtractCycles</a>[g] gives a maximal list of edge-disjoint cycles in graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/FindCycle.html">FindCycle</a>[g] finds a list of vertices that define a cycle in graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/FiniteGraphs.html">FiniteGraphs</a> produces a convenient list of all the interesting, finite, parameterless graphs built into Combinatorica. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/FolkmanGraph.html">FolkmanGraph</a> returns a smallest graph that is edge-transitive but not vertex-transitive. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/FranklinGraph.html">FranklinGraph</a> returns a 12-vertex graph that represents a 6-chromatic map on the Klein bottle. It is the sole counterexample to Heawood's map coloring conjecture. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/FunctionalGraph.html">FunctionalGraph</a>[f, v] takes a set v and a function f from v to v and constructs a directed graph with vertex set v and edges (x, f(x)) for each x in v. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/FunctionalGraph.html">FunctionalGraph</a>[f, v], where f is a list of functions, constructs a graph with vertex set v and edge set (x, fi(x)) for every fi in f. An option called Type that takes on the values Directed and Undirected is allowed. Type -> Directed is the default, while Type -> Undirected returns the corresponding underlying undirected graph. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/FunctionalGraph.html">FunctionalGraph</a>[f, n] takes a nonnegative integer n and a function f from {0,1,..., n-1} onto itself and produces the directed graph with vertex set {0, 1,..., n-1} and edge set {x, f(x)} for each vertex x." 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GeneralizedPetersenGraph.html">GeneralizedPetersenGraph</a>[n, k] returns the generalized Petersen graph, for integers n > 1 and k > 0, which is the graph with vertices {u1, u2, ..., un} and {v1, v2, ..., vn} and edges {ui, u(i+1)}, {vi, v(i+k)}, and {ui, vi}. The Petersen graph is identical to the generalized Petersen graph with n = 5 and k = 2. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GetEdgeWeights.html">GetEdgeWeights</a>[g] returns the list of weights of the edges of g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GetEdgeWeights.html">GetEdgeWeights</a>[g, es] returns the list of weights in graph g of the edges in es. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexLabels.html">GetVertexLabels</a>[g] returns the list of labels of vertices of g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexLabels.html">GetVertexLabels</a>[g, vs] returns the list of labels in graph g of the vertices specified in list vs. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexWeights.html">GetVertexWeights</a>[g] returns the list of weights of vertices of g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GetVertexWeights.html">GetVertexWeights</a>[g, vs] returns the list of weights in graph g of the vertices in vs. 
* Girth[g] gives the length of a shortest cycle in a simple graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphDifference.html">GraphDifference</a>[g, h] constructs the graph resulting from subtracting the edges of graph h from the edges of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphicQ.html">GraphicQ</a>[s] yields True if the list of integers s is a graphic sequence, and thus represents a degree sequence of some graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphIntersection.html">GraphIntersection</a>[g1, g2, ...] constructs the graph defined by the edges that are in all the graphs g1, g2, .... 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphJoin.html">GraphJoin</a>[g1, g2, ...] constructs the join of graphs g1, g2, and so on. This is the graph obtained by adding all possible edges between different graphs to the graph union of g1, g2, .... 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphPolynomial.html">GraphPolynomial</a>[n, x] returns a polynomial in x in which the coefficient of x<sup>m is the number of nonisomorphic graphs with n vertices and m edges. [http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphPolynomial.html GraphPolynomial][n, x, Directed] returns a polynomial in x in which the coefficient of x</sup>m is the number of nonisomorphic directed graphs with n vertices and m edges. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphPower.html">GraphPower</a>[g, k] gives the kth power of graph g. This is the graph whose vertex set is identical to the vertex set of g and that contains an edge between vertices i and j for each path in g between vertices i and j of length at most k. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GraphSum.html">GraphSum</a>[g1, g2, ...] constructs the graph resulting from joining the edge lists of graphs g1, g2, and so forth. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GrayGraph.html">GrayGraph</a> returns a 3-regular, 54-vertex graph that is edge-transitive but not vertex-transitive; the smallest known such example." 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GreedyVertexCover.html">GreedyVertexCover</a>[g] returns a vertex cover of graph g constructed using the greedy algorithm. This is a natural heuristic for constructing a vertex cover, but it can produce poor vertex covers. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/GroetzschGraph.html">GroetzschGraph</a> returns the smallest triangle-free graph with chromatic number 4. This is identical to <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MycielskiGraph.html">MycielskiGraph</a>[4]. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianCycle.html">HamiltonianCycle</a>[g] finds a Hamiltonian cycle in graph g if one exists. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianCycle.html">HamiltonianCycle</a>[g, All] gives all Hamiltonian cycles of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianPath.html">HamiltonianPath</a>[g] finds a Hamiltonian path in graph g if one exists. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianPath.html">HamiltonianPath</a>[g, All] gives all Hamiltonian paths of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HamiltonianQ.html">HamiltonianQ</a>[g] yields True if there exists a Hamiltonian cycle in graph g, or in other words, if there exists a cycle that visits each vertex exactly once. 
* Harary[k, n] constructs the minimal k-connected graph on n vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HasseDiagram.html">HasseDiagram</a>[g] constructs a Hasse diagram of the relation defined by directed acyclic graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HerschelGraph.html">HerschelGraph</a> returns a graph object that represents a Herschel graph. 
* Highlight[g, p] displays g with elements in p highlighted. The second argument p has the form {s1, s2,...}, where the sis are disjoint subsets of vertices and edges of g. The options, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexStyle.html">HighlightedVertexStyle</a>, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeStyle.html">HighlightedEdgeStyle</a>, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexColors.html">HighlightedVertexColors</a>, and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeColors.html">HighlightedEdgeColors</a> are used to determine the appearance of the highlighted elements of the graph. The default settings of the style options are <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexStyle.html">HighlightedVertexStyle</a>->Disk[Large] and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeStyle.html">HighlightedEdgeStyle</a>->Thick. The options <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedVertexColors.html">HighlightedVertexColors</a> and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/HighlightedEdgeColors.html">HighlightedEdgeColors</a> are both set to {Black, Red, Blue, Green, Yellow, Purple, Brown, Orange, Olive, Pink, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DeepPink.html">DeepPink</a>, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DarkGreen.html">DarkGreen</a>, Maroon, Navy}. The colors are chosen from the palette of colors with color 1 used for s1, color 2 used for s2, and so on. If there are more parts than colors, then the colors are used cyclically. The function permits all the options that <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html">SetGraphOptions</a> permits, for example, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexColor.html">VertexColor</a>, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexStyle.html">VertexStyle</a>, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeColor.html">EdgeColor</a>, and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeStyle.html">EdgeStyle</a>. These options can be used to control the appearance of the non-highlighted vertices and edges. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/IntervalGraph.html">IntervalGraph</a>[l] constructs the interval graph defined by the list of intervals l. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/InversionPoset.html">InversionPoset</a>[n] returns a Hasse diagram of the partially ordered set on size-n permutations in which p < q if q can be obtained from p by an adjacent transposition that places the larger element before the smaller. The function takes two options: Type and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a>, with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a> is set to True, labels are produced for the vertices. 
* Isomorphism[g, h] gives an isomorphism between graphs g and h if one exists. Isomorphism[g, h, All] gives all isomorphisms between graphs g and h. Isomorphism[g] gives the automorphism group of g. This function takes an option Invariants -> {f1, f2, ...}, where f1, f2, ... are functions that are used to compute vertex invariants. These functions are used in the order in which they are specified. The default value of Invariants is {<a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/DegreesOf2Neighborhood.html">DegreesOf2Neighborhood</a>, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOf2Paths.html">NumberOf2Paths</a>, Distances}. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/IsomorphismQ.html">IsomorphismQ</a>[g, h, p] tests if permutation p defines an isomorphism between graphs g and h. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/KnightsTourGraph.html">KnightsTourGraph</a>[m, n] returns a graph with m*n vertices in which each vertex represents a square in an m x n chessboard and each edge corresponds to a legal move by a knight from one square to another. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/LabeledTreeToCode.html">LabeledTreeToCode</a>[g] reduces the tree g to its Prufer code. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/LeviGraph.html">LeviGraph</a> returns the unique (8, 3)-cage, a 3-regular graph whose girth is 8. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html">ListGraphs</a>[n, m] returns all nonisomorphic undirected graphs with n vertices and m edges. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html">ListGraphs</a>[n, m, Directed] returns all nonisomorphic directed graphs with n vertices and m edges. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html">ListGraphs</a>[n] returns all nonisomorphic undirected graphs with n vertices. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ListGraphs.html">ListGraphs</a>[n, Directed] returns all nonisomorphic directed graphs with n vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MakeGraph.html">MakeGraph</a>[v, f] constructs the graph whose vertices correspond to v and edges between pairs of vertices x and y in v for which the binary relation defined by the Boolean function f is True. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MakeGraph.html">MakeGraph</a> takes two options, Type and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a>. Type can be set to Directed or Undirected and this tells <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MakeGraph.html">MakeGraph</a> whether to construct a directed or an undirected graph. The default setting is Directed. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a> can be set to True or False, with False being the default setting. Using <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a> -> True assigns labels derived from v to the vertices of the graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximalMatching.html">MaximalMatching</a>[g] gives the list of edges associated with a maximal matching of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximumAntichain.html">MaximumAntichain</a>[g] gives a largest set of unrelated vertices in partial order g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximumIndependentSet.html">MaximumIndependentSet</a>[g] finds a largest independent set of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MaximumSpanningTree.html">MaximumSpanningTree</a>[g] uses Kruskal's algorithm to find a maximum spanning tree of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/McGeeGraph.html">McGeeGraph</a> returns the unique (7, 3)-cage, a 3-regular graph with girth 7. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MeredithGraph.html">MeredithGraph</a> returns a 4-regular, 4-connected graph that is not Hamiltonian, providing a counterexample to a conjecture by C. St. J. A. Nash-Williams. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumChainPartition.html">MinimumChainPartition</a>[g] partitions partial order g into a minimum number of chains. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumChangePermutations.html">MinimumChangePermutations</a>[l] constructs all permutations of list l such that adjacent permutations differ by only one transposition. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumVertexColoring.html">MinimumVertexColoring</a>[g] returns a minimum vertex coloring of g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumVertexColoring.html">MinimumVertexColoring</a>[g, k] returns a k-coloring of g, if one exists. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MinimumVertexCover.html">MinimumVertexCover</a>[g] finds a minimum vertex cover of graph g. For bipartite graphs, the function uses the polynomial-time Hungarian algorithm. For everything else, the function uses brute force. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/MycielskiGraph.html">MycielskiGraph</a>[k] returns a triangle-free graph with chromatic number k, for any positive integer k. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html">NetworkFlow</a>[g, source, sink] returns the value of a maximum flow through graph g from source to sink. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html">NetworkFlow</a>[g, source, sink, Edge] returns the edges in g that have positive flow along with their flows in a maximum flow from source to sink. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html">NetworkFlow</a>[g, source, sink, Cut] returns a minimum cut between source and sink. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html">NetworkFlow</a>[g, source, sink, All] returns the adjacency list of g along with flows on each edge in a maximum flow from source to sink. g can be a directed or an undirected graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlowEdges.html">NetworkFlowEdges</a>[g, source, sink] returns the edges of the graph with positive flow, showing the distribution of a maximum flow from source to sink in graph g. This is obsolete, and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NetworkFlow.html">NetworkFlow</a>[g, source, sink, Edge] should be used instead. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NonLineGraphs.html">NonLineGraphs</a> returns a graph whose connected components are the 9 graphs whose presence as a vertex-induced subgraph in a graph g makes g a nonline graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NoPerfectMatchingGraph.html">NoPerfectMatchingGraph</a> returns a connected graph with 16 vertices that contains no perfect matching. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NormalizeVertices.html">NormalizeVertices</a>[v] gives a list of vertices with a similar embedding as v but with all coordinates of all points scaled to be between 0 and 1. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOf2Paths.html">NumberOf2Paths</a>[g, v] returns a sorted list that contains the number of paths of length 2 to different vertices of g from v. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfDirectedGraphs.html">NumberOfDirectedGraphs</a>[n] returns the number of nonisomorphic directed graphs with n vertices. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfDirectedGraphs.html">NumberOfDirectedGraphs</a>[n, m] returns the number of nonisomorphic directed graphs with n vertices and m edges. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfGraphs.html">NumberOfGraphs</a>[n] returns the number of nonisomorphic undirected graphs with n vertices. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfGraphs.html">NumberOfGraphs</a>[n, m] returns the number of nonisomorphic undirected graphs with n vertices and m edges. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfKPaths.html">NumberOfKPaths</a>[g, v, k] returns a sorted list that contains the number of paths of length k to different vertices of g from v. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfKPaths.html">NumberOfKPaths</a>[al, v, k] behaves identically, except that it takes an adjacency list al as input. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/NumberOfSpanningTrees.html">NumberOfSpanningTrees</a>[g] gives the number of labeled spanning trees of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/OddGraph.html">OddGraph</a>[n] returns the graph whose vertices are the size-(n-1) subsets of a size-(2n-1) set and whose edges connect pairs of vertices that correspond to disjoint subsets. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/OddGraph.html">OddGraph</a>[3] is the Petersen graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/OrientGraph.html">OrientGraph</a>[g] assigns a direction to each edge of a bridgeless, undirected graph g, so that the graph is strongly connected. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ParentsToPaths.html">ParentsToPaths</a>[l, i, j] takes a list of parents l and returns the path from i to j encoded in the parent list. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ParentsToPaths.html">ParentsToPaths</a>[l, i] returns the paths from i to all vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PartialOrderQ.html">PartialOrderQ</a>[g] yields True if the binary relation defined by edges of the graph g is a partial order, meaning it is transitive, reflexive, and antisymmetric. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PartialOrderQ.html">PartialOrderQ</a>[r] yields True if the binary relation defined by the square matrix r is a partial order. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PartitionLattice.html">PartitionLattice</a>[n] returns a Hasse diagram of the partially ordered set on set partitions of 1 through n in which p < q if q is finer than p, that is, each block in q is contained in some block in p. The function takes two options: Type and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a>, with default values Undirected and False, respectively. When Type is set to Directed, the function produces the underlying directed acyclic graph. When <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a> is set to True, labels are produced for the vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PerfectQ.html">PerfectQ</a>[g] yields True if g is a perfect graph, meaning that for every induced subgraph of g the size of a largest clique equals the chromatic number. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PermutationGraph.html">PermutationGraph</a>[p] gives the permutation graph for the permutation p. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PlanarQ.html">PlanarQ</a>[g] yields True if graph g is planar, meaning it can be drawn in the plane so no two edges cross. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PseudographQ.html">PseudographQ</a>[g] yields True if graph g is a pseudograph, meaning it contains self-loops. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RadialEmbedding.html">RadialEmbedding</a>[g, v] constructs a radial embedding of the graph g in which vertices are placed on concentric circles around v depending on their distance from v. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RadialEmbedding.html">RadialEmbedding</a>[g] constructs a radial embedding of graph g, radiating from the center of the graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomTree.html">RandomTree</a>[n] constructs a random labeled tree on n vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomVertices.html">RandomVertices</a>[g] assigns a random embedding to graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html">RankedEmbedding</a>[l] takes a set partition l of vertices {1, 2,..., n} and returns an embedding of the vertices in the plane such that the vertices in each block occur on a vertical line with block 1 vertices on the leftmost line, block 2 vertices in the next line, and so on. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html">RankedEmbedding</a>[g, l] takes a graph g and a set partition l of the vertices of g and returns the graph g with vertices embedded according to <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html">RankedEmbedding</a>[l]. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RankedEmbedding.html">RankedEmbedding</a>[g, s] takes a graph g and a set s of vertices of g and returns a ranked embedding of g in which vertices in s are in block 1, vertices at distance 1 from any vertex in block 1 are in block 2, and so on. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RankGraph.html">RankGraph</a>[g, l] partitions the vertices into classes based on the shortest geodesic distance to a member of list l. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ReadGraph.html">ReadGraph</a>[f] reads a graph represented as edge lists from file f and returns a graph object. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ReflexiveQ.html">ReflexiveQ</a>[g] yields True if the adjacency matrix of g represents a reflexive binary relation. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RegularGraph.html">RegularGraph</a>[k, n] constructs a semirandom k-regular graph on n vertices, if such a graph exists. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RegularQ.html">RegularQ</a>[g] yields True if g is a regular graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ResidualFlowGraph.html">ResidualFlowGraph</a>[g, flow] returns the directed residual flow graph for graph g with respect to flow. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RobertsonGraph.html">RobertsonGraph</a> returns a 19-vertex graph that is the unique (4, 5)-cage graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RootedEmbedding.html">RootedEmbedding</a>[g, v] constructs a rooted embedding of graph g with vertex v as the root. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RootedEmbedding.html">RootedEmbedding</a>[g] constructs a rooted embedding with a center of g as the root. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RotateVertices.html">RotateVertices</a>[v, theta] rotates each vertex position in list v by theta radians about the origin (0, 0). <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RotateVertices.html">RotateVertices</a>[g, theta] rotates the embedding of the graph g by theta radians about the origin (0, 0). 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SelfComplementaryQ.html">SelfComplementaryQ</a>[g] yields True if graph g is self-complementary, meaning it is isomorphic to its complement. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html">SetEdgeWeights</a>[g] assigns random real weights in the range [0, 1] to edges in g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html">SetEdgeWeights</a> accepts options <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html">WeightingFunction</a> and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html">WeightRange</a>. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html">WeightingFunction</a> can take values Random, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomInteger.html">RandomInteger</a>, Euclidean, or LNorm[n] for nonnegative n, or any pure function that takes two arguments, each argument having the form {Integer, {Number, Number}}. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html">WeightRange</a> can be an integer range or a real range. The default value for <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html">WeightingFunction</a> is Random and the default value for <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html">WeightRange</a> is [0, 1]. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html">SetEdgeWeights</a>[g, e] assigns edge weights to the edges in the edge list e. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html">SetEdgeWeights</a>[g, w] assigns the weights in the weight list w to the edges of g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetEdgeWeights.html">SetEdgeWeights</a>[g, e, w] assigns the weights in the weight list w to the edges in edge list e. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html">SetGraphOptions</a>[g, opts] returns g with the options opts set. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html">SetGraphOptions</a>[g, {v1, v2, ..., vopts}, gopts] returns the graph with the options vopts set for vertices v1, v2, ... and the options gopts set for the graph g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html">SetGraphOptions</a>[g, {e1, e2,..., eopts}, gopts], with edges e1, e2,..., works similarly. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetGraphOptions.html">SetGraphOptions</a>[g, {{elements1, opts1}, {elements2, opts2},...}, opts] returns g with the options opts1 set for the elements in the sequence elements1, the options opts2 set for the elements in the sequence elements2, and so on. Here, elements can be a sequence of edges or a sequence of vertices. A tag that takes on values One or All can also be passed in as an argument before any options. The default value of the tag is All and it is useful if the graph has multiple edges. It informs the function about whether all edges that connect a pair of vertices are to be affected or only one edge is affected. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexLabels.html">SetVertexLabels</a>[g, l] assigns the labels in l to vertices of g. If l is shorter than the number of vertices in g, then labels get assigned cyclically. If l is longer than the number of vertices in g, then the extra labels are ignored." 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html">SetVertexWeights</a>[g] assigns random real weights in the range [0, 1] to vertices in g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html">SetVertexWeights</a> accepts options <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html">WeightingFunction</a> and <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html">WeightRange</a>. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html">WeightingFunction</a> can take values Random, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/RandomInteger.html">RandomInteger</a>, or any pure function that takes two arguments, an integer as the first argument and a pair {number, number} as the second argument. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html">WeightRange</a> can be an integer range or a real range. The default value for <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightingFunction.html">WeightingFunction</a> is Random and the default value for <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeightRange.html">WeightRange</a> is [0, 1]. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html">SetVertexWeights</a>[g, w] assigns the weights in the weight list w to the vertices of g. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SetVertexWeights.html">SetVertexWeights</a>[g, vs, w] assigns the weights in the weight list w to the vertices in the vertex list vs. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ShakeGraph.html">ShakeGraph</a>[g, d] performs a random perturbation of the vertices of graph g, with each vertex moving, at most, a distance d from its original position. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ShortestPathSpanningTree.html">ShortestPathSpanningTree</a>[g, v] constructs a shortest-path spanning tree rooted at v, so that a shortest path in graph g from v to any other vertex is a path in the tree. An option Algorithm that takes on the values Automatic, Dijkstra, or <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/BellmanFord.html">BellmanFord</a> is provided. This allows a choice between Dijkstra's algorithm and the Bellman-Ford algorithm. The default is Algorithm -> Automatic. In this case, depending on whether edges have negative weights and depending on the density of the graph, the algorithm chooses between Bellman-Ford and Dijkstra. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ShowLabeledGraph.html">ShowLabeledGraph</a>[g] displays graph g according to its embedding, with each vertex labeled with its vertex number. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ShowLabeledGraph.html">ShowLabeledGraph</a>[g, l] uses the ith element of list l as the label for vertex i. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ShuffleExchangeGraph.html">ShuffleExchangeGraph</a>[n] returns the n-dimensional shuffle-exchange graph whose vertices are length n binary strings with an edge from w to w' if (i) w' differs from w in its last bit or (ii) w' is obtained from w by a cyclic shift left or a cyclic shift right. An option <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexLabel.html">VertexLabel</a> is provided, with default setting False, which can be set to True, if the user wants to associate the binary strings to the vertices as labels." 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SimpleQ.html">SimpleQ</a>[g] yields True if g is a simple graph, meaning it has no multiple edges and contains no self-loops. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SmallestCyclicGroupGraph.html">SmallestCyclicGroupGraph</a> returns a smallest nontrivial graph whose automorphism group is cyclic. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SpringEmbedding.html">SpringEmbedding</a>[g] beautifies the embedding of graph g by modeling the embedding as a system of springs. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SpringEmbedding.html">SpringEmbedding</a>[g, step, increment] can be used to refine the algorithm. The value of step tells the function for how many iterations to run the algorithm. The value of increment tells the function the distance to move the vertices at each step. The default values are 10 and 0.15 for step and increment, respectively. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/StronglyConnectedComponents.html">StronglyConnectedComponents</a>[g] gives the strongly connected components of directed graph g as lists of vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SymmetricQ.html">SymmetricQ</a>[r] tests if a given square matrix r represents a symmetric relation. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/SymmetricQ.html">SymmetricQ</a>[g] tests if the edges of a given graph represent a symmetric relation. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ThomassenGraph.html">ThomassenGraph</a> returns a hypotraceable graph, a graph G that has no Hamiltonian path but whose subgraph G-v for every vertex v has a Hamiltonian path. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ToAdjacencyLists.html">ToAdjacencyLists</a>[g] constructs an adjacency list representation for graph g. It allows an option called Type that takes on values All or Simple. Type -> All is the default setting of the option, and this permits self-loops and multiple edges to be reported in the adjacency lists. Type -> Simple deletes self-loops and multiple edges from the constructed adjacency lists. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ToAdjacencyLists.html">ToAdjacencyLists</a>[g, <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/EdgeWeight.html">EdgeWeight</a>] returns an adjacency list representation along with edge weights. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ToOrderedPairs.html">ToOrderedPairs</a>[g] constructs a list of ordered pairs representing the edges of the graph g. If g is undirected each edge is interpreted as two ordered pairs. An option called Type that takes on values Simple or All can be used to affect the constructed representation. Type -> Simple forces the removal of multiple edges and self-loops. Type -> All keeps all information and is the default option. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ToUnorderedPairs.html">ToUnorderedPairs</a>[g] constructs a list of unordered pairs representing the edges of graph g. Each edge, directed or undirected, results in a pair in which the smaller vertex appears first. An option called Type that takes on values All or Simple can be used, and All is the default value. Type -> Simple ignores multiple edges and self-loops in g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TransitiveReduction.html">TransitiveReduction</a>[g] finds a smallest graph that has the same transitive closure as g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TranslateVertices.html">TranslateVertices</a>[v, {x, y}] adds the vector {x, y} to the vertex embedding location of each vertex in list v. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TranslateVertices.html">TranslateVertices</a>[g, {x, y}] translates the embedding of the graph g by the vector {x, y}. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TravelingSalesman.html">TravelingSalesman</a>[g] finds an optimal traveling salesman tour in a Hamiltonian graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TravelingSalesmanBounds.html">TravelingSalesmanBounds</a>[g] gives upper and lower bounds on a minimum cost traveling salesman tour of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TreeIsomorphismQ.html">TreeIsomorphismQ</a>[t1, t2] yields True if the trees t1 and t2 are isomorphic. It yields False otherwise. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TreeQ.html">TreeQ</a>[g] yields True if graph g is a tree. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TreeToCertificate.html">TreeToCertificate</a>[t] returns a binary string that is a certificate for the tree t such that trees have the same certificate if and only if they are isomorphic. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TriangleInequalityQ.html">TriangleInequalityQ</a>[g] yields True if the weights assigned to the edges of graph g satisfy the triangle inequality. 
* Turan[n, p] constructs the Turan graph, the extremal graph on n vertices that does not contain <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/CompleteGraph.html">CompleteGraph</a>[p]. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/TutteGraph.html">TutteGraph</a> returns the Tutte graph, the first known example of a 3-connected, 3-regular, planar graph that is non-Hamiltonian. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/Uniquely3ColorableGraph.html">Uniquely3ColorableGraph</a> returns a 12-vertex, triangle-free graph with chromatic number 3 that is uniquely 3-colorable. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/UnitransitiveGraph.html">UnitransitiveGraph</a> returns a 20-vertex, 3-unitransitive graph discovered by Coxeter, that is not isomorphic to a 4-cage or a 5-cage. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/UnweightedQ.html">UnweightedQ</a>[g] yields True if all edge weights are 1 and False otherwise. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexColoring.html">VertexColoring</a>[g] uses Brelaz's heuristic to find a good, but not necessarily minimal, vertex coloring of graph g. An option Algorithm that can take on the values Brelaz or Optimum is allowed. The setting Algorithm -> Brelaz is the default, while the setting Algorithm -> Optimum forces the algorithm to do an exhaustive search to find an optimum vertex coloring. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexConnectivity.html">VertexConnectivity</a>[g] gives the minimum number of vertices whose deletion from graph g disconnects it. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexConnectivity.html">VertexConnectivity</a>[g, Cut] gives a set of vertices of minimum size, whose removal disconnects the graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexConnectivityGraph.html">VertexConnectivityGraph</a>[g] returns a directed graph that contains an edge corresponding to each vertex in g and in which edge disjoint paths correspond to vertex disjoint paths in g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexCover.html">VertexCover</a>[g] returns a vertex cover of the graph g. An option Algorithm that can take on values Greedy, Approximate, or Optimum is allowed. The default setting is Algorithm -> Approximate. Different algorithms are used to compute a vertex cover depending on the setting of the option Algorithm. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexCoverQ.html">VertexCoverQ</a>[g, c] yields True if the vertices in list c define a vertex cover of graph g. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexWeight.html">VertexWeight</a> is an option that allows the user to associate weights with vertices. 0 is the default weight. <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/VertexWeight.html">VertexWeight</a> can be set as part of the graph data structure. 
* Vertices[g] gives the embedding of graph g, that is, the coordinates of each vertex in the plane. Vertices[g, All] gives the embedding of the graph along with graphics options associated with each vertex. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WaltherGraph.html">WaltherGraph</a> returns the Walther graph. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WeaklyConnectedComponents.html">WeaklyConnectedComponents</a>[g] gives the weakly connected components of directed graph g as lists of vertices. 
* <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/WriteGraph.html">WriteGraph</a>[g, f] writes graph g to file f using an edge list representation. 
* Zoom[{i, j, k, ...}] is a value that the <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PlotRange.html">PlotRange</a> option can take on in <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/ShowGraph.html">ShowGraph</a>. Setting <a class="http" href="http://reference.wolfram.com/mathematica/Combinatorica/ref/PlotRange.html">PlotRange</a> to this value zooms the display to contain the specified subset of vertices, i, j, k, .... 

## Combinatorica functions implemented, but not included yet

* 