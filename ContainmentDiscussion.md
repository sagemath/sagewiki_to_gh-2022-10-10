

## Modelisation of Containment in Sage

There are a lot of different usage of containment: 

Possible Usage: 

* Complete proven test 
* Probably true results `is_prime` 
* Fast test to rule out trivially wrong answer: three possible aswers: `False, True, Unknown` 
* short idiom to raise an error if the answer is False (eg: for type check) 
* containment module modulo identification/isomorphisms... Coercion/conversion. 
Notes: 

* very similar question can be raised about equality 
Possible Syntaxes: Let `P` be a parent and `x` a python data structure 

* `P(X)` build an element of `P` 
* coercion `P.coerce(X)` 
* we need a standardized way to write a function which is suppose to get an element of `P` but can take any coercible(convertible?) for syntactic sugar `x = P.ensure(X)` ?. 
* explicit conversion but without costly test.  