= Sage Days 46: Hawaii -- computational number theory, etc. -- PROJECTS =




== Single Cell Server ==

People: Jason Grout, William Stein

 * Make the single cell server use stunnel for ssl support.  Benefits: this makes websockets more reliable, and of course makes the server more secure.

 * Make the single cell server highly available, i.e., deployed on multiple machines in multiple locations, with no single point of failure.  Currently, this is VERY hard because of the use of SQLite.

== Salvus: Worksheet Views ==

People: William Stein, Jason Grout

Worksheets in Salvus have numerous "views" -- JSON, LaTeX, PDF, print, XML, etc. -- do a polished implementation of all of these.  This is a 100% frontend CoffeeScript development project.  The basic skeleton is completely in place.

== Sage.math cluster ==

People: William Stein, Keith Clawsen, Volker Braun, Jason Grout
