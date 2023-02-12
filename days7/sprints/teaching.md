

# How close to ready is sage for teaching undergrad/grad combinatorial courses

<a class="http" href="http://sage.math.washington.edu/home/burhanud/sd7/teaching/teaching.wav">Audio</a> 

Textbooks: 

Brualdi - Introductory Combinatorics 

Wilf - Zeilberger  Generating functionalogy 

Stanley - Enumerative Combinatorics 

CAGES Combinatorial  <a href="http://www.math.mtu.edu/~kreher/cages.html">http://www.math.mtu.edu/~kreher/cages.html</a> 

Knuth Graham Pataschnik - Concrete mathematics 

van Lint, Wilson: A course in Combinatorics <a href="http://www.amazon.com/Course-Combinatorics-J-van-Lint/dp/0521422604">http://www.amazon.com/Course-Combinatorics-J-van-Lint/dp/0521422604</a> 

Graphs: 

* - Complete, except maybe chromatic number and Hamiltonian paths? - interface with graphviz: There is some functionality to interface NetworkX with graphviz and some algorithms that are implemented directly in Cython (like spring layout).  We also have a way to interface with pygraphviz, but it's probably not as natural or as easy as it should be. - See <a href="/combinatoricacompare">CombinatoricaCompare</a> for a comparison to the fairly comprehensive graph theory functionality of the Mathematica Combinatorica package. 
Trees: 

* - spanning trees / ... are there 
      * maybe they should return a Graph (could be made to return graph by creating an empty graph and adding the returned edges). - no specific data structure for trees (orderered, ...) 
      * Parts could be taken from MuPAD-Combinat - basic decomposable objects / species 
Posets: 

* - TODO: (integrate Stembridge + MuPAD-Combinat) 
Linear programming: 

* - Should be there ... - Networks? 
Coding theory: 

* - Link with Guava in GAP: sage.coding.guava 
Automata 

* - There exist specialized things in pyrex 
Classical combinatorial objects 

* - Should be complete enough: partitions / ... 
Generating functions 

* - guess / ... (TODO: port Martin Rubey's implementation in Axiom) 