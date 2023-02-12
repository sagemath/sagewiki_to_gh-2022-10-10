

# Basic Arithmetic

[:days4/projects/: Other SAGE Days 4 Project] 

* Nick Alexander, Craig Citro, William Stein, David Harvey, David Roe, Joel Mohler, Dave Saunders, Gonzalo Tornaria, Ifti B., Robert Bradshaw 
* Right now -- write down some tangible maintainable goals that can actually be implemented. 
* (Craig Citro) wrap zzp_x from ntl 
* (Joel Mohler, David Harvey) improve the ntl wrapper. 
* **Commutative Diagram Coercion Model**: The current SAGE coercion model has some advantages (speed, ability to override for new classes) but also some issues.  A user is not able to override the coercion system at runtime and use their own coercion maps (this could be incredibly useful for polynomials, or systems of field extensions).  It is difficult to get a system-wide picture of what coercion maps exist: as SAGE grows, this will introduce bugs when the rules for transitivity of coercion are not followed.  It is also difficult, though not impossible, to implement coercion systems where the computation of the coercion map requires effort (creating a coercion map from $\mathbf{F}_{7<sup>8} \to \mathbf{F}_{7</sup>{24}}$).  I, David Roe, want to discuss a new coercion model, either replacing over built on top of the old, that addresses these problems.  Currently I have some ideas for a system based on commutative diagrams, but I want to brainstorm some more before implementing it.  This project will include discussions on ways to improve category theory in SAGE. Nick Alexander is also very interested in working on the proposed commutative diagram coercion model. 
**Curent Rules** [attachment:cur_coerce.png]  [attachment:cur_coerce_diagram.sage] 

**Test cases** Read these as "an element of $S$ and an element of $R$" 

         1. $\mathbf{Z}[x]/\mathbf{Z} \in \mathbf{Q}[x]$ (not Frac$(\mathbf{Z}[x])$) 
         1. $\mathbf{Q} + \mathbf{Z}[x] \in \mathbf{Q}[x]$ and $\mathbf{Z}/5\mathbf{Z} + \mathbf{Z}[x] \in \mathbf{Z}/5\mathbf{Z}[x]$ 
         1. $\mathbf{Q} * \mathbf{Z}[x] \in \mathbf{Q}[x]$  
         1. $\mathbf{Q} * \mathbf{Z}/5\mathbf{Z}$ error due to no morphism from _all_ of $\mathbf{Q}$ into $\mathbf{Z}/5\mathbf{Z}$. 
         1. $\mathbf{Z}[x] + \mathbf{Z}[y]$ error due to unknown relation between $x$ and $y$ and ambiguous order 
         1. $\mathbf{Q}[\zeta_m] + \mathbf{Q}[\zeta_n] \in \mathbf{Q}[\zeta_{lcm(m,n)}]$ as cyclotomic fields are created _with_ an embedding into $\bar{\mathbf{Q}}$  
         1. $\mathbf{F}_{p<sup>n} + \mathbf{F}_{p</sup>m}$ works using Conway polynomials 
         1. $\mathbf{Z}[x] + \mathbf{Q}[y]$ error, same as 5 (minus the symmetry concerns) It is unclear how to rule this out of generic base-extension code.  
         1. $\mathbf{Z}/16\mathbf{Z} + \mathbf{Z}/12\mathbf{Z} \in \mathbf{Z}/4\mathbf{Z}$ 
         1. $\mathbf{Q} + \mathrm{Matrix}_{n,m}(\mathbf{Z})$. This is same as polynomials. 
         1. $\mathbf{Q} + \mathrm{Matrix}_{n,m}(\mathbf{Z}[x])$. Similar, but need to recurse the change base ring stuff. 
         1. $\mathbf{Q}[x] + \mathrm{Matrix}_{n,m}(\mathbf{Z}[x])$. Here you change base ring of the matrix space from $\mathbf{Z}[x]$ to $\mathbf{Q}[x]$. 
         1. $\mathbf{Q} + \mathcal{O}$, where $\mathcal{O}$ is an order in a number field. This also works by change base ring of $\mathcal{O}$ from $\mathbf{Z}$ to $\mathbf{Q}$ (i.e. going to the number field itself). 
         1. $K + \mathcal{O}$, where $L/K$ is a field extension, and $\mathcal{O}$ is an order in $L$. This is similar to the previous one, $\mathcal{O}$ can be extended to $\mathcal{L}$. 
This should be _ring centric_, i.e. the answer is dependant on a pair of rings (and should be computed without having to create pairs of elements) 

**Finding known morphisms** 

