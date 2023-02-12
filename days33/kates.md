

### Project Leader

Kate 


### Group Members

Aly, Jenn, Diane, Ekin 


### Project Description

Associated notebook file <a href="days33/kates/KateWishList.sws">KateWishList.sws</a> 

Projects are listed by section below.  No one is currently working on these ones: 

   * Compute lots of examples to find guesses for bounds on "C" 
   * Put Kate's EDS class into sage (document properly)? 

### Restricted global_minimal_model()

* Ticket needs review! <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11827">#11827</a>  


### Wrapping E.reduction(prime)(P)

* Our first positive review! <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11822">#11822</a>  


### p-adics

* Implement E.reduction(p) for E defined over a p-adic fields: <a href="days33/kates/reduction of elliptic curves over padics.sws">reduction of elliptic curves over padics.sws</a> 

   * This found a bug/needed enhancement which is now reported: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11826">#11826</a> 
* Tate's algorithm <a href="days33/kates/Tate.sws">Tate.sws</a> <a href="days33/kates/tate(1).sws">tate(1).sws</a> 


### Singular Cubics

<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11823">Trac ticket 11823</a> 

* Currently the patch on the trac server will allow one to define singular cubics.   


```txt
sage: E = WeierstrassCubic([0,0,0,0,0])
sage: E.is_singular()
True
```
* Stuff to do: 

   * Work through elliptic curve documentation, test functions that should work for singular curves, and update the following lists 
   * Document the <a href="/WeierstrassCubic">WeierstrassCubic</a> and <a href="/SingularWeierstrass">SingularWeierstrass</a> classes we've created 
   * Do the stuff on the list below 
   * make E.reduction(bad_prime) able to return this singular cubic object 
   * put the checks back in for <a href="/EllipticCurve">EllipticCurve</a> and <a href="/SingularWeierstrass">SingularWeierstrass</a> that it is actually (or is not) singular 
* Functions that seem ok out of the box (so need only documentation adjustment/testing): 

   * a_invariants() etc 