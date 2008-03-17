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


== Notebook Updates ==

Tom Boothby and William Stein, reviewed by eachother and Timothy Clemans.

Fixed a bunch of bugs, new and old:

  * Smarter update polling (#185): rather than always poll every 1/2 second, we start at 1/4 second intervals, and gradually slow down to 5 second intervals after about 30 seconds.
  * Emptying the trash works (#432)
  * Saving cells without evaluating (#1590): When a cell loses focus, and it's been changed, the changes are sent to the server so that work isn't lost.
  * Removed the last few absolute URLs so the public notebook will be useable by people behind crazy firewalls. (#1879)
  * Updating worksheet title changes the window title (#1974): it should be noted, William Stein was born in 1974.
  * Speed up security certificate generation in linux (#1976)
  * Fixed evaluate link (#2332)
  * Interact bug in drop down menus fixed (#2530)
