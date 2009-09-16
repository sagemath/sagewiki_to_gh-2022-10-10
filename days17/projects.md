= Sage Days 17 Project =

<<TableOfContents>>

== Updating wstein.org/Tables ==

We have that there are three (related) tasks to perform:

 1. generate data
 2. make that data easily accessible and searched
 3. make this available through a web front-end.

Basically everything else on this wiki is currently part of (1). Here's a list of tasks for (3):

 * create some appropriate storage on a ZFS drive to test
 * set up Robert Bradshaw's CherryPy code from Benasque
 * start adding data from existing tables
 * add functionality to the database manager to provide canonical URLs for data and an associated wiki
 * think about authentication issues for uploading new data
 * create a table of contents for the data
 * make certain fields (such as author or title) immutable

Other closely related tasks:

 * create a database type for plaintext databases

Feature requests:

 * user queries for new additions

== Rational Cuspidal Subgroups ==

  * See http://wstein.org/home/wstein/db/days17/cuspidal_torsion/ for some data.

== Dimensions of Modular Forms Spaces for Gamma(N) ==

 See [[http://trac.sagemath.org/sage_trac/ticket/6860|#6860]].

== Pre-Sage Days Stuff ==

 See [[/presagedays|projects]].  There are numerous ideas for projects there.

== Implement the Hijikata Trace Formula ==

There are PARI and Magma implementations here along with some scans:

http://modular.fas.harvard.edu/Tables/hijikata.html

Do a Sage implementation.  Then do some interesting computations say of the trace of $T_2$ on some high weight spaces...
