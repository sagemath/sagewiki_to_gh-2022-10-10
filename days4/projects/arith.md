= Basic Arithmetic =

[:days4/projects/: Other SAGE Days 4 Project]


 Nick Alexander, Craig Citro, William Stein, David Harvey, David Roe, Joel Mohler, Dave Saunders, Gonzalo Tornaria, Ifti B., Robert Bradshaw


 * (Craig Citro) wrap zzp_x from ntl

 * (Joel Mohler, David Harvey) improve the ntl wrapper.

 * '''Commutative Diagram Coercion Model''': The current SAGE coercion model has some advantages (speed, ability to override for new classes) but also some issues.  A user is not able to override the coercion system at runtime and use their own coercion maps (this could be incredibly useful for polynomials, or systems of field extensions).  It is difficult to get a system-wide picture of what coercion maps exist: as SAGE grows, this will introduce bugs when the rules for transitivity of coercion are not followed.  It is also difficult, though not impossible, to implement coercion systems where the computation of the coercion map requires effort (creating a coercion map from $\mathbf{F}_{7^8} \to \mathbf{F}_{7^{24}}$).  I, David Roe, want to discuss a new coercion model, either replacing over built on top of the old, that addresses these problems.  Currently I have some ideas for a system based on commutative diagrams, but I want to brainstorm some more before implementing it.  This project will include discussions on ways to improve category theory in SAGE. Nick Alexander is also very interested in working on the proposed commutative diagram coercion model.

'''Test cases''' Read these as "an element of __ and an element of __"

    1. $\mathbf{Z}[x]/\mathbf{Z} \in \mathbf{Q}[x]$ (not Frac$(\mathbf{Z}[x])$)

    1. $\mathbf{Q} + \mathbf{Z}[x] \in \mathbf{Q}[x]$ and $\mathbf{Z}/5\mathbf{Z} + \mathbf{Z}[x] \in \mathbf{Z}/5\mathbf{Z}[x]$

    1. $\mathbf{Q} * \mathbf{Z}[x] \in \mathbf{Q}[x]$ 

    1. $\mathbf{Q} * \mathbf{Z}/5\mathbf{Z}$ error due to no morphism from ''all'' of $\mathbf{Q}$ into $\mathbf{Z}/5\mathbf{Z}$.

    1. $\mathbf{Z}[x] + \mathbf{Z}[y]$ error due to unknown relation between $x$ and $y$ and ambiguous order

    1. $\mathbf{Q}[\zeta_m] + \mathbf{Q}[\zeta_n] \in \mathbf{Q}[\zeta_{lcm(m,n)}]$ as cyclotomic fields are created ''with'' an embedding into $\bar{\mathbf{Q}}$ 

    1. $\mathbf{F}_{p^n} + \mathbf{F}_{p^m}$ works using Conway polynomials


    1. $\mathbf{Z}[x] + \mathbf{Q}[y]$ same as 5 (minus the symmetry concerns)


'''Proposed model'''

One can view most desired natural coersions as functorial operations from some simpler base object. E.g. 

 * Projection/quotients

 * Fraction fields/localizations

 * Coefficient rings (i.e. polynomial rings, matrix spaces, power series...)

 * Forgetful functors

 * Field extensions and completions



 * W Stein: Implement a global '''proof = True''' or '''proof = False''' option that is queried by algorithms when proof=None.

 * (not for this wee) '''Optimized Polynomial Arithmetic''': David Harvey and Bill Hart (Postdoc, Warwick) are in the process of writing FLINT, which features extremely fast univariate polynomial arithmetic over '''Z'''. Explore how to fill in the remaining gaps in order to make the results of their work easily available to a larger user community. Similarly, Tom Boothby has worked over the past few months on algorithms for very '''fast evaluation of polynomials''' at points, and another project will be to explore how to deploy this.
