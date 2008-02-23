 =Coding Theory=

A linear code of length n  is a finite dimensional subspace of GF(q)^n, with a fixxed (usually the standard) basis. Sage can compute with linear error-correcting codes to a limited extent. It basically has some native Python commands and wrappers to GAP and GUAVA 3.1 commands (GUAVA 3.1 includes Leon's C code, though uncompiled). GUAVA 3.1 is included with Sage.

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
