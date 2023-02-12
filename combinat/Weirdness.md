

# Weirdness


## Conventions for EnumeratedSets (Partitions, Permutations, Subsets, Subwords, ...)

* no global rule for containance test (should "sage: [1,3,2] in Permutations(3)" answer True or False ?). Currently, it is specified in NO class what should be await from this function! 
* specifications of error raised by rank/unrank (see also <a class="http" href="http://groups.google.com/group/sage-combinat-devel/browse_thread/thread/8c7e616013ad37c9/cd1ed8a70e9ce8fc">thread on sage-devel</a>) 
* what should be the equality of two finite enumerated sets ? 

## Words (there is more to look at here)

* [done in sage-words] sage.combinat.word is not imported by default -- with the sage-words merge this is no longer an issue 
* [done in sage-words] word.symmetric_group_action_on_values does not naturally belong in word 
* word.standard should be called word.standardization 
* word.charge returns the cocharge 
* Language as Parent / Word as Element. Merge <a href="/FreeMonoid">FreeMonoid</a> and Words <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12224">#12224</a> 
* Classes for languages <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12225">#12225</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12227">#12227</a>, ... 

## Combinatorial* (not considered very carefully)

* <a href="/CombinatorialClass">CombinatorialClass</a> has no documentation 
* It would be nice for <a href="/CombinatorialObject">CombinatorialObject</a> to have a method 'indices' which returns a list of the index of *every* occurrence of x 

## Combinations

* Looks good! (Just recording here that it was looked at). 

## Compositions

* Compositions has no option for allowing '0' parts (which are often useful) (<a href="/IntegerVectors">IntegerVectors</a> does this. There should be a pointer.) 
* Composition will allow entries with '0' parts (but not, for example, negative parts).  It's not clear that all methods make sense when '0' parts are allowed. 
         * This should not be allowed (in particular [0,1] in Compositions() should return False).  <a href="/IntegerVectors">IntegerVectors</a> can handle this functionality. 
* Composition.conjugate() is not explained 
* Composition.descents() is not explained 
* Composition.major_index() doc-string says it is the sum of the descents.  This is not true for the given example. 
* Composition.refinement() is not explained 
* <a href="/SignedCompositions">SignedCompositions</a> has no corresponding element class <a href="/SignedComposition">SignedComposition</a> 
* Should we use "fatter" or "coarser" for the converse of "finer"? 
* Composition([1,3,2]).parent() should return Compositions() 
The following are being worked on <a href="http://trac.sagemath.org/sage_trac/ticket/5600">http://trac.sagemath.org/sage_trac/ticket/5600</a>: 

* Composition(l) should accept any iterable l, and in particular a tuple: 
         * `sage: Composition((1,3,1)) = Composition([1,3,1])` 
* Missing concatenation 
* inner / outer returns error when set with Composition instance 
         * ```txt
       sage: c=Composition([3,5,7,2])
       sage: C=Compositions(17,outer=c)
       sage: C
       Compositions of the integer 17 satisfying constraints outer=[3, 5, 7, 2]
       sage: C.list()
       TypeError                Traceback (most recent call last)
       ...
       TypeError: 'Composition_class' object is not callable
     
```

## Dyck Words (trac #3269 has some fixes - merged in Sage 3.0.2.rc0)

* <a href="/DyckWord">DyckWord</a>.to_noncrossing_partition() could use a better reference 
* <a href="/DyckWord">DyckWord</a>.to_tableau is not explained 
* <a href="/DyckWord">DyckWord</a>.to_* for * in {ordered_tree, triangulation} is not implemented. Warning: Implementing bijections between Catalan objects can be a never-ending task. 

## Integer Vectors

* <a href="/IntegerVectors">IntegerVectors</a> has no corresponding element class <a href="/IntegerVector">IntegerVector</a> (or Word, etc.) 
* Make that elements are hashable (and thus can index basis of nice free module) 
* Make more clear (checks and documentation) the consideration of trailing zeros 
* Allows the customisation with a post_process (and thus facade parent) 
* More documentation about possible extra arguments 
* Test coherence and compatibility of extra arguments (raise <a href="/NotImplementedError">NotImplementedError</a> to avoid returning error!!!!) 
* <a href="/WeightedIntegerVectors">WeightedIntegerVectors</a> has no corresponding element class <a href="/WeightedIntegerVector">WeightedIntegerVector</a> (or <a href="/IntegerVector">IntegerVector</a>, or Word, etc.) 

## Lyndon Words

* <a href="/LyndonWords">LyndonWords</a> has no corresponding element class <a href="/LyndonWord">LyndonWord</a> (or Word, etc.) 

## Tuples

* This has very similar functionality to Combinations.  These names should be made more consistent somehow. 

