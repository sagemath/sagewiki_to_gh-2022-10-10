= Sage 2.10.4 Release Tour =
Sage 2.10.4 was released on ?????. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see[http://sagemath.org/announce/sage-2.10.4.txt sage-2.10.4.txt]. Among many other things that were done, we have increased documentation substantially, and fixed many bugs. Of course, this list is incomplete; see the release notes for more details.

== Memory leaks exposed by modular symbols ==

Michael Abshoff, Martin Albrecht, Burcin Erocal, Willem Jan Palenstijn, Clement Pernet, William Stein:

      memory
      leaks exposed by modular symbols functionality [this
      ticket is a composite of numerous other memleak fixes
      merged over a *7 month* period. Modular forms are an
      excellent way to expose memory leaks in pretty much
      every algebraic component of Sage and all known issues
      there are now finally fixed]

== SQLAlchemy and DSage ==

to be written

== Graph theory: chromatic polynomial ==

An algorithm originally written in C by Gordon Royle has been adapted to replace the old slow method. This algorithm uses a cut and merge algorithm to recursively compute the chromatic polynomial, and is written in Cython.

== Documentation ==

at least 
 * 2475
 * 2447
 * 2432
 * 2328

== Symmetric function updates ==

Mike Hansen, reviewed by Franco Saliola

Sage 2.10.4 adds support for Macdonald polynomials, LLT polynomials, and Jack polynomials as well as a whole class of user-defined symmetric functions which can characterized by orthogonality and triangularity conditions.  Support for working with ribbon tableaux  was also added as part of these updates.  In addtition, many doctests were added and subtle bugs fixed.
