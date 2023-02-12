

# Porting Sage to Windows

* Michael Abshoff: Cygwin, MSVC 
* Gary Furnish: MSVC, ??? 
* Chris Gorecki: pexpect 
* Dan Shumow: ??? 
* William Stein: SAGE Ultralite 
* Ralf-Philipp Weinmann: ??? 

# Working Plan

I [Michael Abshoff] figure that I will help organize the Windows track of Dev1, so here are my thought on the issue: During Dev1 I would suggest that we work on two problem complexes: 

* Cygwin port of Sage 
* Proto-Sage 

## Cygwin port of Sage

The Cygwin port of Sage is self explanatory. I would assume we will either be very close or done with a working port when Dev1 starts. There will likely be some open issue and since the Cygwin port is essential to test MSVC-ized components during the MSVC port I would really like to have it well working and kept up.   Thus: 

GOAL 1 for Dev Days 1: A 100% complete working Cygwin port of Sage 


## Proto-Sage

Proto-Sage has the goal to start with Python 2.5.2 compiled with MSVC in 32 or 64 bit mode and add as many components from Sage to it as soon as they work, i.e. add numpy/scipy, Sympy, mercurial and so on. The list of packages shouldn't be limited to Python based spkgs, i.e. once we have pari up and running with MSVC it should be added to Proto-Sage. We should build a binary installer for Proto-Sage with individual components. Eventually it would be great for the installer to be able to fetch only new and updated packages from an online repo. The eventual goal of Proto-Sage is to become full fledged Sage once the Sage library has been ported and is working. 

GOAL 2: Create a first minimal "Sage for Windows" distribution with MSI installer.  Hopefully this will include: 

      * 32/64-bit MSVC Python 
      * Pexpect (under development; may use xmlrpc and only talk to Python if this doesn't work) 
      * The Sage interfaces 
      * The Sage notebook 
      * Twisted 
      * Cython 
This will already be extremely useful to a lot of Python people, though it has little to do with mathematics.  
