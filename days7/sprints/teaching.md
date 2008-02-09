## page was renamed from days7/sprints/testing
= How close is sage to ready for teaching undergrad/grad combinatorial courses =

Textbooks:

Brualdi - Introductory Combinatorics

Wilf - Zeilberger  Generating functionalogy

Stanley - Enumerative Combinatorics

CAGES Combinatorial 
http://www.math.mtu.edu/~kreher/cages.html

Knuth Graham Pataschnik - Concrete mathematics

van Lint, Wilson: A course in Combinatorics
http://www.amazon.com/Course-Combinatorics-J-van-Lint/dp/0521422604


Graphs:
 - Complete, except maybe chromatic number and Hamiltonian paths?
 - interface with graphviz: There is some functionality to interface NetworkX with graphviz and some algorithms that are implemented directly in Cython (like spring layout).  We also have a 
 - See CombinatoricaCompare for a comparison to the fairly comprehensive graph theory functionality of the Mathematica Combinatorica package.
Trees:
 - spanning trees / ... are there
   maybe they should return a Graph
 - no specific data structure for trees (orderered, ...)
   Parts could be taken from MuPAD-Combinat
 
 - basic decomposable objects / species

Posets:
 - TODO: (integrate Stembridge + MuPAD-Combinat)

Linear programming:
 - Should be there ...
 - Networks?

Coding theory:
 - Link with Guava in GAP: sage.coding.guava

Automata
 - There exist specialized things in pyrex

Classical combinatorial objects
 - Should be complete enough: partitions / ...

Generating functions
 - guess / ... (TODO: port Martin Rubey's implementation in Axiom)
