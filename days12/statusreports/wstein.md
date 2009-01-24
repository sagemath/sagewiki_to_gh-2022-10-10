= William Stein's Status Report for Sage Days 12 =

== I fixed the following bugs: ==

=== Math ===

 * #1234 -- analytic_rank crashes
 * #3544 -- PermutationGroup.is_transitive is broken
 * #4274 -- assertion failure in rank for elliptic curves
 * #1867 -- factoring multivariate polynomials over finite fields is broken in Singular

=== Graphics ===

 * #4818 -- bug in list_plot3d -- invalid index?
 * #2858 -- parametric_plot3d throws an error when the sum of the components cancels a variable


=== System and Build ===

 * #4029 -- sage-env kills the shell when called from "wrong" directory
 * #773 -- SAGE drops . from path
 * #5045 -- sage's "make check" should check that the sage build flags (in sage-flags.txt) are right
 * #5041/4955 -- make it so the magma .sig files in extcode don't get written there by magma
 * #5044 -- on some systems mwrank dumps core and crashes on exit when run under pexpect
 * #4936 -- massive bloat: make something delete everything in ~/.sage/gap > 1 week old and untouched

=== Doctesting ===

 * #4588 -- doctest -- get rid of the "feature" where docstrings with require, optional, and package all in them are automatically marked optional
 * #5068 -- hange_ring fails for polynomials over finite fields in many cases
 * #4665 -- sage/misc/cython.py creates file sage/misc/hello.spyx in tree while doctesting
 * #3871 -- do not save pngs in SAGE_ROOT; extending #3759
