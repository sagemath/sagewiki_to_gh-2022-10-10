

```rst
#!rst 

Final Schedule for Sage Days 38
===============================

 **Morning sessions** will will include talks, tutorials and open presentations.

 **Afternoon sessions** will be dedicated to working on the exercises from the
 tutorials, coding sprints, follow-up discussions, etc.

 **Status reports**: There will be a status report every day at 17h00.

Monday
------

 **Morning Session**:

 * 08h30 : Coffee & Croissants
 * 09h00 : `Welcome and Introduction to Sage`_ (`source files`_), Sébastien Labbé
 * 10h00 : Coffee Break
 * 10h30 : Tour de Table and Installations, Franco Saliola
 * 11h30 : `Tutorial I`_ : *Using the Sage notebook and navigating the help system*, Franco Saliola

 **Lunch Break**: 12h30 - 14h30

 **Afternoon Session**, 14h30-17h30:

 * 14h30 : `Tutorial II`_ : *Calculus and Linear Algebra in Sage*
 * 15h30 : Coffee Break
 * 16h00 : Coding Sprints
 * 17h00 : Status Reports

 **Buffet at CRM**: 17h30 - 18h30

 **Special event**: *Installation Party*, 18h30

            After the buffet, we will continue with informal discussions,
            coding sprints and we will troubleshoot any problems encountered in
            the installations during the morning session.


Tuesday
-------

 **Morning Session**:

 * 08h30 : Coffee & Croissants
 * 09h00 : `Øyvind Solberg`__, *Quivers and Path Algebras - QPA* (`slides`__ and `demo`__)

            *Abstract*. We will give an introduction representation theory of
            quivers, defining quivers (directed graphs), representations of
            quivers and maps between representations of quivers. Further to
            recall basic constructions involving these objects like direct sum,
            kernels, special representations, etc.  Representations of quivers
            are central for representation theory of finite dimensional
            algebras, and we will try to describe some of the basic problems.

            Next we describe the QPA project by describing the background, aims
            and goals, current status, design and algorithms, and main future
            projects.

            We will end with a short demonstration of the QPA program,
            hopefully run via an interface developed by students at HiST/NTNU.

   __ http://www.math.ntnu.no/~oyvinso/
   __ http://wiki.sagemath.org/days38_schedule?action=AttachFile&do=view&target=solberg-slides.pdf
   __ http://wiki.sagemath.org/days38_schedule?action=AttachFile&do=view&target=solberg-gap-demo.g

 * 10h00 : Coffee Break
 * 10h30 : Nicolas M. Thiéry, *A Sage-Combinat roadmap*

            *Abstract.* In this talk, we will present the Sage-Combinat
            project, whose mission is "to improve Sage as an extensible toolbox
            for computer exploration in (algebraic) combinatorics, and foster
            code sharing between researchers in this area". After a brief tour
            of its history and development model, we will focus on its roadmap,
            opening a discussion on what mid to long term goals could be,
            depending on interest and available work forces.

 * 11h30 : `Meinolf Geck`__, *High performance computations around Kazhdan-Lusztig cells*

            *Abstract.*  We present the computer algebra package PyCox, written
            entirely in Python and compatible with Sage, for computations with
            finite Coxeter groups and Hecke algebras. It includes some new
            variations of the traditional algorithms for computing Kazhdan-Lusztig
            cells (which now work up to type E_7) and distinguished involutions
            (which even work in type E_8).

   __ http://www.abdn.ac.uk/~mth190/

 **Lunch Break**: 12h30 - 14h30

 **Afternoon Session**, 14h30-17h30:

 * 14h30 : `Tutorial III`_: *Programming in Python and Sage*, Florent Hivert
 * 15h30 : Coffee Break
 * 17h00 : Status Reports

Wednesday
---------

 **Morning Session**:

 * 08h30 : Coffee & Croissants
 * 09h00 : Derek Ruths, `Introducing Zen: the Zero-Effort Network Library for Python`_

            *Abstract.* This talk will introduce a new python library for network
            analysis and algorithmics.  As datasets increase in size and algorithms
            demand increasing amounts of resources, it is critically important for
            network libraries to be efficient and performant.  Few libraries
            available for Python (or any other platform for that matter) deliver
            this kind of efficiency: few can load massive network datasets or
            execute intensive algorithms on them.  Of those that can, efficiency
            comes at a cost to ease of use.  We don't believe that this compromise
            is necessary. Designed from scratch, the Zen library aims to provide the
            fastest, most memory efficient network routines without compromising
            good pythonic conventions.  To date it's benchmarked network functions
            match or beat the fastest network libraries available in Python.  In
            this talk, we will give a brief introduction to network analysis,
            discuss the design elements of Zen that make it both fast and
            easy-to-use, briefly overview its functionality, and discuss
            opportunities for integration and use with Sage.

 * 10h00 : Coffee Break
 * 10h30 : Anne Schilling, *Markov chains for promotion operators*, (`Sage worksheet`__)

            *Abstract.* Schuetzenberger introduced a promotion operator on
            arbitrary finite posets. Using a slight extension of these
            operators, one can define a Markov chain on all linear extensions
            of the poset. This generalizes the Tsetlin library which
            corresponds to the antichain. With Sage, we can investigate the
            stationary distributions and eigenvalues of the transition matrix.
            For rooted forests we find that the resulting monoid is R-trivial,
            which leads to a generalization of Brown's theory of Markov chains
            for left regular bands. This is based on mathematical explorations with
            Arvind Ayyer and Steven Klee, and the patch 
            `Trac 12536`_ with Nicolas Thiery.

   __ http://wiki.sagemath.org/days38_schedule?action=AttachFile&do=view&target=schilling-markov.sws

 * 11h00 : Viviane Pons, *Bases of multivariate polynomials*, (`Sage worksheet`__)

            *Abstract.* We have developed a patch in sage to consider
            multivariate polynomials as formal sums of vectors. Each vector
            corresponds to the exponent of a monomial. From simple operations
            on vectors, we obtain operations on the polynomials. We define the
            *divided differences* and we explain how they can be used to
            generate linear bases of the ring of multivariate polynomials. We
            show that they can be seen as a generalization of the Schur basis
            of symmetric polynomials.

   __ http://wiki.sagemath.org/days38_schedule?action=AttachFile&do=view&target=pons-worksheet.sws

 * 11h30 : `Tutorial IV`_: *Contributing to Sage*, Anne Schilling

 **Lunch Break**: 12h30 - 14h30

 **Afternoon Session**, 14h30-17h30: exercises and coding sprints with coffee break and status reports

 * 15h30 : Coffee Break
 * 17h00 : Status Reports

Thursday
--------

 **Morning Session**:

 * 08h30 : Coffee & Croissants
 * 09h00 : Open Presentations
 * 10h00 : Coffee Break
 * 10h30 : Open Presentations
 * 11h30 : `Tutorial V`_: *Cython*, Florent Hivert

 **Lunch Break**: 12h30 - 14h30

 **Afternoon Session**, 14h30-17h30: exercises and coding sprints with coffee break and status reports

 * 15h30 : Coffee Break
 * 17h00 : Status Reports

Friday
------

 **Morning Session**:

 * 08h30 : Coffee & Croissants
 * 09h00 : Open Presentations
 * 10h00 : Coffee Break
 * 10h30 : Open Presentations

 **Lunch Break**: 11h30 - 13h30

 * 13h30 : Doron Zeilberger: n\ :sup:`n-2`\ 

 **Afternoon Session**, 14h30-17h30: exercises and coding sprints with coffee break and status reports

 * 15h30 : Coffee Break
 * 17h00 : Status Reports

Open Presentations
==================

Open presentations are quick (5 to 15 minutes) presentations done by the participants. It can be demonstrations of projects done during the week. Or it can be about anything of interest to the participants including software useful for teaching or research.

Thursday :

- Using sagetex to generate of math homeworks, by Nicolas Thiéry (`zip file with example`__)
   __ http://wiki.sagemath.org/days38_schedule?action=AttachFile&do=view&target=demo-exam-sheet-with-sage.zip
- interact demo, by Mélodie
- animate demo, by Michael

Friday :

- `sagetex Tutorial`_, by Pierre Cagne
- WebWorK and Sage integration, by Malcolm
- `Tutorial V`_: *Cython Part 2*, by Florent Hivert
- `Python Coding Convention`_, by Sébastien Labbé

Not done yet :

- a demo of the new IPython 0.12 Notebook, by Pierre Cagne
- What's new with Python 2.7 recently included into Sage?, by ???
- some interact made by Florent
- pgfplots + gnuplot, by Alexandre Blondin Massé
- tikz2pdf, by Sébastien Labbé



.. _`Introducing Zen: the Zero-Effort Network Library for Python` : http://zen.networkdynamics.org/wp-content/uploads/2012/05/20120509_SageDays38.pdf
.. _`Welcome and Introduction to Sage`: http://thales.math.uqam.ca/~labbes/Sage/2012-05-days38.pdf
.. _`source files`: http://sage.math.washington.edu/home/slabbe/days38-talk/
.. _`Tutorial I`: days38_tutorials#tutorial-i-using-the-sage-notebook-and-navigating-the-help-system
.. _`Tutorial II`: days38_tutorials#tutorial-ii-calculus-and-linear-algebra-in-sage
.. _`Tutorial III`: days38_tutorials#tutorial-iii-programming-in-python-and-sage
.. _`Tutorial IV`: days38_tutorials#tutorial-iv-contributing-to-sage
.. _`Tutorial V`: days38_tutorials#tutorial-v-cython
.. _`Trac 12536`: http://trac.sagemath.org/sage_trac/ticket/12536
.. _`sagetex Tutorial`: http://sagemath.org/doc/tutorial/sagetex.html
.. _`Python Coding Convention`: http://www.sagemath.org/doc/developer/conventions.html

```