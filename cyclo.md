

# Cyclotomic Linear Algebra

This wiki page is about implementing optimized algorithms for linear algebra over cyclotomic fields. 

This <a class="https" href="https://trac.sagemath.org/ticket/3042">trac ticket</a> has relevant code.  

<a href="cyclo/jen.pdf">This short PDF paper by Jen Balakrishnan and William Stein describes the basic idea behind reducing and lifting from mod p to characteristic 0</a> 


## Some specific tasks

1. <a href="/cyclo/benchmark">Benchmarking</a> 
1. (mostly done --works) <a href="/cyclo/charpoly">Come up with a fast characteristic polynomial algorithm over cyclotomic fields.</a>  
1. <a href="/cyclo/matrix_dense_nf">Implement an optimized matrix type Matrix_dense_number_field for matrices with entries in a number field.</a> 
1. Implement a class Matrix_dense_cyclotomic_field that derives from the above class. 
1. Make very fast random_element methods for those matrix types.   This will be needed for testing out our algorithms easily, and for tuning them. 
1. <a href="/cyclo/multipy">Implement multimodular matrix multiplication.</a> This will reduce to doing a bunch of multiplies over GF(p) for many primes p. 
1. <a href="/cyclo/padicsolver">Implement p-adic solver with cyclotomic p-adic reconstruction algorithm.</a> 
1. Implement echelon form using solver algorithm (just like we have for QQ). 
1. Maybe implement multimodular echelon form.   Might as well.  
1. Implement decomposition. 
1. Sparse multimodular echelon form (this is a case where multimodular makes good sense). This will be needed for presentations of weight 2 modular symbols over cyclotomic fields.  