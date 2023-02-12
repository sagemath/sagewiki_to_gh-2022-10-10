

# Status Reports


## Tue September 15, 2009

* Amod Agashe: Getting here; will arrive at ferry terminal at 3:20pm and needs a ride!   
* Tom Boothby: implement an "argument fixer" class (fix for review); also working on disk caching 
* Robert Bradshaw: L-functions precision issues with his implementation of Tim's algorithm 
* Sal Butt: Cleaned up database and make sure all online; reading Kedlaya-Sutherland. 
* Craig Citro: pick a database and go! 
* Tim Dokchitser:  L-functions precision issues with his algorithm 
* Randy Heaton: Petersson inner product -- nobody remembers the formula... 
* Robert Miller: keeping his mother entertained 
* Victor Miller: picking up Amod; working through paper of Yang "Defining Equations of modular curves" 
* Rishi: Polishing lcalc wrapper (see John Cremona's review); association from modular forms to L-functions (needs assistance).  
* William Stein:  Galois action on cuspidal subgroup <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5969">trac #5969</a> 
* Kevin Steuve: compressing the function f(x) = Li(x)-pi(x) 
* Soroosh Yazdani: real component groups 
* Jared Weinstein: Heegner points mod ell. 

## Wed September 16, 2009

* Amod Agashe: did: arrived safely; testing level lower conjecture when no p-torsion up to level 800. plan to do: run code further; investigate Soroosh counterexample at 13;  way to capture congruences only with old forms; craig and congruences with old forms. 
* Tom Boothby: did: nearly finished disk caching and parellelizing decorator; plan to do: math -- million digits of Sha? 
* Robert Bradshaw: did: dokchitser for computing L-functions. figured out problem, but found others; plan to do: millions digits of Sha. 
* Sal Butt: did: worked through kedlaya-sutherland about statistics of L-polynomials (Euler factors at places of good reduction? over QQ. "the symplectic group") and now taking their ideas to do what I want to do.  I'm doing this in the function field case. Now I'm looking at L-polynomial in function field case and doing analogue.  Written sage code, but there are bugs. plan to do: debug and do calculation.  
* Craig Citro: creates inputs to Dokchitser algorithm for a bunch of L-function; plan to do: continue 
* Tim Dokchitser: helped Robert figure out precision issue; talk to people.   plan to do: look at Amod's conjecture. 
* Randy Heaton: wrote two small patches to automize stuff I do a lot with modular forms.  worked out almost everything to compute petersson inner product.  Need: (1) prove small result, (2) talk to Robert and Craig about computing L-functions, (3) talk to Craig about a level raising constant relating Petersson of old form and new form -- what is the Petersson norm of an image.  plan to do: the above, plus todos in the source code, plus newforms don't no they're newforms.  
* Robert Miller: got mom to airport and got a cable for TV!; plan to do: binary codes into database, working on descent, or anything else.  
* Victor Miller: tearing hair out looking at paper of Yang, and got some of it implemented.  Yang defines a bunch of modular functions with character on Gamma(N) with divisors supported on the cusps.  He gets generators by taking products that kill action of character.  He makes claims about them generating... but then he uses only a much simpler class of functions.  I'm implementing both.  Question: is there support for Puiseaux series.  I noticed also that power series over cyclotomic fields: $x^10000$ takes forever; making it takes forever. Plan to do: Implement other class of functions; lattice reduction to find good multiplicative basis.   (The more I read this paper, the more I am annoyed!)  Get the nitty gritty of classes in Sage right.   This is all a generalization of David Loeffler's eta products code.  
* Rishi: Did everything Cremona suggested in his review, except Cremona's class hierarchy is impossible.  Implemented a Dirichlet L-function.  Today: Given a newform find the corresponding L-series that does everything Rubinstein's library provides.  
* William Stein: Heegner points (explained to Jared and came up with a fascinating conjecture plus a great consistency check), real component group (compute action of Atkin-Lehner and Hecke), cuspidal torsion (lots of conjectures, counterexamples).  Today: try to prove real component group conjecture by following Ling-Oesterle's result on Shimura subgroup.  Make and organize more modular forms tables.  
* Kevin Steuve: Compressing tables of differences between Li(x) and pi(x) by looking at differences of errors.  Using lza only save 1/8 th disk space (thought we would get more).  Also made my code use multi-core above $10^{12}$.  Today: working on $n$th prime function using Victor Miller's linear interpolation method.  
* Jared Weinstein: As William said, we identify pattern in vanishing of Kolyvagin classes associated to elliptic curve of rank 2.  We found conjecture that predicts a sufficient condition for them to vanish. TODO: Want to find a necessary condition for vanishing. 
* Soroosh Yazdani: Look at cuspidal torsion, and ideas for proving it.  Discussed example of multiplicity one failing for Eisenstein primes.   Trying to understand action of Atkin-Lehner on real components of J0(N) (an F2 vector space).  When there are three prime divisor of N, there is a basis such that action is straightforward, but for 4 primes not clear.  Also, full Atkin-Lehner involution acts trivially on component group.    Today: But Amod has other ideas about extending Mazur.     
Meeting about making online tables at 2:30 clock to discuss modular forms database.  

Somebody: Implement Shimura subgroup 


## Friday September 18, 2009

* Jared Weinstein: William and I proved if "so and so" then Heegner class vanishes.  Today: Actually write up proof.  
* Amod Agashe: Checked my hunch that if an odd prime p divides a Tamagawa number, but does not divide the order of the torsion subgroup, then one can lower level by p for level up to 1010; discussed my strategy for computing congruences with you and Randy; discussed torsion and cuspidal subgroups with William and Soroosh. The goal for Thursday was to get back safely, which was achieved! 
* Tom Boothby: Robert Bradshaw and I played with power series yesterday.  Found great DiffEQ with easy solution.  Unfortunately, we left off a 1 in summing something, so we are now back to square one.  But we know exactly what $G_2$.  Today: More of the same, but much more careful.  Planning to implement a timeout-ed @parallel for more robust computation (useful for databases whose data is sporadically impossible to compute). 
* Robert Bradshaw: See Tom's status report.  Got the database server running.  Today: Compute $G_2$.  Textfile DB class.  
* Sal Butt: I computed those integrals I was interested in, then migrated C++ code to Sage; computing statistics on ap's;  something is going wrong.  Today: Figure out what.  
* Craig Citro: Playing with lambda internally.  Eavesdropping on Bradshaw and Boothby's conversation... and planned a hike.  Computed adjoint L-function one way, and doing another for consistency.   Today: Working through equations in a paper of Shimura to get constants for functional equations.  Finish create filter from lambda.  
* Tim Dokchitser: General L-functions support; helped Amod figure out answer to question about optimality for Amod.  Massive help in quest for $G_2$.  Today: Is there a curve over Q(mu_7)^+ with everywhere good reduction (or maybe bad at 7).   
* Randy Heaton:  (1) Automated more things I often do, e.g., index_in, eigendecomposition_of method.   (2) Combine hints from Craig, Victor, Hida, Shimura, Diamond-Shurman to get a nice formula for Petersson for case of square-free level.  Generalizing to non-square-free level will be easy, but there is another tricky-to-remove condition.  Today: Learn trac.  Go back to hotel, then Florida safely.  
* Robert Miller: Woke up early and drove Amod to ferry.  Helping Kevin S. with @parallel.  Finished 2-descent. Needs review!!  Today: Randy trac, read about Heegner points, start refereeing William's patch.  
* Victor Miller: Flew home.  
* Rishi: Writing program for L-functions associated to cusp forms.   Today: look at compact_system_of_eigenvalues.  
* William Stein: Jared and I may have proved an interesting theorem using "reciprocity"; Worked on Heegner points patch; conjectures with Amod and Soroosh;  PLAN: attack real component group problem, finish Heegner points patch, put the rest of my databases into the new database, and work on making an interface 
* Kevin Steuve: working on prime_pi and nth-prime. improved my code style. all functionality in a single python class.  Benchmarking prime_pi, and comparing using sieving to calling is_prime on interval; found under some conditions it if faster to use primality tests.  Comparing is_prime versus is_pseudoprime.    Today: prime_pi is fast and nth prime; Going to optimize nth prime and make a sparse cache.  
* Soroosh Yazdani: Looking at Amod's conjectures... true or no hope?  Paper of Tang -- reading this; nice proof.  Modular symbols mod 2.  TODAY: Play around with component group more today. 

## Saturday September 19, 2009

* William Stein: made a list of questions about real component groups, and realized that the conjecture is hard.  