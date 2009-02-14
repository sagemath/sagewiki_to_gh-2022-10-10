= Combinatorial Classes =

There are a lot of design issues which concern combinatorial classes. I'd like to discuss them here. The following are mostly notes from discussion with Nicolas. Once fixed, this material should end up in the doc of CombinatorialClass. Please add comments anywhere.


== Foreword (Teminology) ==

I need to fix some terminology. Maybe the name combinatorial class is bad in the context of Object Oriented programming. Should we call these "combinatorial set" ? Anyway, in the following when there is ambiguity I write OOClass and CClass. 

== Documentation ==

We should agree on a overall structure of the main doc page of a CClass and write a template. I put here a stub for this. Before expanding it we should wait for the transition latex -> ReST.

{{{
   r"""
    My Favorite Combinatorial Class

    ...
    """
}}} 

== Interface and basic usage ==

The name of the OOClasses involved in building a CClass should be uniform : let's take the example of permutations
 * the OOClass whose unique instance is the CClass of all permutations should be named {{{Permutations}}} (which is now {{{permutations_all}}}) the {{{__init__}}} should take in charge to call sub-classes (see below discusion about factories) if needed.  
 * the OOClasses whose instances are sub-CClasses are called {{{Permutations_constraints}}} (eg:{{{Permutations_n}}}) 
 * the OOClass of the objects of a CClass are called by the singular form of the word as in {{{Permutation}}}

The following functions are standard and should be documented/publicized for all CClass:
 * {{{list()}}}
 * {{{count()}}} is the name fixed? coherent with the rest of sage?  (+1 for {{{count()}}}.  As far as I know it is standard. -jbandlow)

The following function should be written but are not supposed to be called directly by the user:
 * {{{__contains__}}} what should be the answer to {{{[2,1,3] in permutations([2,1,3])}}} ? 
 * {{{__iter__}}} this allows for the class itself to be iterated through. Therefore there is no need for {{{iterator}}}. {{{iterator}}} should be deprecated and removed. 


== Objects/Elements/Parents ==

The goal here is to be able to inherit smoothly from a combinatorial class to add extra mathematical structure (eg Poset, Group, Monoid).

 * By default each element created by a combinatorial class should have a parent by default. It seems to me that this should be that largest combinatorial class which has no constraints (Permutations and not Permutations(4) for example). This should be simple to change this behavior. 
 * Elements should be constructed by an overloadable function and never by calling directly a class name. {{{_element_constructor_}}} seems to be sage default. 

A solution is to set two (lazy)_attribute in the combinatorial class named {{{element_class}}} and {{{element_parent}}} .

