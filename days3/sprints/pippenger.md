

# Tom Boothby: Implement Pippenger's Algorithm for multivariate polynomial evaluation

Pippenger's Algorithm is a method to compute a sequence of multiple products of multiple inputs.  I intend to use this to (drastically, in some cases) speed up the evaluation of multivariate polynomials over arbitrary rings. 

<a class="http" href="http://cr.yp.to/papers/pippenger.pdf">Paper</a> 

<a class="http" href="http://sage.math.washington.edu/home/boothby/sprint/pippenger.sws">Worksheet</a> with my progress so far. 

Skip to page 13.  I've already implemented: 

* Direct computation (option 1 in the paper) 
* Input partitioning (option 2) 
* Most of input clumping (option 3) 
I need: 

* Output partitioning (option 4) 
* Output clumping (excercise left to reader) 
* Some insight as to why DJB thinks that one can "quickly compute the parameter sequence given _p, q_.  I'll bring a print copy of the 3 cites from Pippenger [34-36]. 
* The general case (not certain this is a reasonable goal for the amount of time we have) 