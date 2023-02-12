

# eMPIRe

The new SAGE fork of GMP, now called MPIR needs lots of build fixes to support various systems. I've been working through fixing these. 

1) I fixed support for gcc 4.3.0 and 4.3.1 

2) I closed a trac ticket related to the global symbol prefix which is used on Core 2 systems.  

3) I updated the yasm we distribute with mpir so that it will support the new intel syntax x86_64 code on Core 2. 


# Multiplying large polynomials

I worked with Gonzalo Tornaria on writing a polynomial multiplication routine in FLINT which will multiply enormous polynomials, which don't fit in memory. 

1) We decided to implement a multimodular method using David Harvey's zn_poly for the GFp[x] multiplication 

2) We wrote an n (log n)<sup>3</sup> algorithm for reduction mod primes of integers and CRT reconstruction. Work remains to make this n (log n)<sup>2</sup> 

3) We did some profiling. As is, the code is about twice as slow as FLINT for polynomials over 10000 coefficients, but it uses less memory and when the machine runs out of memory the new code scales nicely, but FLINT thrashes the hard drive. Work remains to get this implementation down to the speed of FLINT. 
