

# Combinatorial Classes

There are a lot of design issues which concern combinatorial classes. I'd like to discuss them here. The following are mostly notes from discussion with Nicolas. Once fixed, this material should end up in the doc of CombinatorialClass (I volunteer for this -Florent). Please add comments anywhere. 


# IMPORTANT NOTE : most of this content is outdated see here

The decision was the following: 

Rename combinatorial class enumerated set and to make them parents as any sage sets. As any sage parent they must belongs to a category. Here is the current status:  

Any set of combinatorial objects should be a parent in either category `FiniteEnumeratedSets()` or `InfiniteEnumeratedSets()` or even `EnumeratedSet()` if the cardinality is unknown. The code for these categories seems to be stable and moreover, there are examples showing how to write such a parent (please see `FiniteEnumeratedSets().example()` and `InfiniteEnumeratedSets().example()` from sage) or the respective files in `sage/categories/examples`. You also may want to have a look at the category `Sets()` associated to the files `sets_cat.py` for the problem of constructing elements in a parent. 

On the other hand, concerning the infrastructure a final step is currently done by allowing categories to work with Cython/extension types (see trac #7921). So there shouldn't be any infrastructure problem. 

I'm (Florent) currently working on adapting the combinatorial code to this design. But this is still in progress. The plan is to have trees and binary trees in sage as soon as possible and then to rework permutations, partitions ... 


## Kept for reference

[[_TOC_ 2]] 


## Foreword (Teminology)

I need to fix some terminology. Maybe the name combinatorial class is bad in the context of object oriented programming. Should we call these "combinatorial set" ? Anyway, in the following when there is ambiguity I write OOClass and CClass.  


## Documentation

We should agree on a overall structure of the main doc page of a CClass and write a template. I put here a stub for this. Before expanding it we should wait for the transition latex -> ReST. 


```txt
   r"""
    My Favorite Combinatorial Class

    ...
    """
```
 


## Interface and basic usage

The name of the OOClasses involved in building a CClass should be uniform : let's take the example of permutations 

* the OOClass whose unique instance is the CClass of all permutations should be named `Permutations` (which is now `permutations_all`) the `__init__` should take in charge to call sub-classes (see below discusion about factories) if needed.   
* the OOClasses whose instances are sub-CClasses are called `Permutations_constraints` (eg:`Permutations_n`)  
* the OOClass of the objects of a CClass are called by the singular form of the word as in `Permutation` 
The following functions are standard and should be documented/publicized for all CClass: 

* `CC.list()` 
* `CC.cardinality()`  
      * Note: using `CC.count()` or `len(CC)` is deprecated in Sage 3.4.1 
The following function should be written but are not supposed to be called directly by the user: 

* `__contains__` what should be the answer to `[2,1,3] in permutations([2,1,3])` ?  
* `__iter__` this allows for the class itself to be iterated through.  
      * Note: using `CC.iterator()` is deprecated in Sage 3.4.1 
== Sets with several natural enumerations 

An enumerated set has, by definition, a single canonical enumeration, to which list/<ins>iter</ins>/rank/unrank should all adhere to. To implement several enumerations on the same set, one should construct as many enumerated sets. 
```txt
sage: C = Combinations(range(6),3, enumerated_by='ChaseGrayCode')
sage: for c in C:
        ...
```
As a sugar for the user, one may also want to allow for: 
```txt
C.enumerated_by('lex')
```
which returns the same enumerated set  as Combinations(..., enumerated_by = 'lex') 

To be discussed: any better suggestion for the keyword name? enumeration? ordered_by? 


## Objects/Elements/Parents

The goal here is to be able to inherit smoothly from a combinatorial class to add extra mathematical structure (eg Poset, Group, Monoid). 

* Every combinatorial object created by a combinatorial class should have a parent. By default, this parent should be the largest combinatorial class containing this object (Permutations and not Permutations(4) for example).  
* It should be easy to specify an alternative parent. Typical use case: adding a group structure on Permutations(4). 
* By default, this should be done by deriving a subclass, and overloading _element_constructor_. As a syntactical sugar, and in the often used use-cases where creating a new class would be inconvenient, one can instead pass the parent as an optional argument: `Permutations(4, element_constructor=Permutations())` (or `parent=...`?).  
* In general, the element_constructor (say in `CC(5, element_constructor=constr))` is a gadget allowing to construct objects; it does not necessarily need to be a parent; it could just be a class, a function, a callable, ... Also, how constr is actually used by CC is specified by CC. Most of the time that will be constr(some data). But when, for example, the elements of CC are tree-like objects, we could imagine CC using constr as `constr.leaf(label=3)`, or `constr.node(label=3, [child1, child2])` 
         * Let me give an example: I want to construct the symmetric group `SG4` from the CClass `Permutations(4)` (what an original example :-). I clearly want to write `SG4.count()` and `SG4.list()`. A good way to do this is that the OOClass of `SG4` (says `SymGroup` for short) inherits from the OOClass Permutations. But we have to be careful that `SG4.list()` construct instance of `SG4.element_class` (whatever it is) with parents `SG4` and not instance of `Permutation` with parent `Permutations()`.   
A solution is to set two (lazy)_attribute in the combinatorial class named `element_class` and `element_parent`, and to define  
```txt
   def CClass._element_constructor_(self, x):
      return self.element_class(z, self.element_parent)
```
Of course for this to work we must ensure that any element constructed by the CClass is constructed through this function or by methods of `self.element_class`. Except as a default in `self.element_class` there should not be any reference in `Permutations`, `Permutations_n` and the others to the OOClass `Permutation`. 

(I agree strongly with the first point.  I don't understand the second point.  Could you give an example or describe this more precisely? -jbandlow 

Yes ! see up there -Florent) 


## Bijections

When two combinatorial classes As and Bs with object a and b from OOclass A and B are in bijection, there are several possibilities: 

* `a.to_B()` and `b.to_A()` : this is practical for the user (automatic completion), from the combinatorial point of view. however there is no control on the class nor the parent of the results.  
* `As.from_B(b)` and `Bs.from_A(s)` is more consistent. The combinatorial class knows its bijections. And we can get the bijection itself 
         * by f = As.from_B. Also, it can work on some object b which is not typed (say a list or tuple). 
* `Hom(As, Bs).nameOftheBijection(a)` 
* Bs(a) / B(a) 
We probably should not try to impose too strong a choice, since depending on the context some possibilities are much more natural than others. For example, if A is very standard and B is very exotic, the most natural is to use `b.to_A()` and `B.from_A(a)`. 

At the moment, I (NT) would recommend implementing whichever of a.to_B(), B.from_A(a), or Bs.from_A(a) feels more natural and practical code wise. Possibly with aliases like `B.from_A(a)` calling `a.to_B()`, or `B(a)` calling `B.from_A(a)` for the most common use cases. 

Also, I would recommend keeping the <ins>init</ins>() as concise as possible. Ideally, they would just handle basic construction of objects from simple input, and possibly some dispatching logic. All the rest should be delegated to the .from_ and .to_. 

Then, when we will have more experience, we should investigate further the more advanced options which are discussed below. 


### Toward a bijection framework?

(It might be cool to have some generic intelligence here.   Suppose I add the new CClass `C` to sage and implement `C._to(A,c)`.  Then I would like it if when I call either `C.to(A,c)` or `A.from(C,c)`, sage automatically tries both (if necessary) of `A._from(C,c)` and `C._to(A,c)`. In other words, `CombinatorialClass` itself could have a method like:
```txt
def to(self, class, element):
  try:
    return self._to(class, element)
  except(NotImplementedError):
    return class._from(self, element)
```
And similar for `from()`. Thoughts? -jbandlow) 

I like this idea of generic intelligence which looks both at the domain and the image set. However, it it not clear for me if we  prefer to write `Cs.to(As,c)` than `C.to(A, c)` (remember `C` and `A` is the OOClass of `a` and `c` whereas `Cs` and `As` are combinatorial classes. Bijection acts on objects but are beetween combinatorial classes. So I seems to be in favor of `Cs.to(As,c)` - Florent +1 (NT);  and also, Cs.to(As) to get the bijection itself. 

Further comments about jbandlow suggestion: 

* maybe we want to use coercion for that. 
         * NT: delegating the dispatch logic to conversions definitely sounds good. I am not so sure about coercions, unless the bijection is really really canonical. 
* How to deal with several bijections? extra arg `Cs.to(As, c, 'name_of_the_bijection')`. I maybe prefer `Cs.to(As, 'name')(c)` 
         * +1 (NT) 
* To avoid unuseful selection/dispatching logic I'd rather _to to try `A._from_C` and `C._to_A`.  
Further comments ? 


## Combinatorial Class Factory

The goal here is to make it simple to make a subclass of a combinatorial class by adding some constraints. For example if `p4=Permutations(4)`. The user may want to get the subclass of p4 of permutations of length say 5. So 

* - Each combinatorial class should embed the necessary information to rebuild itself with extra constraints. - what is the syntax to add this extra constraints ?  
      * p4.subclass(length=5) ?  
      * other suggestion ?  (I would prefer p4.with_constraint(length=5).  I feel it is more clear than .subclass to a naive mathematician looking at a tab-completion list. -jbandlow) - If no algorithm is known to handle the new constraints what should be the behavior ? 
      * raise an error suggesting the user to use a `filter`      
      * do the filter automatically (*Definitely* this. Why not?  -jbandlow 
Probably because we can't do that automatically. How do you choose from which class you filter in horrible things such as  
```txt
Permutations().with_constraint(descents=[3,5], shape=[4,3,1,1], length=7)
```
As suggested by Nicolas, we can do that if there is a syntax for the user to tell what is the base class and what is the filter condition. - Florent) 

(By the way, I *really* like the idea of Factories in general. -jbandlow) 

Here is the copy paste of an old mail from Nicolas which was buried.  


```txt
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
>                 # standard = True if none is specified?
>                   standard, alphabet, evaluation, content
>                 young=True,
>                 constructor)
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
>       Tableaux.subfactory(shape="*", alphabet="*")
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
```