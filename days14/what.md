

# Discussion: Sage, Macaulay 2, and other Mathematical Software for Algebraic Geometry


## What are the absolutely critical features that you '''must''' have in the mathematical software you use for '''your''' research? (E.g., fast linear algebra, Groebner basis, sheaves?)

* modular forms 
* fast R[x_1,...,x_n], also with fractional exponents 
* GB's, flexible gradings, term orders 
* rings (not necessarily commutative) 
* modules (not just ideals, not just free) 
* sheaves 
* homological algebra (free resolutions) 
* linear algebra with basis an arbitrary index set I 
* fast sparse and dense linear algebra over finite fields 

## What are the '''killer features''' that your dream mathematical software would have? (e.g., good mailing list, free, super fast algorithm for XXX, latex output?)

* (huge) polyhedral geometry (not just polymake, see more below) 
* representation theory for finite groups (char 0 and modular, not just GAP, compare to what MAGMA can do -- and how fast it can do it) 
* rings of representations (Grothendieck rings, etc.) 
* local rings and global rings: localization, really working (not just M2) 
* GB over all rings (e.g. field extensions), even noncommutative when possible 
* full functoriality (e.g. preservation of GL_n-actions, functors, operations on functors, Yoneda product, tensor products) 
* full homological algebra (spectral sequences, derived categories, etc.) 
* parallelize everything 
* deformation theory 
* a "good clean" programming language (not just M2, e.g. Maple -- having to put things into rings before being able to use them is annoying; work easily with general expressions) 
* super fast GB's and syzygies (speed and low memory usage) 
* super fast and low memoryprimary decomposition (e.g. numerical) and integral closure 
* sheaves, Chern classes, intersection theory on singular spaces 
* algebraic topology on complex and real points on a variety 
* etale cohomology 
* usable resolution of singularities 

#### Polytopes

* packages: lrs, cddlib, porta, 4ti2, polymake, coin/or 
* optimal performance: important algorithms are reverse search (as in lrs, uses less memory), double description (track the duals, as in cdd and 4ti2) 
* optimization: linear and integer programming (coin/or), semidefinite programming (any good software for this?) 
* combinatorial aspects 
* polymake puts a lot of these things together, but it does not build! 

#### Linear algebra

* for a lot of the above issues, we need very very fast linear algebra over a huge range of fields/rings 

## What are some things that disturb you about the direction in which Sage is going?  (E.g., too big/ambitious? not open enough or too open?  too many bugs?  changing too quickly? referee process for code inclusion too onerous?)

* developer \neq user => lameness  (e.g. gfan, polyhedral code) 
* language, "relations", US-ification, Sage taking over the universe of free math software is dangerous, respect for other math software 
* bugginess in core algebraic geometry code: not up to snuff, cannot trust the answers now, need to first fix the basics before implementing new stuff 
* third party code currently not refereed: how do we know it's reliable? 
* credit: young people, publication record 
* longterm survivability 
* keeping large scale vision, consistency among various development efforts/packages: categories, generic algorithms and info, learn from Axiom and MuPAD-combinat 
* more documentation: to improve consistency, explain options to user (there can be 25 different algorithms for doing one thing) 
* track usage 

## What are some things that disturb you about the direction in which Macaulay2 is going?  (similar e.g. as above)

* all of the above 
* very few developers (solution: M2 days, packages, journal) 
* documentation and tutorial issues (improving) 
* community building lacking 
* uncertainty of long-term funding (only NSF, fickle) 
* todo list needs to be upgraded (just text files in svn repository now) 
* webpage needs to be upgraded 
* narrow scope restricts number of developers (only commutative algebraists and algebraic geometers can contribute, and the intersection between this set and the set of software engineers/programmers is too small) 
* narrow scope restricts users (e.g. lack of group theory functionality makes some algebraic geometers have to use a different system for their research) 