

# MSRI 07 WRAP UP

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

10. Supercomputing people are impressed and optimistic with extended precision progress.  <a href="/MatrixSpace">MatrixSpace</a>(<a href="/RealField">RealField</a>(1000),1000,2000) is useful!  Deal with catastrophic loss of precision.  I.e., "algebraic folks" are developing tools that will be useful for us. 

11. If only my problem were (numerical) linear algebra, then much is available.  

12. Meataxe is a general purpose linear algebra library (++).  

13. Learned about many setbacks: hybrid mpi/threads might not work like you think it will; security issues, etc. Infinitely many choices, and not are all right.  

14. 95% of calcs in scientific computing is double precision.   Can use mpi since load balancing is easier, since 1 arithmetic operation = 1 arithmetic operation. 

15. New idea: Roch's scheduling schemes.  Learn about work stealing and work-first principle. 

16. I had a warped view of what could be done.  Overall design is crucially important.  

17. BAD NEWS: Reality.  law of leaky abstractions.  Error handling.    The vendors have hid us from dealing with this (and parallel computing).  Low level issue become big effects and they bust estimates, etc.  

18. Importance of abstracting basic layers away.  E.g., if go with MPI, do it in a way that is abstracted out, and not welded to core of algorithm. 

19. Number theorists haven't leveraged computing like a wide range of other communities.  

20. Changed my perception of how parallel computing fits into things.  Intellectual curiosity? NO!  Tremendously wasteful not to do it.  Free power.  Optimization technique.  Cheating.  

21. The next program I write -- I will ask, how can I make it parallel.  

22. Kedlaya -- runtime analysis.  Brief remarks at end about parallelization.  I skimmed that bit.  Now I would think, how to do the rest, how to implement.  

23. Fulfilled all my dreams.  But I want to stop having to do it in my special purpose system.  Use SAGE/Python/IPython/etc.  

24. The killer application of parallel computing (i.e., an application that drives development): 

            * FFT (no it isn't -- it's signal processing) 
            * Signal processing (uses FFT) 
            * Parallel matrix algorithms. 
            * No killer app in number theory yet?? 
            * Numerical algebraic geometry via PHC. 
            * Integer factorization 
            * Tables 
25. No, it's not about the killer app.  Parallel processing is more gradual.  

26. Hybrid algorithms because of those cursed hardware manufacturers.   Video cards.  Playstation 3.  Maybe you'll be a video game programmer after all.   Hybrid.  Complicated.  Useful.  Offload engines.  Some have violently fast memory... and integer ops!! BUT... maybe don't!  (That's the lesson of many years hard work.) 

27. Often many algorithms are limited by speed of RAM, not speed of CPU.  

28. Really need support from operating systems.  Adaptive scheduling.   

29. Working mathematician: to make a fast program, you do have to pay attention to trends in computer architecture.   As mathematicians we can't just program in our favorite interpreter and be naive.  

30. Why don't GP, GMP, Singular, Gap, etc., use parallelism all over in the core of their implementations?   

      * Because the programmers didn't learn the techniques? 
      * Not enough workshops? 
      * Coming soon! 
      * Sometimes it doesn't make sense to be parallel. 
      * GMP will have a parallel multiply. 
And we're done! 
