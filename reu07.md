[[TableOfContents]]

== REU ==
 * [http://www.math.washington.edu/~morrow/reu07/reu.html Jim Morrow's page]: Relevant papers.
 * [http://www.math.washington.edu/~reu/ REU Archives]
 * [http://www.math.washington.edu/~billey/classes/schubert.notes/notes.pdf Sara Billey's Schubert Variety notes]

=== Schedule ===
 * Friday, June 22, 2007
  * 9:30 am -- Jim's Lecture
  * 2:00 pm -- Robert Miller: Introduction to SAGE.
  * 5:30 pm -- Agua Verde
 * Saturday, June 23, 2007
  * 10:30 -- PDL loading dock: Math n' Stuff Store
 * Sunday, June 24, 2007
  * 10:30 -- PDL loading dock: Aquarium
 * Monday, June 25, 2007 (Jim will be missing)
  * 10:00 am -- Brainstorming to come up with problems and other activities.
    * [http://www.math.washington.edu/~reu/brainstorm.txt Brainstorming Results]
  * 12:45 pm -- Zome Tools
 * Tuesday, June 26, 2007
  * 9:30 am -- Peter lecture
  * Noon -- Rock Climbing (Tom Boothby)
  * First individual meetings
 * Wednesday, June 27, 2007
  * 9:30 am -- Sara Billey
  * 10:45 am -- Owen, Emily
  * 2-4:30 pm -- individual meetings
  * 5:00 pm -- Pizza, Mary Gates Hall, room 254
 * Thursday, June 28, 2007
  * 9:30 am -- Peter on star-K
  * 10:45 am -- Jim on critical circular planar graphs
 * Friday, June 29, 2007
  * 9:30 am -- David
 * Saturday, June 30, 2007
  * 3:00 pm -- Barbeque at Peter's house; meet at PDL loading dock 
 * Monday, July 2, 2007
  * 9:30 am -- Jim on medial graphs
 * Tuesday, July 3, 2007
  * Individual meetings all day.
 * Wednesday, July 4, 2007
  * Independence day!  Fireworks at gasworks park
 * Thursday, July 5, 2007
  * Kari & Lindsay; Jaime & Jeremiah talk
 * Friday, July 6, 2007
  * Combinatorics of Coxeter Groups Meeting at 2:00 p.m. (in Robert's office)
  * Rock Climbing at Stone Gardens in Ballard (Evening)
 * Saturday, July 7, 2007
  * Give Blood -- Meet at 10:00 AM at Stevens Court.  Pass out, or baby-sit Emily for the rest of the day.
    * Andrew wins pint-filling competition, with record time 4:45.
    * Emily wins low blood-pressure competition, with a record 88 over 60.
 * Sunday, July 8, 2007 
  * Underground tour and sculpture park
    * Meet at 11:00 AM at bus stop across from Lander on Campus Pkway; we'll be taking the 70,71,72,73, or 49.  Lindsay has a new cell phone: (425) 418-5006
  * More babysitting Emily, some database work...
 * Wednesday, July 11, 2007
  *  9:30 am -- James and Nate talk; 5:00 pm -- Pizza
 * Thursday, July 12, 2007
  * 7:30 pm -- Seattle Symphony performing Tchaikovsky's Violin Concerto in D major and Orff's Carmina Burana
 * Friday, July 13, 2007
  * 9:30 am -- Plexer Talk - Tom Boothby, Tracy Zhang, and Andrew Fanoe
 * Saturday, July 14, 2007
  * Tunnel hike
 * Friday and Saturday, July 20-21  
   *Vancouver trip
 * Sunday, July 29, 2007
  * 1:00 pm -- Mariners game
=== Projects ===
 0. [:Leon:Update] Jeffrey Leon's Partition Backtracking code
  * Tom Boothby, Robert Miller
 1. Update Owen and Jeff's Genus Code.
  * Emily Kirkman
    * Use the current [http://sage.math.washington.edu:8500/genus_code version].
    * Inclusion of [http://pigale.sourceforge.net/ PIGALE] should lead to an improvement here as well (see below).
 1. Algorithm to test for circular planarity
  * Emily Kirkman
  * Status: Linear time achievable by modifying the graph before calling an O(n) planar embedding (testing) algorithm.  (Not reinventing the wheel, just sticking one in the graph).  Currently working on including PIGALE's tgraph library in SAGE.
  * Resources: 
    * A simple O(n) Planarity Testing [http://www.cs.uvic.ca/~wendym/my_pubs/boyer.ps Algorithm]
    * [http://pigale.sourceforge.net/ PIGALE] implementation of the algorithm.  (See also: [http://en.wikipedia.org/wiki/Fraysseix-Rosenstiehl%27s_planarity_criterion wikipedia] page describing Fraysseix-Rosenstiehl planarity criterion).
 1. Enhancing precision with exact linear algebra
  * Tom Boothby, Emily Kirkman
 1. Combinatorics of Coxeter Groups (with Sara Billey)
  * Tom Boothby, Emily Kirkman, Robert Miller
  * [:reu07/bruhat_notes]
 1. Dirichlet Problem for Directed Networks
  * Kari Christianson, Lindsay Erickson
 1. Complex Conductances
  * Lindsay Erickson
 1. Graphs and Connections on a Surface of Arbitrary Genus
  * Joe Mitchell
=== Pictures ===
 * [:emilyk:Emily Kirkman]
=== Resources ===
 * Dive into Python: http://www.diveintopython.org/
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
