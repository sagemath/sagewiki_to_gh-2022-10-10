
Timeline:  

* Finish Groups 
* Work on getting all doctests passing 
* [Sage 3.0] 
* All doctests pass, major regression testing.  
* Merge with 3.0.x 
* [Sage 3.1 release] 
* Merge with 3.1, fix any bugs in coding sprint 
* [Sage 3.1.x or 3.2 release with new coercion (and possibly critical bug fixes, but nothing else) 
<a href="/days7/coercion/todo">To Do</a> 

The official ticket for this is at <a href="http://trac.sagemath.org/sage_trac/ticket/2314">http://trac.sagemath.org/sage_trac/ticket/2314</a> 

There is a repository up at <a href="http://sage.math.washington.edu/home/robertwb/sage-coerce-3.0.3/devel/sage-main-old">http://sage.math.washington.edu/home/robertwb/sage-coerce-3.0.3/devel/sage-main-old</a> . 

Our goal: to clarify and ease the process of writing a new ring/combinatorial class/special kind of matrix while adding mathematical structure and lessening the need for code duplication. 

Here's the minimum you would need to write for a new kind of ring (eg pAdicRingLazy): 

* In the parent: 
      * `__init__`: must specify `element_class` and a list of leaf categories that this object belongs to (eg element_class: `pAdicLazyElement` and categories: `CompleteDVR` and `TopologicalGroup`) 
      * `_has_coerce_map_from_`: define which rings coerce to this one. 
      * `_gen_` (if you have generators) 
      * `_ngens_` (if you have generators) 
      * `_repr_` 
* In the element: 
      * `__init__`: must specify the parent. 
      * Arithmetic functions (`_add_`, `_mul_`, `_neg_`, `_invert_`) 
      * `_repr_`: takes `do_latex` as an argument. 
      * `_cmp_`: can give a partial order, a total order or only specify when elements are equal or not. 
      * Pickling: if you're writing a Cython class you need to support pickling.  For now, this is done via `__reduce__`: we're trying to come up with a better system. 
Now, onto the details. 

* `Category's` 
      * Must Implement  
            * `_objects_implement_`: returns a list of strings giving the method names of methods that objects of this category must implement. 
            * `_elements_implement_` (if objects of your category have elements): returns a list of strings giving the method names of methods that elements of objects of this category must implement. 
            * `_morphisms_implement_`: returns a list of strings giving the method names of methods that morphisms of this category must implement. 
            * There needs to be a way for a category to list the "forgetting structure" functors emanating from that category.  Currently we envision these functors as having two types: faithful forgetful functors where elements remain the same and functors where the resulting object has fewer elements (eg Fields -> <a href="/MultiplicativeGroups">MultiplicativeGroups</a>) 
      * May want to implement 
            * If you prepend a method name with "_elt_" and attach it to the category then it will be available to elements.  Correspondingly with "_obj_" and objects, "_mor_" and morphisms. 
      * Quotients 
            * For general objects, one can specify a monomorphism f: X -> Y and call _obj_quotient(f) on Y should create the parent Y/X and add a coercion morphism from Y to Y/X 
            * If you just give _obj_quotient a parent X then it checks if there's a coercion morphism and uses that. 
            * For parents, one also wants to be able to specify an equivalence relation 
      * Subsets 
            * We want to be able to create new parents by specifying a test 
            * For general  
* `Functors` 
      * Functors are a primitive type (like objects, categories and elements) that are used in the category system but are also creatable by users. 
      * Must implement 
            * `_act_on_morphism_`??: takes as input a morphism that's guaranteed to be in the domain category. 
            * `_act_on_object_`??: takes as input an object that's guaranteed to be in the domain category. 
* `NaturalTransformations` 
      * I don't recall enough of my category theory off the top of my head, but we should support these. 
* `Objects` 
      * Must Implement 
            * `__init__` 
                  * Any initialization for the object 
                  * Must call superclass's `__init__` method with the following data: 
                        * a list of categories that this object type belongs to.  Superclasses (ie classes that are the image of a forgetful functor from one of the categories on the list) are automatically added, but the ORDER MATTERS for the order functions are detected in. 
* `Parents` 
      * Must Implement 
            * `__init__` 
                  * Should do any needed initialization for the parent 
                  * Must call superclass's `__init__` method with the following data: 
                        * your element class (required) 
                        * a list of leaf categories (see Object `__init__` description) 
                  * Note that `__init__` may be called more than once.  If you do things (like C memory allocation) that should only happen once, use can use `__cinit__` for Cython.  If you're writing a Python class and you care that you might get called twice, you'll have to manually track whether you've been called. 
                  * If you write a `_populate_coercion_lists_` function (see below), you must call it in your `__init__` method (and nowhere else). 
            * `_has_coerce_map_from_` (cpdef) (called by `has_coerce_map_from`) 
                  * Takes a parent as an argument and returns True iff there is a canonical map from that parent to self. 
                  * You may override `_coerce_map_from_` instead of this function.  If you override both they should be consistent. 
                  * The existence or non-existence of a coercion map is cached both in self and elsewhere.  Because parents must be immutable, the return value of this function is constant over time. 
                  * If you call the default implementation `Parent._has_coerce_map_from_(self, P)` from your implemention (which you probably don't want to do), you MUST have overridden `_coerce_map_from_` (because the two default implementations call each other). 
      * Advanced Users May Implement 
            * `_coerce_map_from_` (cpdef) (called by `coercion_from`) 
                  * Overriding this function provides the ability to specify canonical morphisms to fit into the coercion model. 
                  * It takes one argument P, the parent you're coercing from. 
                  * It should return a morphism from P to self.  This morphism should be canonical, though deterministic arbitrary choices may be allowed.  One example of this is the "natural" embedding of symmetric groups.  For a more detailed discussion of what makes a map canonical in this sense, see elsewhere. 
                  * You MUST return an object of type Morphism, or None. 
                  * The default functionality that you're replacing is: use `has_ceorcion_from` to see if a coercion exists and if so create a morphism that calls `self._element_class`'s `__init__` method. 
                  * If you override this method, you need to handle all possibilities for P. 
                  * If you call the default implementation `Parent._coerce_map_from_(self, P)` from your implemention, you MUST have overridden `_has_coerce_map_from_` (because the two default implementations call each other). 
                  * ALL COERCION MORPHISMS SHOULD COMMUTE WITH EACH OTHER (modulo possible round-off error issues).  We don't check this assumption currently, since in many cases morphisms cannot be compared for equality.  But it is an important assumption for the model, and you should keep it in mind when deciding how canonical a morphism you want to use actually is. 
            * `_convert_map_from_` (cpdef) (called by `conversion_from`) 
                  * Overriding this function provides the ability to specify conversion morphisms.  These are the morphisms that convert elements from one parent to another, possibly non-canonically. 
                  * It takes one argument P, the parent you're converting from. 
                  * It should return a morphism from P to self.  This morphism need not be canonical. 
                  * You MUST return an object of type Morphism, or None. 
                  * The default functionality that you're replacing is: create and return a morphism that calls `self._element_class`'s `__init__` method. 
                  * If you override this method, you need to handle all possibilities for P (though you can handle a few and then call `Parent._convert_map_from_(self, P)`). 
            * `_get_action_` (cpdef) (called by `get_action`) 
                  * This gives you the ability to register actions with the coercion system (so that you can use `g * x` for your favorite action). 
                  * This function takes the following arguments: 
                        * `other`.  This will usually be a parent (but could be a type, like in the case of integers acting on Python lists).  Self will be acting on other.  
                        * `op`.  This should be one of the binary operations `*, ^, +, /` in the Python operator module. 
                        * `self_on_left` (boolean, default True): whether `self` acts on `other` on the left.  For example if `self_on_left is true`, and `g` is an element of `self`, `x` of other, * is the operation, then `g * x` would call this action but `x * g` would not. 
                  * One can also implement actions using the function `_rmul_`, `_lmul_`, `_r_action` and `_l_action_` on elements.  If an action is not returned by the `_get_action_` method of either parent then the coercion model tries calling these four functions (see explanation in element), which by default raise `NotImplementedErrors`. 
      * You may want to call, but should not override 
            * `_populate_coercion_lists_` (cpdef) (should only be called in YOUR `__init__` method) 
                  * This function allows you to add coercion maps, conversion maps and actions to the coercion model. 
                  * This is a good place to put the defining coercions for your object.  For example, a morphism from the base to self, or an embedding of a number field into the complex field. 
                  * This function takes the following arguments: 
                        * `coerce_list` (default `[]`):  A list of objects, each of which is either a Morphism with codomain self, or another parent (in which case a default morphism using `element_class.__init__` is created).  These are the coercions to self that are inserted into the cache.  The should be canonical in the sense of coercion morphisms. 
                        * `action_list` (default `[]`):  A list of `Actions`, on and by self.  These actions are registered with the coercion model and inserted into the cache. 
                        * `convert_list` (default `[]`): A list of `Morphisms` with codomain self, used to convert from other parents to self.  These morphisms are inserted into the cache. 
                        * `embedding` (default `None`): A single `Morphism` with self as the domain to be inserted into the coercion model.  Only one embedding of each parent is allowed.  Since your embedding is considered a coercion map, remember that it must commute with all other coercion maps in the model.   
                        * `convert_method_name (default {{{None`): A string that gives the name of a method on elements used to generate elements of this parent.  For example, "`_integer_`" is the `convert_method_name` for the `Integer` class, "`_real_double_`" for the `RealDoubleField` class. 
                  * This function will overwrite anything in the cache that already exists with the same signature (eg a coercion map from A to B if you insert a coercion map from A to B).  If two things with the same signature are given, the latter will be used. 
                  * If both a left and right action are defined (ie another object registers an action on self on the other side as self's action on that other object), the action of the object on the left takes precedence. 
                  * The advantage is that it's one place to insert common morphisms and seeds the discovery process.  For example, if you specify a coercion map from the `RationalField` to self, then it will automatically create a coercion map from the integers to self. 
      * Generic Functions you might override 
            * `__contains__` 
                  * This method is called when you type a in B.  The default implementation casts a into B (ie computes B(a)) and returns bool(a == B(a)). 
                  * You are welcome to override this default, though be wary of straying too far from the specification. 
            * `_gen_` (cpdef) (called by `gen`) 
                  * If your object has generators, you SHOULD override this method. 
                  * It takes two arguments: 
                        * an element of the index set (default 0), which by default is the set [0,1,... ngens - 1].  This index set will usually depend on the category 
                        * a category (default None, indicating the first category in the category list), which indicates in which structure the generating is taking place.  This category is guaranteed to be in the list of categories specified at parent creation time. 
                  * The generators should generate the object in that category (over the base, if base exists).  It's nice if no subset of your generators generates, but is not required. 
                  * If this parent does not have a concept of generators in that category, raise a `ValueError`. 
                  * If you raise a `NotImplementedError`, generic category code will try to compute the appropriate value. 
            * `_ngens_` (cpdef) (called by `ngens`) 
                  * If your object has generators, you SHOULD override this method. 
                  * It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list). 
                  * It should return a non-negative integer or the infinity object giving the size of the index set. 
                  * If this parent does not have a concept of generators in that category, raise a `ValueError`. 
                  * If you raise a `NotImplementedError`, generic category code will try to compute the appropriate value. 
            * `_gens_` (cpdef) (called by `gens`) 
                  * If your object has generators, you may override this method if you don't want the standard iterator.  The most common cause would if you want to index your generators on things other than natural numbers. 
                  * It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list). 
                  * It should return an iterable object. 
                  * If this parent does not have a concept of generators in that category, raise a `ValueError`. 
                  * If you raise a `NotImplementedError`, generic category code will try to compute the appropriate value. 
            * `_gen_index_parent_` (cpdef) (called by `gen_index_parent`) 
                  * If your object has generators, you may override this method if you don't want the standard index set for generators. 
                  * It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list). 
                  * It should return a parent whose elements index the generators of self in the given category. 
                  * If this parent does not have a concept of generators in that category, raise a `ValueError`. 
                  * If you raise a `NotImplementedError`, generic category code will try to compute the appropriate value. 
            * `_base_` (cpdef) (called by `base`) 
                  * If your object belongs to a category that has a concept of base (often a base ring or field), you may want to override this method. 
                  * It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list that has a base). 
                  * It returns a parent which is the "base" of self in that category. 
                  * You may want to override this function for speed.  By default there is an implementation which searches through the categories in self's category list. 
            * `base_ring` (default implementation in categories but will usually be cpdef there) 
                  * You may want to override a default implementation of base_ring.  Some categories will provide this functionality for you. 
                  * It takes no arguments and returns a ring (which may also belong to other categories) 
            * `_base_extend_` (cpdef) (called by `base_extend`) 
                  * If your object belongs to categories with bases, you may want to implement base extension.  This method should usually be implemented in the category, but the parent is allowed to override it. 
                  * Base extension is just a pushout square in an appropriate category.  In order to have base extension, self must belong to at least one "based category," and you can specify which based category to use as an optional argument. 
                  * It takes two arguments: 
                        * Another object B' that will be the base of a new category with the same morphism category as C (the second argument).  B' must belong to the morphism category of C. 
                        * a category C, guaranteed to be a "based category" in the list of categories specified at parent creation time (default None, indicating the first category in the category list that satisfies the conditions). 
                  * This function should return a new object that fits into the commutative square with self, self.base() and B'.  The base extension of a parent should be a parent.  The base extension of a non-parent may or may not be a parent (though it usually won't be). 
      * Generic Functions that are provided for you (don't override unless you know what you're doing) 
            * `__call__` 
                  * This is the function called when you type R(a) where R is the parent you're implementing.  There is a default implementation in Parent.pyx that you should be wary of overriding because it uses the coercion model to try doing sensible things first (check if a is an `Element`, see if there's a coercion from the parent of a to self, see if there's a coercion from self to the parent of a with a section, etc). 
                  * You may want to override call if you have multiple primary arguments that you use to create an element (eg a complex field takes a real part and an imaginary part).  Optional arguments are not a problem: the default creates a parameterized morphism.  This will work even for multiple primary arguments, but might be less efficient or less aesthetically clean. 
      * Not defined functions you may want to define 
            * `__iter__` 
                  * You may want to have the capacity to iterate over the elements of self.  Writing this function will allow code such as `for a in R:` 