(I agree strongly with the first point.  I don't understand the second point.  Could you give an example or describe this more precisely? -jbandlow)

== Bijections ==

When two combinatorial classes As and Bs with object a and b from OOclass A and B are in bijection, there are several possibilities
 * {{{a.to_B()}}} and {{{b.to_A()}}} : this is practical for the user, from the combinatorial point of view. however there is no control on the class nor the parent of the results. 
 * {{{As.from_B(b)}}} and {{{Bs.from_A(s)}}} is more consistent. The combinatorial class knows its bijections. 
 * {{{Hom(As, Bs).nameOftheBijection(a)}}} ?   

It is maybe not a very strong rule. Possible exception A is very standard and B is very exotic. Then maybe one can only write {{{b.to_A()}}} and {{{B.from_A}}}

(It might be cool to have some generic intelligence here.   Suppose I add the new CClass {{{C}}} to sage and implement {{{C._to(A,c)}}}.  Then I would like it if when I call either {{{C.to(A,c)}}} or {{{A.from(C,c)}}}, sage automatically tries both (if necessary) of {{{A._from(C,c)}}} and {{{C._to(A,c)}}}. In other words, {{{CombinatorialClass}}} itself could have a method like:{{{
def to(self, class, element):
  try:
    return self._to(class, element)
  except(NotImplementedError):
    return class._from(self, element)
}}}
And similar for {{{from()}}}. Thoughts? -jbandlow)

== Combinatorial Class Factory ==

The goal here is to make it simple to make a subclass of a combinatorial class by adding some constraints. For example if {{{p4=Permutations(4)}}}. The user may want to get the subclass of p4 of permutations of length say 5. So
 - Each combinatorial class should embed the necessary information to rebuild itself with extra constraints.
 - what is the syntax to add this extra constraints ? 
   * p4.subclass(length=5) ? 
   * other suggestion ?  (I would prefer p4.with_constraint(length=5).  I feel it is more clear than .subclass to a naive mathematician looking at a tab-completion list. -jbandlow)

 - If no algorithm is known to handle the new constraints what should be the behavior ?
   * raise an error suggesting the user to use a {{{filter}}}     
   * do the filter automatically (*Definitely* this. Why not?  -jbandlow)

(By the way, I *really* like the idea of Factories in general. -jbandlow)

Here is the copy paste of an old mail from Nicolas which was buried. 

{{{
> Factories of combinatorial classes:
> 
> There are three levels:
> 
> (a) Combinatorial class factories, like:
>     Permutations
> 
> (b) Combinatorial classes, with list/count operations:
>     Permutations(4): models the combinatorial class of permutations of size 4
>     Permutations(4, descents = [2,1])
>     Permutations(4, greater_than = [3,1,2])
>     Permutations(bruhat_smaller=[3,1,2])
>     Permutations(left_bruhat_smaller=[3,1,2])
>     Permutations(4, left_bruhat_smaller=[3,1,2]): should raise an exception
> 
>     Those are objects which may be an instance of many classes:
>      - Permutations_of_size
>      - Permutations_from_descents
>      - Permutations_lower_ideal_left_weak_order
>     Those classes are implementation details, and need not be known by the user
> 
> (c) Data structures for combinatorial objects
>     class Permutation, class PermutationArray, class PermutationCycle
> 
>     Those classes are mostly implementation details
>     They define the data structure and algorithms
> 
> (d) Combinatorial objects:
>     Permutation([1,3,2])
> 
>     One can always use a combinatorial class CC as constructor; in
>     that case, the result c is always an element of CC (i.e. c.parent() = CC)
> 
>     Example:
>      - Permutation([1,2,3]) creates one permutation in Permutations()
>      - Permutations(4)([1,2,3,4]) also creates one permutation but this time in Permutations(4)
> 
>     This might even be the recommended way.
> 
> More involved example: tableaux
> 
> (a) The Tableaux factory:
>     def Tableaux (# size options; only one can be specified?
>                   size=:, shape
>                   # content options; only one can be specified
> 		  # standard = True if none is specified?
>                   standard, alphabet, evaluation, content
> 		  young=True,
> 		  constructor)
> 
>     Maybe some aliases:
>      - def StandardYoungTableaux(*): Tableaux(*,standard=True, parent = StandardYoungTableaux())
>      - def SemiStandardYoungTableaux(*): Tableaux(*, parent = StandardYoungTableaux())
> 
> (b) Tableaux(4):          standard young tableaux of size 4
>     Tableaux(shape=[4,1]) standard young tableaux of shape [4,1]
> 
>     Tableaux(shape=[4,1], evaluation=[3,2])
>     Tableaux(shape=[4,1], alphabet=[1,2,4]) : semi standard young tableaux (obtained by crystal operations)
> 
>     The default parent for the generated tableaux, depends on the young and standard options:
>      - Tableaux(standard = True, Young = True)
>      - Tableaux(standard=False, Young = True)
>      - Tableaux(standard=False, Young = True)
> 
> 
> 
> (c) Data structures for combinatorial objects
>     Again, those classes are mostly implementation details
>     They define the data structure and algorithms (e.g. RSK will be in YoungTableau)
> 
>     There may be more than one Tableau data structure (by rows, by
>     columns) in which case Tableau is a common abstract class.
> 
> (d) Combinatorial objects:
>     Tableau([[2,3],[1,2]])
>     StandardTableau([[4,3],[1,2]])
>     StandardYoungTableau([[3,4],[1,2]])
> 
>     One can always use a combinatorial class as constructor; this
>     might even be the recommended way:
>     Tableaux([[2,3],[1,2]])
> 
> 
> Different data structures and fundamental algorithms for combinatorial objects:
>  - Tableau(LabelledObject)
>    Indexation choice: t[row,col] with indexing 0 based and longest row first
> 
>  - from Tableau derives:
>     class YoungTableau(Tableau):          implements e.g. RSK
>     class StandardTableau(Tableau)
>     class StandardYoungTableaux(YoungTableau,StandardTableau)
> 
>  - SkewTableau(LabelledObject)       (LabelledObject)
> 
>  - class AbstractTree(AbstractDigraph)
>    Defines precisely the syntax for constructors
> 
>  - class MyTree(AbstractTree)
> 
> ##############################################################################
> Factories, subfactories and subclasses
> 
> 
>  - Consider a factory and a combinatorial class C=Factory(constraints)
>    Then C.sub_class(extra_contraints) is the sub class of C satisfying
>    simultaneously the constraints for C (including the default ones)
>    and the extra_constraints. In practice, this will be constructed by
>    calling the factory with all the constraints set.
> 
>    Consider for example the Tableaux factory (recall that the options
>    standard and evaluation are mutually incompatible)
> 
>    Then, C = Tableaux() models the set of standard tableaux. It is
>    equivalent to C=Tableaux(standard=True).
>    Now, C.sub_class(evaluation=[3,2]) is *not* Tableaux(evaluation=[3,2])
>    but rather Tableaux(standard=True, evaluation=[3,2]) which should
>    trigger an error.
> 
> ##############################################################################
> Factories as databases of algorithms
> 
>    The Tableaux factory will typically be implemented using a database like:
>     {
>       { standard=True, n:     "*"} : StandardTableauxBySize
>       { standard=True, shape: "*"} : StandardTableauxByShape
>       { alphabet: "*", shape: "*"} : SemiStandardTableauxByShapeAndAlphabetCrystal
>     }
> 
>    This allows for two nice features 
>     - A posteriori extensions of the database by pluging in new algorithm
>     - Construction of partially specialized subfactory with
> 	Tableaux.subfactory(shape="*", alphabet="*")
>       to bypass the option checking for those case speed is at a premium
> 
>    Questions:
> 
>     - in some cases, we may want to split between the different cases
>       differently for counting and listing. Should we support this?
>     - does it make sense to define StandardTableaux as
>       StandardTableaux = Tableaux.sub_factory(standard=True)
> 
> 
> 
> 
> CC = CombinatorialClass
> 
> To create the combinatorial classes:
> 
> for x in Tableaux(3):
>     ...
> 
> Comp = Compositions()
> Compositions(4)              : CC of elements of Compositions()
> Compositions(4, parent=Compositions(4)) : CC of elements of Compositions(4)
> 
> Trees(4, constructor=MyTree) : CC of instances of my_data_structure
> 
> Comp.sub_class(4)            : returns Compositions(4)
> 
> Comp([3,1,2])                : returns the element [3,1,2] of Comp
> 
> Arrangements()
> 
> 
> 
> Permutations(4)([1,3,2,4]) : returns an element of Permutations(4)
> 
> In general if C is a combinatorial class C(...) returns an element of C
> (Example C=Trees(4))
}}}
