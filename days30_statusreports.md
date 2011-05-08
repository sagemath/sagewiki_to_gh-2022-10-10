= Final Status Reports for Sage Days 30 =

== Tutorials ==

The week began with several introductory tutorials (see the [[http://wiki.sagemath.org/days30_schedule|schedule]] for links to the tutorials and worksheets). This involved creating several tutorials and incorporating them into Sage; these eventually can be found in the thematic tutorials section of the live documentation.

== Tickets created/reviewed/patched/fixed ==

Here is a list trac tickets that were created or worked on during Sage Days 30.

    * #9123  implement Schur algebras and use them to determine irreducible characters for GL_n
    * #10065 [needs_review] removed bug and new methods in Poset
    * #10167 [closed enhancement: duplicate] three new methods in Poset
    * #10334 [positive_review] miscellaneous cleanup in perm_gps preparing for domains
    * #11263 [positive_review] Markup ".. link" is wrong in the developer guide. Add ".. linkall" to systematically link.
    * #11281 ".. math::" environment ignored in the live documentation
    * #11282 [positive_review] Add a link from the main live documentation help page to the thematic tutorials document
    * #11284 Document all options of Poset.show and Poset.plot
    * #11285 Request to add feature: Decomposing a finite dimensional vector space with respect to a collection of matrices acting on the vector space.
    * #11286 Speed-up solving linear systems  needs_info
    * #11287 [needs_review] Interface to runsnake and import_statements
    * #11289 [positive_review] Random posets, documentation and error-checking
    * #11290 [positive_review] Implementation of non-commutative k-Schur functions in the nilCoxeter algebra
    * #11291 Interface to Gprof2Dot
    * #11292 [positive_review] Allow broader inputs to lattice meet and join
    * #11293 [positive_review] All relations of a poset
    * #11296 [positive_review] add default username to sage-combinat install script
    * #11299 [positive_review] Fix documentation of sage.modular.modform.element.ModForm.qexp
    * #11300 [positive_review] Add get_part method to partition.py
    * #11301 [positive_review] empty partition causes error for up_list
    * #11303 Fix the documentation of attach
    * #11305 Bijection between Rigged Configurations and Crystal Paths
    * #11306 [needs_review] Upgrade unitary check for RDF/CDF matrices
    * #11308 typos in sage.structure.list_clone documentation
    * #11311 [needs_review] engine="pdflatex" in view is ignored
    * #11314 Enhance method from_shape_and_word in tableau to allow English reading order
    * #11315 [needs_review] remove pstricks from default latex preamble

This list was generated from the trac report [[http://trac.sagemath.org/sage_trac/query?status=needs_info&status=needs_review&status=needs_work&status=new&status=positive_review&order=id&col=id&col=summary&col=status&col=reviewer&col=author&keywords=~days30|Sage Days 30 trac tickets]]

== Coding Sprints and Design Discussions ==

 * Anders Buch, Anne Schilling and Nicolas Thiery worked on the interface between sage and Anders' Littlewood-Richardson calculator written in C. We worked on finalizing Mike Hansen's patch and added additional functionalities to the patch such as the fusion coefficients. The final version is on [[http://trac.sagemath.org/sage_trac/ticket/10333|trac #10333]], has a positive mathematical review, and is awaiting a final technical review.

 * Chris Berg and Anne Schilling worked on an implementation of the nilCoxeter algebra and noncommutative k-Schur functions for affine type A. Jason Bandlow and Franco Saliola reviewed the patch [[http://trac.sagemath.org/sage_trac/ticket/11290|trac #11290]] and it received a positive review.

 * Travis Scrimshaw wrote code for the bijection between rigged configurations and crystal paths. In particular, he implemented the Kleber algorithm which provides an efficient way to create all highest weight rigged configuration for a given sequence of rectangles and given weight. His code was pushed to the sage-combinat server.

 * Much work was done by several participants (Hugh Thomas, Eric Webster, Ryan Oulton, JP Simard, Calin Fraser, Josh Koncovy, Gaelan Hanlon, Francis Bischoff, Florent Hivert, Christian Stump) on implementing the full collection of d-complete posets, the slant product of d-complete posets, and jeu de taquin for them. Some of this code can be found in the page for the [[http://wiki.sagemath.org/days30_prize|Sage Days 30 Best First Contribution Prize]].

 * There was much work done on the thematic tutorials. Nicolas Thiery liberated the tutorials from the reference manual. Nicolas Thiery, Florent Hivert, Jason Bandlow and Franco Saliola edited, expanded and added new tutorials.

 * Carolina Benedetti implemented a function to construct the "quantum Grassmannian poset". Here is an [[http://wiki.sagemath.org/days30_statusreports?action=AttachFile&do=view&target=qgposet.pdf|image of one such poset]].
