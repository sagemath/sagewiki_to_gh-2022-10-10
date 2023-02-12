

# Distributed Computation

<a href="/days4/projects/">Other SAGE Days 4 Project</a> 

Continuing a major trend started at the MSRI workshop in January 2007 on parallel computation, participants will design algorithms for parallel distributed integer factorization, computation of Hecke eigenvalues, and other algorithms. In particular, participants will explore several of the other ideas listed above in the context of parallel computation. Implementing these algorithms will likely vastly improve the stability and reliability of distributed computation in SAGE. 

Yi Qiang, Alex Clemesha, Dorian Raymer, William Stein 

* DSAGE: 
   * Write a easy to follow tutorial 
   * Make a DSAGE Live CD (I just tried the VMware image and it worked really well, maybe we can just use that) 
   * Improve overhead of running jobs with DSage (Robert Miller can help stress test this) 
   * Completely convert to GNUTLS (use gnutls tools to generate certificates, etc.) 
   * Improve web interface to dsage with Alex and Dorian 
   * Finish implementing gmp-ecm wrapper 
   * Help out with porting the notebook server to twisted 
   * Implement parallel running of doctests 
   * Fix doctest thread issue for DSage 
   * Make the Dashboard widget more fun to look at and more usable 
   * Try it out at the computer labs (Alex, Dorian, Yi) to test DSage on several computers + live demo of web interface 
* Documentation: 
   * Write a nice tutorial 
* Make it so vastly more objects are picklable: 
   * Write way way more loads(dumps(s)) doctests 
   * Fix them when they don't work. 
* Documentation: 
   * Use dsage to task farm a couple of standard example problems. 
   * Make dsage _truly usable_ for mere mortals -- this means having people who know little just sit down and throw random crap at it; then we formulate a plan to improve things based on the results. 