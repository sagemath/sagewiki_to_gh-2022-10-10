
Here's some things that I think should have an elegant way to implement, but currently seem quite difficult (in terms of code ugliness): 

* Create fast matrices with elements in a number field (or fraction field, or ... ) 
* Create fast polynomials with coefficients in the above base fields. 
* Suppose I have "application" code (that doesn't really belong in SAGE proper) that I want to optimize.  I convert it to Cython, but I'm still using the SAGE types.  This often renders the Cython conversion as pointless (i.e. my code will still be slow).  However, the point is that I want to utilize the logic in the SAGE number field element, but I don't want the overhead of python!  How to do? 
In all these cases, it seems that we want a unified arithmetic interface that can be used from C code (or Cython).  This wants to sit on top of the cython layer (in some way), but we want to avoid the Cython overhead.  How to do?  How to do with-out making SAGE code very ugly?  How to do with-out making SAGE code very C-like? 
