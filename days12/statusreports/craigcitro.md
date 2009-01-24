== Tickets Closed ==

I fixed these bugs:

 * http://trac.sagemath.org/sage_trac/ticket/1127 -- modular symbols complement bug, fixed
 * http://trac.sagemath.org/sage_trac/ticket/2535 -- make `dual_free_module` much faster
 * http://trac.sagemath.org/sage_trac/ticket/2578 -- new native bernoulli polynomial
 * http://trac.sagemath.org/sage_trac/ticket/3571 -- make something '''not''' exposed to python. interestingly, this means i changed a python `getattr` into a direct access of a `cdef` attribute, giving a noticeable speedup to multiplication mod n!
 * http://trac.sagemath.org/sage_trac/ticket/3658 -- Pari craziness
 * http://trac.sagemath.org/sage_trac/ticket/3936 -- invalid.
 * http://trac.sagemath.org/sage_trac/ticket/4957 ... and learned that in C, `n >> 45` and `n >> 13` are the same on a 32-bit machine.
 * http://trac.sagemath.org/sage_trac/ticket/5026 -- numerical noise
 * http://trac.sagemath.org/sage_trac/ticket/5059 ... and learned a ton about pickling, and '''FINALLY''' fixed the broken pickles from last summer.

I also spent a bunch of time reviewing a few annoying and hard to review patches. That was about as much fun as it sounds.

== Comments ==

 * Had a browser war with Martin, and defended Firefox's honor admirably
 * Learned about the awesomeness of having a quake console on my Mac (Visor!)
 * Starting using queues. (Huzzah!)
