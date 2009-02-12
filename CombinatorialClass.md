= Combinatorial Classes =

There are a lot of design issues with concern combinatorial classes. 
I'd like to discuss them here. The following are mostly notes from discussion with Nicolas. Once fixed this material should ends in the doc of CombinatorialClass.

== Interface and basic usage ==

  The name of the ObjOrientedClasses should be uniform : let's take the example of permutations
 * the combinatorial class of all permutations should be named {{{Permutations}}} (which is now permutations_all) the {{{__init__}}} should take in charge to call sub-classes if needed.  
 * sub-comb-classes are called {{{Permutations_constraints}}} 
 * for the objects one removes the s as in {{{Permutation}}}

  The following function are standard and should be documented/publicized for all CombClass:
 * {{{list}}}
 * {{{count}}} is the name fixed ? coherent with the rests of sage ?  
 
  The following function should be written but are not supposed to be called directly by the user:
 * {{{__contains__}}} what should the answer of {{{[2,1,3] in permutations([2,1,3])}}} ? 
 * {{{__iter__}}} this allows for the class itself to be iterated through. Therefore there is no need for iterator. The former should be deprecated and removed. 


== Objects/Elements/Parents ==



== Bijection == 
