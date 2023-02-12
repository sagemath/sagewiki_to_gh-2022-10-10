
* _Goal_ -- Write new classes of p-adic elements, analogous to `IntegerMod_int` and `IntegerMod_int64` for the case that `self.unit` or `self.value` fits into machine precision. 
* _Type_ -- speed improvements 
* _Priority_ -- Medium-Low 
* _Difficulty_ -- Easy 
* _Prerequisites_ -- None 
* _Background_ -- understand the inheritance structure for p-adic base rings, take a look at `sage.rings.finite_rings.integer_mod` 
* _Contributors_ -- David Roe 
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion

This will be useful in the following cases: 
 p  |  max precision on 32-bit  |  max precision on 64-bit 
 2  |  15  |  30 
 3  |  9  |  19 
 5  |  6  |  13 
 7  |  5  |  11 
 11,13  |  4  |  8 
 17,19  |  3  |  7 
 23,29,31  |  3  |  6 
 37-73  |  2  |  5 
 79-211  |  2  |  4 
 223-1289  |  1  |  3 
 1291-46337  |  1  |  2 

To get an idea of the speed improvements available: 


```txt
sage: R19 = Zmod(3^19)
sage: type((R19)(1))
<type 'sage.rings.finite_rings.integer_mod.IntegerMod_int64'>
sage: R20 = Zmod(3^20)
sage: type((R20)(1))
<type 'sage.rings.finite_rings.integer_mod.IntegerMod_gmp'>
sage: a19 = R19.random_element(); b19 = R19.random_element(); a20 = R20.random_element(); b20 = R20.random_element()
sage: timeit("c19 = a19*b19")
625 loops, best of 3: 197 ns per loop
sage: timeit("c20 = a20*b20")
625 loops, best of 3: 454 ns per loop
sage: timeit("c19 = a19 + b19")
625 loops, best of 3: 178 ns per loop
sage: timeit("c20 = a20+b20")
625 loops, best of 3: 389 ns per loop
```
This may be better done as an interface to p-adics in FLINT 2: see <a class="https" href="https://github.com/SPancratz/flint2/blob/trunk/padic.h">https://github.com/SPancratz/flint2/blob/trunk/padic.h</a> 


## Tasks

1. Using `sage/rings/finite_rings/integer_mod.pyx` and `sage/rings/padics/padic_(capped_relative_element.pyx AND capped_absolute_element.pyx AND fixed_modulus_element.pyx)` as a model, implement Zp and Qp using machine arithmetic.  