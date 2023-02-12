

## burcin -- what I did at Dev1

I wanted to make Sage compute **nullspaces of matrices** **over polynomial rings** in a reasonable time. 

I started off with implementing fraction free elimination over ZZ[x] and realised I really needed fast polynomial arithmetic. So 

* I made FLINT the default backend for ZZ[x] in Sage! 
I also fixed some bugs 

* in the NTL ZZ[x] wrapper and 
* conversion of matrices over polynomial rings to Magma 
* converting strings to ZZ[x,y]  
I benchmarked the performance of Maple, MMA and Magma on real world example matrices. Maple seems to perform best overall. Custom Nullspace implementations in MMA can beat Maple for some special cases. Magma is not very good at this problem. I'll post detailed results soon. 

I had a lot of discussions with Arne and Clement on how to go about solving this problem, and learned that 


## It is hard!

I completed implementing the fraction free elimination, 

* One step Bareiss elimination, with a pivoting strategy to pick the smallest degree polynomial as pivot, can (almost) catch up to Maple on small examples 
* It surprisingly performs worse than a non fraction free Gaussian elimination algoritm (with clever pivoting) in MMA 
I also tried  

* using gcd's for reduction 
* avoiding using the fraction free reduction on rows with zero entries in the pivot columns 
Ideas for new algorithms: 

* Arne's algorithm to compute adjoints over ZZ[x] 
* evaluate the matrices, solve the integer systems, interpolate to get nullspace over ZZ[x] 