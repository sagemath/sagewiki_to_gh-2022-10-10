The SAGE Graph Theory Project aims to implement Graph objects and algorithms in [SAGE]

The following is a survey of existing Graph Theory software.
{{{
  <ul>
    <li>Software included with SAGE</li>
      <ol>
        <li>GAP</li>
        <li>Maxima</li>
        <li>Singular</li>
        <li>PARI, MWRANK, NTL</li>
        <li>Matplotlib</li>
        <li>GSL, Numeric</li>
      </ol>
    <li>Software SAGE interfaces with (but does not include)</li>
      <ol>
        <li>Gnuplot</li>
        <li>KASH</li>
        <li><a href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1452.htm">Magma</a></li>
          <ul>
            <li><b>Representation</b></li>Sparse support; function computes memory requirement for graph with n verts and m edges; consists of graph itself, vertex set, and edge set
            <li><b>Storage/Pipes</b></li>one function opens either file or stream, files stored in <a href="http://cs.anu.edu.au/~bdm/data/formats.html">Graph6 and Sparse6 format</a>
            <li><b>Construction</b></li>From matrix; from edge tuples; from vertex neighbors; from edges of other graphs; subgraphs; quotient graphs; incremental construction; complement; contraction; breaking edges; line graph; switch nbrs for non-nbrs of a vertex; disjoint unions, edge unions; complete unions; cartesian, lexicographic and tensor products; n-th power (same vert set, incident iff dist <= n); graph <-> digraph; Cayley graph constructor; Schreier graph constructor; Orbital graph constructor; Closure graph constructor (given G, add edges to make G invariant under a given permutation group); Paley graphs and tournaments; graphs from incidence structures; converse(reverse digraph); n-th odd graph; n-th triangular graph; n-th square lattice graph; Clebsch, Shrikhande, Gewirtz and Chang graphs;
            <li><b>Decorations (Coloring, Weight, Flow, etc.)</b></li>Vertices have labels only; Edges have labels, capacity(non-negative integers, loops=0) and weights(totally ordered ring);
            <li><b>Invariants</b></li>#verts, #edges; characteristic polynomial; spectrum
            <li><b>Predicates</b></li>2 verts incident, 2 edges incident, 1 vertex and 1 edge incident, subgraph, bipartite, complete, Eulerian, tree, forest, empty, null, path, polygon, regular
            <li><b>Subgraphs and Subsets</b></li>has k-clique, clique number, all cliques, maximum clique (<a href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1473.htm">"When comparing both algorithms in the situation where the problem is to find a maximum clique one observes that in general BranchAndBound does better. However Dynamic outperforms BranchAndBound when the graphs under consideration are large (more then 400 vertices) random graphs with high density (larger than 0.5%). So far, it can only be said that the comparative behaviour of both algorithms is highly dependent on the structure of the graphs."</a>), independent sets and number, 
            <li><b>Adjacency, etc.</b></li>(in- & out-) degree, degree vector, valence (if regular), vertex nbrs, edge nbrs, bipartition, dominating sets
            <li><b>Connectivity</b></li>(strongly) connected, components, separable, 2-connected, 2-components, triconnectivity (<a href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1466.htm">"The linear-time triconnectivity algorithm by Hopcroft and Tarjan [HT73] has been implemented with corrections of our own and from C. Gutwenger and P. Mutzel [GM01]. This algorithm requires that the graph has a sparse representation."</a>), k-vertex connectivity, vertex separator, k-edge connectivity, edge separator
            <li><b>Paths, etc.</b></li>distance and geodesic, diameter and corr. path, ball and sphere, distance partition, equitable partition, girth and corr. cycle
            <li><b>Trees, etc.</b></li>spanning tree, breadth first and depth first searches, rooted, root, parent, vertex paths
            <li><b>Colorings</b>(see also Decorations)</li>chromatic number and index, optimal vertex and edge colorings, chromatic polynomial
            <li><b>Optimization</b></li>Max flow min cut (2 algorithms: <a href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text1499.htm#15274">Dinic & push-relabel</a>), maximum matching for bipartite, 
            <li><b>Embedding</b> (Planar graphs, etc.)</li>planarity, Kuratowski subgraphs, faces of a planar graph, embedding info as orientation of edges from a vertex
            <li><b>Algebra</b></li>adjacency matrix, distance matrix, incidence matrix, intersection matrix
            <li><b>Morphisms/Group Actions</b></li>interfaces <i>nauty</i>
            <li><b>Symmetry</b></li>vertex, edge and distance transitivity; orbit partitions; primitivity; symmetric; distance regularity and intersection array
            <li><b>Geometry</b></li>Go back and forth between incidence and coset geometries and their graphs; finite planes;
            <li><b>Generation/Random Graphs</b></li>interfaces <i>nauty</i>
            <li><b>Database</b></li>database interface, strongly regular graph DB, random graph from DB, slick implementation of for loops ("for G in D do ... end for;")
          </ul>
        <li>Maple</li>
        <li>Mathematica</li>
        <li>mwrank</li>
        <li>Octave</li>
        <li>Tachyon Ray Tracer</li>
      </ol>
    <li>Software that SAGE can now include as is</li>
    <li>Software that SAGE should include (or maybe interface with), pending stuff (e.g. licensing)</li>
    <li>Software that is incompatible with SAGE but still useful</li>
  </ul>

  <p>Functionality categories:
          <ol>
            <li><b>Representation</b></li>
            <li><b>Storage/Pipes</b></li>
            <li><b>Construction</b></li>
            <li><b>Decorations (Coloring, Weight, Flow, etc.)</b></li>
            <li><b>Invariants</b></li>
            <li><b>Predicates</b></li>
            <li><b>Subgraphs and Subsets</b></li>
            <li><b>Adjacency, etc.</b></li>
            <li><b>Connectivity</b></li>
            <li><b>Paths, etc.</b></li>
            <li><b>Trees, etc.</b></li>
            <li><b>Colorings</b>
            <li><b>Optimization</b></li>
            <li><b>Embedding</b> (Planar graphs, etc.)</li>
            <li><b>Algebra</b></li>
            <li><b>Morphisms/Group Actions</b></li>
            <li><b>Geometry</b></li>
            <li><b>Topology</b></li> Homology groups
            <li><b>Generation/Random Graphs</b></li>
            <li><b>Database</b></li>
            <li><b>Visualization</b></li>
          </ol>

}}}
