

## Tickets Closed

I fixed these bugs: 

* <a href="http://trac.sagemath.org/sage_trac/ticket/1127">http://trac.sagemath.org/sage_trac/ticket/1127</a> -- modular symbols complement bug, fixed 
* <a href="http://trac.sagemath.org/sage_trac/ticket/2535">http://trac.sagemath.org/sage_trac/ticket/2535</a> -- make `dual_free_module` much faster 
* <a href="http://trac.sagemath.org/sage_trac/ticket/2578">http://trac.sagemath.org/sage_trac/ticket/2578</a> -- new native bernoulli polynomial 
* <a href="http://trac.sagemath.org/sage_trac/ticket/3571">http://trac.sagemath.org/sage_trac/ticket/3571</a> -- make something **not** exposed to python. interestingly, this means i changed a python `getattr` into a direct access of a `cdef` attribute, giving a noticeable speedup to multiplication mod n! 
* <a href="http://trac.sagemath.org/sage_trac/ticket/3658">http://trac.sagemath.org/sage_trac/ticket/3658</a> -- Pari craziness 
* <a href="http://trac.sagemath.org/sage_trac/ticket/3936">http://trac.sagemath.org/sage_trac/ticket/3936</a> -- invalid. 
* <a href="http://trac.sagemath.org/sage_trac/ticket/4957">http://trac.sagemath.org/sage_trac/ticket/4957</a> ... and learned that in C, `n >> 45` and `n >> 13` are the same on a 32-bit machine. 
* <a href="http://trac.sagemath.org/sage_trac/ticket/5026">http://trac.sagemath.org/sage_trac/ticket/5026</a> -- numerical noise 
* <a href="http://trac.sagemath.org/sage_trac/ticket/5059">http://trac.sagemath.org/sage_trac/ticket/5059</a> ... and learned a ton about pickling, and **FINALLY** fixed the broken pickles from last summer. 
I also spent a bunch of time reviewing a few annoying and hard to review patches. That was about as much fun as it sounds. 


## Comments

* Had a browser war with Martin, and defended Firefox's honor admirably 
* Learned about the awesomeness of having a quake console on my Mac (Visor!) 
* Starting using queues. (Huzzah!) 