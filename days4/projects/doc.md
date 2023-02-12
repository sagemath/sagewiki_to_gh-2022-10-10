

# Documentation

<a href="/days4/projects/">Other SAGE Days 4 Project</a> 

* M Albrecht: Go through the wiki and clean it up, write more documentation,  and check what content should be added to the documentation 
* Revise the guided tour part of the **SAGE tutorial** to much better reflect the symbolic calculus functionality, its pros, cons, etc. 
* W Stein: **Documentation**.  Have teams describe how to do the following in tutorial fashion, with all examples automatically doctested: 
   * Use SageX to create an interface to a C library (case study -- GMP-ECM). 
   * Convert a program from .sage files to .py library code. 
   * Convert a .py Python program to SageX for speed. 
   * Create publication-quality graphics for inclusion in latex documents. 
   * Port code from Magma to SAGE. 
   * Make an existing PARI-GP / GAP / Singular / Lisp / Maxima program easily usable from SAGE. 
   * (Bobby Moretti): How to create a ring or other structure object in SAGE, what class to inherit from, how to set the parent object, what methods to override in both python and SageX, etc. 
* W Stein: Continue to flesh out ideas for **JSAGE -- the open source math software journal**.  I announced JSAGE at SD3, and it's been very interesting to see it start to take off.  It's critical that we actually *write* some code to manage JSAGE, and figure out how to really do it right -- much more work is needed.  In particular, a good way of dealing with code submissions from people that don't know much about SAGE development, but have awesome code and ideas to contribute. 