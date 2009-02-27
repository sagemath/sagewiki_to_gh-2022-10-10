= Sage 3.4 Release Tour =

Sage 3.4 was released on FIXME. For the official, comprehensive release note, please refer to [[http://www.sagemath.org/src/announce/sage-3.4.txt|sage-3.4.txt]]. The following points are some of the foci of this release:

 * Merging of Jon Hanke's quadratic forms code
 * Sphinxifying the Sage documentation and move its content to the main Sage development repository

All tickets in the 3.4 milestone can be found on the [[http://trac.sagemath.org/sage_trac/milestone/sage-3.4|trac server]]. Here's a summary of features in this release, categorized under various headings.

== Algebra ==

== Build ==

== Combinatorics ==

== Distribution ==

== Doctest ==

== Documentation ==

== Graphics ==

== Miscellaneous ==

== Notebook ==

== Number Theory ==

== Numerical ==


== Packages ==


 * Update the [[http://www.gnupg.org/index.en.html|libgcrypt]] spkg to {{{libgcrypt-1.4.3.p0.spkg}}} (Michael Abshoff) -- Originally based on Gnu Privacy Guard (GnuPG), libgcrypt is a general purpose library of cryptographic primitives. As such, it does not provide an implementation of any cryptographic protocols, but rather serves as a collection of cryptographic building blocks.


 * Update the [[http://www.python.org|Python]] spkg to {{{python-2.5.2.p9.spkg}}} (Michael Abshoff) -- Python is a general purpose, object oriented programming language. Together with various other open source components, Python serves as a fundamental tool that unify the components of Sage under a common interface.


== Porting ==


== Quadratic Forms ==


 * Merge Jon Hanke's quadratic forms code (Gonzalo Tornaria, Michael Abshoff) -- John Hanke has written a substantial amount of Sage code for working with [[http://en.wikipedia.org/wiki/Quadratic_forms|quadratic forms]]. Hanke's code can serve as base for further enhancement to the case of binary quadratic forms, which are quadratic forms involving two variables. There are currently a number of patches on the trac server for enhancing the functionalities of binary quadratic forms.



== Solaris ==

== User Interface ==

== Website/Wiki ==
