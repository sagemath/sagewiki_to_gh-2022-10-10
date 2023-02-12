
I've attached a .tex file and .pdf for a Sage Enhancement Proposal for improving number fields. 

Number Fields: Sage Enhancement Proposal (pdf): <a href="days4/projects/numbertheory/number_fields/NF_SEP.pdf">NF_SEP.pdf</a> 

Number Fields: Sage Enhancement Proposal (tex): <a href="days4/projects/numbertheory/number_fields/NF_SEP.tex">NF_SEP.tex</a> 

--David Roe 

====== 

Concerning orders and their fraction fields: It is very much worth it to have a possibility of representing orders in a way that is divorced from a power basis. For large degree extensions it frequently happens that working with respect to a power basis is completely impossible for any serious computation. Yet, with respect to an LLL reduced basis of the ring of integers, computations might still be quite doable. 

This is where having a number field as the field of fractions of an order comes in handy too: Going back to a power basis of a generating element can be really bad. 

I'm afraid that, in order to have the representation truly divorced from a power basis, you will need a full multiplication table.  

--Nils Bruin 