## Necklaces

* Necklaces? does not define necklaces 

## Partitions

* Perhaps a <a href="/PartitionOptions">PartitionOptions</a> Class could be added where one could specify: French vs. English, maybe Dominance vs. Lex(?), others? The <a href="/PermutationOptions">PermutationOptions</a> class is a good idea! <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> 
* PartitionsGreatestEQ, PartitionsGreatestLE, <a href="/PartitionsInBox">PartitionsInBox</a> are redundant with options passed to Partitions 
* Partitions(n).random_element() is completely useless if n is even moderately large (~ 100) 
      * Yes, random generation is done naively now.  It's not trivial to do it correctly but would make a nice little project.  See <a href="http://www2.toki.or.id/book/AlgDesignManual/BOOK/BOOK4/NODE153.HTM">http://www2.toki.or.id/book/AlgDesignManual/BOOK/BOOK4/NODE153.HTM</a> 
* The partition* stuff is all redundant 
* q-t analogs do not behave consistently w.r.t. accepting q and t as parameters or creating q,t inside the function 
* The doc for Partition should point out that < compares lexicographically <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> 
* The doc for Partition says 'Sage uses the English convention...' this should be expanded and mention 0-indexing; in fact it should also mention that partitions can be interpreted as diagrams 
      * TS: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> will move the English convention problem to <a href="/PartitionOptions">PartitionOptions</a> 
* p.boxes() returns coordinates as tuples; other functions (corners(), outside_corners(), etc.) use lists. 
      * TS: Already fixed somewhere 
* p.*_lengths() should be called p.*_length_tableau(). For example p.arm_lengths() should be p.arm_length_tableau(). 
      * AM: I think that hook_lengths is right: these are properties of the partition and not any particular tableaux! 
      * TS: The result is a tableau where the entries are the *_length(). 
* p.size() sums the entries instead of getting `p.parent().n` 
      * This is probably the least error prone way to do things since we haven't really decided on how to handle parents for combinatorial objects.  Note that if you just construct the partition with `Partition([3,2,1])`, it has to sum up the entries anyway to get the current parent. 
* p.atom() is not defined 
* p.boxes() would be better called p.cells() 
      * I think of them as "boxes" :-) 
      * In <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> there will be a note in the header about partitions using cells. However we could implement aliases... 
* p.character_polynomial() deserves a reference  
* p.dominate() should be called p.dominated_partitions() (or something more clear) 
      * TS: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> and will deprecate the old name 
* p.down(), p.down_list(), p.up(), p.up_list() could have better names? (restrict/induce? is there a convention for a generator vs a list? is this too redundant?) 
* is p.evaluation() a standard name? 
      * It's from MuPAD-Combinat. 
      * TS: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> gives better documentation for this function and why it is named as such. 
* p.hook_polynomial() needs a definition and/or reference 
* p.hook_product() needs a definition and/or reference, and the parameter should default to 1 
      * Second part in <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> 
* the following example blows up: `sage: m = p.jacobi_trudi(); m.row(0)` 
      * This is because the symmetric function algebra does not have an `is_integral_domain` attribute 
* p.jacobi_trudi() should also include an option for the 'e' version # This is really in <a href="/SkewPartitions">SkewPartitions</a> 
* p.jacobi_trudi() returns the transpose of the conventional Jacobi-Trudi matrix 
* p.k_atom() needs a definition or reference 
* p.k_conjugate() could use a reference 
* p.k_split() needs a definition or reference 
* given p.outside_corners() should p.corners() be renamed to inside_corners()? 
      * TS: I believe corners is a standard name, however I setup an alias in <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a>. 
* p.ferrers_diagram() is basically redundant with p.pp() 
      * TS: I think this should be separate since `p.ferrers_diagram()` returns a string representing the partition whereas `p.pp()` actually prints the diagram. 
* p.pp() should be called p.pretty_print() or just p.print() 
      * TS: I believe this is to be consistent with other such things in sage (in particular tableaux), and as such, we should leave it p.pp(). 
* p.reading_tableau() needs a definition <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> 
* p.remove_box() should be called p.remove_cell() 
      * TS: Already done somewhere 
* p.to_exp() needs a better name 
* p.upper_hook_length(i,j,x) takes coordinates first, so can't be called with (*[i,j],x) (also lower_hook_length) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/13605">#13605</a> 
      * TS: Would it be natural for alpha to default to 1? If so, then I think we should change this to have an optional argument to handle input of a cell. 
* p.frobenius_notation() should exist and 'from_frobenius' should also be an option in the constructor 
      * Already done somewhere 

## SkewPartitions

* Commonalities with Partitions should be factored out! (hook lengths, for one example) 

