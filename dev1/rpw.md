

# what I did this week

looked into how to compute the RREF of big sparse to moderately dense matrices (especially over GF(2)): 

* learned that this is a hard problem 
* looked into Macaulay F4 implementation, because they seem to do sparse elimination. got excited/depressed about its speed for Cyclic14 over GF(2) at a certain point, then found out that implementation is buggy and generated incorrect results 
* paired down code for structured Gaussian elimination, writing wrappers for this 
* at a certain point was not sure whether it would be easier to write wrappers or rewrite the code in Python/Cython 
* compressed matrix representations (deflate() each row): didn't get very far with that, deflate() generates a significant performance impact. 
* need more experimental data of matrices that I am really interested in: generating them 