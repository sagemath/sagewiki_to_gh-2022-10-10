= Sage Days 46: Hawaii -- computational number theory, etc. -- PROJECTS =


== Single Cell Server ==

People: Jason Grout, William Stein

 * Make the single cell server use stunnel for ssl support.  Benefits: this makes websockets more reliable, and of course makes the server more secure.

 * Make the single cell server highly available, i.e., deployed on multiple machines in multiple locations, with no single point of failure.  Currently, this is VERY hard because of the use of SQLite.

== 
