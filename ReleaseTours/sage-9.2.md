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

== Polyhedral geometry ==

=== New features ===
It is now possible to choose which backend to use to compute regions of hyperplane arrangements
[[https://trac.sagemath.org/ticket/29506|29506]]:
{{{
sage: R.<sqrt5> = QuadraticField(5)
sage: H = HyperplaneArrangements(R, names='xyz')
sage: x,y,z = H.gens()
sage: A = H(sqrt5*x+2*y+3*z, backend='normaliz')
sage: A.backend()
'normaliz'
sage: A.regions()[0].backend()  # optional - pynormaliz
'normaliz'
}}} 

It is now possible to compute the slack matrix of a polyhedron [[https://trac.sagemath.org/ticket/29838|29838]]:

{{{
sage: P = polytopes.cube(intervals='zero_one')
sage: P.slack_matrix()
[0 1 1 1 0 0]
[0 0 1 1 0 1]
[0 0 0 1 1 1]
[0 1 0 1 1 0]
[1 1 0 0 1 0]
[1 1 1 0 0 0]
[1 0 1 0 0 1]
[1 0 0 0 1 1]
}}}

=== Implementation improvements ===

 * It is now possible to set up polyhedra with both Vrep and Hrep in the following constructions:

   * Linear transformation [[https://trac.sagemath.org/ticket/29843|29843]]
   * Polar [[https://trac.sagemath.org/ticket/29569|29569]]
   * Product [[https://trac.sagemath.org/ticket/29583|29583]]

 * The generation of regions of hyperplane arrangement has been improved [[https://trac.sagemath.org/ticket/29661|29661]]

 * Ehrhart related functions are now cached [[https://trac.sagemath.org/ticket/29196|29196]]

 * The testing framework using TestSuites is getting improved. 
   See the Task [[https://trac.sagemath.org/ticket/29842|29842: Meta-ticket: Run a more stable test suite on polyhedra]]

There are also some bug fixes and other improvements. For more details see the [[https://trac.sagemath.org/wiki/SagePolyhedralGeometry#release_9.2|release notes for optimization and polyhedral geometry software interactions in Sage]].

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
