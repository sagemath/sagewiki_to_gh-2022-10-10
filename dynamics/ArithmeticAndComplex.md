= Arithmetic and Complex Dynamics =

The goal of sage-dynamics is to improve the open source mathematical software Sage for computer exploration in dynamical systems and foster code sharing between researchers in this area. This portion focuses on the Arithmetic (Number Theoretic) and Complex aspects of dynamical systems.

== News ==

 * [[https://wiki.sagemath.org/days104 | Sage Days 104]] - Sage Days on Arithmetic Dynamics - November 17, 2019 - November 20, 2019, Saint Louis University

 * [[https://icerm.brown.edu/summerug/ | Summer@ICERM]] - REU Program on Computational Arithmetic Dynamics - June 10, 2019 - August 2, 2019

== Past News ==

 * [[http://www.nsf.gov/awardsearch/showAward?AWD_ID=1415294 | NSF DMS-1415294]] - Computational Tools for Dynamical Systems 9/2014 - 8/2017 (P.I.: Hutz)

 * [[https://icerm.brown.edu/collaborate/ | ICERM@Collaborate]] - Program on Computational Arithmetic Dynamics - July 25, 2016 - July 29, 2016

 * [[http://wiki.sagemath.org/sagedaysACD | Sage Days]] Held Sage Days 55 (November 7-10, 2013) at Florida Institute of Technology.

 * January 30, 2012 - May 4, 2012 [[http://icerm.brown.edu/sp-s12 | ICERM semeser program on Complex and Arithmetic Dynamics]]

== How to participate and contribute ==

 * [[http://groups.google.com/group/sage-dynamics | sage-dynamics]]: Google group

  * anyone may subscribe by sending an e-mail to: sage-dynamics+subscribe at googlegroups dot com

== Documentation and Tutorials ==

 * Quick reference card for dynamics available on the Sage Quickref page ([[https://wiki.sagemath.org/quickref/]])

 * [[http://www.sagemath.org/doc/developer/ | Sage developer's guide]]
 
 * sage-combinat has many excellent tutorials [[http://combinat.sagemath.org/doc/ | combinat docs]]

== Road Map ==

The arithmetic and complex dynamics functionality in Sage is currently in its infancy. A significant amount of functionality was developped at the ICERM semester in Spring 2012 and now we have started the process of moving this into Sage through a series of patches (trac tickets). Most of that functionality is current in experimental for that been greatly expanded upon at [[http://wiki.sagemath.org/sagedaysACD | Sage Days 55]]. Much remains to be done. Below you will find a road map of what has been implemented, what is in the process of being implemented, and ideas for future functionality.

== In Progress ==

 * ([[http://trac.sagemath.org/ticket/28107|#28107]]) needs-work: allowing invariant_generators() to take arbitrary character - Brandon Gontmacher, Ben Hutz

 * ([[http://trac.sagemath.org/ticket/25745|#25745]]) needs-work: Periodic Proportion Homomorphism over Finite Fields - Rebecca Lauren Miller

 * ([[http://trac.sagemath.org/ticket/25701|#25701]]) needs-review: Implement Sieve algorithm for product_projective space - Raghukul Raman

 * ([[http://trac.sagemath.org/ticket/23806|#23806]]) needs-info: don't choose default affine patch on projective point init - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/23807|#23807]]) needs-work: fix issues with identical affine patches - Ben Hutz, Peter Bruin, Raghukul Raman

 * ([[http://trac.sagemath.org/ticket/23816|#23816]]) needs-review: left matrix action on scheme points - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/23740|#23740]]) new: Plotting Julia sets for general polynomials - Ben Barros

 * ([[http://trac.sagemath.org/ticket/23720|#23720]]) needs-work: Plotting Mandelbrot sets for general polynomials - Ben Barros, Colby Kelln

 * ([[http://trac.sagemath.org/ticket/23047|#23047]]) new: Meta Ticket: Utilize coercion framework for scheme points and morphisms

 * ([[http://trac.sagemath.org/ticket/21129|#21129]]) needs-review: implementation of Arakelov-Zhang pairing for rational maps - Paul Fili, Holly Krieger\


== Wishlist ==

 * PLEASE ADD MORE...

 ||||||||'''Wishlist'''||
 || Area|| Description || Difficulty || Priority ||
 ||<|1> Products of Projective Spaces || Rational Points on Subschemes || Implement an efficient rational points search on subschemes. Currently it is done by enumeration unless dim is 0 || ||
 ||<|1> Polynomials || specific functionality for regular polynomial endomorphisms of P^N || || ||
 || Attracting Cycles || Check if for a given algebraic parameter c the map z -> z^2 + c is hyperbolic... and more generally for rational maps of P1 determine the existence (and list) of attracting cycles || || ||
 || Non-Integral Domains || Make projective space work over non-integral domains. One method would be to make a valid point on which is valid for modulo all maximal ideals || || ||
 ||<|1> Documentation || Write Tutorials || || ||
 ||<|1> Complex Dynamics || Implement Thurston's algorithm. More precisely, develop an efficient method to determine if there is a Thurston obstruction. (Epstein, ICERM) || || ||
 || Dynamical Zeta Functions || Compute the dynamical zeta function || || ||
 ||<|4>Miscellaneous ||Implement a function which takes as input to rational functions $f(x)$ and $g(x)$, and determines whether or not $f^n=g^m$ for some integers $n,m \geq 1$. (Zieve, ICERM) || || ||
 || fix inheritance structure in generic/morphism/py. see tracc 14711 || || ||
 || implement more general schemes - charts, morphisms || || ||
 || color code cyclegraph. mark critical points for pcf potrait. perhaps color code points in intermediate fields for finite fields || || ||
 ||<|3> Postcritically finite morphisms || given a number field enumerate pcf maps over that field || || ||
 || given a graph, find a pcf map with that graph (approximate with spider algorithm or exact?) || || ||
 || given a family, which members are pcf|| || ||
 || Berkovich P1 || || ||  ||

== Complete ==

 * --([[http://trac.sagemath.org/ticket/28169|#28169]])-- closed sage-8.9: Option for adjugate in conjugation function with normalize_coordinates - Meghan Grip, Emily Rachfal, Talia Blum, John Doyle

 * --([[http://trac.sagemath.org/ticket/28161|#28161]])-- closed sage-8.9: Make _number_field_from_algebraics() return a dynamical system - Jasmine Camero, Olivia Schwager

 * --([[http://trac.sagemath.org/ticket/28148|#28148]])-- closed sage-8.9: sigma_invariants() bug over FunctionFields - Joey Lupo

 * --([[http://trac.sagemath.org/ticket/28109|#28109]])-- closed sage-8.9: Renaming and improvement of periodic point methods - Erich Zhu, Alex Galarrage, Biance Thompson

 * --([[http://trac.sagemath.org/ticket/28071|#28071]])-- closed sage-8.9: Enhance global_height functionality for other fields - Talia Blum, Trevor Hyde, Joey Lupo, Matt Torrence

 * --([[http://trac.sagemath.org/ticket/28070|#28070]])-- closed sage-8.9: is_conjugate bug fix and enhancements - Colby Kelln, Leopold Mayer, Wayne Peng, Srinjoy Srimani, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/28065|#28065]])-- closed sage-8.9: Rational Preimages of Non-endomorphisms - Anna Chlopecki

 * --([[http://trac.sagemath.org/ticket/28032|#28032]])-- closed sage-8.9: Automorphism group for some degree 1 maps - Shuofeng Xu, Max Weinreich, Brandon Gontmacher, Heidi Benham

 * --([[http://trac.sagemath.org/ticket/28028|#28028]])-- closed sage-8.9: Enhance change_ring method on morphisms to use canonical embedding when possible, give clearer error in other cases - Henry Talbot

 * --([[http://trac.sagemath.org/ticket/28027|#28027]])-- closed sage-8.9: Adding cyclegraph functionality to product projective dynamical systems - Alex Galarrage, Alex Shearer, Eric Zhu

 * --([[http://trac.sagemath.org/ticket/28026|#28026]])-- closed sage-8.9: missing parameter in critical_point_portrait for dynamical systems - Brandon Gontmacher, Max Weinreich, Juliano Leveier

 * --([[http://trac.sagemath.org/ticket/28024|#28024]])-- closed sage-8.9: Add FractionField support to specialization - Matt Torrence

 * --([[http://trac.sagemath.org/ticket/27995|#27995]])-- closed sage-8.9: normal_form should Return the Embedding when working over a Finite Field - Meghan Grip, Julia Cai, Srinjoy Srimani, Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/27994|#27994]])-- closed sage-8.9: Name mismatch on affine space and projective space constructors - Matt Torrence, Olivia Schwager, Shuofeng Xu

 * --([[http://trac.sagemath.org/ticket/27992|#27992]])-- closed sage-8.9: sanity check parameter added to prime_list in minimal_model - Talia Blum, Jasmine Camero, Joey Lupo

 * --([[http://trac.sagemath.org/ticket/27985|#27985]])-- closed sage-8.9: Make dynatomic polynomial coerce base ring - Henry Talbot

 * --([[http://trac.sagemath.org/ticket/27984|#27984]])-- closed sage-8.9: Coercion of inputs of orbit into projective space - Emily Rachfal

 * --([[http://trac.sagemath.org/ticket/27983|#27983]])-- closed sage-8.9: Add monic=True option for chebyshev creator - Leo Mayer

 * --([[http://trac.sagemath.org/ticket/27982|#27982]])-- closed sage-8.9: Make Lattes map for projective space coerce base ring - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25243|#25243]])-- closed sage-8.9: is postcritically finite failure for extensions - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25239|#25239]])-- closed sage-8.9: QQbar points of subschemes not valid - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25237|#25237]])-- closed sage-8.9: normlize_coordinates for projective morphism not fully normalized - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/23813|#23813]])-- closed sage-8.9: matrix action on scheme morphism polynomials - Adam Towsley

 * --([[http://trac.sagemath.org/ticket/27900|#27900]])-- closed sage-8.8: removed deprecated dynamics code from schemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25952|#25952]])-- closed sage-8.4: smallest coefficient model for binary forms and dynamical systems - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25839|#25839]])-- closed sage-8.4: Raise Error if Univariate PR used to construct ProjectiveSpace - Joseph Lupo

 * --([[http://trac.sagemath.org/ticket/25795|#25795]])-- closed sage-8.4: minor optimization in comparison between morphisms - Raghukul Raman

 * --([[http://trac.sagemath.org/ticket/25939|#25939]])-- closed sage-8.4: error in Well's algorithm for canonical height - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25897|#25897]])-- closed sage-8.4: incorrect Comparison of embedding index in projective_embedding - Raghukul Raman

 * --([[http://trac.sagemath.org/ticket/25878|#25878]])-- closed sage-8.4: implement Height function for product morphism - Raghukul Raman

 * --([[http://trac.sagemath.org/ticket/25821|#25821]])-- closed sage-8.4: implement height functions for product points - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25792|#25792]])-- closed sage-8.4: add dehomogenize function for product projective point - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25781|#25781]])-- closed sage-8.4: add Comparison operator for morphism between product - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25697|#25697]])-- closed sage-8.4: Implement enumeration over QQ for product projective schemes - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25523|#25523]])-- closed sage-8.4: Raise Exception if DynamicalSystem initialized with coeffs not in given domain - Joseph Lupo
 
 * --([[http://trac.sagemath.org/ticket/25446|#25446]])-- closed sage-8.4: compute all orbits of minimal models of dynamical systems - Ben Hutz
 
 * --([[http://trac.sagemath.org/ticket/25241|#25241]])-- closed sage-8.4: fix issue with change_ring for polynomials with Maps - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25780|#25780]])-- closed sage-8.3: Normalize bound checking in points function - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25592|#25592]])-- closed sage-8.3: enum_affine_rational_field function is missing points - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25564|#25564]])-- closed sage-8.3: implement __hash__ for affine_point - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25529|#25529]])-- closed sage-8.3: Implement Sieving to replace search enumeration - Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/25513|#25513]])-- closed sage-8.3: Scheme endomorphism as_dynamical_system() check if already DynamicalSystem - Joseph Lupo

 * --([[http://trac.sagemath.org/ticket/25242|#25242]])-- closed sage-8.3: is_polynomial fails when multiple roots - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25240|#25240]])-- closed sage-8.3: Chebyshev and Lattes maps should be created as dynamical systems - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/23627|#23627]])-- closed sage-8.3: Update points() in projective_homset.py and affine_homset.py to work over CC and CDF - Ben Hutz, Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/25242|#25242]])-- closed sage-8.3: is_polynomial fails when multiple roots - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/25240|#25240]])-- closed sage-8.3: Chebyshev and Lattes maps should be created as dynamical systems - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/24994|#24994]])-- closed sage-8.3: convert mandelbrot/julia interact to jupyter notebook - Frédéric Chapoton, Jeroen Demeyer 

 * --([[http://trac.sagemath.org/ticket/22771|#22771]])-- closed sage-8.3: Numerical Precision for Heights in Number Fields - TJ, Raghukul Raman 

 * --([[http://trac.sagemath.org/ticket/23814|#23814]])-- closed sage-8.1: fix is_preperiodic domain check - Paul Fili

 * --([[http://trac.sagemath.org/ticket/23811|#23811]])-- closed sage-8.1: fix bug is specialization - Paul Fili

 * --([[http://trac.sagemath.org/ticket/23810|#23810]])-- closed sage-8.1: fix typo is critical point portrait - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/23805|#23805]])-- closed sage-8.1: implement coercion for scheme points - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/23571|#23571]])-- closed sage-8.1: Implement Veronese Embedding - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/23434|#23434]])-- closed sage-8.1: move subscheme code - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/23808|#23808]])-- closed sage-8.1: save embedding in _numberfield_from_algebraics - Paul Fili

 * --([[http://trac.sagemath.org/ticket/23809|#23809]])-- closed sage-8.1: fix normalization in canonical height - Paul Fili

 * --([[http://trac.sagemath.org/ticket/23497|#23497]])-- closed sage-8.1: relocate dynamics code - Ben Hutz, Xander Faber

 * --([[http://trac.sagemath.org/ticket/8423|#8423]])-- closed sage-8.1: Julia sets - Ben Barros

 * --([[http://trac.sagemath.org/ticket/23425|#23425]])-- closed sage 8.1: Plotting external rays of mandelbrot set - Ben Barros

 * --([[http://trac.sagemath.org/ticket/23457|#23457]])-- closed sage 8.1: allow infinity to initialize projective point - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/23334|#23334]])-- closed sage 8.1: Implement Well's canonical height algorithm - Lauren Miller

 * --([[http://trac.sagemath.org/ticket/23333|#23333]])-- closed sage 8.1: Improve sigma invariant - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/23257|#23257]])-- closed sage 8.1: Plotting the Mandelbrot set in Sage - Ben Barros

 * --([[http://trac.sagemath.org/ticket/23086|#23086]])-- closed sage 8.0: Cyclegraph for projective morphisms - Ben Barros

 * --([[http://trac.sagemath.org/ticket/22556|#22556]])-- closed sage 8.0: implement periodic points for rational maps on projective space - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21118|#21118]])-- closed sage 8.0: list of degrees of iterates of function - Joseph Silverman, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/22743|#22743]])-- closed sage 8.0: little clean up of Wehler K3 - Frederic Chapoton

 * --([[http://trac.sagemath.org/ticket/22580|#22580]])-- closed sage 8.0: Normalize nth iterate in projective morphism - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/22268|#22268]])-- closed sage 7.6: copy for scheme morphisms points not deep enough - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/22265|#22265]])-- closed sage 7.6: fix dynatomic polynomial - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/22293|#22293]])-- closed sage 7.6: products and powers of schemes and subschemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/22269|#22269]])-- closed sage 7.6: Segre embedding for multiple component products - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21117|#21117]])-- closed sage 7.6: specialization for subschemes and scheme_morphisms - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21248|#21248]])-- closed sage 7.5: implementation of Reduced Binary Form by Stoll and Cremona- Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/21285|#21285]])-- closed sage 7.4: error in change_ring for affine morphisms - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21100|#21100]])-- closed - duplicate/won't fix: division error in normalize_coordinates - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21113|#21113]])-- closed sage 7.4: unflattening morphism error - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21112|#21112]])-- closed sage 7.4: wrong base ring in sigma invariants - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21108|#21108]])-- closed sage 7.4: use flattening in quo_rem - Vincent Delacroix

 * --([[http://trac.sagemath.org/ticket/21106|#21106]])-- closed sage 7.4: class for flattening morphism - Vincent Delecroix, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21104|#21104]])-- closed sage 7.4: indeterminancy locus - Michelle Manes

 * --([[http://trac.sagemath.org/ticket/21099|#21099]])-- closed sage 7.4: critical subscheme / critical points for a map on projective space - Michelle Manes

 * --([[http://trac.sagemath.org/ticket/21097|#21097]])-- closed sage 7.4: incorrect parent in dynatomic_polynomial - Michelle Manes

 * --([[http://trac.sagemath.org/ticket/20227|#20227]])-- closed sage 7.4: Chow form for projective subschemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15378|#15378]])-- closed sage 7.4: Composition of Morphisms - Vincent Delecroix, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/21091|#21091]])-- closed sage 7.3: is_polynomial bug fix - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20820|#20820]])-- closed sage 7.3: Conjugating sets of Rational Functions - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/20780|#20780]])-- closed sage 7.3: add level parameter to rational_preimages - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20650|#20650]])-- closed sage 7.3: Added is_polynomial and make_look_poly to projective morphism - Rebecca Lauren Miller, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19635|#19635]])-- closed sage 7.3: Enumeration functionality for products of projective spaces over fields and finite fields - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/20079|#20079]])-- closed sage 7.3: Chebyshev Polynomials - Joe Eisner, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20451|#20451]])-- closed sage 7.2: canonical height error - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20262|#20262]])-- closed sage 7.2: Add point transformation matrix for projective space - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/20168|#20168]])-- closed sage 7.2: small improvements to projective morphism - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20059|#20059]])-- closed sage 7.1: minimal periodic points code improvement - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20067|#20067]])-- closed sage 7.1: Change ring to QQbar fails for subschemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20018|#20018]])-- closed sage 7.1: init for endomorphism of projective subschemes fails - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19979|#19979]])-- closed sage 7.1: Fix coding style and documentation in projective products - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/19889|#19889]])-- closed sage 7.1: Fix coding style and documentation style in affine schemes - Rebecca Lauren  Miller

 * --([[http://trac.sagemath.org/ticket/19991|#19991]])-- closed sage 7.1: improve dimension function for subschemes of projective products - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19891|#19891]])-- closed sage 7.1: Fix coding style and documentation in Projective schemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19551|#19551]])-- closed sage 7.0: Basic failures in projective product morphisms - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19552|#19552]])-- closed sage 7.0: images and preimages of projective subschemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19557|#19557]])-- closed sage 6.10: Basic iteration functionality for products of projective spaces - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/19512|#19512]])-- closed sage 6.10: is_morphism for maps of products of projective spaces - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/18443|#18443]])-- closed sage 6.8: Multiplier spectra for projective morphisms - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/18374|#18374]])-- closed sage 6.8: Inconsistency in dimension of total ideals. - Miguel Marco

 * --([[http://trac.sagemath.org/ticket/18281|#18281]])-- closed sage 6.8: implement critical point functionality including is_pcf for projective morphisms - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17282|#17282]])-- closed sage 6.8: Implementing Wehler K3 Surfaces - Joao Faria

 * --([[http://trac.sagemath.org/ticket/18409|#18409]])-- closed sage 6.8: Dynatomic polynomial bug for fractional coefficients - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/18399|#18399]])-- closed sage 6.8: projective automorphism group fails for homogenized maps - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/18279|#18279]])-- closed sage 6.7: implement rational preperiodic points for polynomials over number fields - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/18008|#18008]])-- closed sage 6.7: Periodic points for projective/affine morphism - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17855|#17855]])-- closed sage 6.7: create is_preperiodic function for points of projective space - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17907|#17907]])-- closed sage 6.6: Random failure in enum_projective_number_field - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17729|#17729]])-- closed sage 6.6: Implement Weil restriction for affine schemes/points/morphisms - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/17762|#17762]])-- closed sage 6.6: Connected component for a rational preperiodic point - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17323|#17323]])-- closed sage 6.6: Implement "primes_of_bad_reduction" to work over Number Fields - Joao Faria 

 * --([[http://trac.sagemath.org/ticket/17386|#17386]])-- closed sage 6.6: Enumerate points of bounded height in projective/affine space over number fields - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17326|#17326]])-- closed sage 6.6: Implementing subschemes functionality for projective "is_morphism" - Joao Faria
 
 * --([[http://trac.sagemath.org/ticket/17067|#17067]])-- closed sage 6.5: Enabled canonical height for maps of `\PP^N` over number fields - Ben Hutz, Paul Fili

 * --([[http://trac.sagemath.org/ticket/15393|#15393]])-- closed sage 6.5: FMV Algorithm for automorphism groups - Bianca Thompson, Ben Hutz, Joao Faria

 * --([[http://trac.sagemath.org/ticket/17082|#17082]])-- closed sage 6.5: Height Difference Bounds over number fields - Joao Faria

 * --([[http://trac.sagemath.org/ticket/17427|#17427]])-- closed sage 6.5: x==y while hash(x)!=hash(y) with SchemeMorphism_point_projective_field - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17535|#17535]])-- closed sage 6.5: Homogenize fails for affine space over function fields - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17433|#17433]])-- closed sage 6.5: projective point equality fails for quoteint base rings - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17441|#17441]])-- closed sage 6.5: Change ring fails for SchemeMorphism_polynomial defined with fraction field elements  - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17325|#17325]])-- closed sage 6.5: clear denominators for projective points does not always work - Joao Faria

 * --([[http://trac.sagemath.org/ticket/17450|#17450]])-- closed sage 6.5: Fix category for quotients of polynomial rings - Travis Scrimshaw

 * --([[http://trac.sagemath.org/ticket/17429|#17429]])-- closed sage 6.5: projective point equality returns false positive for ComplexIntervalField - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17324|#17324]])-- closed sage 6.5: implement eq and ne for affine morphisms - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/15448|#15448]])-- closed sage 6.5: cartesian products of projective space - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/16986|#16986]])-- closed sage 6.5: Rational Preimages and All Rational Preimages over number fields - Joao Faria

 * --([[http://trac.sagemath.org/ticket/17118|#17118]])-- closed sage 6.4: Added multiplier computation to affine morphism - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17001|#17001]])-- closed sage 6.4: Functionality for fast evaluation of affine morphisms - Grayson Jorgeson

 * --([[http://trac.sagemath.org/ticket/16961|#16961]])-- closed sage 6.4: Fix Dynatomic Polynomials to work over the Complex Numbers - Joao de Faria

 * --([[http://trac.sagemath.org/ticket/16960|#16960]])-- closed sage 6.4: Orbit Structure for Affine Morphisms - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/16838|#16838]])-- closed sage 6.4: make affine and projective dehomogenize and homogenize work together - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/16833|#16833]])-- closed sage 6.4: Use Macaulay resultant to compute resultant of projective morphisms - Joao de Faria

 * --([[http://trac.sagemath.org/ticket/16834|#16834]])-- closed sage 6.4: Change ring fails for affine morphisms - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/16832|#16832]])-- closed sage 6.4: Can't Coerce projective point to subscheme point - Peter Bruin

 * --([[http://trac.sagemath.org/ticket/15394|#15394]])-- closed sage 6.4: Lattes map from an Elliptic Curve - Patrick Ingram, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15389|#15389]])-- closed sage.6.3: Krumm-Doyle Small Points Algorithm - David Krumm, John Doyle

 * --([[http://trac.sagemath.org/ticket/15382|#15382]])-- closed sage.6.3: MacCaulay Resultant - Soli Vishkautsan, Hao Chen

 * --([[http://trac.sagemath.org/ticket/15782|#15782]])-- closed sage.6.3: Increase Performance of Multiplier in Projective Morphism - Dillon Rose and Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15781|#15781]])-- closed sage.6.3: Increase Performance of possible_periods in Projective Morphism - Dillon Rose and Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15780|#15780]])-- closed sage.6.3: Increase Performance in Projective Morphism - Dillon Rose

 * --([[http://trac.sagemath.org/ticket/16168|#16168]])-- closed sage.6.3: use p_iter_fork in projective_morphism - Dillon Rose

 * --([[http://trac.sagemath.org/ticket/16051|#16051]])-- closed sage.6.3: fast_callable can return ipow with exponents in the base ring - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15920|#15920]])-- closed sage.6.2: Parallelize Possible Periods functions for Projective Morphisms - Dillon Rose

 * --([[http://trac.sagemath.org/ticket/15815|#15815]])-- closed sage.6.2: rational preimages for projective morphisms returns incorrect points - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15490|#15490]])-- closed sage.6.2: documentation fix for projective dynatomic polynomials - Weixin Wu

 * --([[http://trac.sagemath.org/ticket/15396|#15396]])-- closed sage.6.1: Implement .an_element() for ProjectiveSpace - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15392|#15392]])-- closed sage.5.13.rc0: Bruin-Molnar Algorithm for minimal models  - Brian Stout, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15376|#15376]])-- closed sage-5.13.beta4: canonical heights for points with integer fix - Paul Fili

 * --([[http://trac.sagemath.org/ticket/14219|#14219]])-- closed sage-5.13.beta4:- Rational preperiodic points - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15373|#15373]])-- closed sage-5.13.beta3: Global height for integer fix - Paul Fili

 * --([[http://trac.sagemath.org/ticket/15377|#15377]])-- closed sage-5.13.beta3: improve documentation of normalize_coordinates - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/14218|#14218]])-- closed sage-5.13.beta2: Height and canonical heights for points and morphisms - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/14217|#14217]])-- closed sage-5.10.beta3: Basic iteration functionality for projective and affine spaces - new directory structure in schemes - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/13130|#13130]])-- closed sage-5.8.beta3: Basic architecture changes : support for projective spaces over rings - Ben Hutz 
