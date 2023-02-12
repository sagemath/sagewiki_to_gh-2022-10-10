

## Things I did at Sage Dev Days


### Sparse Matrix Reduction

Greg Bard and I used the new compiled digraphs to implement a preprocessing algorithm for sparse matrix reduction. The idea is to choose pivots in an order which minimize the damage (i.e. keep the matrix as sparse as possible for as long as possible). 


### Compiled Graph Backends

The new Cython graphs are now available as backends for Sage graphs. This involves speedups from 5-80 times for simple operations. 


### Opted out of silly segway jokes, etc.
