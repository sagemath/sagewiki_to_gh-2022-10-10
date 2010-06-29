== To-do list for elliptic curves in Sage ==

This is a list of things (small or large) which came up during SD22 at MSRI as deserving to be fixed or implemented in Sage.


   1.  Regulators over number fields.   NB over %\mathbf{Q}$ there are two functions, regulator() and regulator_of_points(), and it is the second of these which can be trivially implemented.  Just copy the code from ell_rational_field.py into ell_number_field.py; also copy height_pairing_matrix().  In each case I mean "move" rather than "copy".  Then in each case add doctests with a couple of examples over number fields.  The other function (regulator) is something which depends on having an actual MW basis, so is not for now.

   2.  Linear dependencies of points over number fields (and over Q), modulo torsion.  The  attached file [[attachment:mwnf.m]] has Magma code for this (written by me) which may be useful, though you will have to find the Sage equivalent of LLLgram().  That  function takes a gram matrix (of not-necessarily full rank) and returns a reduced gram matrix and a matrix in GL(n,Z) and the rank r.

   3.  Finish ticket #8829 on saturation over number fields.

   4.  Kilford's rank function patch #9342:  complete and review.

   5.  Integral points over number fields: ongoing project work re-implementing Nook's Magma code.

   6.  $S$-integral points over number fields: ongoing project work, based on Smart-Stephens and taking as a model the code over $\mathbb{Q}$ for $S$-integral points.

   7.  $S$-class groups: on going project work.

   8.  K-Selmer groups esp.  $K(S,4)$ and $K(S,2)_4$: ongoing project work.

   9.  All curves with e.g.r.: putting together a lot of the above!  When the time comes, I have some complete lists over imaginary quadratic fields of class number 1 which will be helpful.

   10.  All curves with e.g.r. outside $S$ (using most of the above again)

   11.  Iterating through number field elements by height;   special case for integers;   simpler version not by height.  Ongoing project work.

   12.  Heights on projective space over number fields (Jackie's code: make into a ticket+patch)

   13.  Elkies-Watkins over number fields -- post what code you have by the end of the week.

   14.  Implement a $2$-torsion rank function over number fields.  Jamie is working on this: #9371.

   15.  Given an elliptic curves defined over $K$, determine whether it is isomorphic over $K$ to a curves defined over $\mathbb{Q}$.  [Get the j_invariant, decide if it is rational, if so construct a curve over Q with that j-invariant, base change itback to K, and test for the quadratic twist.  All these steps are implemented already.  See attached example [[attachment:eg.sage]] ]
