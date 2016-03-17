= Sage Days 71 Abstracts =

== Sunday ==

'''Sage Number Theory and Development''', <<Anchor(sage_intro)>> ''Alyson Deines'' (10:00-11:00)

This talk will have three parts.  In the first, I will discuss what number theoretic constructs are implemented in Sage and how to use them.  Next, I will compare Sage's functionality with Magma's functionality.  In particular, some gaps in Sage.  The last part is an introduction to Sage development using !GitHub and the Trac server.

----

'''Zeta functions I''', <<Anchor(zeta1)>> ''Fernando Rodriguez Villegas'' (11:30-12:00)

----

'''Motivic integration and orbital integrals I''', <<Anchor(motivic1)>> ''Immanuel Halupczok'' (12:15-12:45)

----


'''Iwasawa theory I''', <<Anchor(iwasawa1)>> ''Jeanine Van Order'' (2:00-2:30)

----

'''Overconvergent modular symbols I''', <<Anchor(overconvergent1)>> ''David Roe'' (2:45-3:15)

----

'''p-adic Precision I''', <<Anchor(precision1)>> ''Tristan Vaccon'' (3:45-4:15)

----

'''Variations on Chabauty-Coleman I''', <<Anchor(chabauty1)>> ''Victor Flynn'' (4:30-5:00)

This will be a short introduction to main principles of
using classical Chabauty-Coleman as a technique for finding
rational points on curves, where the rank of the Jacobian
is less than the genus of the curve (note that this will
be an introduction to the main ideas of the technique, and
will not about any specific implementation).

----

'''Computation of Hida families of ordinary cusp forms''', <<Anchor(hida)>> ''Francesca Bianchi'' (8:00-8:15)

The first example of a p-adic family of modular forms goes back to
Serre's construction of the p-adic Eisenstein series. At the end of
the 1980s Hida then introduced the notion of a p-adic family of
modular forms going through a cuspidal eigenform in the ordinary
subspace of a given weight. This means that we look for a q-expansion
such that the coefficients depend p-adically on a parameter k, in such
a way that specialising the expansion at a certain k gives an
eigenform of weight k. In the talk we will present an algorithm to
compute Hida families through an eigenform of trivial character.

----

''Maurizio Monge'' (8:20-8:35)

----

'''Zeta functions of quartic K3 surfaces over F_3''', <<Anchor(K3F3)>> ''Edgar Costa'' (8:40-8:55)

With the goal of doing a census of the Hasse--Weil zeta functions of
quartic K3 surfaces over F_3, we overview the problem of computing the
zeta function of a generic K3 surface over F_3 using p-adic methods.

-------

== Monday ==

'''A survey of p-adic point counting''', <<Anchor(zeta2)>> ''Jan Tuitman'' (10:00-11:00)

We will give a broad overview of p-adic methods to compute
the zeta function of an algebraic variety.

----

'''Recent developments and applications of uniform p-adic integration''', <<Anchor(motivic2)>> ''Raf Cluckers'' (11:30-12:30)

As a concrete variant of motivic integration, we will discuss uniform p-adic integration and constructive aspects of results involved. Uniformity is in the p-adic fields, and, for large primes p, in the fields F_p((t)). Using real-valued Haar measures on such fields, one can study integrals, Fourier transforms, etc. We follow a line of research that Jan Denef started in the eighties, with in particular the use of (effective) model theory to study various questions related to p-adic integration. A form of uniform p-adic quantifier elimination is used, which is algorithmic. Using the notion of definable functions, one builds constructively a class of complex-valued functions which one can integrate (w.r.t. some of the variables) without leaving the class. One can also take Fourier transforms in the class. Recent applications in the Langlands program are based on Transfer Principles for uniform p-adic integrals, which allow one to get results for F_p((t)) from results for Q_p, once p is large, and vice versa. These Transfer Principles are obtained via the study of general kinds of loci, some of them being zero loci. More recently, these loci are playing a role in the uniform study of p-adic wave front sets for (uniformly definable) p-adic distributions, a tool often used in real analysis. This talk contains various joint work with Gordon, Halupczok, Loeser, Raibaut, and some of it is still in progress. Although all the definitions and results are algorithmic, almost nothing has been implemented yet, and questions about optimal complexity are far from being understood, although some lower bounds are known, coming from lower bounds for Presburger arithmetic.
-------

== Tuesday ==

'''Iwasawa theory II''', <<Anchor(iwasawa2)>> ''Chris Wuthrich'' (10:00-11:00)

I intend to show what sage can do with p-adic L-functions
of elliptic curves. Through the known results on the p-adic version of
the Birch and Swinnerton-Dyer conjecture this gives results on the
Tate-Shafarevich group over Q, even for elliptic curves of rank >1. My
talk should also include what sage cannot do in this direction.

-----

'''Overconvergent modular symbols II''', <<Anchor(overconvergent2)>> ''Ander Steele'' (11:30-12:30)

-------

== Wednesday ==

'''p-adic Floats''', <<Anchor(precision2)>> ''Xavier Caruso'' (10:00-11:00)

Floating point arithmetic is by far the most common implementation of
real numbers on computers. This is in complete opposition with the
p-adic case for which all standard implementations rely on interval
arithmetic.
This talk aims at arguing for initiating -- and then generalizing --
the use of p-adic floating point arithmetic in computer algebra systems.

----

'''Variations on Chabauty-Coleman II''', <<Anchor(chabauty2)>> ''Jennifer Balakrishnan'' (11:30-12:30)
