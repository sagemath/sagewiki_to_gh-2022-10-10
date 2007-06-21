[:reu07: Back to the REU wiki]

J.S. Leon's [http://tigger.uic.edu/~jleon/ webpage]

== Goals ==

 * Fix up Leon's code for modern use.

== Known Bugs in Leon ==

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
   * attachment:huffman-code4.gap
   * attachment:huffman-matrix4
