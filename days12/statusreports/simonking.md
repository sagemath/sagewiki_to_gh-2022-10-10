= Simon King's Status Report =

== Patches ==

 [[http://trac.sagemath.org/sage_trac/ticket/797|#797]], [[http://trac.sagemath.org/sage_trac/ticket/3128|#3128]], [[http://trac.sagemath.org/sage_trac/ticket/5047|#5047]], [[http://trac.sagemath.org/sage_trac/ticket/1587|#1587]], [[http://trac.sagemath.org/sage_trac/ticket/5053|blocker #5053]]

== Reviews ==

 [[http://trac.sagemath.org/sage_trac/ticket/4770|#4770]], [[http://trac.sagemath.org/sage_trac/ticket/5056|#5056]], [[http://trac.sagemath.org/sage_trac/ticket/4761|#4761]]

== Cohomology ==

  I delivered a talk on my Sage project on the computation of the modular cohomology rings of finite p-groups. Here are my [[http://wiki.sagemath.org/days12?action=AttachFile&do=view&target=Cohomology2.pdf|slides]].

  Supported by Michael Abshoff, I tried some optimisations of my programs, and I tried to port it to OS X. However, this turned out to be not so easy. 
  Main problem seems to be MeatAxe, which, according to its web page, has still no support for OS X. 
  There was a huge speedup by choosing other compiler options, but this did not work on all platforms. So, there remains a lot of work.

  There also was some progress in one of the most interesting unfinished examples, namely group number 299 of order 256. We expected that its cohomology ring completes in degree 22. 
 These days, after several months of computation, the 23th term of the resolution was obtained. Unfortunately, it turns out that either there will be no new relation in degree 23 or there will be further non-regular generators in degree 23. In both cases, the computation of the cohomology ring will not be finished before degree 24. However, the computation out to degree 24 will probably be unfeasible.
