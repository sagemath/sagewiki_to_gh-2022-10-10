##master-page:HelpTemplate
##master-date:Unknown-Date
#format wiki
#language en

= Welcome to Sage =
== The open-source alternative to Magma, Maple, Mathematica, and MATLAB! ==

Sage is a Python-based framework which provides a unified environment for [[http://sagemath.org/links-components.html|nearly 100 open-source packages]] related to mathematics research and education.  In addition to a consistent interface to these packages, Sage also provides new functionality built by letting these various packages ''work together''.  We're building the car, not reinventing the wheel.
 
There are hundreds of Sage developers [[http://sagemath.org/development-map.html|around the world]].  Most of these are mathematicians who use Sage for research and education.  As the project grows, we have greater and greater need for contributions from serious programmers.  We've compiled a few suggestions to whet your appetite here; further details and more ideas can be found at the links below, or by contacting the Sage [[http://groups.google.com/group/sage-devel|developer list]].

== Suggestions for developers with programming background ==

=== Package Interfaces ===

 * Improve the [[http://www.sagemath.org/doc/reference/sage/plot/plot.html|matplotlib interface]], and related graphics issues. Converting between matplotlib Figures and sage `GraphicsObjects`, for example, is currently not possible.  Converting 3D plots to 2D `GraphicsObjects` is not possible.  There are a lot of other broken or undocumented things here too.

 * Improve the [[http://www.sagemath.org/doc/reference/sage/interfaces/gap.html|gap interface]].  In particular, convert gap's iterators to native Sage objects

 * Improve other interfaces -- email the developer list for further suggestions.

=== Doctesting/building ===

 * Add functionality to build the Sage [[http://www.sagemath.org/doc/reference/index.html|reference manual]] in parallel, or to easily build a subset of the manual.  Some familiarity with Python docbuilding and Sphinx will be required here.

 * Add more [[http://www.sagemath.org/doc/developer/conventions.html#automated-testing|automated testing]] of the Sage library, through randomized tests, and improvements to the [[buildbot|Patch Buildbot]].


=== Algorithms ===

 * Algorithms for fast computation that you may have seen in a computer science book are not just of theoretical interest here -- they're central to Sage's mission!  Before you start work on one of these, be sure that it doesn't already exist in one of Sage's components.  If it does, work on improving the interface with that component rather than reimplementing the algorithm.

=== Sage startup and usage ===

 * Sage does ''a lot'' at startup, related to the startup of its many components.  Good ideas for improving the startup time are needed.

 * Rework sage build scripts, so that everything is built "in place", maybe using setuptools, and thus achieve significant size reduction of sage build.  Some ideas are discussed in [[http://groups.google.com/group/sage-devel/browse_thread/thread/7d911e59a649eaf6/b90132bf3aefcd1f|this thread]].

 * There are a number of startup options for building, testing, etc.  These have evolved in a somewhat disorganized manner over time, and need to be better unified, organized, and documented.  Some specific ideas are mentioned in comments to this [[http://trac.sagemath.org/sage_trac/ticket/10326#comment:9|related ticket]]

=== Cygwin Port ===

Currently Sage runs on Windows only as a virtual machine, through the VMware Player.  This is viewed by many as a major barrier to new users, and work is ongoing to produce a [[http://www.cygwin.com/|Cygwin]] port.  Here is a list of the [[http://trac.sagemath.org/sage_trac/wiki/CygwinPort|remaining tickets]] for this issue.  Some of these require a lot of work, but some are simple, and several are simple for someone with a Windows programming background.


== Further information ==

To learn about the Sage program, these links will give you a good overview:

 * [[http://www.sagemath.org/|Sage (main page)]]
 * [[http://www.sagemath.org/tour.html|Sage Tour]]
 * [[http://en.wikipedia.org/wiki/Sage_(mathematics_software)|Sage (Wikipedia)]]
 * [[http://www.sagemath.org/library-stories.html|Sage Testimonials]]
 * [[http://www.sagemath.org/library-why.html|Why Sage?]]

If you are interested in development, the following links will help:

 * [[http://www.sagemath.org/doc/faq/faq-contribute.html|FAQ: Contributing to Sage]]
 * [[http://www.sagemath.org/development.html|Info for Developers]]
 * [[http://groups.google.com/group/sage-devel|Sage Developer Mailing List]]

== Mentoring ==

The Sage community is interested in mentoring new developers.  If you have specific questions, go ahead and ask the developer mailing list.  If you're excited about the project but aren't sure where to start, send a brief description of your background and interests and someone with related experience will volunteer to mentor you!  You can do this either on the mailing list, or at the Sage support Q&A site [[http://ask.sagemath.org/questions/|Ask Sage]].