## Permutations

* Permutations doc should define Bruhat order and recoils 
* Permutation doc should reference <a href="/PermutationOptions">PermutationOptions</a> 
* The Permutation constructor does not check enough: Permutation([1,1,1]) and Permutation([-3,7]) don't break, for example (trac #8918) 
* For the following, let p be a Permutation 
* p.action? could mention that to_permutation_group() allows for an action on polynomials 
* p.bruhat_* : 
   1. greater/smaller return comb. classes, inversions,pred,succ return lists, *_iterator return iterators. Can this be made more consistent? 
   1. Bruhat order should be defined or referenced in all of these 
* p.permutahedron_* : 
   1. These all return lists (except for lequal() which is ok).  Compare with bruhat above 
   1. Left and right permutahedron order should be defined or referenced in all of these 
* p.charge() and p.cocharge() need to be implemented, p.ascents() would also possibly be useful 
* Typo in p.cycle_type?  (non-increasing -> non-decreasing) 
* p.descents_composition? needs a definition of descent and an explanation of how to get the comp. 
* p.has_pattern() is redundant with p.avoids? 
* p.isignature, p.iswitch, p.iflip deserve references to Assaf. 
* p.iswitch? should mention that these are the dual knuth relations 
* the (non-dual) knuth relations should be implemented, as well as the boolean p.knuth_equivalent(q) 
* p.left_tableau? says it returns the right tableaux (but it's lying) 
* the only example for p.left_tableau() and p.right_tableau() is an involution; thus they are not distinguished 
* p.left_tableau? and p.right_tableau? should provide a specific reference to the algorithm 
* p.longest_increasing_subsequence() should be called p.longest_increasing_subsequences() (plural) 
* p.major_index? typo: "add one the number of" -> "add one to each of" 
* p.to_major_code: cleanup the doc (spurious "math", formulas not in math mode) 
* p.number_of_descents? should define descent and explain the final_descents option 
* p.number_of_idescents? should include the word 'inverse' and explain final_descents 
* p.major_code documentation should be checked (a variable is called "math" !) 
* p.number_of_recoils? should define recoil 
* p.number_of_saliances? should define saliances 
* p.recoils_composition? needs a definition of recoil and an explanation of how to get the comp. 
* p.reduced_word() implies there is only one.  Is the point that it is faster than p.reduced_word_lexmin() ? 
* p.reduced_word* should all define or reference reduced words in the doc 
* p.remove_extra_fixed_points() should be called p.remove_trailing_fixed_points(). When applied to [1] it should return [] 
* p.robinson_schensted? should provide a specific reference to the algorithm 
* p.runs? should define runs... the definition is quite short 
* p.signature? should define signature 
* p.to_* 
   1. is the 'to' needed in the name?  ex: p.to_cycles() could be called p.cycles() to be compatible with p.cycle_string() 
   1. lehmer_code? and lehmer_cocode? should be defined 
   1. tableau_by_shape? should emphasize that it simply fills the given shape with p in reading order--no col-strict condition is enforced 
   1. permutation_group_element should emphasize that this can be used to act on polynomials 
* More permutation statistics would be useful: E.g., p.excedences(), p.weak_excedences(), p.ascents(), p.valleys() and p.components() 
* Perhaps taking powers of permutations should work 

## PermutationGroup*

* Not generally considered (i'm exhausted on permutations) but is it possible for <a href="/PermutationGroupElement">PermutationGroupElement</a> to be merged with Permutation? 

## q_analogues.py

* These are extremely useful and should be generally available 
* q_pochhammer or `q-series = (a;q)_n := \prod_{k=0}^{n-1} (1 - aq^k)` should be implemented. 

## SetPartitions*

* Are all the names <a href="/SetPartitions">SetPartitions</a>*k necessary in the global namespace? 

## SymmetricFunctions

* The following are for f a symmetric function 
* f._is_positive(basis) should not be hidden 

## Tableau

* The following are for t a Tableau 
* t.major_index is not what most people call the major index of a tableaux.  This should be called dmaj. 
* There should be a general method for adding a row or a cell, or changing a cell 
* All the katabolism stuff needs better doc 
* t.catabolism_sequence() gives an infinite loop if t is the empty tableau (solved) 
* In Tableaux, there should be a reference to Standardtableaux and Semistandardtableaux 

## Category Framework

* Defining `an_element` of a Parent in a naive way (involving multiplication of a coefficient and a term) will lead to an infinite recursion.  See `an_element` in `sfa.py` for a definition which works. 

## More to come...

This is a great page. There is lots of weirdness in the combinatorics stuff, and we should really clean it up. I can start working on the simpler stuff here next week. --<a href="/DanDrake">DanDrake</a> 
