= Coding Theory =

A linear code of length n  is a finite dimensional subspace of GF(q)^n, with a fixed (usually the standard) basis. Sage can compute with linear error-correcting codes to a limited extent. It basically has some native Python commands and wrappers to GAP and GUAVA 3.1 commands (GUAVA 3.1 includes Leon's C code, though uncompiled). GUAVA 3.1 is included with Sage.

Sage can compute Hamming codes

{{{
sage: C = HammingCode(3,GF(3))   
sage: C
Linear code of length 13, dimension 10 over Finite Field of size 3
sage: C.minimum_distance()     
3
sage: C.gen_mat()
    [1 0 0 0 0 0 0 0 2 0 0 2 1]
    [0 1 0 0 0 0 0 0 2 0 0 2 0]
    [0 0 1 0 0 0 0 0 2 0 0 2 2]
    [0 0 0 1 0 0 0 0 2 0 0 1 0]
    [0 0 0 0 1 0 0 0 2 0 0 1 2]
    [0 0 0 0 0 1 0 0 2 0 0 1 1]
    [0 0 0 0 0 0 1 0 2 0 0 0 2]
    [0 0 0 0 0 0 0 1 2 0 0 0 1]
    [0 0 0 0 0 0 0 0 0 1 0 2 2]
    [0 0 0 0 0 0 0 0 0 0 1 2 1]
}}}
the four Golay codes (the binary one, ternary one, and their extended versions),

{{{
sage: C = ExtendedTernaryGolayCode() 
sage: C
Linear code of length 12, dimension 6 over Finite Field of size 3
sage: C.minimum_distance()               
6
sage: C.gen_mat()               
    [1 0 0 0 0 0 2 0 1 2 1 2]
    [0 1 0 0 0 0 1 2 2 2 1 0]
    [0 0 1 0 0 0 1 1 1 0 1 1]
    [0 0 0 1 0 0 1 1 0 2 2 2]
    [0 0 0 0 1 0 2 1 2 2 0 1]
    [0 0 0 0 0 1 0 2 1 2 2 1]
}}}
as well as toric codes, cyclic codes, quadratic and quasi-quadratic residue codes, "random" linear codes, and many others. 

For a given code C, Sage can return a generator matrix, a check matrix, and the dual code:

{{{
sage: C = HammingCode(3,GF(2))
Linear code of length 7, dimension 3 over Finite Field of size 2
sage: C.gen_mat()
   [1 0 0 1 0 1 0]
   [0 1 0 1 0 1 1]
   [0 0 1 1 0 0 1]
   [0 0 0 0 1 1 1]
sage: C.check_mat()
   [1 0 0 1 1 0 1]
   [0 1 0 1 0 1 1]
   [0 0 1 1 1 1 0]
sage: C.dual_code()
Linear code of length 7, dimension 3 over Finite Field of size 2
sage: C = HammingCode(3,GF(4,'a'))
sage: C.dual_code()
Linear code of length 21, dimension 3 over Finite Field in a of size 2^2
}}}

For a linear code C and a vector v in GF(q)^n, Sage can try to decode v (i.e., find the codeword c in C closest to v in the Hamming metric) using syndrome decoding. As of yet, no special decoding methods have been implemented.


{{{
sage: C = HammingCode(3,GF(2))
sage: MS = MatrixSpace(GF(2),1,7)
sage: F = GF(2); a = F.gen()
sage: v1 = [a,a,F(0),a,a,F(0),a]
sage: C.decode(v1)
(1, 0, 0, 1, 1, 0, 1)
sage: v2 = matrix([[a,a,F(0),a,a,F(0),a]])
sage: C.decode(v2)
(1, 0, 0, 1, 1, 0, 1)
sage: v3 = vector([a,a,F(0),a,a,F(0),a])
sage: c = C.decode(v3); c
(1, 0, 0, 1, 1, 0, 1)
}}}
To plot the (histogram of) the weight distribution of a code, one can use the matplotlib package included with Sage:

{{{
sage: C = HammingCode(4,GF(2))
sage: w = C.weight_distribution(); w
[1, 0, 0, 35, 105, 168, 280, 435, 435, 280, 168, 105, 35, 0, 0, 1]
sage: J = range(len(w))
sage: W = IndexedSequence([ZZ(w[i]) for i in J],J)
sage: W.plot_histogram()
}}}
This yields the following plot:

http://sage.math.washington.edu/home/wdj/art/hamming4-wt-histogram.png

Sage can also compute algebraic-geometric codes, called AG codes, via the Singular interface. One may also use the (one-point planar) AG codes implemented in GUAVA via the Sage interface to GAP gap_console(). See the [http://sage.math.washington.edu/home/wdj/guava/: GUAVA] manual for more details.
