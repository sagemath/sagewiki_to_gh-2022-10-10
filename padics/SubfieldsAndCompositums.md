
* _Goal_ -- Create extensions from other extensions using operations such as intersection, compositum and listing subfields. They should be provided with appropriate coercion maps 
* _Type_ -- advanced features 
* _Priority_ -- High 
* _Difficulty_ -- High 
* _Prerequisites_ -- <a href="/padics/GeneralExtensions">general extensions of rings</a>, <a href="/padics/PolynomialFactoring">polynomial factoring</a> 
* _Background_ --  
* _Contributors_ -- David Roe 
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion


## Tasks

1. Implement the compositum of two fields by factoring the defining polynomial for one over the other (I assume there's a better way...).  Each of the original fields should coerce into the compositum. 
1. Implement the intersection of extension rings.  Determine the precision of the defining polynomial...  The intersection should coerce into each of the original fields. 
1. Implement an algorithm to give the lattice (in the poset sense) of subfields of a given p-adic field.  These subfields should coerce naturally into the larger field. 