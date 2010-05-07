= John Cremona (University of Warwick): Tables of elliptic curves =

== Description ==

== Project 1 ==

Tabulating modular elliptic curves over '''Q''' (based on  Chapter II of my book (see below).  The project would be to extend the existing tables from the current conductor limit of 130,000 to something larger, using my C++ code (distributed with Sage) and Sage itself, and some combination of the two.

=== Suggested preliminary reading ===

    1. J. E. Cremona,  "Algorithms for Modular Elliptic Curves" (2nd edition, 1997), CUP, Chapters I, II and the Appendix to Chapter II.  The online version is freely available (and has fewer typos):  http://www.warwick.ac.uk/staff/J.E.Cremona/book/fulltext/index.html

    2. William Stein, "Modular Forms, a Computational Approach", (2007), AMS.The least relevant chapters for us are 2, 4, 5 since we are concerned with forms of weight 2 and trivial character.  Available free online here: http://modular.math.washington.edu/books/modform/ .

    3. J. E. Cremona, "The elliptic Curve Database for conductors up to 130,000", in "Algorithmic Number theory (ANTS-VII, Berlin 2006), pages 11-29.  A light read to set the scene and explain some of the background to this project.  Also available as a preprint at http://www.warwick.ac.uk/staff/J.E.Cremona/papers/ecdb_ants.pdf

== Project 2 ==


Finding all elliptic curves with good reduction outside a finite set S of primes, over number fields.  The theory, is based on my paper on the subject (see below) which reduces the problem to finding all ''S''-integral points on elliptic curves over number fields, together with some algebraic number theory.   The project would be to implement this in Sage, over number fields.  Over '''Q''', I have already done this, using the ''S''-integral points functions implemented two summers ago.  I also have a partial implementation over number fields in Magma.  Over number fields there will be other challenges, and this is likely to spill over into more general computation of Mordell-Weil groups of elliptic curves over number fields. 


=== Suggested preliminary reading ===

    1. J. E. Cremona and M. P. Lingham, "Finding all elliptic curves with good reduction outside a given set of primes",  Experimental Mathematics 16 (2007) No.3, pages 303-312.  Preprint at http://www.warwick.ac.uk/staff/J.E.Cremona/papers/egros.pdf .   See also the references there.
