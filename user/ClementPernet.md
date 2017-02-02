== Stuff I have done/been working on during Sage Dev 1 ==

=== LinBox 1.1.6 rc0 ===

 * tried several ways of getting rid of gmp++ (required for debianization). ==> rely on Givaro's
 * integrated Sage's linbox_wrap interface in the LinBox library
 * fixing bugs in LinBox and Givaro,...
 * testing phase -> integration in sage-3.0.4

=== Dense Linear Algebra over GF(2) ===
 
* Design of the Matrix Multiply based Echelon decomposition
 * learned a lot on the design and tricks of M4RI
 * already done 
   * TSRM, 
   * generalization of matrix windows and algorithms working on them, to any dimensions
   * LQUP (close to done
 * Still to be done
   * extensive testing of some routines
   * trtri (triangular inversion)
   * trtrm (triangular triangular matmul)

=== Algorithms for matrices overs Z and Zp[X] ===
 * Theory: discussions and new insights with A Storjohann (computing Smith form transformation matrices)
 * practice: new libraries

=== Benchmark(et)ing ===
 * parallel ATLAS and fflas-ffpack: 70 Gffops
 * lobbying for introduction of Tbops for benchmark**ing M4RI -> 1.2Tbops

=== Playing with words ===
 * some nicer prononciations for weird acronyms: M4RI and eMPIRe
