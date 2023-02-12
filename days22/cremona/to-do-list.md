

## To-do list for elliptic curves in Sage

This is a list of things (small or large) which came up during SD22 at MSRI as deserving to be fixed or implemented in Sage. 

      * -- Note: Items 1,2, and 4 are all *broken* until we resolve the bug with simon_two_descent. That is my project now since computing ranks (and descending to $\mathbb{Q}$: thanks Erin!) will be important in the Elkies-Watkins search over $\mathbb{Q}[i]$. (Jeremy) 
      *  Regulators over number fields.   NB over $\mathbf{Q}$ there are two functions, regulator() and regulator_of_points(), and it is the second of these which can be trivially implemented.  Just copy the code from ell_rational_field.py into ell_number_field.py; also copy height_pairing_matrix().  In each case I mean "move" rather than "copy".  Then in each case add doctests with a couple of examples over number fields.  The other function (regulator) is something which depends on having an actual MW basis, so is not for now.  See ticket #9372: JEC has uploaded a patch which is ready for review. (Aly and Jeremy -- reviewed, assuming just the doctest needed changed, positive review) 
      *  Linear dependencies of points over number fields (and over Q), modulo torsion.  The  attached file <a href="days22/cremona/to-do-list/mwnf.m">mwnf.m</a> has Magma code for this (written by me) which may be useful, though you will have to find the Sage equivalent of LLLgram().  That  function takes a gram matrix (of not-necessarily full rank) and returns a reduced gram matrix and a matrix in GL(n,Z) and the rank r. (Aly, Jeremy, Jim)  $\mathbf{Note:}$ the Sage equivalent of LLLgram() is LLL_gram() which is a method for integer matrices. Second Note: Pari supports LLL_gram for real matrices as well, which we apparently need. There is already a wrapper, but we should add a member method to real matrices (I don't know exactly where this should go yet, haven't looked -- Jeremy). 
      *  Finish ticket #8829 on saturation over number fields.  [This depends on item 1.]   Probably a job for JEC since he reviewed robertwb's patch and suggested changes, which he will now implement. 
      *  Kilford's rank function patch #9342:  completed needs review. (Aly and Jeremy)(Done, has a positive review) 
      *  Integral points over number fields: ongoing project work re-implementing Nook's Magma code. - This code is done, and output matches the Magma code (and, over Q, it matches what is already implemented in sage). (Jackie and Rado)<a href="days22/cremona/to-do-list/intpts.sage">intpts.sage</a> 
      *  $S$-integral points over number fields: ongoing project work, based on Smart-Stephens and taking as a model the code over $\mathbb{Q}$ for $S$-integral points. 
      *  $S$-class groups: on going project work. 
      *  K-Selmer groups esp.  $K(S,4)$ and $K(S,2)_4$: ongoing project work. 
      *  All curves with e.g.r.: putting together a lot of the above!  When the time comes, I have some complete lists over imaginary quadratic fields of class number 1 which will be helpful. 
      *  All curves with e.g.r. outside $S$ (using most of the above again) 
      *  Iterating through number field elements by height;   special case for integers;   simpler version not by height.  Ongoing project work. 
      *  Heights on projective space over number fields (Jackie's code: make into a ticket+patch) 
      *  Elkies-Watkins over number fields -- post what code you have by the end of the week. 
                     * -- This works very well now. I am working to get access to sage.math to run it on that server (rather than on my computer at home). I need to find a good place, if there is one, to add this into the sage library. Maybe in a miscellaneous file somewhere. (Jeremy) 
      *  Implement a $2$-torsion rank function over number fields.  Jamie is working on this: #9371. Patch is up, needs review. Generalized to any field at Sage Days 29. Positive Review. 
      *  Given an elliptic curves defined over $K$, determine whether it is isomorphic over $K$ to a curves defined over $\mathbb{Q}$.  [Get the j_invariant, decide if it is rational, if so construct a curve over Q with that j-invariant, base change itback to K, and test for the quadratic twist.  All these steps are implemented already.  See attached example <a href="days22/cremona/to-do-list/eg.sage">eg.sage</a> ]  (Erin - patch posted #9384) 
                           * I've fixed this function, descend_to. It now returns the correct twist for the general case and works when j=0,1728. 
            * However, I haven't posted a replacement patch yet because I want the output to be an elliptic curve that sage recognizes is defined over the subfield K of L. This will hopefully be fixed by the end of the day. 
                           * Update: Fixed! 