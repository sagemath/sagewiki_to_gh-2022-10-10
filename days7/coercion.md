 *   Category functions
   *     Must Implement 
   *     May want to implement
 *   Object functions
   *     Must Implement
     *       {{{__init__}}}
       * Any initialization for the object
       * Must call superclass's {{{__init__}}} method with the following data:
         * a list of categories that this object type belongs to.  Superclasses are automatically added, but the ORDER MATTERS for the order functions are detected in.
 *   Parent functions
   *     Must Implement
     *       {{{__init__}}}
       * Should do what initialization for the parent
       * Must call superclass's {{{__init__}}} method with the following data:
         * your element class (required)
         * whether {{{element_class.__init__}}} takes Parent as the first argument (default True)
         * a list of leaf categories (see Object {{{__init__}}} description)
       * Note that {{{__init__}}} may be called more than once.  If you do things (like C memory allocation) that should only happen once, use can use {{{__cinit__}}} for Cython.  If you're writing a Python class and you care that you might get called twice, you'll have to manually track whether you've been called.
       * If you write a {{{_populate_coercion_lists_}}} function (see below), you must call it in your {{{__init__}}} method (and nowhere else).
     *   {{{_has_coercion_from_}}} (cpdef) (called by {{{has_coercion_from}}})
       * Takes a parent as an argument and returns True iff there is a canonical map from that parent to self.
       * You may override make_coercion_from instead of this function.  If you override both they should be consistent.
       * The existence or non-existence of a coercion map is cached both in self and elsewhere.  Because parents must be immutable, the return value of this function is constant over time.
   *     Advanced Users May Implement
     *       {{{_coercion_from_}}} (cpdef) (called by {{{coercion_from}}})
       *     Overriding this function provides the ability to specify canonical morphisms to fit into the coercion model.
       *     It takes one argument P, the parent you're coercing from.
       *     It should return a morphism from P to self.  This morphism should be canonical, though deterministic arbitrary choices may be allowed.  One example of this is the "natural" embedding of symmetric groups.  For a more detailed discussion of what makes a map canonical in this sense, see elsewhere.
       *     You MUST return an object of type Morphism, or None.
       *     The default functionality that you're replacing is: use {{{has_ceorcion_from}}} to see if a coercion exists and if so create a morphism that calls {{{self._element_class}}}'s {{{__init__}}} method.
       *     If you override this method, you need to handle all possibilities for P (though you can handle a few and then call {{{Parent._coercion_from_(self, P)}}}).
     *       {{{_conversion_from_}}} (cpdef) (called by {{{conversion_from}}})
       *     Overriding this function provides the ability to specify conversion morphisms.  These are the morphisms that convert elements from one parent to another, possibly non-canonically.
       *     It takes one argument P, the parent you're converting from.
       *     It should return a morphism from P to self.  This morphism need not be canonical.
       *     You MUST return an object of type Morphism, or None.
       *     The default functionality that you're replacing is: create and return a morphism that calls {{{self._element_class}}}'s {{{__init__}}} method.
       *     If you override this method, you need to handle all possibilities for P (though you can handle a few and then call {{{Parent._conversion_from_(self, P)}}}).
     *       {{{_action_on_}}} (cpdef) (called by {{{get_action}}})
     *       {{{_action_by_}}} (cpdef) (called by {{{get_action}}})
     *       {{{_populate_coercion_lists_}}} (cpdef) (should only be called in YOUR {{{__init__}}} method)
   *     Generic Functions you might override
     *       {{{__contains__}}}
       *         Do we really want to do this?  Cases: is mod(3, 5) in ZZ?  is Zp(5)(17) in ZZ?  is QQ(2) in ZZ?  is RR(2) in ZZ?
     *       {{{__cmp__}}}
     *       {{{_gen_}}} (cpdef) (called by {{{gen}}})
       *     If your object has generators, you SHOULD override this method.
       *     It takes two arguments:
         *   an element of the index set (default 0), which by default is the set [0,1,... ngens - 1].  This index set will usually depend on the category
         *   a category (default None, indicating the first category in the category list), which indicates in which structure the generating is taking place.  This category is guaranteed to be in the list of categories specified at parent creation time.
       *     The generators should generate the object in that category (over the base, if base exists).  It's nice if no subset of your generators generates, but is not required.
       *     If this parent does not have a concept of generators in that category, raise a ValueError.
       *     If you raise a NotImplementedError, generic category code will try to compute the appropriate value.
     *       {{{_ngens_}}} (cpdef) (called by {{{ngens}}})
       *     If your object has generators, you SHOULD override this method.
       *     It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list).
       *     It should return a non-negative integer or the infinity object giving the size of the index set.
       *     If this parent does not have a concept of generators in that category, raise a ValueError.
       *     If you raise a NotImplementedError, generic category code will try to compute the appropriate value.
     *       {{{_gens_}}} (cpdef) (called by {{{gens}}})
       *     If your object has generators, you may override this method if you don't want the standard iterator.  The most common cause would if you want to index your generators on things other than natural numbers.
       *     It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list).
       *     It should return an iterable object.
       *     If this parent does not have a concept of generators in that category, raise a ValueError.
       *     If you raise a NotImplementedError, generic category code will try to compute the appropriate value.
     *       {{{_gen_index_parent_}}} (cpdef) (called by {{{gen_index_parent}}})
       *     If your object has generators, you may override this method if you don't want the standard index set for generators.
       *     It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list).
       *     It should return a parent whose elements index the generators of self in the given category.
       *     If this parent does not have a concept of generators in that category, raise a ValueError.
       *     If you raise a NotImplementedError, generic category code will try to compute the appropriate value.
     *       {{{_base_}}} (cpdef) (called by {{{base}}})
       *     If your object belongs to a category that has a concept of base (often a base ring or field), you may want to override this method.
       *     It takes one argument, a category guaranteed to be in the list of categories specified at parent creation time (default None, indicating the first category in the category list that has a base).
       *     It returns a parent which is the "base" of self in that category.
       *     You may want to override this function for speed.  By default there is an implementation which searches through the categories in self's category list.
     *       {{{base_ring}}} (default implementation in categories but will usually be cpdef there)
       *     You may want to override a default implementation of base_ring.  Some categories will provide this functionality for you.
       *     It takes no arguments and returns a ring (which may also belong to other categories)
     *       {{{_base_extend_}}} (cpdef) (called by {{{base_extend}}})
       *     If your object belongs to categories with bases, you may want to implement base extension.  This method should usually be implemented in the category, but the parent is allowed to override it.
       *     Base extension is just a pushout square in an appropriate category.  In order to have base extension, self must belong to at least one "based category," and you can specify which based category to use as an optional argument.
       *     It takes two arguments:
         *   Another object B' that will be the base of a new category with the same morphism category as C (the second argument).  B' must belong to the morphism category of C.
         *   a category C, guaranteed to be a "based category" in the list of categories specified at parent creation time (default None, indicating the first category in the category list that satisfies the conditions).
       *     This function should return a new object that fits into the commutative square with self, self.base() and B'.  The base extension of a parent should be a parent.  The base extension of a non-parent may or may not be a parent (though it usually won't be).
   *     Generic Functions that are provided for you (don't override unless you know what you're doing)
     *       {{{__call__}}}
   *     Not defined functions you may want to define
     *       {{{__iter__}}}
 *   Element functions
   *     Arithmetic (raise {{{NotImplementedError}}})
     *       _add_                     (cpdef)
     *       _mul_                     (cpdef)
     *       _neg_                     (cpdef)
     *       _invert_                  (cpdef)
   *     Arithmetic (With Defaults)
     *       _sub_                     (cpdef)
     *       _div_                     (cpdef)
     *       _powlong_
     *       _pow_
   *     Functions you may want to implement
     *       _polynomial_
 *   Morphism functions
   * 
