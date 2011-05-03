= Sage Days 30 Coding Sprint Projects =

<<TableOfContents>>


'''For the main SD 30 wiki page go [[days30|here]]'''


Below a list of proposed projects.

== Combinatorics ==

* Implement the full collection of d-complete posets and slant product of d-complete posets, and jeu de taquin for them.

  ... (+ Florent)

* Implement jeu de taquin for increasing tableaux (for d-complete posets or something less general).

* Finalize posets

  Christian, Franco, Nicolas

* Set factories

  Jason, Florent, Travis, Nicolas

* Finalize Mike's permutation group patches

  Rob, Nicolas

== Number Theory ==


* <<Anchor(nt4)>> Update IntegerVectors internal representation in Sage

  Currently IntegerVectors consist of vectors with only positive integer entries.  Need a more general object, and to implement various norms.

  PEOPLE: Eva, Nicolas, Florent

* <<Anchor(nt1)>> Generate centered digit set for multidimensional radix representation

  Prerequisite: updated IntegerVectors.  Input: a dilation matrix A (nxn integer matrix, all of whose eigenvalues have modulus > 1).  Output: a centered digit set D = {d_1, ..., d_r}; here r = |det A|.  The centered digit set is a complete set of coset representatives of Z^n^/A(Z^n^), chosen to be the integer vectors contained in the set A((-1/2,1/2]^n^).

* <<Anchor(nt2)>> Implement Scheicher & Thuswaldner neighbor-finding algorithm

  Prerequisite: updated IntegerVectors.  Input: a dilation matrix A (nxn integer matrix, all of whose eigenvalues have modulus > 1) and digit set D = {d_1, ..., d_r} (set of integer vectors that comprise a complete set of coset representatives of Z^n^/A(Z^n^); here r = |det A|).  Output: a list of integer vectors that give the neighbor translates of T(A,D), the set of "decimals" under the multidimensional radix representation with base A and digit set D.  See [[http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.141.4331&rep=rep1&type=pdf|Scheicher and Thuswaldner's paper]].

* <<Anchor(nt3)>> Visualizing attractors of iterated function systems and other fractal sets

  Review/search for graphics packages that are currently usable by Sage, as well as other open-source options for drawing fractals that are available.  Find the best one for visualizing fractals, specifically fractals arising from [[https://secure.wikimedia.org/wikipedia/en/wiki/Iterated_function_system|iterated function systems]], specifically iterated functions systems arising from multidimensional radix representations (sums of terms of the form A^n^ d_n, where A is an nxn integer matrix all of whose eigenvalues have modulus > 1, and the d_n are "digit" vectors drawn from a complete set of coset representatives of Z^n^/A(Z^n^); for each digit d, we can define a function f_d = A^-1^(x+d)).  Good qualities in a graphics package include: ability to generate images from batches of examples automatically generated in Sage, ability to focus on areas of interest in the image and zoom in, ability to display both 2D and 3D images, and ability to rotate 3D images for different views.

== Documentation ==

* Discussion thematic tutorials

  Jason, Anne, Franco, Rob, Nicolas, Florent, 

* ``Introduction to Sage'' book

  Hugh, Rob, Nicolas
