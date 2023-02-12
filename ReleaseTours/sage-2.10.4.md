

# Sage 2.10.4 Release Tour

Sage 2.10.4 was released on March 17, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see<a class="http" href="http://www.sagemath.org/mirror/src/announce/sage-2.10.4.txt">sage-2.10.4.txt</a>.  

Robert Miller and Michael Abshoff were the release managers for this Sage release. 


## Memory leaks exposed by modular symbols

Michael Abshoff, Martin Albrecht, Burcin Erocal, Willem Jan Palenstijn, Clement Pernet, William Stein: memory leaks exposed by modular symbols functionality. This ticket is a composite of numerous other memleak fixes merged over a *7 month* period. Modular forms are an excellent way to expose memory leaks in pretty much every algebraic component of Sage and all known issues there are now finally fixed. 


## SQLAlchemy and DSage

We merged <a href="/SetupTools">SetupTools</a> and SQLAlchemy into Sage as standard packages. SQLAlchemy is now used as in DSage replacing hand written code with much more efficient classes from SQLAlchemy. <a href="/SetupTools">SetupTools</a> is required to install SQLAlchemy, but is also useful for a number of experimental spkgs like Mayavi2, TVTK and other packages from the Enthought Tool Suite. Yi Qiang improved DSage making it more robust and finally adding the doumentation to the standard Sage manual. 


## Graph theory: chromatic polynomial

An algorithm originally written in C by Gordon Royle has been adapted by Robert Miller to replace the old slow method. This algorithm uses a cut and merge algorithm to recursively compute the chromatic polynomial, and is written in Cython. 


## Documentation

Many doctest patches written during Doc Day 2 were merged. In addition many people kept up the good work after Doc Day 2 was over and have been submitting patches to increase coverage. We did exceed the target for the release by 0.6% reaching 47.6%. 


## Symmetric function updates

Mike Hansen, reviewed by Franco Saliola: Sage 2.10.4 adds support for Macdonald polynomials, LLT polynomials, and Jack polynomials as well as a whole class of user-defined symmetric functions which can characterized by orthogonality and triangularity conditions.  Support for working with ribbon tableaux  was also added as part of these updates.  In addtition, many doctests were added and subtle bugs fixed. 


## Notebook Updates

Tom Boothby and William Stein, reviewed by each other and Timothy Clemans. 

Fixed a bunch of bugs, new and old: 

   * Smarter update polling (#185): rather than always poll every 1/2 second, we start at 1/4 second intervals, and gradually slow down to 5 second intervals after about 30 seconds. 
   * Emptying the trash works (#432) 
   * Saving cells without evaluating (#1590): When a cell loses focus, and it's been changed, the changes are sent to the server so that work isn't lost. 
   * Removed the last few absolute URLs so the public notebook will be useable by people behind crazy firewalls. (#1879) 
   * Updating worksheet title changes the window title (#1974): it should be noted, William Stein was born in 1974. 
   * Speed up security certificate generation in linux (#1976) 
   * Fixed evaluate link (#2332) 
   * Interact bug in drop down menus fixed (#2530) 

## Parallel Doctesting

Gary Furnish reviewed by Michael Abshoff: 

"sage -tp" has been introduced as an experimental multithreaded doctester.  The first parameter is the number of threads, and the second parameter is the folder to doctest.  Thus "sage -tp 4 devel/sage/sage" tests everything with four threads running. Additional options like "-long" or valgrind options like "-memcheck" do work. The code base is still young and needs more testing. The eventual goal will be to replace the current doctesting infrastructure with this code base. 


## SBox Class

A new S-box class was introduced to Sage to support (algebraic) exploration of this fundamental cryptographic primitive.  

* We create a new 3-bit S-box 

```txt
sage: S = mq.SBox(7,6,0,4,2,5,1,3); S
(7, 6, 0, 4, 2, 5, 1, 3)
```
* and check its properties with respect to differential 

```txt
sage: S.difference_distribution_matrix()

[8 0 0 0 0 0 0 0]
[0 2 2 0 2 0 0 2]
[0 0 2 2 0 0 2 2]
[0 2 0 2 2 0 2 0]
[0 2 0 2 0 2 0 2]
[0 0 2 2 2 2 0 0]
[0 2 2 0 0 2 2 0]
[0 0 0 0 2 2 2 2]

sage: S.maximal_difference_probability()
0.25
```
* and linear cryptanalysis: 

```txt
sage: S.linear_approximation_matrix()

[ 4  0  0  0  0  0  0  0]
[ 0  0  0  0  2  2  2 -2]
[ 0  0 -2 -2 -2  2  0  0]
[ 0  0 -2  2  0  0 -2 -2]
[ 0  2  0  2 -2  0  2  0]
[ 0 -2  0  2  0  2  0  2]
[ 0 -2 -2  0  0 -2  2  0]
[ 0 -2  2  0 -2  0  0 -2]

sage: S.maximal_linear_bias_relative()
0.25
```
* We can express this S-box as a univariate polynomial over $GF(2^3)$  

```txt
sage: S.interpolation_polynomial()
x^6 + a*x^5 + (a + 1)*x^4 + (a^2 + a + 1)*x^3 + (a^2 + 1)*x^2 + (a + 1)*x + a^2 + a + 1
```
* or as a set of polynomials over $GF(2)$. 

```txt
sage: S.polynomials(degree=2)

[x0*x2 + x1 + y1 + 1,
 x0*x1 + x1 + x2 + y0 + y1 + y2 + 1,
 x0*y1 + x0 + x2 + y0 + y2,
 x0*y0 + x0*y2 + x1 + x2 + y0 + y1 + y2 + 1,
 x1*x2 + x0 + x1 + x2 + y2 + 1,
 x0*y0 + x1*y0 + x0 + x2 + y1 + y2,
 x0*y0 + x1*y1 + x1 + y1 + 1,
 x1*y2 + x1 + x2 + y0 + y1 + y2 + 1,
 x0*y0 + x2*y0 + x1 + x2 + y1 + 1,
 x2*y1 + x0 + y1 + y2,
 x2*y2 + x1 + y1 + 1,
 y0*y1 + x0 + x2 + y0 + y1 + y2,
 y0*y2 + x1 + x2 + y0 + y1 + 1,
 y1*y2 + x2 + y0]
```