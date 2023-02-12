

## People interested

John Voight, David Roe, Xavier Caruso, Kiran Kedlaya 


## Progress

We had a discussion Monday afternoon.  The short summary: 

* We agree that objects like matrices, vectors and subspaces should be stored as an approximation and a separate precision object (rather than as a "array" of p-adic entries). 
* Things like kernels should give the maximum kernel.  If A is a singular matrix, then any ball around A contains invertible matrices.  So when a user asks for the rank we should give them the minimum rank among all matrices equivalent to the given approximation modulo the precision; if they ask for the kernel we give them the linear space containing all possible kernels. 
* Precision objects for subspaces can be thought of as balls in the tangent space to the corresponding Grassmanian. 
* We should use the templates being developed for Qp and Zp in the linear algebra context as well. 