

# Alex Ghitza's Status Report for Sage Days 12


## I fixed the following bugs:


### Modular Symbols (with Craig Citro)

* #1127 - modularSymbol complement fails for E=128a 
* #2535 - Problem with cuspidal_subspace and new_subspace for modular symbols 
NOTE: We used a naive approach to solving both of these issues, but there is more to be done about complement() and dual_free_module() for submodules of modular symbols, see for instance the new #5080 that was uncovered by Robert Bradshaw and Craig Citro. 


### Packages

* #4322 - modular polynomials database is broken 
* #4755 - CremonaDatabase().number_of_curves() should work when the optional database isn't installed 

### Number Theory

* #3045 - K.gen() where K = GF(p) returns 1, not a primitive element 

### Linear Algebra

* #4048 - missing minpoly for GF(p) 

### Calculus

* #2404 - subs_expr claims to take a dictionary, but doesn't 

### Documentation

* #5077 - bug in fibonacci function 
* #5087 - purge "cannonical" typos 