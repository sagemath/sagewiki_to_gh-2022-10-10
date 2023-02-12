

## Arne Storjohann


### Algorithms for linear algebra on polynomial and integer matrices: similarities and differences

Much recent progress has been made on algorithms for exact linear algebra with matrices having entries integers or univariate polynomials with coefficients from a field.  In many cases, an algorithm for integer matrices translate in a straightforward fashion to give an algorithm for polynomial matrices, and vice versa.  In this talk I will survey some recently developed algorithmic techniques that don't extend so easily from polynomials to integers. 

A first example is high-order lifting, the basis of many asymptotically fast algorithms for polynomial matrices.  To extend high-order lifting to integer matrices required the invention of new techniques, including the shifted number system to deal with the problem of error producing carries. 

A second example is our recent, essentially optimal algorithm for computing the exact inverse of a polynomial matrix.  Although applicable to integer matrices, a simple preconditioning technique used for the polynomial case is unavailable for integer matrices, and the complexity of the integer matrix inversion algorithm remains sensitive to the numerical condition number of the input matrix. 
