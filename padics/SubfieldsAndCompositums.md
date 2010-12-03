 * ''Goal'' -- Create extensions from other extensions using operations such as intersection, compositum and listing subfields. They should be provided with appropriate coercion maps
 * ''Type'' -- advanced features
 * ''Priority'' -- High
 * ''Difficulty'' -- High
 * ''Prerequisites'' -- [[../GeneralExtensions | general extensions of rings]], [[../PolynomialFactoring | polynomial factoring]]
 * ''Background'' -- 
 * ''Contributors'' -- David Roe
 * ''Progress'' - not started
 * ''Related Tickets'' -- 

== Discussion ==

== Tasks ==

 1. Implement the compositum of two fields by factoring the defining polynomial for one over the other (I assume there's a better way...).  Each of the original fields should coerce into the compositum.

 1. Implement the intersection of extension rings.  Determine the precision of the defining polynomial...  The intersection should coerce into each of the original fields.

 1. Implement an algorithm to give the lattice (in the poset sense) of subfields of a given p-adic field.  These subfields should coerce naturally into the larger field.
