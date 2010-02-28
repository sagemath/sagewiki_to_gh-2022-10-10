= Google Summer of Code 2010 =

== Important Dates ==
Here is the [[http://socghop.appspot.com/document/show/gsoc_program/google/gsoc2010/timeline|original timeline]]. Some highlights:
 * *March 8 - 12:* application window
 * *March 18:* accepted mentoring organizations announced
 * *March 29 - April 9:* student application window
 * ...

== GSoC Sage Projects ==

All #numbers below refer to [[http://trac.sagemath.org|trac tickets]]. Make sure to read the [[gsoc10#notes|notes section]] before you edit the list of projects below.


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

=== Community Tools ===
 * Enhance publishing of Notebook documents (i.e. like on [[http://www.sagenb.org/pub]]).
   * Wiki-like platform for editing notebooks for publishing mathematical, physical, statistical and other content. 
   * tagging support, listings by tags
   * efficiently exchange usage examples, tips and ideas.

=== Interfaces to Sage ===

Make it easier to call Sage from other applications. 

 * Sage as a C library
 * libGAP

=== pynac ===
 
 * optimization / better data structures (heaps?)

=== Development Process ===

 * automated doctesting for tickets marked "needs review"
 * ...

=== Others ===

Here are some other task lists:

 * [[devel/SageTasks]]
 * [[symbolics]]
 * PolyhedraWishList

== Potential Mentors ==
 * Burcin Erocal
 * William Stein

== Notes: ==
<<Anchor(notes)>>

We should take care to define deliverables for the items below. These should be doable with less than 3 months of work.

Here is what the FAQ says for "Ideas" lists:

  An "Ideas" list should be a list of suggested student projects. This list is meant to introduce contributors to your project's needs and to provide inspiration to would-be student applicants. It is useful to classify each idea as specifically as possible, e.g. "must know Python" or "easier project; good for a student with more limited experience with C++." If your organization plans to provide an application template, you should include it on your Ideas list.

 Keep in mind that your Ideas list should be a starting point for student applications; we've heard from past mentoring organization participants that some of their best student projects are those that greatly expanded on a proposed idea or were blue-sky proposals not mentioned on the Ideas list at all. 


And this is from the [[http://groups.google.com/group/google-summer-of-code-announce/web/notes-on-organization-selection-criteria|notes on organization selection criteria]]:

 2) Do the projects on your ideas list look feasible for student developers?  Is your ideas list thorough and well-organized?  Your ideas list is the first place that student participants are going to look to get information on participating in GSoC, so putting a lot of effort into this list is a good thing(tm).  One thing we noticed and really appreciate is how some organizations classified their ideas by easy, medium and difficult, and specifically listed the skills and background required to complete a given task.  It might also be cool to expand on each idea with some places to get started research-wise (pointers to documentation or specific bugs), as well as the impact finishing a given idea will have for the organization.
