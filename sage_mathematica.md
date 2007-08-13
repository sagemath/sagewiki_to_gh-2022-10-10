= SAGE for Mathematica Users =

This page is modeled on the http://www.scipy.org/NumPy_for_Matlab_Users

== Introduction ==

SAGE has many of the capabilities of Mathematica, and many additional ones (e.g. wiki-creating software and a 3D raytracer).  Some features of SAGE have been inspired by Mathematica, but overall the syntax and structure of SAGE are quite different.  One of the main influences on SAGE is the use of the language Python.  

This page is intended to help users familiar with Mathematica migrate to SAGE more easily.

== Key Differences ==

Indexing: Lists in Mathematica are indexed starting from 1.  In SAGE, as in Python, indices start at 0.  Also, where Mathematica accepts a list of indices, in SAGE you can construct sub-lists using "slice" operations.  For example, if we have a list of numbers, num_list = [0,1,2,3,4], then numlist[1:3] would return the list [1,2].  
