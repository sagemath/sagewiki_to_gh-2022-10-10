

# Dokchitser Project for Sage Days 11

TODO: 

         1. Modularize the code (break into the following classes and sort dependencies) 
                     * LSeries (Is already in there. Have to free it from the other 3 modules) 
                     * <a href="/GammaFactor">GammaFactor</a> (Done and documented) 
                     * <a href="/IncompleteGeneralizedGammaFactor">IncompleteGeneralizedGammaFactor</a> (To be done) 
                     * <a href="/InverseMellinGammaFactor">InverseMellinGammaFactor</a> (To be done) 
         1. Stuff still computed using gp: 
                     * Delta polynomials in _recursions_at_infinity (search for comment below) 
                     * _without_gp (gamma_series) has this line 
                                             * sinser = sage_eval(rs(gp_eval('Vec(sin(Pi*(%s)))'%(z0+x)))) 
                     * init_Ginf: still uses pari (see below) 
                     * Ginf: still uses pari to evaluate continued fraction 
         1. Doctest everything, making sure it all works 100% and fix issues with coercion, complex inputs, etc., as they are systematically uncovered. 
         1. Possibly maybe change from digits to bits prec. 
         1. Optimize. 


---

 

From Jen: 

Here's the version (closest to Dokchitser's original pari code) that still uses continued fraction approximation: 

<a href="http://sage.math.washington.edu/home/jen/sage-3.0.5-x86_64-Linux/l4.py">http://sage.math.washington.edu/home/jen/sage-3.0.5-x86_64-Linux/l4.py</a> 

(needs gamma_series.py to run: 

<a href="http://sage.math.washington.edu/home/jen/sage-3.0.5-x86_64-Linux/gamma_series.py">http://sage.math.washington.edu/home/jen/sage-3.0.5-x86_64-Linux/gamma_series.py</a>) 

The version with Pade approximation (l5.py) has a negligible speedup but only really works for low precision. I'm not sure if Pade gives us a means of computing bounds (I think Mike Rubinstein said that continued fractions won't). Also, l4.py doesn't work for imaginary inputs yet - some coercion with <a href="/SymbolicRing">SymbolicRing</a> that I didn't try. 

Dokchiter's Paper: <a href="days11/projects/dokchitser/dokchitser.pdf">dokchitser.pdf</a> 
