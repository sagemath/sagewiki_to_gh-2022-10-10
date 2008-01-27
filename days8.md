= Sage/Scipy Days 8 at Enthought =
== Connecting Pure Mathematics With Scientific Computation ==
=== February 29 until March 4, 2008 at the Enthought headquarters in Austin, Texas ===


ORGANIZERS:
  * Josh Kantor (University of Washington)
  * Travis Oliphant (Enthought)
  * Fernando Perez (Berkeley)
  * Fernando Rodriguez-Villegas (UT Austin)
  * William Stein (University of Washington)

Original full announcement:

{{{
#!rst
================================
 Sage/Scipy Days 8 at Enthought
================================

-------------------------------------------------------
Connecting Pure Mathematics With Scientific Computation
-------------------------------------------------------

.. Contents::
..
    1  Introduction
    2  Location
    3  Costs and Funding
    4  Contacts and further information
    5  Preliminary agenda
      5.1  Friday 29: Talks
      5.2  Saturday 1: More talks/code planning/code
      5.3  Sunday 2: Coding
      5.4  Monday 3: Coding
      5.5  Tuesday 4: Wrapup
..


Introduction
============

The Sage_ and Scipy_ teams and `Enthought Inc.`_ are pleased to announce the
first collaborative meeting for Sage/Scipy joint development, to be held from
February 29 until March 4, 2008 at the Enthought headquarters in Austin, Texas.

The purpose of this meeting is to gather developers for these projects in a
friendly atmosphere for a few days of technical talks and active development
work.  It should be clear to those interested in attending that this is *not*
an academic conference, but instead an opportunity for the two teams to find
common points for collaboration, joint work, better integration between the
projects and future directions.  The focus of the workshop will be to actually
*implement* such ideas, not just to plan for them.

**Sage**
  is a Python-based system which aims at providing an open source, free
  alternative to existing propietary mathematical software and does so by
  integrating multiple open source projects, as well as providing its own
  native functionality in many areas.  It includes by default the NumPy and
  SciPy packages.

**NumPy and SciPy**
  are Python libraries whose focus is high-performance numerical computing, and
  they are widely accepted as the foundation of most Python-based scientific
  computing projects.

**Enthought**
  is a scientific computing company that produces Python-based tools for many
  application-specific domains.  Enthought has a strong commitment to open
  source development: it provides support and hosting for Numpy, Scipy, and
  many other Python scientific projects and many of its tools_ are freely
  available.

The theme of the workshop is finding ways to best combine our strengths to
create something that is significantly better than anything ever done so far.

.. _Sage: http://sagemath.org
.. _Scipy: http://scipy.org
.. _`Enthought Inc.`: http://enthought.com
.. _tools: http://code.enthought.com


Location
========

The workshop will be held at the headquarters of `Enthought Inc.`_::

  Suite 2100
  515 Congress Ave.
  Austin, TX 78701
  (512) 536-1057, voice
  (512) 536-1059, fax

.. _`Enthought Inc.`: http://enthought.com


Costs and Funding
=================

We can accomodate a total of 30 attendees at Enthought's headquarters for the
meeting.  There is a $100 registration fee, which will be used to cover coffee,
snacks and lunches for all the days of the meeting, plus one group dinner
outing.  Attendees can use the wiki_ to coordinate room/car rental sharing if
they so desire.

Thanks to Enthought's generous offer of support, we'll be able to cover the
above costs for 15 attendees, in addition to offering them housing and
transportation.  Please note that housing will be provided at Enthought's
personal residences, so remember to bring your clean pajamas.

We are currently looking into the possibility of additional funding to cover
the registration fee for all attendees, and will update the wiki accordingly if
that becomes possible.

If you plan on coming please email Fernando.Perez@colorado.edu to let us know
of your intent so we can have a better idea of the total numbers.  Please
indicate if you could only come under the condition that you can be hosted.  We
will try to offer hosting to as many of the Sage and Scipy developers as
possible, but if you can fund your own expenses, this may open a slot for
someone with limited funds.  If the total attendance is below 15, we will offer
hosting to everyone.

We will close registration for those requesting hosting by Sunday, February
3, 2008.  If we actually fill up all 30 available slots we will announce it,
otherwise you are free to attend by letting us know anytime before the meeting,
though past Feb. 1 you will be required to pay the registration fee of $100.

.. _wiki: http://wiki.sagemath.org/days8


Contacts and further information
================================

For further information, you can either contact one of the following people (in
parenthesis we note the topic most likely to be relevant to them):

- William Stein (Sage): wstein@gmail.org

- Fernando Perez (Scipy): Fernando.Perez@colorado.edu

- Travis Oliphant (Enthought): oliphant@enthought.com

or you can go to our wiki_ for up to date details.



Preliminary agenda
==================

Friday 29: Talks
----------------

This is a rough cut of suggested topics, along with a few notes on possible
details that might be of interest.  The actual material in the talks will be up
to the presenters, of course.  Some of these topics might just become projects
to work on rather than actual talks, if we don't have a speaker available but
have interested parties who wish to focus on the problem.

Speakers are asked to include a slide of where they see any chances for better
collaboration between the various projects (to the best of their knowledge).
There will be a note-taker during the day who will try to keep tabs on this
information and will summarize it as starting material for the joint work panel
discussion to be held on Saturday (FPerez volunteers for this task if needed).

- Numpy internal architecture and type system.

- Sage internal type system, with emphasis on its number type system.

- A clarification of where the 'sage language' goes beyond python.  Things like
  ``A\b`` are valid in the CLI but not the notebook.  Scipy is pure python, so
  it would help the scipy team better understand the boundaries between the
  two.

- Special methods used by Sage (foo._magical_sage_method_)?  If some of these
  make sense, we might want to agree on common protocols for numpy/scipy/sage
  objects to honor.

- Sage usage of numpy, sage.matrix vs numpy.arrays.  Smoother integration of
  numpy arrays/sage matrices and vectors.

- Extended precision LAPACK.  Integration in numpy/sage. The extended precision
  work LAPACK work was done by Y. Hida and J. Demmel at UC Berkeley.

- Distributed/Parallel computing: DSage, ipython, Brian Granger's work on
  Global arrays for NASA...

- Scikits: these are 'toolkits' that use numpy/scipy and can contain GPL code
  (details of how these will work are being firmed up in the scipy lists, and
  will be settled by the workshop). Perhaps some of SAGE's library wrappers
  (like GMP, MPFR or GSL) could become scikits?
  
- Cython: status (inclusion in py2.6?), overview, opportunities for better
  numpy integration and usage.

- Enthought technologies: Traits, TVTK, Mayavi, Chaco, Envisage.

- User interface collaboration: 'sage-lite'/pylab/ipython code sharing
  possibilities?
  

Saturday 1: More talks/code planning/coding
-------------------------------------------

9-11 am: Any remaining talks that didn't fit on Friday.  Only if needed.

11-12: panel for specific coding projects and ideas, spill over into lunch
time.

12-1: lunch.

Rest of day: start coding!  Organize in teams according to the plans made
earlier and code away...

Sunday 2: Coding
----------------

Work on projects decided above.

5-6pm: brief (5-10 minutes) status updates from coding teams.  Problems
encountered, progress, suggestions for adjustment.

Monday 3: Coding
----------------

Same as Sunday.

Tuesday 4: Wrapup
-----------------

9-11 am: Wrapup sessions with summary from coding projects.

11-12 am: Panel discussion on future joint work options.

Afternoon: anyone left around can continue to code!

}}}
