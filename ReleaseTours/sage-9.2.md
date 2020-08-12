= Sage 9.2 Release Tour =

in progress (2020)

<<TableOfContents>>

== Python 3 transition ==

[[ReleaseTours/sage-9.0|SageMath 9.0]] was the first version of Sage running on Python 3 by default. [[ReleaseTours/sage-9.1|SageMath 9.1]] continues to support Python 2.  

'''Sage 9.2 removes support for Python 2.'''

 * [[https://trac.sagemath.org/query?keywords=~python3&milestone=sage-9.2&or&component=python3&milestone=sage-9.2&or&keywords=~py3&milestone=sage-9.2&groupdesc=1&group=status&max=1500&col=id&col=summary&col=keywords&col=component&col=time&col=changetime&col=author&col=reviewer&order=component|Trac tickets with keyword/component python3 in milestone 9.2]]

See [[Python3-Switch]] for more details

=== Support for system Python 3.6 added ===

This allows Sage to use the system Python on some older Linux distributions that are still in widespread use in scientific computing, including `centos-8` and `fedora-{26,27,28}` (although Python 3.7.x packages are also available for these). See [[https://trac.sagemath.org/ticket/29033|#29033]] for more details.

=== Unicode identifiers ===

Python 3 made much improved support for Unicode available, and Sage 9.2 has merged several Unicode improvements. Note that Python does not allow ''arbitrary'' Unicode characters in identifiers but only [[https://docs.python.org/3/reference/lexical_analysis.html#identifiers|word constituents]]. So before you get excited about using emojis... note that they cannot be used:
{{{
sage: K.<🍎,🥝> = QQ[]
SyntaxError: invalid character in identifier
}}}
However, we can use letters from various alphabets:
{{{
sage: μ, ν, ξ = 1, 2, 3
sage: SR('λ + 2λ')
3*λ
sage: var('α', domain='real')
α
sage: Ш = EllipticCurve('389a').sha(); Ш
Tate-Shafarevich group for the Elliptic Curve defined by y^2 + y = x^3 + x^2 - 2*x over Rational Field
sage: ГельфандЦетлинPattern = GelʹfandT͡setlinPattern = GelfandTsetlinPattern 
sage: ГельфандЦетлинPattern([[3, 2, 1], [2, 1], [1]]).pp()
  3     2     1
     2     1
        1
sage: 四次方(x) = x^4
sage: 四次方(3)
81
}}}
We can use math accents:
{{{
sage: a = 1
sage: â = 2
sage: ā = 3
sage: a, â, ā
(1, 2, 3)
}}}
But note that Python normalizes identifiers, so the following are not distinguished:
{{{
sage: Q = 42
sage: ℚ
42
sage: F = 1
sage: 𝐹, 𝐅, 𝓕, 𝔽, 𝕱, 𝗙, 𝘍, 𝙁, 𝙵
(1, 1, 1, 1, 1, 1, 1, 1, 1)
}}}
See [[https://trac.sagemath.org/ticket/30111|Meta-ticket #30111: Unicode support]] for more information.

== Package upgrades ==

The removal of support for Python 2 will enable major package upgrades.

[[https://trac.sagemath.org/ticket/29141|Meta-ticket #29141: Upgrades and other changes that require dropping py2 support]]

Major user-visible package upgrades below...

=== matplotlib ===

Dropping Python 2 support allowed us to make a major jump from matplotlib 2.2.5 to 3.2.1. See matplotlib's [[https://matplotlib.org/3.3.0/users/prev_whats_new/whats_new_3.0.html|release notes for 3.0]], [[https://matplotlib.org/3.3.0/users/prev_whats_new/whats_new_3.1.0.html|3.1]], [[https://matplotlib.org/3.3.0/users/prev_whats_new/whats_new_3.2.0.html|3.2]].
In addition to improved output, this update will likely enable Sage developers to implement new features for plotting and graphics.

=== rpy2 and R ===

The [[https://pypi.org/project/rpy2/|rpy2 Python package]] is the foundation for [[https://doc.sagemath.org/html/en/reference/interfaces/sage/interfaces/r.html|SageMath's interface]] to [[https://www.r-project.org/|R]]. Dropping Python 2 support allowed us to make the major upgrade from 2.8.2 to 3.3.5 in [[https://trac.sagemath.org/ticket/29441|Trac #29441]]; see the [[https://rpy2.github.io/doc/latest/html/changes.html#release-3-3-1|release notes]] for details.

We only did a minor upgrade of R itself in the Sage distribution, to 3.6.3, the latest in the 3.6.x series. Of course, if R 4.0.x is installed in the system, Sage will use it instead of building its own copy.

The SageMath developers are eager to learn from users how they use the SageMath-R interface, and what needs to be added to it to become more powerful.  Let us know at [[https://groups.google.com/d/msg/sage-devel|sage-devel]].

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

 * Obtaining incidence matrix and combinatorial polyhedron is much faster for integer and rational polyhedra [[https://trac.sagemath.org/ticket/29837|29837]], [[https://trac.sagemath.org/ticket/29841|29841]]

 * The testing framework using TestSuites is getting improved. 
   See the Task [[https://trac.sagemath.org/ticket/29842|29842: Meta-ticket: Run a more stable test suite on polyhedra]]

There are also some bug fixes and other improvements. For more details see the [[https://trac.sagemath.org/wiki/SagePolyhedralGeometry#release_9.2|release notes for optimization and polyhedral geometry software interactions in Sage]].

== Deprecating, removing components ==


== Configuration and build changes ==

Sage 9.1 introduced [[https://wiki.sagemath.org/ReleaseTours/sage-9.1#Portability_improvements.2C_increased_use_of_system_packages|informational messages at the end of a ./configure run]] regarding system packages.  To make sure that these messages are not overlooked, Sage 9.2 no longer invokes `./configure` when you type `make` in an unconfigured source tree. See [[https://groups.google.com/d/msg/sage-devel/9gOkmF6rSjY/wEV4WBQABwAJ|sage-devel: require "./configure" before "make"]], [[https://trac.sagemath.org/ticket/29316|Trac #29316]].


=== For developers ===

Let's talk about `src/setup.py`. The build system of the Sage library is based on `distutils` (not `setuptools`); it is implemented in the package `sage_setup`.
In particular, it implements its own version of source code discovery methods similar to [[https://setuptools.readthedocs.io/en/latest/setuptools.html#using-find-packages|setuptools.find_packages]]: `sage_setup.find.find_python_sources`. Because of source discovery, developers can add new Python modules and packages under `src/sage/` simply by creating files and directories; it is not necessary to edit `setup.py`.

Prior to Sage 9.2, the situation was different for Cython extensions. They had to be listed in `src/module_list.py`, either one by one, or using glob patterns such as `*` and `**`.
Sage 9.2 has eliminated the need for `src/module_list.py` by extending `sage_setup.find.find_python_sources`; it now also finds Cython modules in the source tree (Trac [[https://trac.sagemath.org/ticket/29701|#29701]]).

Some Cython modules need specific compiler and linker flags. Sage 9.2 has moved all of these flags from `Extension` options in `src/module_list.py` to `distutils:` directives in the individual `.pyx` source files, see [[https://trac.sagemath.org/ticket/29706|Trac #29706]] and [[https://cython.readthedocs.io/en/latest/src/userguide/source_files_and_compilation.html#compiler-directives|Cython documentation]].

Sage 9.2 has also changed the mechanism for conditionalizing a Cython extension module on the presence of a Sage package.  Consider the module [[https://git.sagemath.org/sage.git/tree/src/sage/graphs/graph_decompositions/tdlib.pyx?id=55c3fbc565fd7884f3df9555de83dd326ace276e|sage.graphs.graph_decompositions.tdlib]] as an example. Prior to Sage 9.2, this module was declared as an `OptionalExtension`, conditional on the SPKG `tdlib`, in `src/module_list.py`. The new mechanism is as follows. [[https://git.sagemath.org/sage.git/tree/src/setup.py?id=55c3fbc565fd7884f3df9555de83dd326ace276e#n53|src/setup.py]] maps the SPKG name `tdlib` to the "distribution name" `sage-tdlib`. At the top of the Cython source file [[https://git.sagemath.org/sage.git/tree/src/sage/graphs/graph_decompositions/tdlib.pyx?id=55c3fbc565fd7884f3df9555de83dd326ace276e|src/sage/graphs/graph_decompositions/tdlib.pyx]], there is a new directive `sage_setup: distribution = sage-tdlib`. Now the source discovery in [[https://git.sagemath.org/sage.git/tree/src/sage_setup/find.py?id=55c3fbc565fd7884f3df9555de83dd326ace276e#n61|sage_setup.find.find_python_sources]] includes this Cython module only if the SPKG `tdlib` is installed and current.


== Tickets ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.2&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.2]]

== Cleaning ==

 * [[https://trac.sagemath.org/ticket/29636|Trac #29636: Delete changelog sections from all SPKG information files]]; they were deprecated in favor of using Trac years ago. The contributions of Sage developers maintaining SPKGs are documented by our [[http://www.sagemath.org/changelogs/index.html|historical changelogs]].


== Availability of Sage 9.2 and installation help ==

Sage 9.2 has not been released yet.  See [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.


 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions.
