
* _Goal_ -- Write a specialized class for matrices over Zmod(n) for n > 46341  
* _Type_ -- speed improvements 
* _Priority_ -- High 
* _Difficulty_ -- Medium 
* _Prerequisites_ -- None 
* _Background_ -- Cython, take a look at `sage.matrix.matrix_modn_dense` and `sage.matrix.matrix_integer_dense` 
* _Contributors_ -- David Roe 
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion


## Tasks

1. Combine the implementations in `sage.matrix.matrix_modn_dense` and `sage.matrix.matrix_integer_dense` to make a matrix class that stores its entries with an array of mpz_ts, does fast in place row and column operations and supports the ability to have the base ring a Quasi-DVR (so has some support for valuations of elements). 
1. Optimize determinants!  In Magma, determinants for matrices over Zmod(n) are much faster than matrices over ZZ.  In Sage, we need to convert to a matrix over ZZ because it's much slower! 