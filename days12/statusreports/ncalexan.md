
I fixed the following bugs: 

* #2789 multivariate polynomials over residue fields of number fields are broken 
* #1367 weird bug creating fractional ideal in relative number field 
That "weird bug" was actually lots of missing conversions and questionable decisions over the years.  This required a great deal of time to understand the infrastructure to fix properly, but opens the door for easy slaying of additional bugs, including... 

* #4869 make element of relative number field from polynomial 
* #4727 list method on relative number field elements is broken -- it doesn't satisfy the most basic consistency check 
I reviewed several patches at the beginning of the conference, too.  Most made it into 3.3.0alpha2. 
