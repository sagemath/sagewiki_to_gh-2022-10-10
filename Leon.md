[[reu07| Back to the REU wiki]]

J.S. Leon's [[http://tigger.uic.edu/~jleon/|webpage]]

== Goals ==

 * Fix up Leon's code for modern use.

== Progress ==

 * Fixed several issues relating to outdated design.
   * Originally defaulted to using short's: now uses unsigned's.
   * Changed obsolete CLK_TCK to CLOCKS_PER_SEC.
 * Discovered a serious fencepost error in loops.
   * Temporary solution: allocate one more memory spot than necessary to allow Leon's indexing
   * Long term: correct all of Leon's loops to index properly.
 * Discovered undocumented restriction on Cayley library names: no hyphens.

== Solutions to known bugs ==

 1. Related to reading the input file:
   {{{
./wtdist huffman-code4.gap 6 huffman-matrix4 // seems to work, creates huffman-matrix4 file
./desauto -code huffman-code4.gap huffman-matrix4 huffman-autgp4 // does not work

output:
Error: Library block huffman-matrix4 not found in specified library.
Program was executing function read01Matrix (line 234 in file
../../src/leon/src/readdes.c).
}}}
  . Related files:
   * [[attachment:huffman-code4.gap]]
  * SOLUTION: Cayley library format does not support names with hyphens. Use only alphanumeric and underscore characters. 

 1. Bus Errors
   {{{
./wtdist example1::left 4 really
Bus error
}}}
  . Related file:
   * [[attachment:example1]] 
  * Happens on OS X, but not Linux- it is due to invalid memory access.
  * SOLUTION: see above, regarding "fencepost error."


== Known Bugs in Leon ==

 1. Running out of memory:
   * W. C. Huffman describes a general procedure to produce examples of this bug:
   {{{
The main problem always seems to be when there are only a few minimal weight codewords.  I think you can create a lot of examples that will make it difficult in the following way: Let C1 be any code you want with minimum weight at least 3. Let C2 be the [2,1,2] code with basis [1 1].  Form the direct sum of C1 and C2.  This will create a code of minimum weight 2 with only one codeword of minimum weight 2.  I have a feeling this will give you trouble even if the code C1 has an automorphism group that is easy to compute.
}}}
   * The following codes, as noted by Huffman, commonly cause an out of memory condition. Even if this doesn't happen, they are still good benchmarks for memory use:
   {{{
Example 1:
1111111111110000000000001100000000
0000000000001010100000000010101011
0000000000000101010000000001010111
0000000000000000001010100000001110
0000000000000000000101010000001101
0000001010101010100000001000100000
0000000101010101010000000100010000
1010100000001010100000001010000000
0101010000000101010000000101000000
0010100000000010100011110000000000
0001010000000001010011110000000000
1000100000001000101100110000000000
0100010000000100011100110000000000
0000000010100011110010100000000000
0000000001010011110001010000000000
0000001000101100111000100000000000
0000000100011100110100010000000000

Example 2:
1111111111110000000000001100000000
0000000000001010100000000010101011
0000000000000101010000000001010111
0000000000000000001010100000001110
0000000000000000000101010000001101
0000001010101010100000001000100000
0000000101010101010000000100010000
1010100000001010100000001010000000
0101010000000101010000000101000000
0010100000000010100011110000000000
0001010000000001010011110000000000
1000100000001000101100110000000000
0100010000000100011100110000000000
0000000010100011110001010000000000
0000000001010011110010100000000000
0000001000101100110100010000000000
0000000100011100111000100000000000

Example 3:
1111111111110000000000001100000000
0000000000000000001111110010101010
0000000000000000001111110001010101
0000000000001010101010100000000011
0000000000000101010101010000000011
0000001010100000000000001000101000
0000000101010000000000000100010100
1010100000000000000000001010001000
0101010000000000000000000101000100
0010100000000010100011110000000000
0001010000000001010011110000000000
1000100000001000101100110000000000
0100010000000100011100110000000000
0000000010100011110010100000000000
0000000001010011110001010000000000
0000001000101100111000100000000000
0000000100011100110100010000000000

Example 4:
1111111111110000000000001100000000
0000000000000000001111110010101010
0000000000000000001111110001010101
0000000000001010101010100000000011
0000000000000101010101010000000011
0000001010100000000000001000101000
0000000101010000000000000100010100
1010100000000000000000001010001000
0101010000000000000000000101000100
0010100000000001010011110000000000
0001010000000010100011110000000000
1000100000000100011100110000000000
0100010000001000101100110000000000
0000000010100011110001010000000000
0000000001010011110010100000000000
0000001000101100110100010000000000
0000000100011100111000100000000000

}}}

 1. Infinite Hangs (?)
   * These have not yet been tested...
   {{{
checking equivalence of:

[1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
[0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]
[0 0 1 1 1 1 1 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1]
-----------------------------------------------------------------
[1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
[0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1]
[0 0 1 1 0 0 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1]


checking equivalence of:

[1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
[0 0 1 1 0 0 1 1 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1]
-----------------------------------------------------------------
[1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
[0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
[0 0 1 1 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1]

}}}

   * This example also leads to an infinite loop in computeSubgroup...
   {{{
./wtdist huffman-code4.gap 6 huffman_matrix4 // now works, using underscores
./desauto -code huffman-code4.gap huffman_matrix4 huffman_autgp4 // fall into infinite loop
}}}
  . Related files:
   * [[attachment:huffman-code4.gap]]


CategoryHomepage
