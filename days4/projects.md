= Projects =
Coding sprint and project ideas for [:days4:SAGE Days 4] June 12-17, 2007.

At some point a day or 2 before SD4, we'll have to: flesh these out more and print up the result in a nice latex document for everybody.  Then when people choose actual projects, they will create subpages on the wiki to track their progress, etc.

 * W Stein: Go through all the standard SAGE packages and, when possible, '''add an spkg-check''', which runs some sort of analogue of "make check" when possible.
 * Introduce some form of package sanity checking to sage -upgrade, such as file size checks, CRC checks, or digital signatures.
 * D Deshommes and W Stein: Fully port SAGE to Solaris; improve SAGE's package management system
 * W Stein, etc.: Make it so vastly more objects are picklable:
  * Write way way more loads(dumps(s)) doctests
  * Fix them when they don't work.
 * Revise the guided tour part of the '''SAGE tutorial''' to much better reflect the symbolic calculus functionality, its pros, cons, etc.
 * Create ["screenshots"]
 * W Stein: '''Documentation'''.  Have teams describe how to do the following in tutorial fashion, with all examples automatically doctested:
  * Use dsage to task farm a couple of standard example problems.
  * Make dsage ''truly usable'' for mere mortals -- this means having people who know little just sit down and throw random crap at it; then we formulate a plan to improve things based on the results.
  * Use SageX to create an interface to a C library (case study -- GMP-ECM).
  * Convert a program from .sage files to .py library code.
  * Convert a .py Python program to SageX for speed.
  * Create publication-quality graphics for inclusion in latex documents.
  * Port code from Magma to SAGE.
  * Make an existing PARI-GP / GAP / Singular / Lisp / Maxima program easily usable from SAGE.
  * (Bobby Moretti): How to create a ring or other structure object in SAGE, what class to inherit from, how to set the parent object, what methods to override in both python and SageX, etc.
 * M Albrecht: Go through the wiki and clean it up, write more documentation,  and check what content should be added to the documentation
 * W Stein: Implement a global '''proof = True''' or '''proof = False''' option that is queried by algorithms when proof=None.
 * David Roe: General elliptic curve '''height bound''' code (port Cremona's GPL'd MAGMA code to SAGE.)
 * W Stein: Implement '''Tate's algorithm over number fields''' (again, this involves porting Cremona's GPL'd MAGMA code to SAGE).
 * W Stein, Tom Boothby, Robert Miller, Dorian Raymer, Alex Clemesha, Yi Qiang, and Timothy Clemans: Improve '''The SAGE Notebook''':
  1. Convert the web server so that it uses twisted's multithreaded server (either twisted web like moinmoin or twisted web2)
  1. Make it so that the server use https to secure all communications and logins
  1. Figure out precisely why the notebook feels sluggish when running locally on _certain_ platforms.  Consider removing features in the interest of speed.  Also seriously consider making it so maybe 3 SAGE instances are pre-started by the notebook server when it is fairly idle so that new worksheets appear to starting working immediately.
  1. Make it so each user of the notebook has an account on the notebook, and can only see worksheets that are explicitly shared by other users.  Worksheet names would internally be prefaced with the user name.
  1. Interface issues:
   1. Highlighting a block of text and pressing tab indents it four spaces; similarly, pressing shift-tab dedents it four spaces.
   1. Uploading a worksheet should not display an empty page.
  1. Create a worksheet settings panel; use this to:
   1. Set the math software system used to evaluate cells
   1. Determine whether pressing shift-enter jumps to the next cell or stays in current one.
   1. Determine whether or not the side bar is displayed (the left button wall could still be used to toggle it).
  1. In the notebook some input cell should *always* have focus, if this is possible.  I hate typing into a worksheet and having random movement happen.
  1. Create a notebook settings panel:
   1. Whether or not panel is displayed by default
   1. Whether shift enter or enter evaluates a cell (Mathematica or Maple mode)
   1. Default CAS for new worksheets.
   1. Whether or not SAGE logo at top left is displayed (or another log is displayed in its place, which is copied to .sage when selected).
  1. Change "slide-show mode" to "single cell mode".  Make it so the editor in this mode is a full-fledged code editor.
  1. Slide-show mode should flip through slides, which should be well-defined sections of the worksheet.
  1. Printing needs to be rewritten as follows: Given a single worksheet, print it by (1) saving it to a latex file with embedded (vector, if possible) images, and (2) running pdflatex on the result, then return the resulting pdf file and/or a tarball with the images and latex. This would be very high quality, and will also be something that would be easily included in latex documents.  Printing a notebook (=all worksheets owned by a given user) would create a document with a section for each notebook.
  1. Rewrite saving/loading of worksheets, so it doesn't use pickle.  Instead use the {{{'}}}'s text encoding and the images in directories.
  1. Finish implementing the html/edit mode: (1) images shouldn't get deleted on saving, (2) inserting new cells shouldn't be broken, and (3) it would be really nice, and probably easy, to have a WYSIWYG html editor mode like the one in moinmoin in which I'm writing this right now.
  1. Fix the bug where variables aren't listed in the sidebar.
  1. Implement correct tab completion in the worksheet when in system-other-than-sage mode (i.e., don't put magma.foo[tab])
  1. Add support for user javascript in the worksheet cells along with basic graphics (Robert Miller). See http://www.sagemath.org:9002/sage_trac/ticket/359
  1. Create an option so that processes that run the actual worksheets can be started as a different user.  This will be slower, but could be vastly more robust.  With sufficient thought there might be a trick to implement this in a few lines of code.
  1. Add a lock button in upper left that looks like a lock.  When clicked one can't accidentally navigate away from a worksheet with out confirming.
  1. Fix bugs:
   1. The interactive help at sagenb.org and sagenb.com often doesn't appear unless one hits refresh a few times.
   1. Come up with clever new ideas to address the "jupiness" of the notebook, e.g., Justin Walker reports that in Safari under OS X, "I reach the bottom of the visible page, and scroll down to make the next cell visible, enter an expression, and hit SHFT- Return, the page jumps back to the top."
  1. Implement some of the features of Google Notebook (http://www.google.com/notebook)  -- note we were before them.
   1. Full search of all worksheets
   1. Cleaner display of worksheet list on the left
   1. Drag and drop
  1. New directory structure / never an sobj -- *BUT* maintain backwards compatibility with existing notebooks (!).
   * /notebook
    * config.txt #config file for notebook in standard config file format
    * /history
    * /data (contains objects & stuff)
    * /codes (contains attachable scripts & stuff)
    * /worksheets
     * /_scratch_ (for example)
      * _scratch_.txt (contains worksheet wiki text + config-file format header)
      * /cells
      * /images?
    * /userinfo (contains SQLite database to control access / session / user stuff & stuff)
   * Note -- when one saves a worksheet (or set of worksheets), all objects that they link to must be included in the saved worksheet!
  1. Javascript feature: click & drag on a plot to zoom.  Tom really wants this. Bobby seconds this. It's a killer feature. Perhaps google maps style?
  1. Create a quiz-mode for worksheets, which satisfies the requirements of a quiz system.
 * W Stein: Continue to flesh out ideas for '''JSAGE -- the open source math software journal'''.  I announced JSAGE at SD3, and it's been very interesting to see it start to take off.  It's critical that we actually *write* some code to manage JSAGE, and figure out how to really do it right -- much more work is needed.  In particular, a good way of dealing with code submissions from people that don't know much about SAGE development, but have awesome code and ideas to contribute.
 * Nick Alexander (from UCI) and Thea (from SFU): I'd like to implement some basic''' linear algebra over Z/nZ''', following perhaps '' Algorithms for Linear Algebra Problems over Principal Ideal Rings '' (1996), Johannes Buchmann, Stefan Neis at http://citeseer.ist.psu.edu/719844.html.   The algorithms of that paper apply to principal ideal '''rings''', and in the case of a principal ideal '''domain''', reduce to computing the Hermite normal form.  So this could expand to trying to compute the Hermite normal form in the manner of Steel's unpublished algorithm as implemented in MAGMA.
 * David Joyner: I'm interested in adding functionality to the '''group theory''' functionality in SAGE.
 * David Joyner: I'm also interested in coding theory and in particular Robert Miller's work on (now GPL'd) '''Leon's partition backtracking''' programs.
 * Kirsten Fagnan, Peter Clark: '''3d Graphics'''
 * Kirsten Fagnan, Josh Kantor, didier deshommes: '''Numerical Computation'''
  1. Incorporate superLU into SAGE with appropriate wrapping via sagex
  1. Incorporate clapack into SAGE
  1. Incorporate something that depends on clapack
  1. Improve SAGE's support for octave and matlab
 * William Stein, David Roe, Joel Mohler: '''Number Fields''' There are numerous issues with number fields in SAGE.  Basically the design is terrible.  The KANT developers have worked very hard for literally a decade to get the design of number fields right, but the design in SAGE (1) completely ignores all the good work done by the KANT group, and just doesn't feel right.
  1. Arithmetic speed -- Joel improved this a lot, but it's unclear what the best plan is.  Discussion at SD4 about design would be very worthwhile.
  1. I really ''do not'' like how relative extensions are implemented in SAGE.  It's terrible.  Design discussions + possibly rewrite it all.  The main problem is that it works way too much like PARI and isn't structural; it doesn't fit at all with how SAGE is supposed to work, and is utterly confusing from a KANT/MAGAM point of view.  It's really bad.
  1. Rings of integers and orders -- Discuss how they might be implemented; required functionality etc.
 * David Roe:''' p-Adic Arithmetic''' -- Design and implement highly optimized algorithms for arithmetic with p-adic numbers. The current implementation is already extensive, containing a wide range of different models of p-adic arithmetic (capped relative, capped absolute, lazy, extensions, etc.) but many new algorithms need to be developed, especially for arithmetic with polynomials over the p-adics, for p-adic linear algebra, for computing in the lattice of extensions of a p-adic ring, and for computing with completions of a number field. (This project started at SAGE Days 2, and has been very actively pursued, especially by David Roe during the last 7 months.)
 * Applications of '''Monsky-Washnitzer Cohomology''': Investigate algorithms for''' fast point counting''' on elliptic and hyperelliptic curves, computation of p-adic height pairings, and computations of''' ''p''-adic Coleman integrals'''. This project began in 2006 at an MSRI workshop, and has been an active area of work during the last year by Kiran Kedlaya, David Harvey, and Robert Bradshaw. In particular, Harvey has recently developed new algorithms that will be explored at the workshop, which allow for new efficient point counting on Jacobians of hyperelliptic curves, Bradshaw and Kedlaya have implemented Coleman integration which has application to the study of rational points on curves, and Stein has been investigating p-adic analogues of the Birch and Swinnerton-Dyer conjecture in many new cases using a new algorithm for computing p-adic heights. Kiran Kedlaya: for applications to rational points on curves, it would be useful to have '''iterated Coleman integrals'''. Also, what about p-adic heights on hyperelliptic curves with good ordinary reduction? Amnon Besser has a recipe for computing heights using Coleman integrals, but it would be easier if one could use only the Frobenius matrix, since then Harvey's improvements become available.
 * '''Quaternion Algebra Arithmetic''' and Modular Forms: Create and implement algorithms for efficient arithmetic in quaternion algebras, and apply this work to computation of Hecke operators, modular forms, Tamagawa numbers of modular abelian varieties, and enumeration of elliptic curves of large conductor. Gonzalo Tornaria has long worked in this area, and William Stein is working with David Kohel and Lassina Dembele on the design of better algorithms.  This could also involve porting code from MAGMA to SAGE -- the two authors of Magma's quaternion algebra arithmetic have both strongly encouraged me to port their code to SAGE (or have partly done so themselves already).
 * '''Distributed Parallel Computation''': Continuing a major trend started at the MSRI workshop in January 2007 on parallel computation, participants will design algorithms for parallel distributed integer factorization, computation of Hecke eigenvalues, and other algorithms. In particular, participants will explore several of the other ideas listed above in the context of parallel computation. Implementing these algorithms will likely vastly improve the stability and reliability of distributed computation in SAGE.
 * '''Optimized Polynomial Arithmetic''': David Harvey and Bill Hart (Postdoc, Warwick) have recently created and implemented what is by far the '''world’s fastest code for univariate polynomial arithmetic'''. Explore how to fill in the remaining gaps in order to make the results of their work easily available to a larger user community. Similarly, Tom Boothby has worked for about 9 months on algorithms for very '''fast evaluation of polynomials''' at points, and another project will be to explore how to deploy this.
 * '''Commutative Diagram Coercion Model''': The current SAGE coercion model has some advantages (speed, ability to override for new classes) but also some issues.  A user is not able to override the coercion system at runtime and use their own coercion maps (this could be incredibly useful for polynomials, or systems of field extensions).  It is difficult to get a system-wide picture of what coercion maps exist: as SAGE grows, this will introduce bugs when the rules for transitivity of coercion are not followed.  It is also difficult, though not impossible, to implement coercion systems where the computation of the coercion map requires effort (creating a coercion map from $\mathbf{F}_{7^8} \to \mathbf{F}_{7^{24}}$).  I, David Roe, want to discuss a new coercion model, either replacing over built on top of the old, that addresses these problems.  Currently I have some ideas for a system based on commutative diagrams, but I want to brainstorm some more before implementing it.  This project will include discussions on ways to improve category theory in SAGE. Nick Alexander is also very interested in working on the proposed commutative diagram coercion model.
 * '''p-adic L-series of elliptic curves''': Christian Wuthrich and I will do a lot along these lines the week before.  Finishing this off at SAGE Days might be really interesting.
 * Kiran Kedlaya: I would love to have '''Arithmetic on Jacobians of Hyperelliptic Curves''' (Cantor's method), ideally SageX'd. I don't know whether this could be ported from MAGMA.
 * Bobby Moretti: '''Symbolic calculus'''. Speeding up arithmetic, cleaning up functions.py, reimplementing and improving maxima's solve command.
 * Bobby Moretti: '''Weirstrass Normal Form'''. Implement EllipticCurve_from_cubic() without using MAGMA.
 * didier deshommes: Improve support for '''SAGE on NexentaOS'''. Several packages need to be patched.
 * Yi Qiang:
  * Improve overhead of running jobs with DSage
  * Completely convert to GNUTLS
  * Finish implementing a web interface to dsage with Alex and Dorian
  * Finish implementing gmp-ecm wrapper
  * Help out with porting the notebook server to twisted
  * Implement parallel running of doctests
  * Fix doctest thread issue for DSage
 * Mike Hansen: '''Symmetric functions'''.  Implement the algebra of symmetric functions using SYMMETRICA for backend calculations.
 * Mike Hansen, Yi Qiang(?): '''Bootable (Cluster) CD for SAGE/DSAGE'''.  Using BCCD ( http://bccd.cs.uni.edu/ ) as a base, create a bootable CD to allow one to easily turn in unused lab into DSAGE cluster.