* Element functions 
      * Arithmetic (default implementation raises a `NotImplementedError`) 
            * `_add_` (cpdef) (call using + or `__add__`) 
            * `_mul_` (cpdef) (call using * or `__mul__`) 
            * `_neg_` (cpdef) (call using - or `__neg__`)  
            * `_invert_ (cpdef) (call using ~ or {{{__invert__`) 
      * Arithmetic (default implementation exists) 
            * `_sub_` (cpdef) (call using - or `__sub__`) 
            * `_div_` (cpdef) (call using / or `__div__`) 
                  * Use `ZeroDivisionError` when appropriate 
            * `_pow_` (cpdef) (call using ^ or ** or `__pow__`) 
                  * This allows you to override the default exponentiation algorithm. 
                  * If your parent is in a category that has multiplication, there's a default implemention of exponentiation using binary exponentiation algorithm. 
                  * Your function should take one argument, which is the exponent.  There is no guarantee as to the type of the exponent: you should do your own type checking. 
      * Functions you should implement 
            * `__init__` 
                  * This by default accepts Parent as the first argument. If not, it must have an attribute `init_no_parent` set to False 
            * `_cmp_` (cpdef) (call using >, <, ==, !=, >=, <=, `__cmp__}}, {{{__richcmp__`) 
                  * This function implements element comparison. 
                  * It takes one input, which is the element to which it is being compared.  This other element is guaranteed to have the same parent. 
                  * It should return one of 5 possible values: 
                        * 1  indicates that self > other 
                        * 0  indicates that self = other 
                        * -1 indicates that self < other 
                        * -2 indicates that self is incomparable to other (eg in a poset) 
                        * -3 indicates that the question doesn't really make sense mathematically, but Python is welcome to impose whatever order it wants to. 
                  * These return values are put together to give answers to all of the comparison questions. 
            * `_hash_` 
                  * Python claims that if two objects satisfy the == relation then they should have the same hash.  We do want mod(3, 5) == 3 and mod(3, 5) == 8 but do not want 3 to have the same hash as 8.  So we are breaking this restriction on hashing, but you should use this rule in spirit. 
                  * Hash should only work for immutable objects (matrices' hash function will fail if they have not been set to be immutable). 
                  * Our hashing should be consistent with Python hashing to the extent possible. 
                  * It should be fast. 
            * `_repr_` 
                  * This is the easiest way to define how your object prints. 
                  * It should return a string representing your object. 
                  * It takes one argument: `do_latex`.  If True, this function should return LaTeX code representing the object. 
                  * Keep in mind that your string representation may be used as a component of others.  It does not need to convey all the information about the object necessarily, though in simple cases it is nice if your object is reconstructible from the print representation. 
                  * Most things don't distinguish between `__repr__` and `__str__` but there exist objects in Sage that do.  See sage.plot.plot or sage.calculus.calculus for some examples. 
                  * To allow users more runtime control over how objects print, see the section on `Printers` 
      * Functions you may want to implement 
            * `_polynomial_`, `_integer_`, `_real_double`, etc 
                  * These functions are used by other specific other parents' `__call__` methods to create elements. 
            * `_rmul_` 
            * `_lmul_` 
            * `_r_action_` 
            * `_l_action_` 
            * `plot` 
                  * Should take whatever input needed and return an appropriate graphics object. 
            * `plot3d` 
                  * Should take whatever input needed and return a 3d graphics object. 
* `Morphisms` 
      * `Morphisms` are "arrows" or "maps" between objects in a category.  They can be composed, and there is an identity morphism from any object to itself. 
      * Morphisms tie into their category with the prefix "_mor_" (ie if a function is not found on the morphism it checks the category C and categories D for which there's a natural faithful forgetful functor from C to D, prefixing "_mor_" onto the desired name.  So to implement `inverse_image` one could implement `_mor_inverse_image` on the category) 
      * Functions you may want to implement 
            * `_call_` (cpdef) (called using () or `__call__`) 
                  * This should only be implemented for morphisms of parents (not of objects). 
                  * Takes one input, which you may assume is a element of the domain (this will be of type Element unless you're implementing a native morphism and it's a native Python type). 
                  * Should output an element of the codomain. 
            * `_composition_` (cpdef) (called using () or *) 
                  * There is a default implementation, which returns a formal composition. 
                  * Hopefully your morphism will have some sort of data attached to it which determine it and how it acts on elements.  In this case, you'll want to override `_composition_` 
            * `_cmp_` (cpdef) (called using >, <, ==, !=, >=, <=, `__cmp__`, `__richcmp__`) 
                  * Please implement this if you can: it's useful (for checking commutative diagrams for example). 
            * `section` (cpdef) 
                  * This method returns a section of the morphism, ie a left or right inverse (which may depend on if this morphism is epi or mono) 
                  * It takes one argument, the category in which the section should be a morphism (default Sets with error allowing morphisms). 
                  * If no section exists in the desired category, raise a <a href="/ValueError">ValueError</a>. 
                  * The object returned can be either a `Morphism` or a `MorphismFamily` 
            * `_repr_type_` and `_repr_defn_` 
                  * These are functions that control how the morphism prints.  They may be rethought in light of `Printers` 
            * `pushforward`, `pullback`, `upper_shriek`, etc should all be defined at the category level but might be redefined here. 
* `MorphismFamily's` 
      * In addition to `Morphisms`, Sage has `MorphismFamily's`, which can represent parameterized families of morphisms in the same category, or a single morphism that needs additional data in order to apply itself to an element (for example the ring homomorphism from the integers to the 5-adic ring of capped relative precision 20 which can take an extra argument which specifies absolute and relative precision caps of the elements so created). 
      * Functions you may want to implement 
            * `_call_` (cpdef) 
                  * Only really designed for parents, not other objects, because the one benefit is allowing the image of an element to depend on other parameters. 
                  * Unlike `Morphisms`, the `_call_` method of a `MorphismFamily` takes up to three inputs: 
                        * An element of the domain.  This is guaranteed to be in the domain. 
                        * A tuple giving positional arguments (default `None`) 
                        * A dictionary giving keyword arguments (default `None`) 
                  * Should output an element of the codomain, which can depend on the positional and keyword arguments in an arbitrary way. 
            * `_composition_` (cpdef) 
                  * The composition of two should be another `MorphismFamily`, or conceivably a `Morphism`. 
            * `_cmp_` 
            * `section` 
            * `_repr_type_` and `_repr_defn_`, `pushforward`, `pullback`, `upper_shriek`, etc should all be defined at the category level but might be redefined here. 
* `Printers` 
      * There is a hierarchy of printer objects with actually contain the code for determining string representations of objects, and default settings which control the behavior of the printers. 
      * The reason to separate this functionality from the elements, parents and categories is twofold.  First, it facilitates more user control over printing.  A user can use a context to change printing options on elements of a particular ring, on the verbosity of representations of parents or what data is shown when a category is printed.  Second, it reduces code duplication and corresponding bugs in printing code.  The optimal inheritance hierarchy for code printing various objects is vastly different from the optimal hierarchy for elements or rings.  By having a separate object control the printing and actually compute the string representation we can minimize code duplication. 
      * Implementation of this system is only just beginning.  See `sage.rings.padics.padic_printing` for the first steps. 
      * Functions you should write 
            * `repr` 
                  * This function returns a string representation of an appropriate type object. 
                  * It takes two arguments: 
                        * An object to be printed.  For the different levels of `Printers`, this will be either an element, an object or a category. 
                        * A recursion level (default 0).  This is useful in gauging the desired level of verbosity. 
* `Companions` 
      * There are often conflicting demands as to whether parents should be written in Python or Cython.  Companions are a mechanism to allow Python parents with some of the benefits of Cython parents (notably, C access to member fields common to all elements of a parent and the ability to write code that logically belongs with the parent in Cython).  Every parent has a member field which is of Companion type, which can then be inherited from.  Current examples include the `NativeIntStruct` of `IntegerMods` and the `PowComputers` of p-adics. 
Notes:  About Cython functions: 

* You must write `__reduce__` 
* Keep in mind the `__cinit__` (formerly `__new__`) 