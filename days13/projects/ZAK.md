= ZAK code analysis =

== Interesting code ==

=== tn ===

 * C code
 * compiles fine and is well tested
 * GPL V2+
 * depends on GMP only
 * minor issues in code, i.e. "malloc.h" used, static linking broken on OSX
 * mabshoff will build an experimental spkg

=== hn ===

 * C++ code
 * friend and template issues - forward declaration should fix that (patch exists)
 * depends on LiDiA '''and''' LEDA (depends on sorting for sortseq)
 * presumed to work correctly
 * ancient binary on Linux exists, uses old LEDA and LiDiA

=== isolist ===

 * C++ code
 * depends on LiDiA '''or''' LEDA controllable via include_param.h - see end of schulzepillot_qfcomputing_zak.pdf

=== decomp ===

 * valgrind it to check for
{{{
*** glibc detected *** decomp: double free or 
corruption (fasttop): 0x08055458 *** 
}}}

=== herm_mass ===

 * check compilation 
