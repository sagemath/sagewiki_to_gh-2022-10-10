{{{#!rst


Schedule for Sage Days 49 (June 17-21, 2013)
============================================

**For the main Sage Days 49 page go** `here <http://wiki.sagemath.org/combinat/FPSAC13>`_

Monday
------

 **Morning Session**:

 * 09h00 : Welcome, Sage installation, coffee
 * 10h00 : Introduction to Sage*, Tom Denton `(Slides!) <http://wiki.sagemath.org/days49_schedule?action=AttachFile&do=view&target=TDintroSlides.pdf>`_
 * 10h45 : Tutorial I: *Using the Sage notebook and navigating the help system*, Mathieu Guay-Paquet (UQAM)
 * 11h30 : Talk I: *Find me a basis that....*, Mike Zabrocki (York) 
           
           *Abstract*. This talk will start with an introduction to combinatorial
           Hopf algebras (CHAs).  Ironically, one of the main open problems
           related to this area is to give a good definition of a CHA.  A 
           question that I think that Sage will help us answer is "what is the
           fundamental basis of a combinatorial Hopf algebra?" `slides available for talk <http://wiki.sagemath.org/days49_schedule?action=AttachFile&do=view&target=MZslides.pdf>`_

 **Lunch Break**: 12h30 - 14h30

 **Afternoon Session**, 14h30-17h30:

 * 14h30 : *Round table and discussion of programming projects* Anne Schilling (UC Davis)
 * 15h30 : Coffee Break
 * 16h00 : Coding Sprints
 * 17h00 : Coding Sprints

Tuesday
-------

 **Morning Session**:

 * 09h00 : Talk II: *Combinatorial Actions, Orbit Averages, and Sage Implementation*, Tom Roby (U. Connecticut) `slides!! <http://www.math.uconn.edu/~troby/homomesySageOrsay2013.pdf>`_ (open in Adobe Acrobat Reader to see animations)

            *Abstract*. We consider a variety of combinatorial actions on finite sets whose
            orbits have unexpected properties.  Starting with simple examples such
            as cyclic rotation of binary strings, we generalize to actions on Young
            tableaux and order ideals of partially ordered sets.  We identify a
            particular phenomenon called *homomesy* appearing in many unrelated
            combinatorial contexts: namely that the average value of some natural
            statistic over each orbit is the same as the average over the entire
            set.  Viewing these actions as products of *toggle operations* allows
            us to see how some of these actions are related and to extend much of
            this picture more broadly.  In particular, we can generalize the
            operations of rowmotion and promotion (in Striker and Williams'
            terminology) on order ideals in a poset to (1) the order polytope of a
            poset (the continuous piecewise-linear category), and (2) to the
            collection of maps from a poset to rational functions in $|P|$ variables
            (the birational/geometrical) setting.

            For this latter setting, Darij Grinberg has developed Sage code that (1)
            computes the rowmotion operator; (2) checks whether this operator
            appears to have finite order; (3) helps check for homomesy of particular
            statistics under the action of the operator.  Although we have proofs of
            homomesy for a number of special cases, much remains to be done even at
            the combinatorial level of order ideals on posets.  For the two other
            categories almost everything we have discovered via computer-based
            computations is still conjectural.

            This talk largely discusses recent work with Jim Propp, including ideas
            and results and code from Arkady Berenstein, David Einstein, Darij
            Grinberg, Shahrzad Haddadan, Jessica Striker, and Nathan Williams.

 * 10h00 : Coffee Break
 * 10h30 : Tutorial II: *Programming in Python and Sage*, Viviane Pons (Marne-la-Vallée) (download `tutorial <http://igm.univ-mlv.fr/~pons/docs/Introduction_to_Python_and_Sage.sws>`_, save and open through sage notebook)
 * 11h30 : Talk III: *Computing Ext algebras with Sage.  An F_5 algorithm for path algebra quotients* (`Slides <http://wiki.sagemath.org/days49_schedule?action=AttachFile&do=view&target=ExtF5SimonKing.pdf>`_), Simon King (Friedrich Schiller U. Jena)

            *Abstract.* Basic algebras are finite dimensional path algebra quotients and naturally 
            occur in, e.g., representation theory of finite groups. We implement Ext algebras of 
            basic algebras in Sage, together with an F5 algorithm. 

            Given minimal projective resolutions 
            for the simple modules of a basic algebra, one computes the Ext algebra by dealing with homogeneous 
            algebraic relations in free associative algebras. Here, we use “Letterplace” from Singular. Our wrapper 
            in Sage revealed some severe memory leaks. 

            Minimal projective resolutions for modules over basic algebras 
            can be obtained by standard basis or linear algebra methods. The currently best implementation 
            (for quivers with a single vertex) is David Green’s heady Buchberger algorithm, which is part of the 
            optional p group cohomology spkg. We wish to replace it by a more efficient method: F5.
            
            Faugère’s famous F5 algorithm computes standard bases for modules over polynomial rings. 
            It uses a “signature”, that keeps track how elements were constructed, and is efficient by 
            exploiting commutativity to avoid redundant constructions. We provide a non-commutative F5 algorithm, 
            replacing the commutativity relations by the quotient relations in a basic algebra.
            
            Given a module over a basic algebra, the output of the F5 algorithm is not just a 
            standard basis but a so-called signed standard basis of the module. Our main result is: 
            If a negative degree monomial ordering is used, then the signed standard basis provides 
            enough information to read off the Loewy layers of the module. This information is not 
            provided in an unsigned standard basis. Hence, the F5 algorithm could not easily be 
            replaced by any other algorithm for the computation of standard bases.
            
            The first Loewy layer provides a minimal generating set. Thus, the non-commutative 
            F5 algorithm yields more information than Green’s algorithm and in addition 
            is theoretically more efficient.

            
 
 **Lunch Break**: 12h30 - 14h30

 **Afternoon Session**, 14h30-17h30:
 
 * 14h00 : `FindStat <http://wiki.sagemath.org/combinat/FPSAC13>`_ Demo (Chris Berg, Viviane Pons, Travis Scrimshaw)
 * 15h30 : Coffee Break
 * 17h00 : Status Reports

Wednesday
---------

 **Morning Session**:

 * 09h00 : Tutorial III *version control and contributing to sage* Chris Berg (UQAM)
       Guides:

       - `How to Referee Sage Trac Tickets`_ by William Stein
       - `How to contribute to Sage`_ by Sébastien Labbé
       - `Introduction to Sage Development`_ by Mike Hansen
       - `Short step-by-step checklist for reviewing a patch`_ by Franco Saliola
       - `Sage Developer's Guide`_:

       - `Walking Through the Development Process`_
       - `Review a patch`_

 Videos:

 - `Contributing to Sage : Who, What and How`_: video of a talk by William Stein

 Related thematic tutorials:

 - `Editing the Sage sources`_

 * 10h00 : Coffee Break
 * 10h30 : Tutorial IV: *coercion and category framework*, Simon King
   `Tutorial worksheet <http://wiki.sagemath.org/days49_schedule?action=AttachFile&do=get&target=TutorialCategoriesCoercion.sws>`_, `original webpage <http://www.sagemath.org/doc/developer/walk_through.html>`_

 **Lunch Break**: 12h30 - 14h30

 **Afternoon Session**, 14h30-17h30: exercises and coding sprints with coffee break and status reports

 * 15h30 : Coffee Break
 * 17h00 : Status Reports

Thursday
--------

 **Morning Session**:

 * 09h00 : Talk IV: *Numerical evaluation of D-finite functions: NumGfun and beyond*, Mark Mezzarobba (RISC, Johannes Kepler U. Linz)
   `Slides <http://marc.mezzarobba.net/exposes/sd49-mezzarobba-20130620-slides.pdf>`_
   `Maple worksheet <http://marc.mezzarobba.net/exposes/sd49-mezzarobba-20130620-demo.mw>`_

            *Abstract.* D-finite (aka holonomic) functions are complex analytic solutions of 
            linear ODEs with polynomial coefficients. The class of D-finite 
            functions encompasses most elementary functions (exp, ln, sin, sinh...) 
            as well as many common special functions (e.g., Bessel functions and 
            generalized hypergeometric functions). Its nice algebraic and 
            computational  properties make it possible to develop a unified 
            framework to deal with  these functions in a computer algebra system, 
            instead of developing ad hoc code for every single function.

            My talk will focus on the multiple precision numerical evaluation of
            D-finite functions. I will present NumGfun, a Maple package that 
            provides a guaranteed evaluator for general D-finite functions as well 
            as some other features related to the rigorous symbolic-numeric 
            manipulation of such functions. I also plan to discuss some of the 
            underlying algorithms and say a few words about applications to analytic 
            combinatorics, the reasons that made me use Maple for this work, what I 
            dislike about it and what role Sage may play as an alternative.                 
 
 * 10h00 : Coffee Break
 * 10h30 : Open Presentations

 **Lunch Break**: 12h30 - 14h00

 * 14h00 : `Digiteo Seminar`_, *Le génie mathématique, du théorème de quatre couleurs à la classification des groupes*, Georges Gonthier (Microsoft Research)

 **Afternoon Session**, 

 * 15h30 : Coffee Break
 * 17h00 : Status Reports

Friday
------

 **Morning Session**:

 * 09h00 : Open Presentations
 * 10h00 : Coffee Break
 * 10h30 : Open Presentations

 **Lunch Break**: 11h30 - 13h30

 **Afternoon Session**, 14h30-17h30: exercises and coding sprints with coffee break and status reports

 * 15h00 : Final Status Reports

Open Presentations
==================

Open presentations are quick (5 to 15 minutes) presentations done by the participants. It can be demonstrations of projects done during the week. Or it can be about anything of interest to the participants including software useful for teaching or research.

.. _`Digiteo Seminar`: http://www.digiteo.fr/prochaine-seance-du-seminaire-digiteo-organisee-avec

.. _`How to contribute to Sage`: http://thales.math.uqam.ca/~labbes/Sage/how-to-contribute/
.. _`How to Referee Sage Trac Tickets`: http://sagemath.blogspot.com/2010/10/how-to-referee-sage-trac-tickets.html
.. _`Editing the Sage sources`: http://combinat.sagemath.org/doc/thematic_tutorials/tutorial-editing-sage-sources.html
.. _`Introduction to Sage Development`: http://wiki.sagemath.org/days20.5/schedule?action=AttachFile&do=view&target=sd20.5.pdf
.. _`Short step-by-step checklist for reviewing a patch`: https://www.evernote.com/shard/s16/sh/f30e5eb9-70a9-4882-818b-333c690942bf/d7a138e2705c25b8da6e2053950a89d5
.. _`Sage Developer's Guide`: http://sagemath.org/doc/developer/index.html
.. _`Walking Through the Development Process`: http://sagemath.org/doc/developer/walk_through.html
.. _`Review a patch`: http://sagemath.org/doc/developer/walk_through.html#reviewing-a-patch
.. _`Contributing to Sage : Who, What and How`: http://vimeo.com/14044496
.. _`Quick reStructuredText`: http://docutils.sourceforge.net/docs/user/rst/quickref.html
.. _`reStructuredText`: http://docutils.sourceforge.net/rst.html
.. _`Sphinx Markup Constructs`: http://sphinx.pocoo.org/markup/index.html
.. _`reStructuredText (saifoo.net)`: http://www.siafoo.net/help/reST/
.. _`ReText`: http://sourceforge.net/p/retext/home/ReText


}}}
