

# Sage 4.3.2 Release Tour

[[_TOC_]] 


## Major features

* much improved interface to Singular which makes using any Singular function much more efficient and easy (cf. Libraries section below) 

## Libraries

* much improved interface to Singular which makes using any Singular function much more efficient and easy #7939 

```python
#!python
sage: P.<x,y,z> = QQ[];
sage: A = Matrix(ZZ,[[1,1,0],[0,1,1]])
sage: toric_ideal = sage.libs.singular.ff.toric__lib.toric_ideal # we load the function
sage: toric_ideal(A,"du") # the integer matrix does not tell us which ring we want
Traceback (most recent call last)
...
ValueError: Could not detect ring.

sage: toric_ideal(A,"du",ring=P) # so we try again
[x*z - y]
```

## Geometry

* a major refactoring of the Polyhedron class fixed many bugs, added new functionality, and created a cleaner structure that should make future improvements much easier. 