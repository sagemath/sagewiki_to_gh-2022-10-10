= Discussion: Sage, Macaulay 2, and other Mathematical Software for Algebraic Geometry =

== What are the absolutely critical features that you '''must''' have in the mathematical software you use for '''your''' research? (E.g., fast linear algebra, Groebner basis, sheaves?) ==
 * modular forms
 * fast R[x_1,...,x_n], and f^(1/n)
 * GB's, free resolutions, flexible gradings, term orders
 * rings (not necessarily commutative)
 * modules (not just ideals, not just free)
 * homological algebra
 * linear algebra with basis an arbitrary index set I
 * fast sparse and dense linear algebra over GF(q)

== What are the '''killer features''' that your dream mathematical software would have? (e.g., good mailing list, free, super fast algorithm for XXX, latex output?) ==
 * (huge) polyhedral geometry (not just polymake)
 * representation theory for finite groups (char 0 and modular, not just GAP, compare to what MAGMA can do -- and how fast it can do it)
 * rings of representations (Grothendieck rings, etc.)
 * local rings and global rings: localization, really working (not just M2)
 * GB over all rings (e.g. field extensions), even noncommutative when possible
 * full functoriality (e.g. GL_n-actions, functors, operations on functors, Yoneda product, tensor products)
 * full homological algebra (spectral sequences, etc.)
 * parallelize everything
 * deformation theory
 * a "good clean" programming language (not just M2, e.g. Maple -- having to put things into rings before being able to use them is annoying)
 * super fast GB's and syzygies (speed and low memory usage)
 * super fast primary decomposition (e.g. numerical) and integral closure
 * sheaves, Chern classes, intersection theory on singular spaces
 * algebraic topology on complex and real points on a variety
 * etale cohomology
 * usable resolution of singularities

=== Polytopes ===
 * packages: lrs, cddlib, porta, 4ti2, polymake, coin/or
 * optimal performance: important algorithms are reverse search (lrs), double description
 * optimization: linear and integer programming (coin/or), semidefinite programming
 * combinatorial aspects
 * polymake puts a lot of these things together, but it does not build!

== What are some things that disturb you about the direction in which Sage is going?  (E.g., too big/ambitious? not open enough or too open?  too many bugs?  changing too quickly? referee process for code inclusion too onerous?) ==

== What are some things that disturb you about the direction in which Macaulay2 is going?  (similar e.g. as above) ==

 
