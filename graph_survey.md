
[[_TOC_]] 


## Introduction

The SAGE <a class="http" href="http://wiki.sagemath.org/graph">Graph Theory Project</a> aims to implement Graph objects and algorithms in <a href="/SAGE">SAGE</a>. 

The main people working on this project are Emily Kirkman and Robert Miller. 

We have attempted to make a complete list of existing graph theory software.  We posted functionality lists and some algorithm/construction summaries.  We are very interested in feedback or last-minute additions, as we are ready to begin <a class="http" href="http://wiki.sagemath.org/graph_benchmark">benchmarking</a> our findings. 


## Existing Graph Theory software


### Software included with SAGE


#### GAP

* (see GRAPE-- noting that GRAPE is not standard in SAGE) 

#### Maxima

* <a class="http" href="http://wxmaxima.sourceforge.net/graphs/">GRAPHS package</a> 

#### NetworkX

* <a class="https" href="https://networkx.lanl.gov/">Link</a> Seems pretty comprehensive, released under "GNU Lesser General Public License", works on Python $\geq$ 2.3, interfaces with Matplotlib, Pygraphviz, Graphviz, Pydot, numpy or Numeric, Ipython, SciPy, PyGSL, sAsync, PyYAML: EXCELLENT documentation with links to source code from each function descriptor (TODO: make sense of networkx.utils, networkx.threshold, networkx.generators.small, networkx.me, networkx.mixing, networkx.search_class, networkx.tests); uses pygraphviz to interface to graphviz 
   1. **Representation** 
      * in Graph and DiGraph, "data structures based on an adjacency list implemented as a node-centric dictionary of dictionaries. The dictionary contains keys corresponding to the nodes and the values are dictionaries of neighboring node keys with the value None (the Python None type). This allows fast addition, deletion and lookup of nodes and neighbors in large graphs" 
      * "The XGraph and XDiGraph classes are extensions of the Graph and DiGraph classes... The key difference is that an XGraph edge is a 3-tuple e=(n1,n2,x), representing an undirected edge between nodes n1 and n2 that is decorated with the object x. Here n1 and n2 are (hashable) node objects and x is a (not necessarily hashable) edge object. Since the edge is undirected, edge (n1,n2,x) is equivalent to edge (n2,n1,x). An XDiGraph edge is a similar 3-tuple e=(n1,n2,x), with the additional property of directedness. I.e. e=(n1,n2,x) is a directed edge from n1 to n2 decorated with the object x, and is not equivalent to the edge (n2,n1,x). Whether a graph or digraph allow self-loops or multiple edges is determined at the time of object instantiation via specifying the parameters selfloops=True/False and multiedges=True/False." 
   1. **Storage/Pipes** (see networkx.io) 
      * 'convert' module converts NetworkX graphs to and from other formats: python dict of lists, python dict of dicts, numpy matrices, scipy sparse matrices, pygraphviz; works with python pickling; Import and export networkx networks to dot format using pydot or pygraphviz, 
   1. **Construction** 
      * add path, add cycle, incremental construction, subgraphs, copy, directed $\leftrightarrow$ undirected, balanced r-tree of height h, barbell graph, complete graph, complete bipartite, circular ladder graph, cycle, hierarchically constructed Dorogovtsev-Goltsev-Mendes graph, empty graph, grid graph, n-dim grid graph, hypercube, ladder graph, lollipop graph ($K_n \# P_m$), null graph (#verts = 0), path graph ($P_n$), star graph, trivial graph (#verts = 1), wheel graph, (disjoint) union, cartesian product, composition, complement, empty-copy, relabel nodes by mapping or functions, convert labels to integers 
   1. **Invariants** 
      * density, 
   1. **Predicates** 
      * standard predicates, directed acyclic, 
   1. **Subgraphs and Subsets** 
      * find cliques (Bron & Kerbosch), maximal and bipartite clique graph constructor, project bipartite onto one part (connected if they share a common Top/Bottom Node), clique number and number of maximal cliques, find cliques containing specified node, maximum locally (k,l) connected subgraph 
   1. **Adjacency, etc.** 
      * neighbors, degree, valid degree sequence?, create degree sequence, double edge swap, 
   1. **Connectivity** 
      * find k-cores of a graph, is (k,l) connected, (number) components, 
   1. **Paths, etc.** 
      * eccentricity, diameter, periphery, radius, center, shortest path (length & many variants, including Dijkstra, Floyd-Warshall), dictionary of all shortest path lengths, list of vertices in topological sort order, predecessors, 
   1. **Trees, etc.** 
      * tree class, rooted/directed/forests (experimental classes) 
   1. **Optimization** 
      * clustering: number of triangles for given nodes, clustering coefficients (fraction of triads, which is edge vertex edge, that are triangles), transitivity (3*triangles/triads); breadth-first and depth-first search, Helper queues for use in graph searching; LIFO: Last in first out queue (stack), FIFO: First in first out queue, Priority(fcn): Priority queue with items are sorted by fcn, Random: Random queue, q.append(item) -- add an item to the queue, q.extend(items) -- equivalent to: for item in items: q.append(item), q.pop() -- return the top item from the queue, len(q) -- number of items in q (also q.<ins>len()); </ins> 
   1. **Algebra** 
      * adjacency matrix, (normalized) Laplacian, 
   1. **Morphisms/Group Actions** 
      * non-isomorphic checker (does not check isomorphism; only conclusive in the not-isomorphic direction), three versions: fast, faster and fastest 
   1. **Symmetry** 
      * betweenness, edge, degree, and closeness centrality 
   1. **Generation/Random Graphs** 
      * random bipartite graph from two degree sequences (four versions: including regular, 'reverse' and alternating Havel-Hakimi style), bipartite preferential attachment, bipartite with fixed degree, projection of bipartite onto selected nodes, random pseudograph with given degree sequence, random graph with expected degree given, Havel-Hakimi for simple graphs, tree with given degree sequence, generate a graph with given degree sequence maximizing s-metric, s-metric (the sum of the product $deg(u)*deg(v)$ for every edge u-v in G (Reference unpublished li-2005, author Lun Li and David Alderson and John C.)), digraphs: growing network, growing network with redirection or copying; random geometric graph in the unit cube, $G_{n,p}$ Erdös-Rényi (two versions, normal and fast), Newman-Watts-Strogatz small world graph ("First create a ring over n nodes. Then each node in the ring is connected with its k nearest neighbors. Then shortcuts are created by adding new edges as follows: for each edge u-v in the underlying "n-ring with k nearest neighbors"; with probability p add a new edge u-w with randomly-chosen existing node w. In contrast with watts_strogatz_graph(), no edges are removed."), Watts-Strogatz small world graph ("First create a ring over n nodes. Then each node in the ring is connected with its k nearest neighbors. Then shortcuts are created by rewiring existing edges as follows: for each edge u-v in the underlying "n-ring with k nearest neighbors"; with probability p replace u-v with a new edge u-w with randomly-chosen existing node w. In contrast with newman_watts_strogatz_graph(), the random rewiring does not increase the number of edges."), $G_{n,d}$ ("Return a random regular graph of n nodes each with degree d... n*d must be even"), Barabási-Albert preferential attachment ("A graph of n nodes is grown by attaching new nodes each with m edges that are preferentially attached to existing nodes with high degree."), "Holme and Kim algorithm for growing graphs with powerlaw degree distribution and approximate average clustering" (see P. Holme and B. J. Kim, "Growing scale-free networks with tunable clustering", Phys. Rev. E 2002 vol 65 #2), random lobster ("A caterpillar is a tree that reduces to a path graph when pruning all leaf nodes (p2=0). A lobster is a tree that reduces to a caterpillar when pruning all leaf nodes."), random shell graph (see networkx.generators.random_graphs), tree with given powerlaw distribution ("A trial powerlaw degree sequence is chosen and then elements are swapped with new elements from a powerlaw distribution until the sequence makes a tree (#edges=#nodes-1).") or its degree sequence, 
   1. **Database** 
      * atlas function returns all graphs on up to 7 vertices (see "An Atlas of Graphs" by Ronald C. Read and Robin J. Wilson, Oxford University Press, 1998.) 
   1. **Visualization** 
      * layout: circular, shell, random, spring model, spectral layout, Power Iteration method to find smallest eigenvectors of Laplacian(G) 
      * intervace to pygraphviz 
      * Draw networks with matplotlib (pylab) 
      * Draw networks in 3d with <a class="http" href="http://www.vtk.org/">vtk</a> 

### Software optional in SAGE


#### GRAPE

* <a class="http" href="http://www.maths.qmul.ac.uk/~leonard/grape/">Link</a> 
   1. says David Joyner, "An official GAP package which must be installed separately. GRAPE is primarily designed for the construction and analysis of finite graphs related to groups, designs, and geometries. It has about 50 graph-theoretical functions written in GAP. However, 6 of these call (directly or indirectly) B. D. McKay's program nauty." 
   1. Some of the following is copy/paste directly from L. H. Soicher's stellar <a class="http" href="http://www.maths.qmul.ac.uk/~leonard/grape/manual/chapters.htm">documentation</a> 
      1. **Construction** 
         * In general GRAPE deals with finite directed graphs which may have loops but have no multiple edges. However, many GRAPE functions only work for simple graphs.  In GRAPE, a graph gamma is stored as a record, with mandatory components isGraph, order, group, schreierVector, representatives, and adjacencies.  The only mandatory component which may change once a graph is initially constructed is adjacencies. This is the most general and useful way of constructing a graph in GRAPE: 
            * Graph( G, L, act, rel ) 
            * Graph( G, L, act, rel, invt ) 
            * First suppose that the optional boolean parameter invt is unbound or has value false. Then L should be a list of elements of a set S on which the group G acts, with the action given by the function act. The parameter rel should be a boolean function defining a G-invariant relation on S (so that for g in G, x,y in S, rel(x,y) if and only if rel(act(x,g),act(y,g))). Then the function Graph returns a graph gamma which has as vertex-names (an immutable copy of) 
               * centerlineConcatenation( Orbits( G, L, act ) ) (the concatenation of the distinct orbits of the elements in L under G), and for vertices v,w of gamma, [v,w] is an edge if and only if centerlinerel( VertexName( gamma, v ), VertexName( gamma, w ) ). Now if the parameter invt exists and has value true, then it is assumed that L is invariant under G with respect to action act. Then the function Graph behaves as above, except that the vertex-names of gamma become (an immutable copy of) L. 
Other construction functions:  EdgeOrbitsGraph, NullGraph, CompleteGraph, JohnsonGraph, CayleyGraph, AddEdgeOrbit, RemoveEdgeOrbit, AssignVertexNames And functions to construct new graphs from old:  InducedSubgraph, DistanceSetInduced, DistanceGraph, ComplementGraph, PointGraph, EdgeGraph, SwitchedGraph, UnderlyingGraph, QuotientGraph, BipartiteDouble, GeodesicsGraph, CollapsedIndependentOrbitsGraph CollapsedCompleteOrbitsGraph, NewGroupGraph 

      1. **Representation** 
         * Pretty thorough list of functions to inspect a graph.  Should be useful in initial benchmark testing.  Named vertices stood out as far as representation. 
      1. **Morphisms/Group Actions** 
         * Functions to determine regularity properties of graphs, Automorphism groups and isomorphism testing for graphs. Partial Linear Spaces. 
      1. **Subgraphs and Subsets** 
         1. Some Special Vertex Subsets of a Graph: 
            1. ConnectedComponent 
            1. ConnectedComponents 
            1. Bicomponents 
            1. DistanceSet 
            1. Layers 
            1. IndependentSet 
         1. Complete Subgraphs 
            1. CompleteSubgraphs 
            1. CompleteSubgraphsOfGivenSize 
      1. **Colorings** 
         * Vertex Colorings 

#### Nauty

* <a class="http" href="http://cs.anu.edu.au/~bdm/nauty/">Link</a> 
   1. Subset of GRAPE, which is why GRAPE is not be standard in SAGE as is 
   1. Benchmark program 
   1. Source posted, but no public license - should contact Brendan McKay 
   1. Written in portable subset of C, python wrapper already in existence (see pynauty) 
   1. Both MAGMA and GRAPE (GAP package) use nauty 
      1. **Construction** 
         * includes gtools - quick generators for non-isomorphic graphs, also generates bipartite graphs and digraphs 
      1. **Invariants** 
         * canonical labelling 
      1. **Morphisms/Group Actions** 
         * Computing automorphism groups of graphs and digraphs, isomorphism testing 

### Software interfaced in SAGE


#### Magma

* <a class="http" href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1452.htm">Link</a> 
   1. **Representation** 
      * Sparse support; function computes memory requirement for graph with n verts and m edges; consists of graph itself, vertex set, and edge set 
   1. **Storage/Pipes** 
      * one function opens either file or stream, files stored in <a class="http" href="http://cs.anu.edu.au/~bdm/data/formats.html">Graph6 and Sparse6 format</a> 
   1. **Construction** 
      * From matrix; from edge tuples; from vertex neighbors; from edges of other graphs; subgraphs; quotient graphs; incremental construction; complement; contraction; breaking edges; line graph; switch nbrs for non-nbrs of a vertex; disjoint unions, edge unions; complete unions; cartesian, lexicographic and tensor products; n-th power (same vert set, incident iff dist $\leq$ n); graph $\leftrightarrow$ digraph; Cayley graph constructor; Schreier graph constructor; Orbital graph constructor; Closure graph constructor (given G, add edges to make G invariant under a given permutation group); Paley graphs and tournaments; graphs from incidence structures; converse(reverse digraph); n-th odd graph; n-th triangular graph; n-th square lattice graph; Clebsch, Shrikhande, Gewirtz and Chang graphs; 
   1. **Decorations** (Coloring, Weight, Flow, etc.) 
      * Vertices have labels only; Edges have labels, capacity(non-negative integers, loops=0) and weights(totally ordered ring); 
   1. **Invariants** 
      * #verts, #edges; characteristic polynomial; spectrum 
   1. **Predicates** 
      * 2 verts incident, 2 edges incident, 1 vertex and 1 edge incident, subgraph, bipartite, complete, Eulerian, tree, forest, empty, null, path, polygon, regular 
   1. **Subgraphs and Subsets** 
      * has k-clique, clique number, all cliques, maximum clique (<a class="http" href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1473.htm">"When comparing both algorithms in the situation where the problem is to find a maximum clique one observes that in general BranchAndBound does better. However Dynamic outperforms BranchAndBound when the graphs under consideration are large (more then 400 vertices) random graphs with high density (larger than 0.5%). So far, it can only be said that the comparative behaviour of both algorithms is highly dependent on the structure of the graphs."</a>), independent sets and number, 
   1. **Adjacency, etc.** 
      * (in- & out-) degree, degree vector, valence (if regular), vertex nbrs, edge nbrs, bipartition, dominating sets 
   1. **Connectivity** 
      * (strongly) connected, components, separable, 2-connected, 2-components, triconnectivity (<a class="http" href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1466.htm">"The linear-time triconnectivity algorithm by Hopcroft and Tarjan (HT73) has been implemented with corrections of our own and from C. Gutwenger and P. Mutzel (GM01). This algorithm requires that the graph has a sparse representation."</a>), k-vertex connectivity, vertex separator, k-edge connectivity, edge separator 
   1. **Paths, etc.** 
      * distance and geodesic, diameter and corr. path, ball and sphere, distance partition, equitable partition, girth and corr. cycle 
   1. **Trees, etc.** 
      * spanning tree, breadth first and depth first searches, rooted, root, parent, vertex paths 
   1. **Colorings**(see also Decorations) 
      * chromatic number and index, optimal vertex and edge colorings, chromatic polynomial 
   1. **Optimization** 
      * Max flow min cut (2 algorithms: <a class="http" href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1499.htm#15274">Dinic & push-relabel</a>), maximum matching for bipartite, 
   1. **Embedding** (Planar graphs, etc.) 
      * planarity, Kuratowski subgraphs, faces of a planar graph, embedding info as orientation of edges from a vertex 
   1. **Algebra** 
      * adjacency matrix, distance matrix, incidence matrix, intersection matrix 
   1. **Morphisms/Group Actions** 
      * interfaces _nauty_ 
   1. **Symmetry** 
      * vertex, edge and distance transitivity; orbit partitions; primitivity; symmetric; distance regularity and intersection array 
   1. **Geometry** 
      * Go back and forth between incidence and coset geometries and their graphs; finite planes; 
   1. **Generation/Random Graphs** 
      * interfaces _nauty_ 
   1. **Database** 
      * database interface, strongly regular graph DB, random graph from DB, slick implementation of for loops ("for G in D do ... end for;") 

#### Maple

* Contains the **networks** package, which includes: 
   1. **Representation** 
      * ? 
   1. **Construction** 
      * new (0 verts), void (n verts, 0 edges), incremental construction, complement, complete, contraction, hypercubes, cycle, petersen, cube, icosahedron, dodecahedron, octahedron, tetrahedron, simplify a multigraph, union, subgraphs, 
   1. **Decorations** (Coloring, Weight, Flow, etc.) 
      * vertex weights default to 0, edge weights default to 1 (can be any valid maple expression) 
   1. **Invariants** 
      * characteristic polynomial 
   1. **Adjacency, etc.** 
      * in-nbrs(arrivals), out-nbrs(departures), degree sequence, endpoints, graphical ("tests whether intlist is the degree sequence of a simple graph"), edge-nbrs, vert-nbrs, in-degree, out-degree, max & min degree, edge span & span polynomial ("The span polynomial in variable p gives the probability that G is spanning when each edge operates with probability p.", "When G is connected, this is the all-terminal reliability polynomial of G, and gives the probability that G is connected when each edge operates independently with probability p."), 
   1. **Connectivity** 
      * components, edge-connectivity, 2-components, count minimal cutsets, rank ("The rank of an edgeset e is the number of vertices of G minus the number of components of the subgraph induced by e."), Whitney rank polynomial ("The rank polynomial is a sum over all subgraphs H of G of $x<sup>{(rank(G) - rank(H))} y</sup>{corank(H)}$."), 
   1. **Paths, etc.** 
      * diameter, fundcyc ("Given a subset e of edges forming a unicyclic subgraph of a graph G, the edges forming the unique cycle are returned as a set. It is assumed that only one cycle is present."), girth, find path from a to b, 
   1. **Trees, etc.** 
      * ancestor, daughter, count spanning trees (Kirchoff Matrix-Tree theorem), cycle base ("A spanning tree is found, and fundcyc() is then used to find all fundamental cycles with respect to this tree. They are returned as a set of cycles with each cycle being represented by a set of edges."), edge disjoint spanning tree, shortest path spanning tree, min weight spanning tree, Tutte polynomial ("The Tutte polynomial is a sum over all maximal forests H of G of $t<sup>{ia(H)} z</sup>{ea(H)}$ where $ia(H)$ is the internal activity of H and $ea(H)$ is the external activity of H.") 
   1. **Colorings** 
      * chromatic polynomial, 
   1. **Optimization** 
      * maximum flow (flow), Dinic algorithm for max flow (see Magma), flow polynomial ("The flow polynomial in variable h gives the number of nowhere-zero flows on G with edge labels chosen from integers modulo h."), minimum cut, 
   1. **Embedding** (Planar graphs, etc.) 
      * isplanar, 
   1. **Algebra** 
      * acycpoly ("The acyclicity polynomial in variable p gives the probability that G is acyclic when each edge operates with probability p."), adjacency matrix, distance table (allpairs- optional table gives shortest path trees, rooted at each vertex), incidence matrix, 
   1. **Generation/Random Graphs** 
      * random graphs- specify #verts and prob of edge occuring, or #verts and #edges 
   1. **Database** 
      * show command shows a table of known information about a network 
   1. **Visualization** 
      * plots graphs either in lines (Linear) or in concentric circles (Concentric), ability to give specific graphs specific plotting procedures, 3d plots ("The location of the vertices of the graph is determined as follows. Let A be the adjacency matrix of G and let u, v and w be three eigenvectors of A with corresponding second, third, and fourth largest eigenvalue in absolute value. Then the (x,y,z) coordinates of the ith vertex of G is (u[i],v[i],w[i])."; "Sometimes other symmetries in the graph can be seen by using other eigenvectors. If the optional argument eigenvectors = [e1, e2, e3] is specified, where e1, e2, and e3 are vertex numbers (integers from 1 through the number of vertices), the eigenvectors corresponding to the eigenvalues of these relative magnitudes are used.") 

#### Mathematica

* <a class="http" href="http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/">GraphPlot</a>(<a class="http" href="http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotReferences.html">biblio</a>) is built-in: also a few functions for "applications" (?); designed to work well with large graphs; also supports graphs from _Combinatorica_ 
   1. **Representation** 
      * graph simply _is_ an adjacency matrix (could be sparse), or a list of rules (e.g. {1->2, 2->3, 3->4, 4->1}) 
   1. **Construction** 
      * N/A (see representation) 
   1. **Predicates** 
      * vertex list (apparently only nontrivial when graph is a rule list, see representation) 
   1. **Subgraphs and Subsets** 
      * maximal independent vertex sets and edge sets, 
   1. **Connectivity** 
      * list strongly connected components, 
   1. **Paths, etc.** 
      * distance, pseudo-diameter (see <a class="http" href="http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotPseudoDiameter.html">Documentation</a>) 
   1. **Trees, etc.** 
      * <a class="http" href="http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotTreePlot.html">TreePlot</a> uses the layered drawing algorithm, implements more control: 
   1. **Optimization** 
      * maximum matching for bipartite, <a class="http" href="http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotMinCut.html">min cut</a> problem 
   1. **Visualization** 
      * <a class="http" href="http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotGraphPlotAndGraphPlot3D.html">ALGORITHMS</a> include spring model, spring-electrical model, high-dimensional embedding (random seeds can be given for spring models, link includes options for the spring models); tree algorithms include radial drawing, layered drawing (see G. Di Battista, P. Eades, R. Tamassia, and I. G. Tollis, Algorithms for the Visualization of Graphs, Prentice-Hall, 1999.); vertex styles and colors, edge styles and colors; function to return coordinates without drawing 

### Extensions of interfaced software in SAGE


#### Maple: 'laplacian.mpl'

1. <a class="http" href="http://www.math.uga.edu/~mbaker/REU/maple/laplacian-guide.html">'laplacian.mpl'</a>; <a class="http" href="http://www.fmf.uni-lj.si/~mohar/Papers/Spec.pdf">here</a> is a paper on the Laplacian Spectrum 
   1. **Storage/Pipes** 
      * creation of certain spreadsheets, such as known eigenvalues and eigenvalues of increasing subdivisions of the graph 
   1. **Construction** 
      * banana graphs, star graphs, bouquets and flowers, hypercubes, supercirc (see docs), subdivide edges into n edges, contract, assign directions (apparently in a random way) 
   1. **Decorations** (Coloring, Weight, Flow, etc.) 
      * normalilze (so sum of weights = 1) 
   1. **Algebra** 
      * discrete laplacian matrix (this function may fight with the built-in laplacian in 'linalg'), compute its eigenvalues given a measure, 
   1. **Topology** 
      * (laplacian matrix), effective resistance between vertices, discrete and continuous canonical measure <a class="http" href="http://www.math.uga.edu/~mbaker/REU/tex/canonical.pdf#search=&quot;graph%20tau&quot;">an unrelated explanation?</a> and tau (also, taushorten "Investigates the behavior of tau as an edge is shortened"), discrete dx measure 
1. <a class="http" href="http://www.cecm.sfu.ca/CAG/papers/GTpaper.pdf">GraphTheory</a> and <a class="http" href="http://www.cecm.sfu.ca/CAG/papers/GT2006.pdf">Part II</a> of the paper (haven't yet found the actual package...) 

#### Mathematica: Combinatorica

1. <a class="http" href="http://www.combinatorica.com/">Combinatorica</a> - for a list of functions, see <a class="http" href="http://www.cs.sunysb.edu/~skiena/combinatorica/help.pdf">help.pdf</a>, page 13-14, 18, 21, 23, 25 - for a <a class="http" href="http://www.amazon.com/exec/obidos/ASIN/0521806860/ref=nosim/thealgorithmrepo/">book</a> 
1. For a comparison of functionality in Combinatorica and SAGE, see the <a href="/CombinatoricaCompare">CombinatoricaCompare</a> page. 

### Other (useful) software


#### Python Libraries


##### pygraphlib

* contains pygraph and pydot 
* spanning trees by dijkstra and prim, shortest path, depth and breadth first (yep, that's it) 

##### Pygraphviz, pydot, YAPGVB

* <a class="http" href="http://networkx.lanl.gov/pygraphviz/">Pygraphviz</a> is a part of NetworkX, meant to be a python interface to Graphviz 
* <a class="http" href="http://dkbza.org/pydot.html">Pydot</a> is a python interface to Graphviz's dot language 
* <a class="http" href="http://yapgvb.sourceforge.net/">Yet Another Python Graphviz Binding</a> is yet another acronym, also has boost-graph bindings... 

##### GraphViz

* <a class="http" href="http://www.graphviz.org">Link</a> 
   1. open source, Common Public License Version 1.0 (BSD style) 
   1. poorly documented, at least on the web 
      1. **Visualization** 
         * DOT makes "hierarchical" drawings of directed graphs.  Algorithm aims edges in same direction and attempts to not cross edges and reduce length. 
         * NEATO uses spring method, via the Kamada-Kawai algorithm (statistical multi-dimensional scaling) 
         * fdp also uses the spring model, via the Fruchterman-Reingold heuristic (handles larger graphs and undirected, clustered graphs) 
         * a <a class="http" href="http://www.dkbza.org/pydot.html">python interface</a> 
         * "options for colors, fonts, tabular node layouts, line styles, hyperlinks, and custom shapes." 

##### Gato

* <a class="http" href="http://gato.sourceforge.net/">Link</a> A tool that animates algorithms, perhaps SAGE cannot actually include right now as is, but license is LGPL, and it requires Python and Tcl/Tk: would be good for educational purposes 
   * seems that you can write your algorithm in one window and watch it go, supports 3d 

#### C/C++


##### CHomP

* <a class="http" href="http://www.math.gatech.edu/~chomp/software/">link</a> GPL, written in C++, several benchmarks on page 
   * application, and C++ <a class="http" href="http://www.math.gatech.edu/~chomp/advanced/library.php">library</a>: "The CHomP library allows a C++ programmer to access the data structures and homology computation procedures directly from their own programs, without the need to write data to files and then run homology programs which would read them in turn." (This had worried me at first, because the main programs only take strictly black&white bitmaps as input... -RLM) 
      1. Homology computation: compute the homology groups over $\mathbf{Z}$ or $\mathbf{Z}_p$ of a chain complex, as well as the homs induced in homology by chain maps; compute the (relative) homology of a set of cubes or a cubical set, as well as the homomorphism induced in homology by an acyclic combinatorial cubical multivalued map; compute the homology of a finite abstract simplicial complex or relative homology of a pair of simplicial complexes; construct a chain selector of an almost perfect combinatorial cubical multivalued map- this program was written by Marcin Mazur and Jacek Szybowski; find an index pair with Andrzej Szymczak's algorithm 
      1. Data verification: verify whether a combinatorial cubical multivalued map is suitable for the (relative) homology computation with homcubes; verify whether a combinatorial cubical multivalued map satisfy the almost-perfectnessassumption of the chmap program 
      1. Converting data files: convert a set of cubes between the format used in the Bill Kalies' chom program and the format used in this Homology Package; extract a list of squares from an uncompressed Windows bitmap file; convert a set of cubical cells into a set of cubes- in the input file, if any cell spans across several cubes, then all the cubes it contains are written to the output file; convert a chain map from the output format of the chmap program written by Marcin Mazur and Jacek Szybowski to the input format for homchain, which is necessary if one wants to compute the homomorphism induced in homology by such a map; convert a combinatorial cubical multivalued map from the format used in chmap by Marcin Mazur and Jacek Szybowski to the format used in the Homology Package, in which each cube is mapped to a set of cubes, not necessarily convex; convert a set of cubes to a set of corresponding cubical cells; create a map whose graph is stored as a set of cubes, or create the combinatorial cubical multivalued indentity map on the given set of cubes; extract the domain, image, and/or graph of a combinatorial cubical multivalued map; extract a list of pixels or voxels from a raw bitmap data; draw a 2-dimensional projection of a set of cubes onto one of the planes spanned by selected two axes 
      1. Data manipulation: create a chain complex of a set of cubes; create chain maps corresponding to the projections of a map whose graph is given onto domain and codomain; compute the difference of two sets of cubes; divide a set of cubes into subsets separated by hyperplanes; create a chain complex of a simplicial complex; compute the restriction of a map to the given subset of its domain; compute the common part of given sets of cubes; split a set of cubes into connected components; compute the union of given sets of cubes 
      1. Tools and test programs 

##### Boost C++ Libraries

* <a class="http" href="http://www.boost.org/libs/graph/doc/index.html">link</a>: a C++ library with a GPL-ish license, algorithms: 
   * Dijkstra's Shortest Paths 
   * Bellman-Ford Shortest Paths 
   * Johnson's All-Pairs Shortest Paths 
   * Kruskal's Minimum Spanning Tree 
   * Prim's Minimum Spanning Tree 
   * Connected Components 
   * Strongly Connected Components 
   * Dynamic Connected Components (using Disjoint Sets) 
   * Topological Sort 
   * Transpose 
   * Reverse Cuthill Mckee Ordering 
   * Smallest Last Vertex Ordering 
   * Sequential Vertex Coloring 

##### Very_nauty

* <a class="http" href="http://keithbriggs.info/very_nauty.html">Link</a> 
   1. designed to be compatible with nauty 
   1. C library 
   1. **Subgraphs and Subsets** 
      * cliques in G(n,p), # of graphs on n nodes with chromatic number k, # of graphs on n nodes with clique number k, new data on chromatic number and cliqe number, Lambert's w function 

##### plantri/fullgen

* <a class="http" href="http://cs.anu.edu.au/people/bdm/plantri/">Link</a> written in C, tested mainly on UNIX, weird license ('free for all purposes other than sale for profit. However, they remain subject to our copyright and are not "public domain".'): interesting note, co-authored by Brendan McKay, of _nauty_ 
   1. **Generation/Random Graphs** 
      * plantri: "exactly one member of each isomorphism class is output without the need for storing them. The speed of generation is more than 100,000 graphs per second in most cases, so extremely large classes of graph can be exhaustively listed.", classes include planar triangulations, quadrangulations, simple graphs, triangulations of a disc, planar cubic and quartic graphs 
      * fullgen generates fullerenes 
      * see also <a class="http" href="http://hep.physics.indiana.edu/~tsulanke/graphs/surftri/">surftri</a>, which generates triangulations of surfaces of higher genus 

##### GraphThing

* <a class="http" href="http://graph.seul.org/">link</a> GPL, C++, <a class="http" href="http://www.wxwidgets.org/">wxWidgets</a> 
   * Adding, deleting and moving of vertices and edges. 
   * Loading and saving of graphs. 
   * Graph complements, induced subgraphs and line graphs. 
   * Quick creation of many common graphs (complete, cycle, null, star, etc.). 
   * Determination of shortest path, connectivity and Eulericity. 
   * BFS, DFS and Minimum Spanning Tree. 
   * Adjacency matrix (including exponents) and degree sequence. 
   * Chromatic polynomial and chromatic number. 
   * Network algorithms: Maximum network flow. 

##### EWS

* <a class="http" href="http://www.mathe2.uni-bayreuth.de/axel/ews.html">Link</a> 
   * auf Deutsche 

##### LINK

1. <a class="http" href="http://dimacs.rutgers.edu/~berryj/LINK.html">(hyper)link</a> 
   1. Free, but not open source 
   1. C++ libraries 
   1. Doc's are PS, which upsets my computer very much!!! (ie - I can't read them so I don't actually know that much about LINK) 

##### ABACUS (A Branch-And-!CUt System)

* <a class="http" href="http://www.informatik.uni-koeln.de/abacus/">Link</a> 
   1. open source, GNU Lesser GPL v2.1 
   1. C++ libraries 
   1. **Optimization** 
      * Branch-and-Bound algorithm, linear programming relaxations allow for dynamic generation of cutting planes or columns) 

##### GOBLIN

* <a class="http" href="http://www.math.uni-augsburg.de/~fremuth/goblin.html">Link</a> 
   * LGPL C++ library with Tcl/Tk interface 
   * **Representation** 
   * Adjacency matrix or incidence list 
   * **Storage** 
   * Has its own format 
   * **Optimization** 
   * "Focuses on" combinatorical optimization algorithms, especially network flow and load balancing 

##### igraph

* <a class="http" href="http://cneurocvs.rmki.kfki.hu/igraph/">Link</a>, open source, written in C, with Python, Ruby and R interfaces. 

#### JAVA


##### CAIDA's Walrus

* <a class="http" href="http://www.caida.org/tools/visualization/walrus/">link</a> GPL, written in Java, "best suited to visualizing moderately sized graphs that are nearly trees" (viz only), PRETTY, doesn't work in OS X currently (as of 10/10/06), no functionality 

##### The Graph Visualization Framework

* <a class="http" href="http://gvf.sourceforge.net/">Link</a> Name self-explanatory.  Open source, but written in Java. 

##### JGraphT

* <a class="http" href="http://jgrapht.sourceforge.net/">Link</a> JGraphT is a free Java graph library that provides mathematical graph-theory objects and algorithms 

##### GINY

* <a class="http" href="http://csbi.sourceforge.net/">Link</a> Open source java intefaces for supreme graph visualization 

##### JUNG

* <a class="http" href="http://jung.sourceforge.net/">Link</a> Open source java library 

##### JDigraph

* <a class="http" href="http://jdigraph.sourceforge.net/">Link</a> Open source java library 

##### WilmaScope

* <a class="http" href="http://www.wilmascope.org/">Link</a> a Java3D application which creates real time 3d animations of dynamic graph structures 

##### nv2d

* <a class="http" href="http://ostatic.com/110007-software-opensource/nv2d">link</a> 
   1. **Visualization** 
   1. Java visualization, designed to run in a browser 
   1. Spring model visualization 
   1. **Construction** 
   1. Data from GraphML, Nfile 

##### JGraphEd

* <a class="http" href="http://www.jharris.ca/JGraphEd/">Link</a>, Java-based graph editor, entirely GUI, with very basic interface. Good example of a bad interactive environment. 

##### JIGGLE

* <a class="http" href="http://www.cs.cmu.edu/~quixote/">Link</a> 
   1. **Visualization** 
   1. Java visualization applet, poor interface, minimal, source available 

##### RoxGT

* <a class="http" href="http://roxgt.sourceforge.net">Link</a> 
   * Claims to be a complete extensible graph framework, written in Java. No documentation. 

#### And more

These need to be organized... 


##### DISCRETA

* <a class="http" href="http://www.mathe2.uni-bayreuth.de/discreta/">Link</a> 

##### GTL

* The <a class="http" href="http://www.cs.sunysb.edu/~algorith/implement/gtl/implement.shtml">Graph Template Library</a>, and extension of the STL... a few basic algorithms. see also <a class="http" href="http://www.infosun.fim.uni-passau.de/Graphlet/">Graphlet</a> 

##### GeoSteiner

* <a class="http" href="http://www.diku.dk/geosteiner/">Link</a> 
   1. ** Construction** A set of points in different formats 
   1. **Trees, etc.** 
   1. Euclidean Steiner Tree Problem in the Plane 
   1. Rectilinear Steiner Tree Problem in the Plane 
   1. Minimum Spanning Tree Problem in Hypergraphs 
<a class="http" href="http://www.diku.dk/geosteiner/LICENSE">License</a> 


##### GUESS

* <a class="http" href="http://graphexploration.cond.org/">link</a> represents graphs in JUNG, "still a work in progress", most if not all functionality besides visualization reduces to JUNG 

##### GRIN

* <a class="http" href="http://www.geocities.com/pechv_ru/">Link</a> 
   1. for windows only 
   1. not open-source, but free download 
      1. **Connectivity** 
         * bridges and cutpoints 
      1. **Paths, etc.** 
         * Paths and Cycles (Eulerian and Hamiltonian), Shortest Paths, Max Capacity Path, K Shortest paths, Critical path 
      1. **Trees, etc.** 
         * Minimal spanning tree 
      1. **Optimization** 
         * Max Flow 
      1. **Morphisms/Group Actions** 
         * Automorphism group 
      1. **Topology** 
         * Metrics of the graph Density, Undensity and so on...) 
      1. **Visualization** 
         * 2d only, Clipboard edit, decomposition of edges, resize 

##### DSATUR

* <a class="http" href="http://prolland.free.fr/works/research/dsatphp/dsat.html">Link</a>, a program for computing graph colorings, algorithm <a class="http" href="http://prolland.free.fr/works/research/dsat/index.html#anchor38034">documentation</a> in French, input in <a class="http" href="http://mat.gsia.cmu.edu/COLOR/general/ccformat.ps">DIMACS</a> format, <a class="http" href="http://prolland.free.fr/works/research/dsatphp/dsat.txt">source code</a> 

##### LEDA

1. <a class="http" href="http://www.algorithmic-solutions.info/leda_guide/graph_algorithms/graph_draw.html">Link</a> 
   1. Commercial, but supposedly fast 
   1. **Morphisms / Group Actions** 
      * Module graph and subgraph isomorphisms 
   1. **Needs a Functionality Category** 
      1. Curved Geometry: Polygons with Circular Arcs 
      1. Module Compression 
      1. Module Cryptography 
      1. Static Graphs 

##### GDToolkit

* <a class="http" href="http://www.dia.uniroma3.it/~gdt/">Link</a> Closed source, visualization. OOP hierarchy of graph drawing classes - but we can't see the classes... hence 'useless'. 

##### StOCNET

* <a class="http" href="http://stat.gamma.rug.nl/stocnet/">Link</a> Social Networks 

##### TouchGraph

* <a class="http" href="http://touchgraph.sourceforge.net/">Link</a> a <a href="/GraphLayout">GraphLayout</a> library.  I can't say much else because the 'CVS + Source' link is dead.  Is this a temporary problem or should we completely toss this one? 

##### Vancouver Network Analysis Team

* <a class="http" href="http://www.sfu.ca/~richards/">Link</a>, Social Network Analysis 

##### yFiles

* <a class="http" href="http://www.yworks.com/en/products_yfiles_about.htm">Link</a>, Commercial but pretty visualization 

##### prefuse

* <a class="http" href="http://prefuse.org/">link</a> "information visualization toolkit" 

##### LGL (Large Graph Layout)

* <a class="http" href="http://sourceforge.net/projects/lgl">link</a> LGL is a compendium of applications for making the visualization of large networks and trees tractable. LGL was specifically motivated by the need to make the visualization and exploration of large biological networks more accessible. 

##### Otter

* <a class="http" href="http://www.caida.org/tools/utilities/">Link</a> Defunct 

##### Gravisto

* <a class="http" href="http://gravisto.fmi.uni-passau.de/">Link</a> 

##### INGRID

* <a class="http" href="http://ingrid.ldgo.columbia.edu/">Link</a> 
   * Seems geared for climate modeling. Written in <a href="/PostScript">PostScript</a> (???) 

##### METIS

* <a class="http" href="http://glaros.dtc.umn.edu/gkhome/views/metis/">Link</a> 
   1. **Paths** 
   1. Claims to be fast at partitioning using various algorithms 
   1. Fill-reducing ordering algorithms on sparse matrix representations, running a fill-reducing ordering on a matrix increases algorithm efficiency. 
   1. <a class="http" href="http://www.dtc.umn.edu/publications/reports/2006_03.pdf">Documentation here</a> 

##### Algolib

* <a class="http" href="http://algo.inria.fr/libraries/software.html">Link</a> 
   * Appears to be for general combinatorics (gen. functions, mostly) Doesn't seem to do graph theory. 

##### ACE

* <a class="http" href="http://phalanstere.univ-mlv.fr/~ace/ACE/3.0/ACE.html">Link</a> 
   * MAPLE Package for computer algebra and combinatorics. No longer being maintained. 

##### Scalable Libraries for Graph Partitioning

* <a class="http" href="http://www.npac.syr.edu/NPAC1/PUB/ranka/part/part.html">Link</a>, no software yet, but good references on page: "Efficient methods for graph partitioning and incremental graph partitioning are important for parallelization of a large number of unstructured and/or adaptive applications." 

##### Netvis Module

* <a class="http" href="http://www.netvis.org/">Link</a>, Social Networks 

##### Cyram Netminer

* <a class="http" href="http://www.netminer.com/NetMiner/home_01.jsp">Link</a>, closed source, social networks 

## Algorithm Repositories


### Stony Brook

* <a class="http" href="http://www.cs.sunysb.edu/~algorith/index.html">Linky</a> 
   1. Polynomial time 
      * Connected Components 
      * Topological Sorting 
      * Minimum Spanning Tree 
      * Shortest Path 
      * Transitive Closure and Reduction 
      * Matching 
      * Eulerian Cycle / Chinese Postman 
      * Edge and Vertex Connectivity 
      * Network Flow 
      * Drawing Graphs Nicely 
      * Drawing Trees 
      * Planarity Detection and Embedding 
   1. NP 
      * Clique 
      * Independent Set 
      * Vertex Cover 
      * Traveling Salesman Problem 
      * Hamiltonian Cycle 
      * Graph Partition 
      * Vertex Coloring 
      * Edge Coloring 
      * Graph Isomorphism 
      * Steiner Tree 
      * Feedback Edge/Vertex Set 

### InterTools

* <a class="http" href="http://rtm.science.unitn.it/intertools/">InterTools</a> 
   1. Maximum Clique in Graphs (MAX-CLIQUE) 
   1. Graph Partitioning (equicut) 
   1. Quadratic Assignment Problem (QAP) 

### Graph Partitioners

* <a class="http" href="http://www.cs.cmu.edu/~scandal/alg/separator.html">Link</a> 
   1. Coordinate Bisection 
   1. Random Circles 
   1. Spectral Bisection 

### GraphBase

* <a class="http" href="http://www.cs.sunysb.edu/~algorith/implement/graphbase/implement.shtml">Standford Link</a> 
   1. **Generations/Random Graphs** 
      1. Generating Graphs 
      1. Random Number Generation 
   1. **Database** 
      1. Graph Data Structures 
   1. **Trees, etc.** 
      1. Minimum Spanning Tree 
   1. **Paths, etc.** 
      1. Hamiltonian Cycle 
   1. **Optimization** 
      1. Matching 
      1. Shortest Path 
      1. Priority Queues 
   1. **Connectivity** 
      1. Edge and Vertex Connectivity 
      1. Connected Components 
   1. **Topology** 
      1. Topological Sorting 
   1. **Morphisms/Group Actions** 
      1. Generating Permutations 
   1. **Colorings** 
      1. Generating Partitions 
   1. **Needs a Functionality Category** 
      1. Feedback Edge/Vertex Set 
      1. Voronoi Diagrams 
      1. Cryptography 

### Groups & Graphs

* <a class="http" href="http://www.paddle.mb.ca/G&amp;G/G&amp;G.html">Link</a> 
   1. free download, but no mention of source or license 
   1. no internet doc's 
   1. links out to papers on algorithms (references Brendan McKay's _Practical Graph Isomorphism_ paper) 
   1. Algorithms: 
      1. **Morphisms/Group Actions** 
         1. Graph Isomorphism 
         1. Permutations Groups 
      1. **Paths, etc.** 
         1. Hamilton Cycles 
         1. Long Paths 
      1. **Embeddings** 
         1. Planarity Test 
         1. Planar Graph Layout 
         1. Torus Maps 
      1. **Subgroups/Subsets** 
         1. k-Factors 
      1. **Visualization** 
         1. Draw Symmetric 
      1. **Needs a Functionality Category** 
         1. Projective Configurations 

### Dr. Epstein

* <a class="http" href="http://www.ics.uci.edu/~eppstein/PADS/">Some python algorithms</a> 

## Functionality categories

1. **Representation** 
1. **Storage/Pipes** 
1. **Construction** 
1. **Decorations** (Coloring, Weight, Flow, etc.) 
1. **Invariants** 
1. **Predicates** 
1. **Subgraphs and Subsets** 
1. **Adjacency, etc.** 
1. **Connectivity** 
1. **Paths, etc.** 
1. **Trees, etc.** 
1. **Colorings** 
1. **Optimization** 
1. **Embedding** (Planar graphs, etc.) 
1. **Algebra** 
1. **Morphisms/Group Actions** 
1. **Symmetry** 
1. **Geometry** 
1. **Topology** 
1. **Generation/Random Graphs** 
1. **Database** 
1. **Visualization** 

## Miscellaneous Flora and Fauna

* <a class="http" href="http://wwwteo.informatik.uni-rostock.de/isgci/smallgraphs.html">List of small graphs</a> 
* <a class="http" href="http://citeseer.ist.psu.edu/hansen01computers.html">Computers and Discovery in Algebraic Graph Theory</a> 
* <a class="http" href="http://people.freenet.de/Emden-Weinert/graphs.html">Thomas Emden-Weinert's webpage</a>: many many many many many links and resources 
* <a class="http" href="http://vlado.fmf.uni-lj.si/vlado/vladonet.htm">Vladimir Batagelj's website</a>: same story 
* <a class="http" href="http://hypergraph.sourceforge.net/">HyperGraph</a>, open source Java library for hypergraphs (might be interesting to browse the source at some point) 
* <a class="http" href="http://glaros.dtc.umn.edu/gkhome/views/cluto/index.html">CLUTO</a> - Family of Data Clustering Software Tools 
* <a class="http" href="http://glaros.dtc.umn.edu/gkhome/views/metis/parmetis/index.html">METIS</a> - Family of Multilevel Partitioning Algorithms: "a family of programs for partitioning unstructured graphs and hypergraphs and computing fill-reducing orderings of sparse matrices. The underlying algorithms used by METIS are based on the state-of-the-art multilevel paradigm that has been shown to produce high quality results and scale to very large problems." 
* <a class="http" href="http://amalfi.dis.unina.it/graph/">"The Graph Database"</a> 
* <a class="http" href="http://research.microsoft.com/users/lovasz/geommain.pdf">Paper</a>: Geometric Representations of Graphs, by Lásló Lovász 
* <a class="http" href="http://web.cs.ualberta.ca/~joe/Coloring/">Joe Culberson</a>'s graph coloring software 
* <a class="http" href="http://www.win.tue.nl/~aeb/graphs/index.html">Andries Brouwer</a>'s collection of various graphs. 