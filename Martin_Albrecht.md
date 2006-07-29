= Martin Albrecht's (malb) SAGE projects =

== Part of my Thesis ==
 * My thesis deals with algebraic attacks on block ciphers namely the Courtois Toy Cipher. So I will implement/have implemented several algebraic attack algorithms like XL,XSL,F4 and DR. Though those might not be of general interest.
== Other stuff I'm working on ==
 * Real cputime() including subprocesses. Either the host OSes are kind enough to provide us with the needed information or we need to query every process for its cputime(). Most CASes seem to offer this information, if they don't: Query the OS.
 * Cputime class/function which wraps all the cputime() calls for all the subprocesses for convenience. So only one '''cputime(all=True)''' call would be sufficient.

 * Memory consumption analogous to cputime(). This is tricky because some grep on top et al. doesn't provide the necessary information. E.g. Python never ever frees memory while running, and we also might count shared libraries several times this way.
 * Memory profiling similar to %prun or hotshot. The memory profiler would provide hints which part consumes the most memory during a calculation.
 * Allow %prun and hotshot to profile pyrex code.
 * [http://www-id.imag.fr/Logiciels/givaro/ Givaro] integration. This significantly improves finite field arithmetic (more than ten times) and everything relying on it in SAGE. Try it:  '''k = linbox.GFq(2^8,repr="poly")'''
 * Extremely fast sparse (and dense) linear algebra. Actually I only care about echelon form calculation. We are debating if [http://www.linalg.org LinBox] is a good choice for this. Matrices involved in algebraic attacks are often very sparse and there is no need to have my machine go down because e.g., NTL allocates many zeros (i.e., NTL only knows dense matrices).
 * Parallel sparse linear algebra to utilize all 16 cores at sage.math.washington.edu at once. :) It's either to hard for me (if there is no library) or simple as it would be just another library to expose.
 * [http://article.gmane.org/gmane.comp.mathematics.sage.general/193/ SAGEBot] is not dead yet.
 * [http://eprint.iacr.org/2006/224.pdf Generalizations of the Karatsuba Algorithm for Efficient Implementations]
 * Implement or wrap the [http://eprint.iacr.org/2006/251.pdf "Method of Four Russians"] for row reducing resp. inverting a dense boolean matrix

= Other stuff =
I'm a computer science grad student from Bremen, Germany with a strong interest in cryptanalysis, right now mainly algebraic attacks on block ciphers. I maintain a blog at http://www.informatik.uni-bremen.de/~malb/blog.php . 
