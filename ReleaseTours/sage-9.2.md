= Sage 9.2 Release Tour =

in planning (2020)

<<TableOfContents>>

== Python 3 transition ==

SageMath 9.0 was the first version of Sage running on Python 3 by default. Sage 9.1 continues to support Python 2.  

'''Sage 9.2 will remove support for Python 2.'''

See [[Python3-Switch]] for more details

== Package upgrades ==

The removal of support for Python 2 will enable major package upgrades.

[[https://trac.sagemath.org/ticket/29141|Meta-ticket #29141: Upgrades and other changes that require dropping py2 support]]

== Deprecating, removing components ==

 * [[https://groups.google.com/d/msg/sage-devel/dg9qDUVU3qs/e-WptfUjBQAJ|Deprecate all of sage.finance, sage.media, sage.stats]], [[https://trac.sagemath.org/ticket/29662|Trac #29662]], [[https://trac.sagemath.org/ticket/29663|Trac #29663]]

== Configuration and build changes ==

 * [[https://groups.google.com/d/msg/sage-devel/9gOkmF6rSjY/wEV4WBQABwAJ|sage-devel: require "./configure" before "make"]], [[https://trac.sagemath.org/ticket/29316|Trac #29316]]

== Tickets ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.2&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.2]]

== Cleaning ==

 * [[https://trac.sagemath.org/ticket/29636|Trac #29636: Delete changelog sections from all SPKG information files]]; they were deprecated in favor of using Trac years ago. The contributions of Sage developers maintaining SPKGs are documented by our [[http://www.sagemath.org/changelogs/index.html|historical changelogs]].


== Availability of Sage 9.2 and installation help ==

The Sage 9.2 series has not been started yet.  

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions.
