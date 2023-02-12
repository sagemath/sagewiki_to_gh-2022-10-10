

# Sage Days 14 projects

This is a list of projects suitable for <a href="/days14">Sage Days 14</a>.  Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this).  The projects can be about Sage, or Macaulay2, or both. 


## 4ti2

* Mike Hansen 
* William Stein 
* Peter Malkin 
* Matthias Koeppe 

## Create an interface from Macaulay2 to Sage

Make it possible to use Sage *from* Macaulay2.  See <a href="http://trac.sagemath.org/sage_trac/ticket/5475">http://trac.sagemath.org/sage_trac/ticket/5475</a> for something maybe useful. 

* Dan Grayson 
* William Stein 
* Mike Stillman 

## Improve robustness of the Sage/Macaulay2

* William Stein 
* Mike Hansen 
* Dan Grayson 
* Mike Stillman 
See <a href="http://trac.sagemath.org/sage_trac/ticket/5467">http://trac.sagemath.org/sage_trac/ticket/5467</a> 

<a class="http" href="http://wiki.sagemath.org/days14/projects/robust">http://wiki.sagemath.org/days14/projects/robust</a> 


## Documentation for algebraic geometry code in Sage

* Alex Ghitza 
* William Stein 
* Alex Ghitza 
* Roy 
* David Eisenbud 
* Justin Walker 
Go through schemes/* and add docstrings and doctests everywhere they're missing.  This is a good project for becoming familiar with the Sage code; it is also sorely needed. 

I (=William) did something -- w00t!: <a href="http://trac.sagemath.org/sage_trac/ticket/5476">http://trac.sagemath.org/sage_trac/ticket/5476</a> 


## Hierarchy of algebraic-geometric objects in Sage

* Alex Ghitza 
This is about infrastructure and long-term plans.  We need to look at the existing hierarchy, figure out which high-level objects are missing and think about the best ways to organise them.  (Example: do we want a "coherent sheaf" object in Sage?  how would we implement it?)  I'll try to touch upon some of these issues in my talk. 


## Algebraic Geometry "Wishlist"

* Daniel 
* David Eisenbud 
* Dave S. 
* Roy 

# Projects that aren't happening...


## Get the 3d implicit plotting code to work better

   * See trac <a href="http://trac.sagemath.org/sage_trac/ticket/5249">http://trac.sagemath.org/sage_trac/ticket/5249</a> 
   * Weird bumpiness 
   * Colors 
   * Put Alex Ghitza's examples (from the singular book) into Sage.  

## Implement automorphism_group for elliptic curves over finite fields

Right now only `E.automorphisms()` is implemented, and it returns a list.  


## Improve Sage visualisation capabilities

People: Alex Ghitza,  

There is good 2d plotting infrastructure, and nicely developing 3d plotting.  We should attach this functionality to algebraic curves, surfaces, etc. 
