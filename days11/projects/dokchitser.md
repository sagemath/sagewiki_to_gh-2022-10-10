= Dokchitser Project for Sage Days 11 =

From Jen:

Here's the version (closest to Dokchitser's original pari code) that
still uses continued fraction approximation:

http://sage.math.washington.edu/home/jen/sage-3.0.5-x86_64-Linux/l4.py

(needs gamma_series.py to run:

http://sage.math.washington.edu/home/jen/sage-3.0.5-x86_64-Linux/gamma_series.py)

The version with Pade approximation (l5.py) has a negligible speedup
but only really works for low precision. I'm not sure if Pade gives us
a means of computing bounds (I think Mike Rubinstein said that
continued fractions won't). Also, l4.py doesn't work for imaginary
inputs yet - some coercion with SymbolicRing that I didn't try.
