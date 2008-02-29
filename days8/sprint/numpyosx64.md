= Get NumPy, SciPy & MatplotLib to build and work on OS X 10.5.x in 64-bit mode =

PEOPLE: Michael Abshoff

SUMMARY: The title says it all.

ISSUES:
It doesn't just work. The problem is that 

 * python compiled from source in 64 bit mode on OSX doesn't work out of the box, especially on OSX 10.5. Maybe the freshly release 2.5.2 will help here
 * disutils trouble, related to falgs and build tests
 * it probably works if one builds one's own toolchain, but it should work with XCode 2.5 and 3.0
