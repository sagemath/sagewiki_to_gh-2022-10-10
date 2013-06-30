## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
## IMPORTANT NOTE:
## When you use this page as a template for creating your project page:
##  * please remove all lines starting with two hashes (##)
##  * except the acl line, please keep that, but remove one hash, so it reads #acl ...
##  * fix the acl line so it has the correct page instead of the sample Project/...Group
##acl Project/AdminGroup:admin,read,write,delete,revert Project/ReadWriteGroup:read,write Project/ReadGroup:read
##master-page:Unknown-Page
##master-date:Unknown-Date
#format wiki
#language en


== Michelle's project: Benford's Law and Elliptic Divisibility Sequences ==

(People: )


=== Background: ===

Benford's Law is a distribution on a data set that fits lots of "real world data" as well as many purely mathematical sequences.  You can read some about Benford's Law on Wikipedia (http://en.wikipedia.org/wiki/Benford's_law).

I am interested in proving that elliptic divisibility sequences are Benford base-b for almost every b.  A quick description of an elliptic divisibility sequence is this: start with an elliptic curve E defined over the rationals and a non-torsion rational point P on E.  We can look at the sequence of multiples of the point: P, 2P, 3P, 4P, ..., nP, ...  

Each of these points is a rational point on the elliptic curve E, meaning the point nP looks like (x,,n,,, y,,n,,) = (a,,n,, / d,,n,,^2^, b,,n,, / d,,n,,^3^).  So instead of the sequence of points, we look at the sequence of denominators: d,,1,,, d,,2,,, d,,3,,, ... , d,,n,,, ...  This turns out to be a divisibility sequence (if m divides n, then d,,m,, divides d,,n,,), which is pretty cool.  

If you want to know more about elliptic divisibility sequences, you can again start with Wikipedia (http://en.wikipedia.org/wiki/Elliptic_divisibility_sequence).

I have a heuristic argument that elliptic divisibility sequences should be Benford if the canonical height of the starting point is irrational.  There are some delicate issues in controlling an error term, though, to make the heuristic argument into an actual proof.


=== Sage Project: ===

Build a Benford checker for Sage that will take as an input a (large) data set and will output a description of the set's fit to a Benford distribution. Bonus points if we can do a nice graphical output.  In my talk, I'll demonstrate some of what I'm talking about with a Mathematica Benford checker that I have.

We can do this for both the first- and second-digit Benford test. 



=== Math Project: ===

Fix up my heuristic argument about elliptic divisibility sequences into an actual proof.

We can also generate lots of data for the Benford fit of EDS's from lots of different elliptic curves and nontorsion points using our Benford checker.  Good fit to Benford would suggest that the canonical height of the given points is irrational, which is not known (I believe) for any particular point on any particular elliptic curve.  Again, this would just be evidence of irrationality with some confidence interval.  But it would still be kind of cool.


=== Readings: ===

Here's a very bare-bones background and project description.  Read this first.
[[attachment:edsbenford.pdf]]
