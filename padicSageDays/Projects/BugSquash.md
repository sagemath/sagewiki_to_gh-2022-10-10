
See <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=needs_info&amp;status=needs_review&amp;status=needs_work&amp;status=new&amp;component=padics&amp;order=priority&amp;type=defect">this list of open padic defects</a>. 

Keep track of the bugs you report, fix and review here: 


### Reported

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12534">#12534</a> -- negative exponents of p-adic capped relative zeros are broken 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12535">#12535</a> -- p-adic exponents are broken 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12549">#12549</a> -- p-adic is_zero doesn't normalize at the beginning 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11960">#11960</a> -- matrix of Frobenius for p = 3 is broken 

### Existing

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6667">#6667</a> -- bug in Newton polygon for p-adic polynomials 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7016">#7016</a> -- Bizarre results when taking the mod of a p-adic number 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8181">#8181</a> -- cannot coerce residue field back to p-adic ring   
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8198">#8198</a> -- p-adic precision in vector multiplication 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8240">#8240</a> -- cannot coerce p-adic field into residue field 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8627">#8627</a> -- cannot coerce p-adic capped-rel to capped-abs 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8628">#8628</a> -- confusing defaults for p-adic precision types 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10698">#10698</a> -- error in padic power series construction 

### Already Needing Review

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11895">#11895</a> -- !pAdicZZpXCRElement is unhashable 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11777">#11777</a> -- Coercion/printing problem with p-adics 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8162">#8162</a> -- p-adic ring constructor documentation incorrect 

### Fixed


### Reviewed

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11777">#11777</a> -- Coercion/printing problem with p-adics 
      * Reviewed, updated patch attached; needs re-review. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12534">#12534</a> -- negative exponents of p-adic capped relative zeros are broken 
      * This problem is fixed in the new Templates code for p-adics (#12555), and won't be fixed. 