

# Sage Doc Day(s) 5

**June 2010** 

The focus is on raising the doctest coverage score for the Sage library to 90%, which is one of the goals for releasing sage-5.0. 

See the discussions at  <a href="http://groups.google.com/group/sage-devel/browse_thread/thread/189f3b30b183690a">http://groups.google.com/group/sage-devel/browse_thread/thread/189f3b30b183690a</a> , <a href="http://groups.google.com/group/sage-devel/browse_thread/thread/6e56d8f033293142">http://groups.google.com/group/sage-devel/browse_thread/thread/6e56d8f033293142</a> and  <a href="http://groups.google.com/group/sage-devel/browse_thread/thread/2a2b4e79023a36b1">http://groups.google.com/group/sage-devel/browse_thread/thread/2a2b4e79023a36b1</a> 

See also Minh's page listing the modules in most need of attention: <a href="http://sage.math.washington.edu/home/mvngu/doctest-coverage/">http://sage.math.washington.edu/home/mvngu/doctest-coverage/</a> 


## Relevant Tickets

If you are working on **any** doctests please open a trac ticket and link it here so that we avoid duplicated work. 

* interfaces/mwrank.py (John Cremona) 
* needs work: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9235">9235</a>: categories/homset.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8800">8800</a>: categories/functor and categories/pushout, plus several bug fixes. 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9215">9215</a>: plot/animate.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9216">9216</a>: groups/group.pyx 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9222">9222</a>: databases/conway.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9223">9223</a>: databases/cremona.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9231">9231</a>: interfaces/tachyon.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9234">9234</a>: plot/plot3d/texture.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9236">9236</a>: misc/sage_timeit.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9242">9242</a>: rings/ideal_monoid.py 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9278">9278</a>: databases/kohel.py  (patch just removes the file) 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9279">9279</a>: databases/tables.py (patch just removes the file) 

## Bugs with new tickets found as a result of writing doctests

* needs review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8992">8992</a>: Coercion of univariate quotient rings. 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8807">8807</a>: Applying functors to morphisms. This is a dependency for <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8800">8800</a> 
* closed: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8993">8993</a>: Univariate quotient rings in the Singular interface. 