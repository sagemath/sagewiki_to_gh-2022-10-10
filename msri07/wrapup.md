= MSRI 07 WRAP UP =

1. vocabulary, taxonomy:
    * highly parallel
    * supercomputing
    * structured
    * unstructured
    * data parallel

2. MPI -- where it should fit -- build abstraction level

3. Parallel processing is finally almost here.

4. Everybody tells me to program in GASnet, but only MPI is widely available. 
    * OpenMP --???

5. MPI bindings aren't in some languages... at least a dozen attempts in Python before get it right!

6. Lesson: Focus goals to meet user's demands.  Many users have existing code and want a framework to use it in a more parallel way.

7. Parallel computing actually works !  Sometimes makes the impossible, possible.

8. How to spell Parallel.

9. No progress on interesting research in algebra, number theory at this workshop.

10. Supercomputing people are impressed and optimistic with extended precision progress.  MatrixSpace(RealField(1000),1000,2000) is useful!  Deal with catastrophic loss of precision.  I.e., "algebraic folks" are developing tools that will be useful for us.

11. If only my problem were (numerical) linear algebra, then much is available. 

12. Meataxe is a general purpose linear algebra library (++). 

13. Learned about many setbacks: hybrid mpi/threads might not work like you think it will; security issues, etc. Infinitely many choices, and not are all right. 

14. 95% of calcs in scientific computing is double precision.   Can use mpi since load balancing is easier, since 1 arithmetic operation = 1 arithmetic operation.

15. New idea: Roch's scheduling schemes.  Learn about work stealing and work-first principle.

16. I had a blocked view of what could be done.  Overall design is crucially important. 

17. BAD NEWS: Reality.  law of leaky abstractions.  Error handling.    The vendors have hid us from dealing with this (and parallel computing).  Low level issue become big effects and they bust estimates, etc. 

18. Importance of abstracting basic layers away.  E.g., if go with MPI, do it in a way that is abstracted out, and not welded to core of algorithm.

19. Number theorists haven't leveraged computing like a wide range of other communities. 

20. Changed my perception of how parallel computing fits into things.  Intellectual curiosity? NO!  Tremendously wasteful not to do it.  Free power.  Optimization technique.  Cheating. 

21. The next program I write -- I will ask, how can I make it parallel. 
 
