{{{
 *   Parent functions
   *     Must Implement
     *       __init__
     *       has_coercion_from         (cpdef)
     *       gen
     *       ngens
     *       base_extend?
   *     For Advanced Users
     *       make_coercion_from        (cpdef)
     *       make_conversion_from      (cpdef)
     *       make_action_on            (cpdef)
     *       make_action_by            (cpdef)
     *       _populate_coercion_lists  (cpdef)
   *     Advanced Calls
     *       get_coercion_from         (cpdef)
     *       get_conversion_from       (cpdef)
     *       get_action                (cpdef)
   *     Generic Functions you might override
     *       __contains__
       *         Do we really want to do this?  Cases: is mod(3, 5) in ZZ?  is Zp(5)(17) in ZZ?  is QQ(2) in ZZ?  is RR(2) in ZZ?
     *       __cmp__
     *       __call__
   *     Not defined functions you may want to define
     *       __iter__
 *   Element functions
   *     Arithmetic (raise NotImplemented)
     *       _add_                     (cpdef)
     *       _mul_                     (cpdef)
     *       __neg__                   (spec)
     *       __invert__                (spec)
   *     Arithmetic (With Defaults)
     *       _sub_                     (cpdef)
     *       _div_                     (cpdef)
     *       _powlong_
     *       _pow_
   *     Functions you may want to implement
     *       _polynomial_

}}}
