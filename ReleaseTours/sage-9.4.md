= Sage 9.4 Release Tour =

current development cycle (2021)

<<TableOfContents>>

== Goals and tickets ==

 * Add support for Python 3.10

 * Add support for gcc 11

 * Add support for macOS Big Sur that does not depend on homebrew's gcc@10

 * packages upgrades 
   - https://repology.org/projects/?inrepo=sagemath_develop
   - many upgrades enabled by dropping support for Python 3.6

 * Drop support for optional packages with system gcc 4.x

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.4&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.4]]

== Configuration changes ==

 * Drop support for system Python 3.6 (deprecated in Sage 9.3). [[https://trac.sagemath.org/ticket/30551|#30551]]
  It is still possible to build the Sage distribution on systems with old Python versions, but Sage will build its own copy of Python 3.9.x in this case.


== Availability of Sage 9.4 and installation help ==

The first beta of the 9.4 series, 9.4.beta0, was tagged on 2021-05-26.

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions and [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.
