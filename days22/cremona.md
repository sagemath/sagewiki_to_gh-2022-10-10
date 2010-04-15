= John Cremona (University of Warwick): Tables of elliptic curves =

== Description ==

 1. Tabulating modular elliptic curves over Q (based on  Chapter II of my book Algorithms for Modular Elliptic Curves, which is available free online here:http://www.warwick.ac.uk/staff/J.E.Cremona/book/fulltext/index.html).  The project would be to extend the existing tables from the current conductor limit of 130,000 to something larger, using my C++ code (distributed with Sage) and Sage itself, and some combination of the two.

 2. Finding all elliptic curves with good reduction outside a finite set S of primes, over number fields.  The theory, is based on my paper on the subject (see Cremona and Lingham, Experimental Mathematics 16 No.3 (2007), 303-312, also available here:  http://www.warwick.ac.uk/staff/J.E.Cremona/papers/egros.pdf ) which reduces the problem to finding all S-integral points on e.c.s over number fields, together with some algebraic number theory.   The project would be to implement this in Sage, over number fields.  Over Q, I have already done this, using the S-integral points functions implemented two summers ago.  I also have a partial implementation over number fields in Magma.  Over number fields there will be other challenges, and this is likely to spill over into more general computation of Mordell-Weil groups of elliptic curves over number fields. 
