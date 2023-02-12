

# Algebraic Curves (mainly over finite fields) in Sage


## People

* William Stein, Mike Hansen, Florian Hess, Michael Stoll (remote) 

## Relevant Papers

* <a href="daysff/curves/hess-computing_riemann_roch_spaces_in_algebraic_function_fields_and_related_topics.pdf">hess-computing_riemann_roch_spaces_in_algebraic_function_fields_and_related_topics.pdf</a> 

## Slides from Talks

* <a href="daysff/curves/hess-talks-arithmetic_on_general_curves_and_applications.pdf">hess-talks-arithmetic_on_general_curves_and_applications.pdf</a> 
* <a href="daysff/curves/hess-talks-computation_of_riemann_roch_spaces_and_some_applications.pdf">hess-talks-computation_of_riemann_roch_spaces_and_some_applications.pdf</a> 

## Relevant Source Code

* May 1998 code from Florian Hess: <a href="http://www.math.tu-berlin.de/~hess/gff">http://www.math.tu-berlin.de/~hess/gff</a> 
* New code written at this Sage Days:  
            * Trac 9054: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9054">Create a class for basic function_field arithmetic for Sage</a> 
            * Trac 9094: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9094">is_square and sqrt for polynomials and fraction fields</a> 
            * Trac 9095: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9095">Heights of points on elliptic curves over function fields</a> 

## Tasks


### Stage 1: Computing Some Riemann-Roch Spaces

* (Robert Bradshaw) DONE (needs review): Fast basic arithmetic in rational function fields: <a href="http://trac.sagemath.org/sage_trac/ticket/9051">http://trac.sagemath.org/sage_trac/ticket/9051</a> 
* (William Stein) Create all the basic classes for basic arithmetic with function fields, orders, and ideals, mirroring what is available for number fields.  Without this, it isn't possible to do anything else.   This is now the following ticket: <a href="http://trac.sagemath.org/sage_trac/ticket/9054">http://trac.sagemath.org/sage_trac/ticket/9054</a> 
* (William Stein) Implement arithmetic in orders in a function field: sum, product, intersection 
            * Relevant bug: <a href="http://trac.sagemath.org/sage_trac/ticket/9053">http://trac.sagemath.org/sage_trac/ticket/9053</a> 
* (Chris Hall) Implement the reduction algorithm (easy port from above code): <a href="http://trac.sagemath.org/sage_trac/ticket/9069">http://trac.sagemath.org/sage_trac/ticket/9069</a> 
* Conversion from divisor to ideal 
* Implement writing down basis for Riemann-Roch spaces 
* A suite of basic test examples, starting with example 15 from Florian's paper above.  
* (Kevin Wilson) Residue class fields 

### Stage 2: Fleshing it out

* Round 2: p-maximizing an order 
* Factoring ideals in maximal order 
* Computation of the genus 
* Reduction of a divisor 
* Algebraic closure of base field in function field 
* More interesting examples, testing speed, etc. 

### Stage 3: Speed

* Make it all faster than Magma. 

## Some motivating remarks

Michael Stoll and I recently did some computations to classify torsion orders for elliptic curves over quartic fields.  We did part in Sage, but ran into serious trouble, which forced us to switch to Magma.  Here's Michael's assessment of what would need to be in Sage to make this computation possible: 


```txt
affine/projective schemes
  (essentially an interface to the Gröbner basis machinery).
  For example, I define the curve X_1(29) as an intersection of a bunch of
quadrics in P^21 (IIRC), or its genus 8 quotient in a similar way in P^7,
together with the map from the former to the latter.

 * for curves in particular:
  + function field
  + places and divisors (also in terms of points on the curve)
  + Riemann-Roch spaces (==> reduction of divisors, ...)
  + class groups (including discrete logs)
  + differentials (necessary for Chabauty, for example)

Some parts of the computation you can probably easily emulate in SAGE without
all the machinery at hand, like finding the F_{11^e}-points on X_1(29) and
their images on the genus 8 curve. What is likely to be hard is to get the
class group over F_11 of the genus 8 curve, to determine the image of the
cuspidal group and to find the image of the prime divisors of degree at most
4 on X_1(29)/F_11 (the latter two use the discrete log in the class group).

One could get by without the class group and discrete logs, if one can at
least determine the 2-torsion in the class group [or else show that J_1(29)
(Q) is purely cuspidal], and one can do computations with divisors. Then one
could just make a list of divisors representing the cuspidal subgroup (plus
the 2-torsion), and then check for each candidate image of a prime divisor of
degree at most 4 on X_1(29)/F_11 that it is not linearly equivalent to one of
the divisors representing the group. That would be a lot less efficient, but
that's maybe not the point. For this, you need Florian's function fields and
Riemann-Roch spaces, since you need to work with divisors and test them for
linear equivalence.

(I'm focusing on 29, beacuse that is the hardest case. 19 and 23 don't need
much; you only have to check that there are no elliptic curves over F_16 with
exactly 19 or 23 points, which I assume SAGE can do easily. 31 requires
computations of a similar nature as 29, but less involved.)

```

## Project: Computation of Riemann-Roch spaces

Correct wrapping of the "Brill Noether" algorithm from Singular. This may be just a matter of reading documentation carefully.  See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8997">trac #8997</a>.    

From William Stein: After talking with Florian Hess for a while, I'm now convinced that using Singular Brill-Noether implementation is not a good idea anyways, since Florian's algorithm is simply much nicer.   The current plan is simply to implement Florian's algorithm from scratch in Sage.   
