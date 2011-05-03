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

  Jason, Florent, Travis, Nicolas, Anne

* Finalize Mike's permutation group patches

  Rob, Nicolas

* Get the reflection groups / Coxeter groups into a proper state

  Christian, (Nicolas, Anne ?)

* Implementation of energy function of crystals (suitable for an interested student!!!)

  Anne

* Implementation of cyclic tableaux

  Anne

* Quotient rings of rings of symmetric functions, examples of noncommutative Schur functions, etc.

  Jason, Anne

* Actions on combinatorial free modules

  Hugh, Anne, Franco, Nicolas

* Implementation of bijection between crystal paths and rigged configurations

   Travis, Anne

== Number Theory ==


* Update IntegerVectors internal representation in Sage [l^p^ norms: norm(p='sage.rings.integer.Integer(2)')].

  Eva, Nicolas, Florent (Jordi wants to give this a try)

* Student project: Generate centered digit set for multidimensional radix representation

  Input: a dilation matrix A (nxn integer matrix, all of whose eigenvalues have modulus > 1).  Output: a centered digit set D = {d_1, ..., d_r}; here r = |det A|.  The centered digit set is a complete set of coset representatives of Z^n^/A(Z^n^), chosen to be the integer vectors contained in the set/polytope A((-1/2,1/2]^n^).

* Student project: Generate minimum modulus digit set for multidimensional radix representation

  Input: a dilation matrix A.  Output: a digit set D = {d_1, ..., d_r} consisting of the representatives of each coset of Z^n^/A(Z^n^) with minimum l^2^ norm.

  - Method 1: Use algorithm for centered digit set D_0 to find an initial set of coset representatives.  Find the smallest l^2^ norm of any k in Z^n^ that is not in the initial digit set D_0.  Search vectors k in Z^n^ of expanding l^2^ norm: check the l^2^ norm of the current representative for the coset that k is in, and replace that representative with k (in the digit list/set D) if k has smaller norm.  Note that this is a finite search.

  - Method 2: Use LLL algorithm to find minimal basis for lattice A(Z^n^).  Then take D to be the set of Z^n^ lattice points (integer vectors) in the set/polytope A((-e_1/2,e_1/2] x ... x (-e_n/2,e_n/2]), where e_1, ..., e_n are the LLL basis vectors for A(Z^n^).

* Student project: Visualizing attractors of iterated function systems and other fractal sets

  Review/search for graphics packages that are currently usable by Sage, as well as other open-source options for drawing fractals that are available.  Find the best one for visualizing fractals, specifically fractals arising from [[https://secure.wikimedia.org/wikipedia/en/wiki/Iterated_function_system|iterated function systems]], specifically iterated functions systems arising from multidimensional radix representations (sums of terms of the form A^n^ d_n, where A is an nxn integer matrix all of whose eigenvalues have modulus > 1, and the d_n are "digit" vectors drawn from a complete set of coset representatives of Z^n^/A(Z^n^); for each digit d, we can define a function f_d = A^-1^(x+d)).  Good qualities in a graphics package include: ability to generate images from batches of examples automatically generated in Sage, ability to focus on areas of interest in the image and zoom in, ability to display both 2D and 3D images, and ability to rotate 3D images for different views.

* Potentially suitable as student project?: Implement Scheicher & Thuswaldner neighbor-finding algorithm

  Input: a dilation matrix A (nxn integer matrix, all of whose eigenvalues have modulus > 1) and digit set D = {d_1, ..., d_r} (set of integer vectors that comprise a complete set of coset representatives of Z^n^/A(Z^n^); here r = |det A|).  Output: a list of integer vectors that give the neighbor translates of T(A,D), the set of "decimals" under the multidimensional radix representation with base A and digit set D.  See [[http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.141.4331&rep=rep1&type=pdf|Scheicher and Thuswaldner's paper]].

== Documentation ==

* Discussion thematic tutorials

  Jason, Anne, Franco, Rob, Nicolas, Florent, Jeff

* ``Introduction to Sage'' book

  Hugh, Rob, Nicolas, Jeff
