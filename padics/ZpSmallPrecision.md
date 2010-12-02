 * ''Goal'' -- Write new classes of p-adic elements, analogous to `IntegerMod_int` and `IntegerMod_int64` for the case that `self.unit` or `self.value` fits into machine precision.
 * ''Type'' -- speed improvements
 * ''Priority'' -- Medium-Low
 * ''Difficulty'' -- Easy
 * ''Prerequisites'' -- None
 * ''Background'' -- understand the inheritance structure for p-adic base rings, take a look at `sage.rings.finite_rings.integer_mod`
 * ''Contributors'' -- David Roe
 * ''Progress'' - not started
 * ''Related Tickets'' -- 

== Discussion ==

This will be useful in the following cases:

|| p || max precision on 32-bit || max precision on 64-bit ||
|| 2 || 15 || 30 ||
|| 3 || 9 || 19 ||
|| 5 || 6 || 13 ||
|| 7 || 5 || 11 ||
|| 11,13 || 4 || 8 ||
|| 17,19 || 3 || 7 ||
|| 23,29,31 || 3 || 6 ||
|| 37-73 || 2 || 5 ||
|| 79-211 || 2 || 4 ||
|| 223-1289 || 1 || 3 ||
|| 1291-46337 || 1 || 2 ||

== Tasks ==

 1. Using `sage/rings/finite_rings/integer_mod.pyx` and `sage/rings/padics/padic_(capped_relative_element.pyx AND capped_absolute_element.pyx AND fixed_modulus_element.pyx)` as a model, implement Zp and Qp using machine arithmetic. 
