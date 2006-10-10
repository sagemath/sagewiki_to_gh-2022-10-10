[[TableOfContents]]

== Introduction ==

The SAGE Graph Theory Project aims to implement Graph objects and algorithms in ["SAGE"].

The main people working on this project are Emily Kirkman and Robert Miller.

== Survey of existing Graph Theory software ==

=== Software included with SAGE ===
==== GAP ====
==== Maxima ====
==== Singular ====
==== PARI, MWRANK, NTL ====
==== Matplotlib ====
==== GSL, Numeric ====

=== Software included with SAGE as optional ===
==== GRAPE ====
   says David Joyner, "An official GAP package which must be installed separately. GRAPE is primarily designed for the construction and analysis of finite graphs related to groups, designs, and geometries. It has about 50 graph-theoretical functions written in GAP. However, 6 of these call (directly or indirectly) B. D. McKay's program nauty."
===== Nauty =====
       [http://cs.anu.edu.au/~bdm/nauty/ Link]
         a. Benchmark program
         a. Source posted, but no public license - should contact Brendan !McKay
         a. Written in portable subset of C, python wrapper already in existence (see pynauty)
         a. Both MAGMA and GRAPE (GAP package) use nauty
            1. '''Construction'''
               includes gtools - quick generators for non-isomorphic graphs, also generates bipartite graphs and digraphs
            1. '''Invariants'''
               canonical labelling
            1. '''Morphisms/Group Actions'''
               Computing automorphism groups of graphs and digraphs, isomorphism testing

=== Software SAGE interfaces with (but does not include) ===

==== Magma ====
      [http://magma.maths.usyd.edu.au/magma/htmlhelp/text1452.htm Link]
         1. '''Representation'''
          . Sparse support; function computes memory requirement for graph with n verts and m edges; consists of graph itself, vertex set, and edge set
         1. '''Storage/Pipes'''
          . one function opens either file or stream, files stored in [http://cs.anu.edu.au/~bdm/data/formats.html Graph6 and Sparse6 format]
         1. '''Construction'''
          . From matrix; from edge tuples; from vertex neighbors; from edges of other graphs; subgraphs; quotient graphs; incremental construction; complement; contraction; breaking edges; line graph; switch nbrs for non-nbrs of a vertex; disjoint unions, edge unions; complete unions; cartesian, lexicographic and tensor products; n-th power (same vert set, incident iff dist $$\leq$$ n); graph $\leftrightarrow$ digraph; Cayley graph constructor; Schreier graph constructor; Orbital graph constructor; Closure graph constructor (given G, add edges to make G invariant under a given permutation group); Paley graphs and tournaments; graphs from incidence structures; converse(reverse digraph); n-th odd graph; n-th triangular graph; n-th square lattice graph; Clebsch, Shrikhande, Gewirtz and Chang graphs;
         1. '''Decorations''' (Coloring, Weight, Flow, etc.)
          . Vertices have labels only; Edges have labels, capacity(non-negative integers, loops=0) and weights(totally ordered ring);
         1. '''Invariants'''
          . #verts, #edges; characteristic polynomial; spectrum
         1. '''Predicates'''
          . 2 verts incident, 2 edges incident, 1 vertex and 1 edge incident, subgraph, bipartite, complete, Eulerian, tree, forest, empty, null, path, polygon, regular
         1. '''Subgraphs and Subsets'''
          . has k-clique, clique number, all cliques, maximum clique ([http://magma.maths.usyd.edu.au/magma/htmlhelp/text1473.htm "When comparing both algorithms in the situation where the problem is to find a maximum clique one observes that in general BranchAndBound does better. However Dynamic outperforms BranchAndBound when the graphs under consideration are large (more then 400 vertices) random graphs with high density (larger than 0.5%). So far, it can only be said that the comparative behaviour of both algorithms is highly dependent on the structure of the graphs."]), independent sets and number,
         1. '''Adjacency, etc.'''
          . (in- & out-) degree, degree vector, valence (if regular), vertex nbrs, edge nbrs, bipartition, dominating sets
         1. '''Connectivity'''
          . (strongly) connected, components, separable, 2-connected, 2-components, triconnectivity ([http://magma.maths.usyd.edu.au/magma/htmlhelp/text1466.htm "The linear-time triconnectivity algorithm by Hopcroft and Tarjan (HT73) has been implemented with corrections of our own and from C. Gutwenger and P. Mutzel (GM01). This algorithm requires that the graph has a sparse representation."]), k-vertex connectivity, vertex separator, k-edge connectivity, edge separator
         1. '''Paths, etc.'''
          . distance and geodesic, diameter and corr. path, ball and sphere, distance partition, equitable partition, girth and corr. cycle
         1. '''Trees, etc.'''
          . spanning tree, breadth first and depth first searches, rooted, root, parent, vertex paths
         1. '''Colorings'''(see also Decorations)
          . chromatic number and index, optimal vertex and edge colorings, chromatic polynomial
         1. '''Optimization'''
          . Max flow min cut (2 algorithms: [http://magma.maths.usyd.edu.au/magma/htmlhelp/text1499.htm#15274 Dinic & push-relabel]), maximum matching for bipartite,
         1. '''Embedding''' (Planar graphs, etc.)
          . planarity, Kuratowski subgraphs, faces of a planar graph, embedding info as orientation of edges from a vertex
         1. '''Algebra'''
          . adjacency matrix, distance matrix, incidence matrix, intersection matrix
         1. '''Morphisms/Group Actions'''
          . interfaces ''nauty''
         1. '''Symmetry'''
          . vertex, edge and distance transitivity; orbit partitions; primitivity; symmetric; distance regularity and intersection array
         1. '''Geometry'''
          . Go back and forth between incidence and coset geometries and their graphs; finite planes;
         1. '''Generation/Random Graphs'''
          . interfaces ''nauty''
         1. '''Database'''
          . database interface, strongly regular graph DB, random graph from DB, slick implementation of for loops ("for G in D do ... end for;")

==== Maple ====
       Contains the '''networks''' package, which includes:
         1. '''Representation'''
          . ?
         1. '''Construction'''
          . new (0 verts), void (n verts, 0 edges), incremental construction, complement, complete, contraction, hypercubes, cycle, petersen, cube, icosahedron, dodecahedron, octahedron, tetrahedron, simplify a multigraph, union, subgraphs,
         1. '''Decorations''' (Coloring, Weight, Flow, etc.)
          . vertex weights default to 0, edge weights default to 1 (can be any valid maple expression)
         1. '''Invariants'''
          . characteristic polynomial
         1. '''Adjacency, etc.'''
          . in-nbrs(arrivals), out-nbrs(departures), degree sequence, endpoints, graphical ("tests whether intlist is the degree sequence of a simple graph"), edge-nbrs, vert-nbrs, in-degree, out-degree, max & min degree, edge span & span polynomial ("The span polynomial in variable p gives the probability that G is spanning when each edge operates with probability p.", "When G is connected, this is the all-terminal reliability polynomial of G, and gives the probability that G is connected when each edge operates independently with probability p."),
         1. '''Connectivity'''
          . components, edge-connectivity, 2-components, count minimal cutsets, rank ("The rank of an edgeset e is the number of vertices of G minus the number of components of the subgraph induced by e."), Whitney rank polynomial ("The rank polynomial is a sum over all subgraphs H of G of $x^{(rank(G) - rank(H))} y^{corank(H)}$."),
         1. '''Paths, etc.'''
          . diameter, fundcyc ("Given a subset e of edges forming a unicyclic subgraph of a graph G, the edges forming the unique cycle are returned as a set. It is assumed that only one cycle is present."), girth, find path from a to b,
         1. '''Trees, etc.'''
          . ancestor, daughter, count spanning trees (Kirchoff Matrix-Tree theorem), cycle base ("A spanning tree is found, and fundcyc() is then used to find all fundamental cycles with respect to this tree. They are returned as a set of cycles with each cycle being represented by a set of edges."), edge disjoint spanning tree, shortest path spanning tree, min weight spanning tree, Tutte polynomial ("The Tutte polynomial is a sum over all maximal forests H of G of $t^{ia(H)} z^{ea(H)}$ where $ia(H)$ is the internal activity of H and $ea(H)$ is the external activity of H.")
         1. '''Colorings'''
          . chromatic polynomial,
         1. '''Optimization'''
          . maximum flow (flow), Dinic algorithm for max flow (see Magma), flow polynomial ("The flow polynomial in variable h gives the number of nowhere-zero flows on G with edge labels chosen from integers modulo h."), minimum cut,
         1. '''Embedding''' (Planar graphs, etc.)
          . isplanar,
         1. '''Algebra'''
          . acycpoly ("The acyclicity polynomial in variable p gives the probability that G is acyclic when each edge operates with probability p."), adjacency matrix, distance table (allpairs- optional table gives shortest path trees, rooted at each vertex), incidence matrix,
         1. '''Generation/Random Graphs'''
          . random graphs- specify #verts and prob of edge occuring, or #verts and #edges
         1. '''Database'''
          . show command shows a table of known information about a network
         1. '''Visualization'''
          . plots graphs either in lines (Linear) or in concentric circles (Concentric), ability to give specific graphs specific plotting procedures, 3d plots ("The location of the vertices of the graph is determined as follows. Let A be the adjacency matrix of G and let u, v and w be three eigenvectors of A with corresponding second, third, and fourth largest eigenvalue in absolute value. Then the (x,y,z) coordinates of the ith vertex of G is (u[i],v[i],w[i])."; "Sometimes other symmetries in the graph can be seen by using other eigenvectors. If the optional argument eigenvectors = [e1, e2, e3] is specified, where e1, e2, and e3 are vertex numbers (integers from 1 through the number of vertices), the eigenvectors corresponding to the eigenvalues of these relative magnitudes are used.")

==== Mathematica ====
      [http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/ GraphPlot]([http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotReferences.html biblio]) is built-in: also a few functions for "applications" (?); designed to work well with large graphs; also supports graphs from ''Combinatorica''
         1. '''Representation'''
          . graph simply ''is'' an adjacency matrix (could be sparse), or a list of rules (e.g. {1->2, 2->3, 3->4, 4->1})
         1. '''Construction'''
          . N/A (see representation)
         1. '''Predicates'''
          . vertex list (apparently only nontrivial when graph is a rule list, see representation)
         1. '''Subgraphs and Subsets'''
          . maximal independent vertex sets and edge sets,
         1. '''Connectivity'''
          . list strongly connected components,
         1. '''Paths, etc.'''
          . distance, pseudo-diameter (see [http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotPseudoDiameter.html Documentation])
         1. '''Trees, etc.'''
          . [http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotTreePlot.html TreePlot] uses the layered drawing algorithm, implements more control:
         1. '''Optimization'''
          . maximum matching for bipartite, [http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotMinCut.html min cut] problem
         1. '''Visualization'''
          . [http://documents.wolfram.com/mathematica/Built-inFunctions/AdvancedDocumentation/DiscreteMath/GraphPlot/AdvancedDocumentationGraphPlotGraphPlotAndGraphPlot3D.html ALGORITHMS] include spring model, spring-electrical model, high-dimensional embedding (random seeds can be given for spring models, link includes options for the spring models); tree algorithms include radial drawing, layered drawing (see G. Di Battista, P. Eades, R. Tamassia, and I. G. Tollis, Algorithms for the Visualization of Graphs, Prentice-Hall, 1999.); vertex styles and colors, edge styles and colors; function to return coordinates without drawing

=== Extensions of software that SAGE interfaces with ===
==== Magma ====
==== Maple ====
         a. [http://www.math.uga.edu/~mbaker/REU/maple/laplacian-guide.html 'laplacian.mpl']; [http://www.fmf.uni-lj.si/~mohar/Papers/Spec.pdf here] is a paper on the Laplacian Spectrum
            1. '''Storage/Pipes'''
             . creation of certain spreadsheets, such as known eigenvalues and eigenvalues of increasing subdivisions of the graph
            1. '''Construction'''
             . banana graphs, star graphs, bouquets and flowers, hypercubes, supercirc (see docs), subdivide edges into n edges, contract, assign directions (apparently in a random way)
            1. '''Decorations''' (Coloring, Weight, Flow, etc.)
             . normalilze (so sum of weights = 1)
            1. '''Algebra'''
             . discrete laplacian matrix (this function may fight with the built-in laplacian in 'linalg'), compute its eigenvalues given a measure,
            1. '''Topology'''
             . (laplacian matrix), effective resistance between vertices, discrete and continuous canonical measure [http://www.math.uga.edu/~mbaker/REU/tex/canonical.pdf#search=%22graph%20tau%22 an unrelated explanation?] and tau (also, taushorten "Investigates the behavior of tau as an edge is shortened"), discrete dx measure
         a. [http://www.cecm.sfu.ca/CAG/papers/GTpaper.pdf GraphTheory] and [http://www.cecm.sfu.ca/CAG/papers/GT2006.pdf Part II] of the paper (haven't yet found the actual package...)
==== Mathematica ====
         a. [http://www.combinatorica.com/ Combinatorica] - for a list of functions, see [http://www.cs.sunysb.edu/~skiena/combinatorica/help.pdf help.pdf], page 13-14, 18, 21, 23, 25 - for a [http://www.amazon.com/exec/obidos/ASIN/0521806860/ref=nosim/thealgorithmrepo/ book]

=== Software that SAGE can now include as is (not as an optional package...) ===
==== Gato ====
      [http://gato.sourceforge.net/ Link]
      A tool that animates algorithms, perhaps SAGE cannot actually include right now as is, but license is LGPL, and it requires Python and Tcl/Tk: would be good for educational purposes
       . seems that you can write your algorithm in one window and watch it go, supports 3d
==== NetworkX ====
      [https://networkx.lanl.gov/ Link]
      Seems pretty comprehensive, released under "GNU Lesser General Public License", works on Python $\geq$ 2.3, interfaces with Matplotlib, Pygraphviz, Graphviz, Pydot, numpy or Numeric, Ipython, !SciPy, PyGSL, sAsync, PyYAML: EXCELLENT documentation with links to source code from each function descriptor (TODO: make sense of networkx.utils, networkx.threshold, networkx.generators.small, networkx.me, networkx.mixing, networkx.search_class, networkx.tests, )
         1. '''Representation'''
          * in Graph and !DiGraph, "data structures based on an adjacency list implemented as a node-centric dictionary of dictionaries. The dictionary contains keys corresponding to the nodes and the values are dictionaries of neighboring node keys with the value None (the Python None type). This allows fast addition, deletion and lookup of nodes and neighbors in large graphs"
          * "The XGraph and XDiGraph classes are extensions of the Graph and !DiGraph classes... The key difference is that an XGraph edge is a 3-tuple e=(n1,n2,x), representing an undirected edge between nodes n1 and n2 that is decorated with the object x. Here n1 and n2 are (hashable) node objects and x is a (not necessarily hashable) edge object. Since the edge is undirected, edge (n1,n2,x) is equivalent to edge (n2,n1,x). An XDiGraph edge is a similar 3-tuple e=(n1,n2,x), with the additional property of directedness. I.e. e=(n1,n2,x) is a directed edge from n1 to n2 decorated with the object x, and is not equivalent to the edge (n2,n1,x). Whether a graph or digraph allow self-loops or multiple edges is determined at the time of object instantiation via specifying the parameters selfloops=True/False and multiedges=True/False."
         1. '''Storage/Pipes''' (see networkx.io)
          . 'convert' module converts NetworkX graphs to and from other formats: python dict of lists, python dict of dicts, numpy matrices, scipy sparse matrices, pygraphviz; works with python pickling; Import and export networkx networks to dot format using pydot or pygraphviz,
         1. '''Construction'''
          . add path, add cycle, incremental construction, subgraphs, copy, directed $\leftrightarrow$ undirected, balanced r-tree of height h, barbell graph, complete graph, complete bipartite, circular ladder graph, cycle, hierarchically constructed Dorogovtsev-Goltsev-Mendes graph, empty graph, grid graph, n-dim grid graph, hypercube, ladder graph, lollipop graph ($K_n \# P_m$), null graph (#verts = 0), path graph ($P_n$), star graph, trivial graph (#verts = 1), wheel graph, (disjoint) union, cartesian product, composition, complement, empty-copy, relabel nodes by mapping or functions, convert labels to integers
         1. '''Invariants'''
          . density,
         1. '''Predicates'''
          . standard predicates, directed acyclic,
         1. '''Subgraphs and Subsets'''
          . find cliques (Bron & Kerbosch), maximal and bipartite clique graph constructor, project bipartite onto one part (connected if they share a common Top/Bottom Node), clique number and number of maximal cliques, find cliques containing specified node, maximum locally (k,l) connected subgraph
         1. '''Adjacency, etc.'''
          . neighbors, degree, valid degree sequence?, create degree sequence, double edge swap,
         1. '''Connectivity'''
          . find k-cores of a graph, is (k,l) connected, (number) components,
         1. '''Paths, etc.'''
          . eccentricity, diameter, periphery, radius, center, shortest path (length & many variants, including Dijkstra, Floyd-Warshall), dictionary of all shortest path lengths, list of vertices in topological sort order, predecessors,
         1. '''Trees, etc.'''
          . tree class, rooted/directed/forests (experimental classes)
         1. '''Optimization'''
          . clustering: number of triangles for given nodes, clustering coefficients (fraction of triads, which is edge vertex edge, that are triangles), transitivity (3*triangles/triads); breadth-first and depth-first search, Helper queues for use in graph searching; LIFO: Last in first out queue (stack), FIFO: First in first out queue, Priority(fcn): Priority queue with items are sorted by fcn, Random: Random queue, q.append(item) -- add an item to the queue, q.extend(items) -- equivalent to: for item in items: q.append(item), q.pop() -- return the top item from the queue, len(q) -- number of items in q (also q.__len());
         1. '''Algebra'''
          . adjacency matrix, (normalized) Laplacian,
         1. '''Morphisms/Group Actions'''
          . non-isomorphic checker (does not check isomorphism; only conclusive in the not-isomorphic direction), three versions: fast, faster and fastest
         1. '''Symmetry'''
          . betweenness, edge, degree, and closeness centrality
         1. '''Generation/Random Graphs'''
          . random bipartite graph from two degree sequences (four versions: including regular, 'reverse' and alternating Havel-Hakimi style), bipartite preferential attachment, bipartite with fixed degree, projection of bipartite onto selected nodes, random pseudograph with given degree sequence, random graph with expected degree given, Havel-Hakimi for simple graphs, tree with given degree sequence, generate a graph with given degree sequence maximizing s-metric, s-metric (the sum of the product $deg(u)*deg(v)$ for every edge u-v in G (Reference unpublished li-2005, author Lun Li and David Alderson and John C.)), digraphs: growing network, growing network with redirection or copying; random geometric graph in the unit cube, $G_{n,p}$ Erdös-Rényi (two versions, normal and fast), Newman-Watts-Strogatz small world graph ("First create a ring over n nodes. Then each node in the ring is connected with its k nearest neighbors. Then shortcuts are created by adding new edges as follows: for each edge u-v in the underlying "n-ring with k nearest neighbors"; with probability p add a new edge u-w with randomly-chosen existing node w. In contrast with watts_strogatz_graph(), no edges are removed."), Watts-Strogatz small world graph ("First create a ring over n nodes. Then each node in the ring is connected with its k nearest neighbors. Then shortcuts are created by rewiring existing edges as follows: for each edge u-v in the underlying "n-ring with k nearest neighbors"; with probability p replace u-v with a new edge u-w with randomly-chosen existing node w. In contrast with newman_watts_strogatz_graph(), the random rewiring does not increase the number of edges."), $G_{n,d}$ ("Return a random regular graph of n nodes each with degree d... n*d must be even"), Barabási-Albert preferential attachment ("A graph of n nodes is grown by attaching new nodes each with m edges that are preferentially attached to existing nodes with high degree."), "Holme and Kim algorithm for growing graphs with powerlaw degree distribution and approximate average clustering" (see P. Holme and B. J. Kim, "Growing scale-free networks with tunable clustering", Phys. Rev. E 2002 vol 65 #2), random lobster ("A caterpillar is a tree that reduces to a path graph when pruning all leaf nodes (p2=0). A lobster is a tree that reduces to a caterpillar when pruning all leaf nodes."), random shell graph (see networkx.generators.random_graphs), tree with given powerlaw distribution ("A trial powerlaw degree sequence is chosen and then elements are swapped with new elements from a powerlaw distribution until the sequence makes a tree (#edges=#nodes-1).") or its degree sequence,
         1. '''Database'''
          . atlas function returns all graphs on up to 7 vertices (see "An Atlas of Graphs" by Ronald C. Read and Robin J. Wilson, Oxford University Press, 1998.)
         1. '''Visualization'''
          * layout: circular, shell, random, spring model, spectral layout, Power Iteration method to find smallest eigenvectors of Laplacian(G)
          * intervace to pygraphviz
          * Draw networks with matplotlib (pylab)
          * Draw networks in 3d with [http://www.vtk.org/ vtk]

=== Software that SAGE can now include as optional ===
      (or maybe interface with)

==== GeoSteiner ====
    [http://www.diku.dk/geosteiner/ Link]
        1. ''' Construction'''
	A set of points in different formats
	1. '''Trees, etc.'''
	. Euclidean Steiner Tree Problem in the Plane
        . Rectilinear Steiner Tree Problem in the Plane
	. Minimum Spanning Tree Problem in Hypergraphs

http://www.diku.dk/geosteiner/LICENSE

==== Very_nauty ====
       [http://keithbriggs.info/very_nauty.html Link]
	 a. designed to be compatible with nauty
         a. C library
         1. '''Subgraphs and Subsets'''
            cliques in G(n,p), # of graphs on n nodes with chromatic number k, # of graphs on n nodes with clique number k, new data on chromatic number and cliqe number, Lambert's w function
==== GraphViz ====
       [http://www.graphviz.org Link]
         a. open source, Common Public License Version 1.0
         a. poorly documented, at least on the web
            1. '''Visualization'''
               DOT makes "hierarchical" drawings of directed graphs.  Algorithm aims edges in same direction and attempts to not cross edges and reduce length.
               NEATO uses spring method, via the Kamada-Kawai algorithm (statistical multi-dimensional scaling)
               fdp also uses the spring model, via the Fruchterman-Reingold heuristic (handles larger graphs and undirected, clustered graphs)
==== plantri/fullgen ====
      [http://cs.anu.edu.au/people/bdm/plantri/ Link] written in C, tested mainly on UNIX, weird license ('free for all purposes other than sale for profit. However, they remain subject to our copyright and are not "public domain".'): interesting note, co-authored by Brendan !McKay, of ''nauty''
         1. '''Generation/Random Graphs'''
          * plantri: "exactly one member of each isomorphism class is output without the need for storing them. The speed of generation is more than 100,000 graphs per second in most cases, so extremely large classes of graph can be exhaustively listed.", classes include planar triangulations, quadrangulations, simple graphs, triangulations of a disc, planar cubic and quartic graphs
          * fullgen generates fullerenes
          * see also [http://hep.physics.indiana.edu/~tsulanke/graphs/surftri/ surftri], which generates triangulations of surfaces of higher genus

=== Software that is incompatible with SAGE but still useful ===
      (e.g. web-based applets)
==== GRIN ====
         [http://www.geocities.com/pechv_ru/ Link]
	   a. for windows only
	   a. not open-source, but free download
	      1. '''Connectivity'''
	         bridges and cutpoints
	      1. '''Paths, etc.'''
	         Paths and Cycles (Eulerian and Hamiltonian), Shortest Paths, Max Capacity Path, K Shortest paths, Critical path
	      1. '''Trees, etc.'''
	         Minimal spanning tree
	      1. '''Optimization'''
	         Max Flow
	      1. '''Morphisms/Group Actions'''
	         Automorphism group
            1. '''Topology'''
	         Metrics of the graph Density, Undensity and so on...)
            1. '''Visualization'''
               2d only, Clipboard edit, decomposition of edges, resize
==== DSATUR ====
      [http://prolland.free.fr/works/research/dsatphp/dsat.html Link], a program for computing graph colorings, algorithm [http://prolland.free.fr/works/research/dsat/index.html#anchor38034 documentation] in French, input in [http://mat.gsia.cmu.edu/COLOR/general/ccformat.ps DIMACS] format, [http://prolland.free.fr/works/research/dsatphp/dsat.txt source code]
==== LEDA ====
      I. [http://www.alogorithmic-solutions.com Link]
         a. Commercial, but supposedly fast
         1. '''Morphisms / Group Actions'''
            Module graph and subgraph isomorphisms
==== LINK ====
      I. [http://dimacs.rutgers.edu/~berryj/LINK.html (hyper)link]
         a. Free, but not open source
         a. C++ libraries
==== ABACUS (A Branch-And-!CUt System) ====
      [http://www.informatik.uni-koeln.de/abacus/ Link]
         a. open source, GNU Lesser GPL v2.1
         a. C++ libraries
         1. '''Optimization'''
            Branch-and-Bound algorithm, linear programming relaxations allow for dynamic generation of cutting planes or columns)

=== Algorithm descriptions for specific problems ===
==== InterTools ====
      [http://rtm.science.unitn.it/intertools/ InterTools]
	   1. Maximum Clique in Graphs (MAX-CLIQUE)
	   1. Graph Partitioning (equicut)
	   1. Quadratic Assignment Problem (QAP)
==== GraphBase ====
      [http://www.cs.sunysb.edu/~algorith/implement/graphbase/implement.shtml Standford Link]
         1. '''Generations/Random Graphs'''
            a. Generating Graphs
            a. Random Number Generation
         1. '''Database'''
            a. Graph Data Structures
         1. '''Trees, etc.'''
            a. Minimum Spanning Tree
         1. '''Paths, etc.'''
            a. Hamiltonian Cycle
         1. '''Optimization'''
            a. Matching
            a. Shortest Path
         1. '''Connectivity'''
            a. Edge and Vertex Connectivity
            a. Connected Components
         1. '''Topology'''
            a. Topological Sorting
         1. '''Morphisms/Group Actions'''
            a. Generating Permutations
==== Groups & Graphs ====
      [http://www.paddle.mb.ca/G&G/G&G.html Link]
         a. free download, but no mention of source or license
         a. no internet doc's
         a. links out to papers on algorithms (references Brendan !McKay's ''Practical Graph Isomorphism'' paper)
         a. Algorithms:
            1. '''Morphisms/Group Actions'''
               a. Graph Isomorphism
               a. Permutations Groups
            1. '''Paths, etc.'''
               a. Hamilton Cycles
            1. '''Visualization'''
               a. Draw Symmetric
=== Apparently useless / and/or misc. / and/or etc. ===
==== nv2d ====
        [http://web.mit.edu/bshi/Public/nv2d/ link]
		1. '''Visualization'''
		. Java visualization, designed to run in a browser
		. Spring model visualization
		1. '''Construction'''
		. Data from GraphML, Nfile
==== Otter ====
        [http://www.caida.org/tools/utilities/ Link]
        Defunct
==== Gravisto ====
        [http://gravisto.fmi.uni-passau.de/ Link]
==== JIGGLE ====

	[http://www.cs.cmu.edu/~quixote/ Link]
		1. '''Visualization'''
		.Java visualization applet, poor interface, minimal, source available
==== RoxGT ====
        [http://roxgt.sourceforge.net Link]
		Claims to be a complete extensible graph framework, written in
		Java. No documentation.
==== INGRID ====
        [http://ingrid.ldgo.columbia.edu/ Link]
		Seems geared for climate modeling. Written in PostScript (???)
==== METIS ====
        [http://glaros.dtc.umn.edu/gkhome/views/metis/ Link]
		1. '''Paths'''
		. Claims to be fast at partitioning using various algorithms
		. Fill-reducing ordering algorithms on sparse matrix representations, running a fill-reducing ordering on a matrix increases algorithm efficiency.
                . [http://www.dtc.umn.edu/publications/reports/2006_03.pdf Documentation here]

==== Algolib ====
        [http://algo.inria.fr/libraries/software.html Link]
		Appears to be for general combinatorics (gen. functions, mostly) Doesn't seem to do graph theory.
==== ACE ====
        [http://phalanstere.univ-mlv.fr/~ace/ACE/3.0/ACE.html Link]
		MAPLE Package for computer algebra and combinatorics. No longer being maintained.
==== GOBLIN ====
        [http://www.math.uni-augsburg.de/~fremuth/goblin.html Link]
		LGPL C++ library with Tcl/Tk interface
		1. '''Representation'''
		. Adjacency matrix or incidence list
		1. '''Storage'''
		. Has its own format
		1. '''Optimization'''
		. "Focuses on" combinatorical optimization algorithms, especially network flow and load balancing
==== JGraphEd ====
        [http://www.jharris.ca/JGraphEd/ Link]
                Java-based graph editor, entirely GUI, with very basic interface. Good example of a bad interactive environment.

==== JGraphEd ====
        [http://www.jharris.ca/JGraphEd/ Link], Java-based graph editor, entirely GUI, with very basic interface. Good example of a bad interactive environment.

==== Scalable Libraries for Graph Partitioning ====
         [http://www.npac.syr.edu/NPAC1/PUB/ranka/part/part.html Link], no software yet, but good references on page: "Efficient methods for graph partitioning and incremental graph partitioning are important for parallelization of a large number of unstructured and/or adaptive applications."

== Functionality categories ==
         1. '''Representation'''
         1. '''Storage/Pipes'''
         1. '''Construction'''
         1. '''Decorations''' (Coloring, Weight, Flow, etc.)
         1. '''Invariants'''
         1. '''Predicates'''
         1. '''Subgraphs and Subsets'''
         1. '''Adjacency, etc.'''
         1. '''Connectivity'''
         1. '''Paths, etc.'''
         1. '''Trees, etc.'''
         1. '''Colorings'''
         1. '''Optimization'''
         1. '''Embedding''' (Planar graphs, etc.)
         1. '''Algebra'''
         1. '''Morphisms/Group Actions'''
         1. '''Symmetry'''
         1. '''Geometry'''
         1. '''Topology'''
         1. '''Generation/Random Graphs'''
         1. '''Database'''
         1. '''Visualization'''
