

# Fix Sage's Brill-Noether

See the files 

      * SAGE_ROOT/devel/sage/sage/schemes/plane_curves/projective_curve.py 
      * SAGE_ROOT/devel/sage/sage/schemes/plane_curves/affine_curve.py 
in the Sage install.   Note this in the funciton riemann_roch_space (in projective_curve.py): 
```txt
        The following example illustrates that the Riemann-Roch space
        function in Singular doesn't *not* work correctly.
        
        ::
        
            sage: R.<x,y,z> = GF(5)[]
            sage: f = x^7 + y^7 + z^7
            sage: C = Curve(f); pts = C.rational_points()
            sage: D = C.divisor([ (3, pts[0]), (-1,pts[1]), (10, pts[5]) ])
            sage: C.riemann_roch_basis(D)    # output is random (!!!!)
            [x/(y + x), (z + y)/(y + x)]
        
        The answer has dimension 2 (confirmed via Magma). But it varies
        between 1 and quite large with Singular.
```
 

* Sage's <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8997">trac 8997</a>. 
* Singular's <a class="http" href="http://www.singular.uni-kl.de:8002/trac/ticket/153">trac 153</a>. 
There is a <a href="/daysff/curves">wiki page about general function fields issues in Sage</a>.  
