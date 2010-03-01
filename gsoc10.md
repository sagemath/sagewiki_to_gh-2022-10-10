= Google Summer of Code 2010 =

This is the main organization page for the [[http://socghop.appspot.com/|Google Summer of Code]] efforts of the [[http://www.sagemath.org|Sage]] project.

'''If you're a student''' interested in working on any of the [[#projects|projects]] described below, or if you want to suggest any other projects, please write a short message to [[http://groups.google.com/group/sage-devel|sage-devel@googlegroups.com]] introducing yourself (background, skills) and your interests.

'''If you're a Sage developer''', please take some time to organize the list below and add more ideas. The [[gsoc10#notes|notes section]] contains some guidelines from the [[http://socghop.appspot.com/document/show/gsoc_program/google/gsoc2010/faqs|GSOC FAQ]].

== Important Dates ==
Here is the [[http://socghop.appspot.com/document/show/gsoc_program/google/gsoc2010/timeline|original timeline]]. Some highlights:
 * '''March 8 - 12:''' application window
 * '''March 18:''' accepted mentoring organizations announced
 * '''March 29 - April 9:''' student application window
 * ...

== GSoC Sage Projects ==
<<Anchor(projects)>>
All #numbers below refer to [[http://trac.sagemath.org|trac tickets]]. 


=== Notebook ===

The Sage notebook is an AJAX application similar to Google Documents that provides
functionality for all mathematical software somewhat like Mathematica notebooks. 
It was written from scratch (in Javascript and Python) by the Sage development team,
and has been used daily by thousands of people over the last year.  It's one of the
main ''killer features'' of Sage.  This project is about improving the notebook.
No special mathematical knowledge is required.  Knowledge of Javascript, jQuery, Python,
and general AJAX techniques is needed. 

 * Authentication backend (ldap, kerberos?)
 * Improvements to interact
 * Add support for making presentations
 * Enhance export capabilities create methods for well designed PDF, LaTeX (with or without SageTeX) or ODF output.
 * master-notebook, collection of other notebooks for a script or book.
 * Permanent hyperlinks between worksheets, independent of worksheet numbering, to support multi-worksheet documents (ie books)
 * enhance history and snapshot capabilities.
 * concurrent editing of one single document: only altered cells are updated and "collision" warnings issued if more than one change happens with appropriate methods to solve it
 * read/write permission management for groups with roles (teacher is able to read notebooks, but students are not able to read each others)
 * ...

==== Internationalization of the notebook ====

This project would involve changing the Sage notebook so that the user
interface language can be translated and changed on the fly. This
project will require knowledge of Python, Mercurial, and basic web
coding; knowing the [[http://www.gnu.org/software/gettext/manual/gettext.html|GNU gettext]] utilities, Javascript, and the Jinja
web templating system will be helpful. No knowledge of (human!)
languages other than English is necessary.

Currently, the user interface for the Sage notebook is all in English.
Several one-off translations have been done
([[http://math1.skku.ac.kr/|Korean]];
[[http://groups.google.com/group/sage-devel/browse_thread/thread/3c583014d2132cc4/|Russian]])
involved going through source code and translating each string
individually. The goal of the Sage project is to produce a viable
alternative to Maple, Mathematica, Magma, and Matlab; having the user
interface available in non-English languages would have a tremendous
impact on that goal and vastly increase the number of people who can
benefit from Sage.

Proper internationalization ([[http://en.wikipedia.org/wiki/Internationalization_and_localization|i18n]]) involves wrapping
each string in a function that looks up the correct translation,
depending on the current language selected. 

Deliverables for this project would include:

    * wrapping strings in the Python, Javascript, and templating code of the Sage notebook with appropriate translation calls;

    * updating the Sage notebook so that the language can be set to a default language (so that, say, a French site could have everything default to French) and can be changed on a per-user basis (so each user can choose a preferred language);

    * developing a workflow for adding new translations and updating existing translations when strings change.

It would also be nice to work on support for more significant
localization, perhaps using the [[http://babel.edgewall.org/|Python Babel tools]]; this would include more thorough localization
abilities, such as proper pluralization, thousands/decimal separators, ordinals,
date and time display, and so on.

This project will not involve any actual translation, just making it
''possible'' for the Sage notebook UI to be localized. This is probably a medium-difficulty project, and will not require any specialized knowledge of mathematics or mathematical programming. 

=== Community Tools ===
 * Enhance publishing of Notebook documents (i.e. like on [[http://www.sagenb.org/pub]]).
   * Wiki-like platform for editing notebooks for publishing mathematical, physical, statistical and other content. 
   * tagging support, listings by tags
   * efficiently exchange usage examples, tips and ideas.

=== Interfaces to Sage ===

Make it easier to call Sage from other applications. 

 * Sage as a C library
 * libGAP


=== Portable C99 libm ===

Sage relies on a fairly complete C99 libm.  In particular, it expects the "long double" and "complex" variants of most functions to be present.  Not all these functions are present on Cygwin, FreeBSD or older Solaris, causing porting problems on those platforms.  The objective of this task would be to either locate and port or write a libm that is sufficient to meet Sage's requirements.

One possible option would be to use glibc and only compile the libm bits.  (Thought glibc is a bit dodgy on the precision side in some areas).

=== pynac (optimizing data structures) ===

As the symbolics backend, [[http://pynac.sagemath.org|Pynac]] is a fundamental component of Sage.
With some work and optimization, it could also be used for arithmetic
with other mathematical structures like generic polynomial rings. It's
based on a solid library [[http://www.ginac.de|GiNaC]], which has [[http://www.ginac.de/tutorial/|great documentation]]
and very readable code.

'''Skills:''' C++, (the necessary Cython and Python can be picked up easily)

This project would have two steps, the first would be a major optimization for Pynac also a good introduction to the library, coding conventions, type hierarchy, etc. The second would involve replacing the basic datatypes (vectors with heaps), lot's of timings and experiments to improve performance.

 * allow different printing orders

   GiNaC uses the Maple approach to printing symbolic expressions.
   Variable orders depend on their creation order at runtime. This is
   not acceptable for Sage, so we (=Burcin) added some code to do an approximation
   to a graded lexicographic order. This is the wrong design, and it slowed things
   down considerably.

   Doing it the right way, and allowing different orders would also let
   us use Pynac for other structures in Sage.

 * consider heaps instead of vectors for storage of add and mul objects

   Data structures for polynomials is a well studied topic. Geobuckets (used by [[http://www.singular.uni-kl.de/|Singular]], or hash tables have been used successfully until now. Recently heaps, based on work by Stephen Johnson in the 70s, were shown to perform much better than the alternatives.

   Pynac uses vectors to keep `add` and `mul` objects. Here is a [[http://www.ginac.de/tutorial/Internal-representation-of-products-and-sums.html|detailed explanation]] of the data structure. Using heaps could lead to a much more efficient data structure allowing us to handle much larger expressions. This would mean a major restructuring of the basic data types in Pynac.
   
   * (Geobuckets) http://dx.doi.org/10.1006/jsco.1997.0176
   * (Johnson's paper) http://doi.acm.org/10.1145/1086837.1086847
   * http://www.cecm.sfu.ca/~mmonagan/papers/sdmp19.pdf

=== Development Process ===

 * automated doctesting for tickets marked "needs review"
 * setting up a buildbot with trac integration for tickets with patches (list failing doctests, ...)
 * ...

=== Porting ===

 * Cygwin
 * FreeBSD
 * Solaris 10 64-bit (the 32-bit version is basically complete). 
 * Open Solaris on x64 hardware. 
 * Improvements to the build system?

=== Others ===

Here are some other task lists:

 * [[devel/SageTasks]]
 * [[symbolics]]
 * PolyhedraWishList

== Potential Mentors ==
 * DanDrake
 * Burcin Erocal
 * Peter Jeremy (FreeBSD port, possibly libm task)
 * William Stein

== Notes: ==
<<Anchor(notes)>>

We should take care to define deliverables for the items below. These should be doable with less than 3 months of work.

Here is what the FAQ says for "Ideas" lists:

  An "Ideas" list should be a list of suggested student projects. This list is meant to introduce contributors to your project's needs and to provide inspiration to would-be student applicants. It is useful to classify each idea as specifically as possible, e.g. "must know Python" or "easier project; good for a student with more limited experience with C++." If your organization plans to provide an application template, you should include it on your Ideas list.

 Keep in mind that your Ideas list should be a starting point for student applications; we've heard from past mentoring organization participants that some of their best student projects are those that greatly expanded on a proposed idea or were blue-sky proposals not mentioned on the Ideas list at all. 


And this is from the [[http://socghop.appspot.com/document/show/program/google/gsoc2009/orgcriteria|notes on organization selection criteria]]:

 2) Do the projects on your ideas list look feasible for student developers?  Is your ideas list thorough and well-organized?  Your ideas list is the first place that student participants are going to look to get information on participating in GSoC, so putting a lot of effort into this list is a good thing(tm).  One thing we noticed and really appreciate is how some organizations classified their ideas by easy, medium and difficult, and specifically listed the skills and background required to complete a given task.  It might also be cool to expand on each idea with some places to get started research-wise (pointers to documentation or specific bugs), as well as the impact finishing a given idea will have for the organization.
