

# Implement p-adic solver with cyclotomic p-adic reconstruction algorithm

* Here is a proof of concept implementation: 

         * <a href="cyclo/padicsolver/proofofconcept.sws">proofofconcept.sws</a> <a href="cyclo/padicsolver/proofofconcept.pdf">proofofconcept.pdf</a> 
Notes: (1) I realized that reducing the entries in B modulo p^prec right before doing right_solve greatly speeds up the above proof of concept.  (2) To make the above viable will require either modifying IML, modifying Linbox, or implementing Dixon p-adic lifting from scratch.  I think implementing Dixon itself will be the best strategy, since we really need fine control over how it works, *and* we really want to use Pernet'ts FFLAS fast matrix-mod-p code, which IML doesn't use.  

* Here are slides from a talk by Michael Monagan (join work with Liang Chen) on the same problem, but the approach is different: 

         * <a href="cyclo/padicsolver/Cyclotomic.pdf">Cyclotomic.pdf</a> 
I think this approach is perhaps misguided (?), since it doesn't seem to mention LLL at all, and it's of course **critical** to understand how to apply LLL to this problem.  There's no way around that.    
