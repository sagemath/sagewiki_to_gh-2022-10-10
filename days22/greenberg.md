

# Noam Elkies (Harvard) and Matthew Greenberg (University of Calgary): Mod p representations associated to elliptic curves

<a href="days22/greenberg/project.pdf">Project description (pdf)</a> 

<a href="days22/greenberg/activitysheet.pdf">Activity sheet (pdf)</a> 

Background reading: 

Silverman, "The arithmetic of elliptic curves", Chapters 3 and 7 

Diamond and Shurman, "A first course in modular forms, Chapter 9 

Neukirch, "Algebraic number theory", Chapter 2, Section 10 and Chapter 5, Section 6 

Ribet and Stein, "Lectures on Serre's conjecture", Chapter 1, see <a href="http://wstein.org/papers/serre/">http://wstein.org/papers/serre/</a> 


## Final presentation, Friday 02.07.2010

See <a href="http://wiki.sagemath.org/days22/greenberg/presentation">http://wiki.sagemath.org/days22/greenberg/presentation</a> 


## Status report, Monday 28.06.2010

See <a href="http://wiki.sagemath.org/days22/greenberg/june282010">http://wiki.sagemath.org/days22/greenberg/june282010</a> 

A. Find the elliptic curve that modular mod-$p$ representations come from, for $p < 7$ 

People: William Stein, Mike Lipnowski, Sam Lichtenstein, Ben Linowitz, Laura Peskin, David Ai, Rodney Keaton, M. Tip, Brandon Levin 


### (24.06.2010 update)

Attached are some text files giving some data about the minimal conductor < 10,000 for an elliptic curve realizing a mod 2, 3, or 5 representation attached to a newform of level < 150. -Sam 

<a href="days22/greenberg/norm2cond10000">norm2cond10000</a> <a href="days22/greenberg/norm3cond10000">norm3cond10000</a> <a href="days22/greenberg/norm5cond10000">norm5cond10000</a> 

B. $S_4$-extensions: find the curves 

People: Brandon Levin, Mike Lipnowski, Gagan Sekhon, Noam Elkies, Jon Cass, David Ai 

C. Mod-7 galreps from abvars of prime level not arising from elliptic curves 

People: Laura Peskin, M. Tip, Arijit, Rebecca, Mike D, Noam 


### (24.06.2010 update)

Level 29 gives an example.    Using the Hasse bound we see that a2  is -2,-1,0,1,2, so a2  mod 7  is 0,1,2,5,6.    Thus one of the level 29 forms doesn't come from an elliptic curve. 

D. Prime powers for small primes 

People: Ben Linowitz, Sam Lichtenstein, Gagan, Chris Wuthrich, Barinder, Hatice 


### (24.06.2010 update)

Gagan reports that the Galois representations associated to 121A and 121C are surjective mod 2 but not mod 4.  


## Status report, Monday 30.06.2010

See <a href="http://wiki.sagemath.org/GaganSekhon">http://wiki.sagemath.org/GaganSekhon</a> 

There is only one conjugacy class of subgroups of GL(2,Z/9) which surjects onto (Z/9Z)* under the determinant map and reduces onto GL(2,Z/3).  It is of size 144=3*#GL(2,Z/3).  So Elkies' analysis of "3 not 9" pins down the image of Galois completely.   


## Misc

   * A program for finding certain integral modular symbols that Matt G. wanted: <a href="http://nt.sagenb.org/home/pub/13/">http://nt.sagenb.org/home/pub/13/</a> 
   * All of the code Ben Linowitz produced during the conference: <a href="days22/greenberg/Ben_Linowitz_SD22.sws">Sage worksheet (sws)</a> 
   * All the code and data that William Stein computed when making a big table of newforms: <a href="http://sage.math.washington.edu/home/wstein/db/modsym-2010">http://sage.math.washington.edu/home/wstein/db/modsym-2010</a> 
   * William's improvements to reduction mod primes code in sage: <a href="http://trac.sagemath.org/sage_trac/ticket/9400">http://trac.sagemath.org/sage_trac/ticket/9400</a> 