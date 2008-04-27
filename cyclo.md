= Cyclotomic Linear Algebra =

This wiki page is about implementing optimized algorithms for linear algebra over cyclotomic fields.



== Some specific tasks ==

 1. Implement an optimized matrix type {{{Matrix_number_field}}} for matrices with entries in a number field.

 1. Implement a class {{{Matrix_cyclotomic_field}}} that derives from the above class.

 1. Make very fast random_element methods for those matrix types.   This will be needed for testing out our algorithms easily, and for tuning them.

 1. Implement multimodular matrix multiplication. This will reduce to doing a bunch of multiplies over GF(p) for many primes p.

 1. Implement p-adic solver with cyclotomic p-adic reconstruction algorithm. 

 1. Implement echelon form using solver algorithm (just like we have for QQ).

 1. Maybe implement multimodular echelon form.   Might as well. 

 1. Implement decomposition.

 1. Sparse multimodular echelon form (this is a case where multimodular makes good sense). This will be needed for presentations of weight 2 modular symbols over cyclotomic fields. 
