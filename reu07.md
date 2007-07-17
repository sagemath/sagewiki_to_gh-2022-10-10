[[TableOfContents]]

== REU Resources ==
 * [http://www.math.washington.edu/~morrow/reu07/reu.html Jim Morrow's page]: Relevant papers.
 * [http://www.math.washington.edu/~reu/ REU Archives]
 * [http://www.math.washington.edu/~billey/classes/schubert.notes/notes.pdf Sara Billey's Schubert Variety notes]
 * Dive into Python: http://www.diveintopython.org/

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
  * 1:30 -- 4:00 pm; Ernie Esser on Boomerangs (MGH 254)
  * 5:00 -- Pizza
  * 6:00 -- Picnic at Magnuson?
 * Friday, Saturday, and Sunday, July 20-22, 2007  
   *Victoria trip
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
  * Tom Boothby, Sean Howe, Emily Kirkman, Robert Miller
  * [:reu07/bruhat_notes]
 1. Dirichlet Problem for Directed Networks
  * Kari Christianson, Lindsay Erickson
 1. Star-Ks and 2:1 Networks w/ Complex Admittance
  * Lindsay Erickson
 1. Graphs and Connections on a Surface of Arbitrary Genus
  * Joe Mitchell
 1. Angle Systems and Embeddings
  * Joey Greer
=== Pictures ===
 * [:emilyk:Emily Kirkman]

== T-shirt Ideas ==
attachment:ninja_star.png

attachment:frisbee.png

http://sagemath.org:9001/days4/projects/redbull?action=AttachFile&do=get&target=dillhole.gif

http://sagemath.org:9001/days4/projects/redbull?action=AttachFile&do=get&target=ninja1.jpg


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
