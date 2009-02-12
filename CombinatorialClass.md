= Combinatorial Classes =

There are a lot of design issues which concern combinatorial classes. I'd like to discuss them here. The following are mostly notes from discussion with Nicolas. Once fixed this material should ends in the doc of CombinatorialClass. Please add comment at any places.

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

The goal here is to be able to inherits smoothly from a combinatorial class to add extra mathematical structure (eg Poset, Group, Monoid).

 * By default each element created by a combinatorial class should have a parent (Permutations for example).
 * Any element should be constructed by an overloadable function and never by calling directly a class name. {{{_element_constructor}}} seems to be sage default. 

A solution is to set two (lazy)_attribute in the combinatorial class named {{{element_class}}} and {{{element_parent}}}



== Bijections ==

When two combinatorial classes As and Bs with object a and b from OOclass A and B are in bijection, there are several possibilities
 * a.to_B() and b.to_A() : this is practical for the user, from the combinatorial point of view. however there is no control on the class nor the parent of the results. 
 * As.from_B(b) and Bs.from_A(s) is more consistent. The combinatorial class knows its bijections. 
 * Hom(As, Bs).nameOftheBijection(a) ?   

It is maybe not a very strong rule. Possible exception A is very standard and B is very exotic. Then maybe one can only write b.to_A() and B.from_A



== Combinatorial Class Factory ==

The goal here is to make is simple to take a subclass of a combinatorial class by adding some constraints. For example if {{{p4=Permutations(4)}}}. The user may want to get the subclass of p4 of permutations of length say 5. So
 - Each combinatorial class should embed the necessary information to rebuild itself with extra constraint.
 - what is the syntax to add this extra constraints ? 
   * p4.subclass(length5=5) ?
   * other suggestion ? 
 - If no algorithm is known to handles the new constraints what should be the behavior ?
   * raise an error suggesting the user to use a {{{filter}}}     
   * do the filter automatically   
