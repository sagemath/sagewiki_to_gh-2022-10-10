= Final Status Reports for Sage Days 30 =

== Tutorials ==

The week began with several introductory tutorials (see the [[http://wiki.sagemath.org/days30_schedule|schedule]] for links to the tutorials and worksheets). This involved creating several tutorials and incorporating them into Sage; these eventually can be found in the thematic tutorials section of the live documentation.

== Tickets created/reviewed/patched/fixed ==

Here is a list of [[http://trac.sagemath.org/sage_trac/ticket/|trac tickets]] 
that were created or worked on during Sage Days 30. This
list was generated from the trac report
[[http://trac.sagemath.org/sage_trac/query?status=needs_info&status=needs_review&status=needs_work&status=new&status=positive_review&order=id&col=id&col=summary&col=status&col=reviewer&col=author&keywords=~days30|Sage Days 30 trac tickets]]::

 * [[http://trac.sagemath.org/sage_trac/ticket/9123|#9123: implement Schur algebras and use them to determine irreducible characters for GL_n]]
 * [[http://trac.sagemath.org/sage_trac/ticket/9128|#9128:[needs_review] Sphinx should be aware of all.py to find its links]]
 * [[http://trac.sagemath.org/sage_trac/ticket/10065|#10065:[needs_review] removed bug and new methods in Poset]]
 * [[http://trac.sagemath.org/sage_trac/ticket/10167|#10167:[closed enhancement: duplicate] three new methods in Poset]]
 * [[http://trac.sagemath.org/sage_trac/ticket/10194|#10194:Set factories]]
 * [[http://trac.sagemath.org/sage_trac/ticket/10333|#10333:[needs_review] Add an optional interface for lrcalc]]
 * [[http://trac.sagemath.org/sage_trac/ticket/10334|#10334:[positive_review] miscellaneous cleanup in perm_gps preparing for domains]]
 * [[http://trac.sagemath.org/sage_trac/ticket/10998|#10998: Categories for posets]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11251|#11251:[needs_review] Add todo extension to Sphinx]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11263|#11263:[positive_review] Markup ".. link" is wrong in the developer guide. Add ".. linkall" to systematically link.]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11281|#11281:".. math::" environment ignored in the live documentation]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11282|#11282:[positive_review] Add a link from the main live documentation help page to the thematic tutorials document]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11284|#11284:Document all options of Poset.show and Poset.plot]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11285|#11285:Request to add feature: Decomposing a finite dimensional vector space with respect to a collection of matrices acting on the vector space.]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11286|#11286:Speed-up solving linear systems  needs_info]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11287|#11287:[needs_review] Interface to runsnake and import_statements]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11289|#11289:[positive_review] Random posets, documentation and error-checking]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11290|#11290:[positive_review] Implementation of non-commutative k-Schur functions in the nilCoxeter algebra]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11291|#11291:Interface to Gprof2Dot]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11292|#11292:[positive_review] Allow broader inputs to lattice meet and join]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11293|#11293:[positive_review] All relations of a poset]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11296|#11296:[positive_review] add default username to sage-combinat install script]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11299|#11299:[positive_review] Fix documentation of sage.modular.modform.element.ModForm.qexp]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11300|#11300:[positive_review] Add get_part method to partition.py]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11301|#11301:[positive_review] empty partition causes error for up_list]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11303|#11303:Fix the documentation of attach]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11305|#11305:Bijection between Rigged Configurations and Crystal Paths]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11306|#11306:[needs_review] Upgrade unitary check for RDF/CDF matrices]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11308|#11308:typos in sage.structure.list_clone documentation]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11311|#11311:[needs_review] engine="pdflatex" in view is ignored]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11314|#11314:[positive_review] Enhance method from_shape_and_word in tableau to allow English reading order]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11315|#11315:[needs_review] remove pstricks from default latex preamble]]

== Coding Sprints and Design Discussions ==

 * Anders Buch, Anne Schilling and Nicolas Thiéry worked on the interface between sage and Anders' Littlewood-Richardson calculator written in C. We worked on finalizing Mike Hansen's patch and added additional functionalities to the patch such as the fusion coefficients. The final version is on [[http://trac.sagemath.org/sage_trac/ticket/10333|#10333]], has a positive mathematical review, and is awaiting a final technical review.

 * Chris Berg and Anne Schilling worked on an implementation of the nilCoxeter algebra and noncommutative k-Schur functions for affine type A. Jason Bandlow and Franco Saliola reviewed the patch [[http://trac.sagemath.org/sage_trac/ticket/11290|#11290]] and it received a positive review.

 * Travis Scrimshaw wrote code for the bijection between rigged configurations and crystal paths and opened the corresponding ticket [[http://trac.sagemath.org/sage_trac/ticket/11305|#11305]]. In particular, he implemented the Kleber algorithm which provides an efficient way to create all highest weight rigged configuration for a given sequence of rectangles and given weight. His code was pushed to the sage-combinat server.

 * Much work was done by several participants (Hugh Thomas, Eric Webster, Josh Koncovy, Gaelan Hanlon, Francis Bischoff, Christian Stump) on implementing the full collection of d-complete posets, the slant product of d-complete posets, and jeu de taquin for them. Some of this code can be found in the page for the [[http://wiki.sagemath.org/days30_prize|Sage Days 30 Best First Contribution Prize]].

 * There was much work done on the thematic tutorials. Florent with a bit of help from Nicolas worked on the Sphinx infrastructure to enable cross document links and other related features [[http://trac.sagemath.org/sage_trac/ticket/11251|#11251]], [[http://trac.sagemath.org/sage_trac/ticket/11263|#11263]], [[http://trac.sagemath.org/sage_trac/ticket/11282|#11282]]. This enabled Nicolas to move the Sage-Combinat thematic tutorials to where they belonged (either the reference manual or the thematic tutorial document). Nicolas, Florent Hivert, Jason Bandlow and Franco Saliola edited, expanded and added new tutorials. All the newcommers kindly played the guinea pigs on them.

 * Carolina Benedetti implemented a function to construct the "quantum Grassmannian poset". Here is an example:

   {{attachment:qgposet.pdf||width=600 height=850}}

 * Nicolas, Florent Hivert, Jason Bandlow, Franco Saliola, Anne Schilling, Travis Scrimshaw, Christian Stump and others discussed the design and naming conventions for the implementation of actions and representations. Nicolas has some code (aka the bigmess patch) that he will refactor soon according to the decisions taken there.

 * Florent Hivert, Jason Bandlow, Travis Scrimshaw, and Nicolas had a long design discussion about set factories. Florent Hivert wrote a patch implementing the design which is currently tested on combinat queue and should be submitted shortly [[http://trac.sagemath.org/sage_trac/ticket/10194|#10194]].

 * Christian Stump worked on the implementation of reflection worked, and had many discussions with Nicolas about the design. It turned out that the "category with adjective" idiom that Nicolas had implemented two weeks before in Montreal came just handy for this [[http://trac.sagemath.org/sage_trac/ticket/10963|#10963]].

 * Christian Stump and Florent Hivert worked on the optimization of the universal cyclotomic field

 * Jason Bandlow completed an initial implementation of k-Schur functions as a subring of the ring of symmetric functions after design discussions with Nicolas, Anne, .... The code was pushed to the sage-combinat server.

 * Rob Beezer and Nicolas worked on the conversion of the French "Introduction to Sage" book to worksheets using Rob's conversion scripts.

 * Rob Beezer and Nicolas finalized [[http://trac.sagemath.org/sage_trac/ticket/10334|#10334: miscellaneous cleanup in perm_gps preparing for domains]]

 * Nicolas implemented an interface with RunSnake [[http://trac.sagemath.org/sage_trac/ticket/11287|#11287]] which was reviewed by Franco

 * Christian, Franco and Nicolas worked on the finalization of [[http://trac.sagemath.org/sage_trac/ticket/10998|#10998: Categories for posets]]

 * Eva Curry, Florent and Nicolas implemented the enumerated set of IntegerPointsInABall, and got cool 3D pictures out of them.

 * Hugh got his code implementing Schur algebras and irreducible characters of GL_n (including the characteristic p case) into a shareable state (with help from Anne, Jason, and Franco), and, with help and prodding from Anne, got it into the sage-combinat queue.  

And everybody (more or less) played Frisbee!
