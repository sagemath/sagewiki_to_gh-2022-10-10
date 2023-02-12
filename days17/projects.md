

# Sage Days 17 Project

[[_TOC_]] 


## Long list of databases

See <a href="/days17/projects/presagedays/discussion">Long list of projects corresponding to existing databases</a> 


## Updating wstein.org/Tables

We have that there are three (related) tasks to perform: 

1. generate data 
1. make that data easily accessible and searched 
1. make this available through a web front-end. 
Basically everything else on this wiki is currently part of (1). Here's a list of tasks for (3): 

* create some appropriate storage on a ZFS drive to test (William) 
* set up Robert Bradshaw's <a href="/CherryPy">CherryPy</a> code from Benasque (Robert Bradshaw) 
* start adding data from existing tables  
* add functionality to the database manager to provide canonical URLs for data and an associated wiki 
* think about authentication issues for uploading new data 
* make certain fields (such as author or title) immutable 
* create a table of contents for the data, which probably makes the most sense as a completely separate webserver  
* write something that does sanity checks and tests: for instance, keep a list of sample queries, and run them regularly (say, daily) to make sure that they still work 
Other closely related tasks: 

* create a database type for plaintext databases 
Feature requests: 

* user queries for new additions 

## Rational Cuspidal Subgroups

   * See <a href="http://wstein.org/home/wstein/db/days17/cuspidal_torsion/">http://wstein.org/home/wstein/db/days17/cuspidal_torsion/</a> for some data. 

## Dimensions of Modular Forms Spaces for Gamma(N)

* See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6860">#6860</a>. 

## Pre-Sage Days Stuff

* See <a href="/days17/projects/presagedays">projects</a>.  There are numerous ideas for projects there. 

## Implement the Hijikata Trace Formula

There are PARI and Magma implementations here along with some scans: 

<a href="http://modular.fas.harvard.edu/Tables/hijikata.html">http://modular.fas.harvard.edu/Tables/hijikata.html</a> 

Do a Sage implementation.  Then do some interesting computations say of the trace of $T_2$ on some high weight spaces... 
