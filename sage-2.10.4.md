= Sage 2.10.4 Release Tour =
Sage 2.10.4 was released on March 17, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see[http://sagemath.org/announce/sage-2.10.4.txt sage-2.10.4.txt]. 

Robert Miller and Michael Abshoff were the release managers for this Sage release.

== Memory leaks exposed by modular symbols ==

Michael Abshoff, Martin Albrecht, Burcin Erocal, Willem Jan Palenstijn, Clement Pernet, William Stein: memory leaks exposed by modular symbols functionality. This ticket is a composite of numerous other memleak fixes merged over a *7 month* period. Modular forms are an excellent way to expose memory leaks in pretty much every algebraic component of Sage and all known issues there are now finally fixed.

== SQLAlchemy and DSage ==

We merged SetupTools and SQLAlchemy into Sage as standard packages. SQLAlchemy is now used as in DSage replacing hand written code with much more efficient classes from SQLAlchemy. SetupTools is required to install SQLAlchemy, but is also useful for a number of optional spkgs like MayaVI and packages from the Enthought Tools. Yi Qiang improved DSage making it more robust and finally adding the doumentation to the standard Sage manual.

== Graph theory: chromatic polynomial ==

An algorithm originally written in C by Gordon Royle has been adapted by Robert Miller to replace the old slow method. This algorithm uses a cut and merge algorithm to recursively compute the chromatic polynomial, and is written in Cython.

== Documentation ==

Many doctest patches written during Doc Day 2 were merged. In addition many people kept up the good work after Doc Day 2 was over and have been submitting patches to increase coverage. We did exceed the target for the release by 0.6% reaching 47.6%.

== Symmetric function updates ==

Mike Hansen, reviewed by Franco Saliola: Sage 2.10.4 adds support for Macdonald polynomials, LLT polynomials, and Jack polynomials as well as a whole class of user-defined symmetric functions which can characterized by orthogonality and triangularity conditions.  Support for working with ribbon tableaux  was also added as part of these updates.  In addtition, many doctests were added and subtle bugs fixed.

== Notebook Updates ==

Tom Boothby and William Stein, reviewed by each other and Timothy Clemans.

Fixed a bunch of bugs, new and old:

  * Smarter update polling (#185): rather than always poll every 1/2 second, we start at 1/4 second intervals, and gradually slow down to 5 second intervals after about 30 seconds.
  * Emptying the trash works (#432)
  * Saving cells without evaluating (#1590): When a cell loses focus, and it's been changed, the changes are sent to the server so that work isn't lost.
  * Removed the last few absolute URLs so the public notebook will be useable by people behind crazy firewalls. (#1879)
  * Updating worksheet title changes the window title (#1974): it should be noted, William Stein was born in 1974.
  * Speed up security certificate generation in linux (#1976)
  * Fixed evaluate link (#2332)
  * Interact bug in drop down menus fixed (#2530)

== Parallel Doctesting ==

Gary Furnish reviewed by Michael Abshoff:

"sage -tp" has been introduced as an experimental multithreaded doctester.  The first parameter is the number of threads, and the second parameter is the folder to doctest.  Thus "sage -tp 4 devel/sage/sage" tests everything with four threads running. Additional options like "-long" or valgrind options like "-memcheck" do work. The code base is still young and needs more testing. The eventual goal will be to replace the current doctesting infrastructure with this code base.