Every parent will hava a "incoming list" of other objects that it knows how to coerce from (as in the current coerce_try) and known embeddings (which it may append to the lists of existing rings), both created at ring creation time. When trying to find a map from (distinct) $R$ to $S$ we recursively try and find maps from $R$ into the incoming list of $S$ and vica-versa. This is implicitly the "comutative" part of the diagram, and the result may be the composition of several morphisms (represented as Homomorphism objects).  

Given a set of objects, one wants to be able to extract, view, query, and even run consistancy checks on this data as a (commutative diagram) graph of known morphisms between them.  

This is an atomic step in the procedure below.  

**Creating new morphisms** 

One can view most desired natural coersions as functorial operations from some simpler base object. E.g.  

* Projection/quotients 
* Fraction fields/localizations 
* Coefficient rings (i.e. polynomial rings, matrix spaces, power series...) 
* Forgetful functors 
* Field extensions and completions 
Given two objects $S$ and $R$, first see if there is a natural morphism $S \rightarrow R$ or $R \rightarrow S$. If there is one, use it. If there are two, by definition they are cannonically isomorphic and so we can use either.  

Considering functors above, decompose each object $R$ as a tower of simpler rings $R^0 \rightarrow \cdots \rightarrow R_ \rightarrow R' \rightarrow R$. Now try to complete the pushout diagram $R \leftarrow Y \rightarrow S$ for maximal $Y$ (as low as possible in the tower of $R$ or $S$). If a unique such pushout exists, do arithmatic in this ring.  

Some of these pushouts (e.g. coefficent rings) could be handled by generic code (e.g. base_extend). Others might be very special to the specific rings (e.g. compositum of number fields (perhaps with specified embeddings into an algebric closure).  

**Actions** 

There would be a parallel framework for actions, where the parents would not necessarily be identical. Pow would be worked into the coercion model, as an action of the integers (at least) on ring elements.  

**Efficiency concerns** 

The above procedures could be moderately expensive in some cases, and much more expensive than we want for basic arithmetic. The actual model would cache all operations. Specifically, one would have a hashtable 

(R, S, op) -> (Hom(R,X), Hom(S, X), method_flag) 

where X may be one of R or S, and one of the Hom's may be None (signifying the identity, i.e. due nothing) 

method could be one of +, -, *, /, pow, rmul, lmul, r_act, l_act, ? 

The reason to specify the op is so that actions can be detected and handled efficently, not so different ring operations would have different coersion routes.  

* I have three concerns about the operators: 
         * Should + and - have the same functors for simplicity?  
         * <ins>pow</ins> excepts a 3rd argument modulus.  I think that modulus and the base would be coerced much like the +,- operator. [Counter argument, currently the third argument is ignored everywhere in SAGE and there is no way to use it other than explicitly calling x.<ins>pow</ins>(exp, mod). Currently, one would always create a element in the quotient ring and then power that.]  
         * + and - have the most "traditional" coercion.  This coercion could be used a bunch of other places (e.g. quo_rem)  
** Prototype** (showing how to handle actions) 

<ins>mul</ins>(left, right): 

         * if have_same_parent(left, right): 
                     * return left._mul_c(right) action = multiplicative_actions(parent_c(left), parent_c(right)) if not action is None: 
                     * return action(left, right) else: 
                     * left, right = canonical_coercion_c(left, right) return _mul_c(left, right) 
cdef canonical_coercion_c(x, y): 

         * # All the non-element stuff as before homs = canonical_coercion_hash[xp, yp] if not homs is None: 
                     * if not homs[0] is None: 
                                 * x = homs[0](x) if not homs[1] is None: 
                                 * y = homs[1](y) return x, y 
            * # Discover pushouts according to "zipper" method.  
cdef inline _mul_c(self, <a href="/RingElement">RingElement</a> right): 

         * if HAS_DICTIONARY(self):   # fast check 
                     * return self._mul_(right) else: 
                     * return self._mul_c_impl(right) 
_What about weakrefs?_ 

**Other** 

* W Stein: Implement a global **proof = True** or **proof = False** option that is queried by algorithms when proof=None. 
* (not for this week) **Optimized Polynomial Arithmetic**: David Harvey and Bill Hart (Postdoc, Warwick) are in the process of writing FLINT, which features extremely fast univariate polynomial arithmetic over **Z**. Explore how to fill in the remaining gaps in order to make the results of their work easily available to a larger user community. Similarly, Tom Boothby has worked over the past few months on algorithms for very **fast evaluation of polynomials** at points, and another project will be to explore how to deploy this. 