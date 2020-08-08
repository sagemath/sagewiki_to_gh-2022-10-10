= Sage 9.2 Release Tour =

in progress (2020)

<<TableOfContents>>

== Python 3 transition ==

[[ReleaseTours/sage-9.0|SageMath 9.0]] was the first version of Sage running on Python 3 by default. [[ReleaseTours/sage-9.1|SageMath 9.1]] continues to support Python 2.  

'''Sage 9.2 will remove support for Python 2.'''

 * [[https://trac.sagemath.org/query?keywords=~python3&milestone=sage-9.2&or&component=python3&milestone=sage-9.2&or&keywords=~py3&milestone=sage-9.2&groupdesc=1&group=status&max=1500&col=id&col=summary&col=keywords&col=component&col=time&col=changetime&col=author&col=reviewer&order=component|Trac tickets with keyword/component python3 in milestone 9.2]]

See [[Python3-Switch]] for more details


=== Unicode identifiers ===

https://trac.sagemath.org/ticket/30111


=== Support for system Python 3.6 added ===

== Package upgrades ==

The removal of support for Python 2 will enable major package upgrades.

[[https://trac.sagemath.org/ticket/29141|Meta-ticket #29141: Upgrades and other changes that require dropping py2 support]]

Major user-visible package upgrades below...

=== matplotlib === 

2.2.5 -> 3.2.1

=== rpy2 ===

2.8.2 -> 3.3.5

=== sphinx ===

1.8.5 -> 3.1.2

=== ipython ===

5.8.0 -> 7.13.0


== Deprecating, removing components ==



== Configuration and build changes ==

 * [[https://groups.google.com/d/msg/sage-devel/9gOkmF6rSjY/wEV4WBQABwAJ|sage-devel: require "./configure" before "make"]], [[https://trac.sagemath.org/ticket/29316|Trac #29316]]

=== For developers ===

 * [[https://trac.sagemath.org/ticket/29701|Trac #29701: Replace use of "module_list" and "OptionalExtension" by extending "find_python_sources"]]

== Tickets ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.2&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.2]]

== Cleaning ==

 * [[https://trac.sagemath.org/ticket/29636|Trac #29636: Delete changelog sections from all SPKG information files]]; they were deprecated in favor of using Trac years ago. The contributions of Sage developers maintaining SPKGs are documented by our [[http://www.sagemath.org/changelogs/index.html|historical changelogs]].


== Availability of Sage 9.2 and installation help ==

Sage 9.2 has not been released yet.  See [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.


 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions.
