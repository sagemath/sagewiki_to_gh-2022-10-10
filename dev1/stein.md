= Stein -- what I did at Dev Days 1 =

1. Made a start on sage lite.  It didn't go anywhere, but I have some ideas...

2. Implemented and tested the pickle jar.  http://trac.sagemath.org/sage_trac/ticket/3482
{{{
It turns out that *all* 465 pickles in sage-3.0.3 made on opteron 64-bit linux *unpickle* fine on 32-bit osx intel.
}}}


3. Basic decorator and primitive for parallel computing in sage:  http://trac.sagemath.org/sage_trac/ticket/3467
Actually used this to compute 1.6GB of modular symbols spaces in parallel. Works well.  There are a few details that
it would be nice to add, but already this is a very nice useful thing to have.  I deleted more code than I wrote.

4. [http://pyprocessing.berlios.de/ Pyprocessing] -- learned about it, used it, integrated with @parallel with Mike Hansen.  Very interesting technology.  Is '''very''' likely to finally make it so we can start using parallel computing in the core of the Sage library.  This is, imho, major.  

5. Refereed a lot of patches.

6. Discussed notebook database schema with Tom Boothby.

7. Helped a little bit with the coercion rewrite

8. Rode a Segway.

---

== Modular Forms ==

At the modular forms workshop, I:

1. Gave an intro talk with challenge problems.

2. Estimated time to solve them.

3. Wrote code and computed 1.6GB of data (weight 2 and levels up to about 2200).   Very surprising timing results. 
