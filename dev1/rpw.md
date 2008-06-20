what I did this week... looked into how to compute the RREF of big moderately sparse matrices (especially over GF(2)):

 * looked into Macaulay F4 implementation, got excited/depressed about its speed at a certain point, then found out that it was buggy
 * paired down code for structured Gaussian elimination, writing wrappers for this
 * at a certain point was not sure whether it would be easier to write wrappers or rewrite the code in Python/Cython
 * compressed matrix representations (deflate() each row): didn't get very far with that, deflate() generates a significant performance impact.
 * need more experimental data of matrices that we want to efficiently reduce: generating them
