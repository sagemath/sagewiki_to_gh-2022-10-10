= Sage Days 14 projects =

This is a list of projects suitable for [[days14 | Sage Days 14]].  Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this).  The projects can be about Sage, or Macaulay2, or both.

== Create an interface from Macaulay2 to Sage ==

Make it possible to use Sage *from* Macaulay2.

== The Sage/Macaulay2 interface is evidently not very robust ==

For example, in the following session I quickly get nonsense when the input is large:
{{{
sage: R.<x,y,z> = GF(997)[]; R
Multivariate Polynomial Ring in x, y, z over Finite Field of size 997
sage: macaulay2(x)
x
sage: 997*macaulay2(x)
0
sage: macaulay2((x+y+z+1)^20)
997   #HUH??
sage: str(macaulay2((x+y+z+1)^20))
x     # HUH??
sage: macaulay2.console()
Macaulay 2, version 1.1
}}}


== Improve Sage visualisation capabilities ==

People: Alex Ghitza, 

There is good 2d plotting infrastructure, and nicely developing 3d plotting.  We should attach this functionality to algebraic curves, surfaces, etc.


== Documentation for algebraic geometry code in Sage ==

People: Alex Ghitza, 

Go through schemes/* and add docstrings and doctests everywhere they're missing.  This is a good project for becoming familiar with the Sage code; it is also sorely needed.


== Hierarchy of algebraic-geometric objects in Sage ==

People: Alex Ghitza, 

This is about infrastructure and long-term plans.  We need to look at the existing hierarchy, figure out which high-level objects are missing and think about the best ways to organise them.  (Example: do we want a "coherent sheaf" object in Sage?  how would we implement it?)  I'll try to touch upon some of these issues in my talk.
