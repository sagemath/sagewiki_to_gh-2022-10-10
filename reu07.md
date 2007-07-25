[[TableOfContents]]

== REU Resources ==
 * [http://www.math.washington.edu/~morrow/reu07/reu.html Jim Morrow's page]: Relevant papers.
 * [http://www.math.washington.edu/~reu/ REU Archives]
 * [http://www.math.washington.edu/~billey/classes/schubert.notes/notes.pdf Sara Billey's Schubert Variety notes]
 * Dive into Python: http://www.diveintopython.org/
 * Python Library reference: http://www.python.org/doc/current/lib/lib.html

=== Talks ===
 *  All talks are posted on [http://www.math.washington.edu/~reu/papers/current/]
=== Schedule ===
 * [:reu07/sched_archive:Archive Schedule]
 * Monday, July 15, 2007
   * 9:30 am -- Joe talk on Jordan curve theorem
   * 2:00 pm -- leave for Harry Potter movie
   * Evening -- Emily's girlfriend's band
 * Tuesday, July 17, 2007
  * 9:30 am -- Computing the automorphism group of a graph, Robert Miller
  * Frisbee with SIMUW ?
 * Wednesday, July 18, 2007
  * 1:30 -- 4:00 pm; Ernie Esser on Boomerangs (MGH 254; http://www.math.ucla.edu/~ernmon/boomerang/boomerang.pdf
  * 5:00 -- Pizza
 * Thursday, July, 19, 2007
  * 6:00 -- Picnic at Magnuson, just south of the boat launch;  enter on 65th Street
 * Friday, July 20
  * Vote on t-shirt design
 * Friday, Saturday, and Sunday, July 20-22, 2007  
   * Bite of Seattle
   * Jeremy Enigk at the Chop Suey (21+). Doors open at 9 p.m. [http://www.ticketweb.com/user/?region=wa&query=schedule&venue=chopsuey1 Tickets.]
 * Monday, July 23, 2007
  * Joey on angle systems; vote on t-shirts
 * Tuesday, July 24, 2007
  * More Joey at 9:30; Coloring knots at 1:30, Smith 115
 * Wednesday, July 25
  * Pizza at 5:00
 * Thursday, July 26
  * 9:30: More Plexers (Andrew et al)
  * 5:30 Laurelhurst salmon bake; details:   http://www.seattle.gov/parks/centers/Laurelhurst/activity.htm
  * July 27-29, Victoria trip
 * Sunday, July 29, 2007
  * 1:05 pm -- Mariners game
 * Friday, August 3
  * 2:00 Friends and Enemies simulation
=== Projects ===
 1. Update Owen and Jeff's Genus Code.
  * Emily Kirkman
    * Use the current [http://sage.math.washington.edu:8500/genus_code version].
    * Inclusion of [http://pigale.sourceforge.net/ PIGALE] should lead to an improvement here as well (see below).
 1. Algorithm to test for recoverability
  * Emily Kirkman
  * Circular Planarity Testing: 
    * Status: Linear time achievable by modifying the graph before calling an O(n) planar embedding (testing) algorithm.  (Not reinventing the wheel, just sticking one in the graph).  Currently working on including the Boost library in SAGE.
    * Resources: 
      * A simple O(n) Planarity Testing [http://www.cs.uvic.ca/~wendym/my_pubs/boyer.ps Algorithm]
      * [http://boost.sourceforge.net/ Boost] implementation of the algorithm.
  * Criticality
 1. Enhancing precision with exact linear algebra
  * Tom Boothby, Emily Kirkman
 1. Combinatorics of Coxeter Groups (with Sara Billey)
  * Tom Boothby, Sean Howe, Emily Kirkman, Robert Miller
  * [:reu07/bruhat_notes]
 1. Dirichlet Problem for Directed Networks
  * Kari Christianson, Lindsay Erickson
 1. Star-Ks and 2:1 Networks w/ Complex Admittance
  * Lindsay Erickson
 1. Graphs and Connections on a Surface of Arbitrary Genus
  * Joe Mitchell
 1. Angle Systems and Embeddings
  * Joey Greer, Emily Kirkman
 1. New Algorithm for Finding Planar Embeddings with user-defined Topological Constraints
  * Emily Kirkman
 1. [:Leon:Update] Jeffrey Leon's Partition Backtracking code
  * Tom Boothby, Robert Miller
=== Pictures ===
 * [:emilyk:Emily Kirkman]

== T-shirt Decision ==
 * Crab full size on back
 * Owen'ed full size on front, UW Math REU 2007 Jaime-style on top / bottom
 * Blue shirts with yellow text

== Wiki examples ==
To include a link:

{{{
[http://www.math.washington.edu/~morrow/reu07/reu.html Jim Morrow's page]
[:Leon: update]
}}}
To add a table of contents:

{{{
[[TableOfContents]]
}}}
To format the table of contents (simultaneously formatting the page):

{{{
== Top Level, No. 1 ==
== Top Level, No. 2 ==
=== Next Level, No. 1 ===
=== Next Level, No. 2 ===
==== Another Level, etc. ====
== Top Level, No. 3 ==
}}}
To create a new wiki page, simply navigate there, and you will be given a new blank page.

MoinMoin, this particular brand of wiki, also allows you to use LaTeX:

$$\sum_{k=1}^n{n \choose k}x^k$$

$\sum_{k=1}^n{n \choose k}x^k$

$$\left[\begin{array}{cccc}1 & 0 & 0 & 0 \\0 & 1 & 0 & 0 \\0 & 0 & 0 & \omega \\0 & 0 & -\omega & 0\end{array}\right]$$

Here's how to do that:

{{{
$$\sum_{k=1}^n{n \choose k}x^k$$
$\sum_{k=1}^n{n \choose k}x^k$
$$\left[\begin{array}{cccc}1 & 0 & 0 & 0 \\0 & 1 & 0 & 0 \\0 & 0 & 0 & \omega \\0 & 0 & -\omega & 0\end{array}\right]$$
}}}
NOTE: The double-dollar notation is a replacement for LaTeX's math environment \[...\], which does not work in the wiki.
