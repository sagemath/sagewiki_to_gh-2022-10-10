= Sage 9.2 Release Tour =

in progress (2020)

<<TableOfContents>>

== Python 3 transition completed ==

[[ReleaseTours/sage-9.0|SageMath 9.0]] was the first version of Sage running on Python 3 by default. [[ReleaseTours/sage-9.1|SageMath 9.1]] continued to support Python 2.  

'''Sage 9.2 has removed support for Python 2.'''

 * [[https://trac.sagemath.org/query?keywords=~python3&milestone=sage-9.2&or&component=python3&milestone=sage-9.2&or&keywords=~py3&milestone=sage-9.2&groupdesc=1&group=status&max=1500&col=id&col=summary&col=keywords&col=component&col=time&col=changetime&col=author&col=reviewer&order=component|Trac tickets with keyword/component python3 in milestone 9.2]]

See [[Python3-Switch]] for more details

=== Support for system Python 3.6 added ===

This allows Sage to use the system Python on some older Linux distributions that are still in widespread use in scientific computing, including `centos-8` and `fedora-{26,27,28}` (although Python 3.7.x packages are also available for these). See [[https://trac.sagemath.org/ticket/29033|#29033]] for more details.

=== Unicode identifiers ===

Python 3 made much improved support for Unicode available, and Sage 9.2 has merged several Unicode improvements. Note that Python does not allow ''arbitrary'' Unicode characters in identifiers but only [[https://docs.python.org/3/reference/lexical_analysis.html#identifiers|word constituents]]. So before you get excited about using emojis... note that they cannot be used:
{{{
#!python
sage: K.<🍎,🥝> = QQ[]
SyntaxError: invalid character in identifier
}}}
However, we can use letters from various alphabets.  The updated IPython allows us to type them using [[https://ipython.readthedocs.io/en/stable/api/generated/IPython.core.completer.html|latex and unicode tab completion]]:
{{{
#!python
sage: μ, ν, ξ = 1, 2, 3       # type \mu<TAB>, 
                              #      \nu<TAB>, ...
sage: SR('λ + 2λ')
3*λ
sage: var('α', domain='real')
α
sage: Ш = EllipticCurve('389a').sha()   
                              # type \CYR<TAB> CAP<TAB>
                              #      LET<TAB> SHA<TAB><ENTER>
sage: Ш
Tate-Shafarevich group for the Elliptic Curve
defined by y^2 + y = x^3 + x^2 - 2*x over Rational Field
sage: GelʹfandT͡setlinPattern = GelfandTsetlinPattern
                              # type \MODIFIER LETTER 
                              #      PRIME<TAB><ENTER>
                              # for the romanized soft mark
sage: ГельфандЦетлинPattern = GelʹfandT͡setlinPattern
sage: ГельфандЦетлинPattern([[3, 2, 1], [2, 1], [1]]).pp()
  3     2     1
     2     1
        1
sage: 四次方(x) = x^4
sage: 四次方(3)
81
}}}
We can use math accents...
{{{
#!python
sage: a = 1
sage: â = 2                   # type a\hat<TAB><ENTER>
sage: ā = 3                   # type a\bar<TAB><ENTER>
sage: a, â, ā
(1, 2, 3)
sage: s(t) = t^3; s
t |--> t^3
sage: ṡ = diff(s, t); ṡ       # type s\dot<TAB><ENTER>                                                                                
t |--> 3*t^2
sage: s̈ = diff(ṡ, t); s̈       # type s\ddot<TAB><ENTER>                                                                                                   
t |--> 6*t
}}}
... and have fun with modifier letters:
{{{
#!python
sage: ℚ̄ = QQbar               # type \bbQ<TAB>\bar<TAB>
sage: %display unicode_art
sage: A = matrix(ℚ̄, [[1, 2*I], [3*I, 4]]); A
⎛  1 2*I⎞
⎝3*I   4⎠
sage: Aᵀ = A.transpose()      # type A\^T<TAB><ENTER>
sage: Aᵀ                                                                                                                     
⎛  1 3*I⎞
⎝2*I   4⎠
sage: Aᴴ = A.conjugate_transpose()
                              # type A\^H<TAB><ENTER>
sage: Aᴴ
⎛   1 -3*I⎞
⎝-2*I    4⎠
sage: C = Cone([[1, 1], [0, 1]])                                                                           
sage: Cᵒ = C.dual(); Cᵒ       # type C\^o<TAB><ENTER>
2-d cone in 2-d lattice M                                                                                        
}}}
But note that Python normalizes identifiers, so the following variants are ''not'' distinguished:
{{{
#!python
sage: AT == Aᵀ, AH == Aᴴ, Co == Cᵒ                                                                                                   
(True, True, True)
sage: ℚ = QQ                  # type \bbQ<TAB><ENTER>
sage: ℚ
Rational Field
sage: Q = 42
sage: ℚ
42
sage: F = 1
sage: 𝐹, 𝐅, 𝓕, 𝕱, 𝗙, 𝘍, 𝙁, 𝙵 # type \itF<TAB>, \bfF<TAB>,
                              #      \scrF<TAB>, \frakF<TAB>,
                              #      \sansF<TAB>, ...
(1, 1, 1, 1, 1, 1, 1, 1)
}}}
We have also added a few Unicode aliases for global constants and functions.
{{{
#!python
sage: π
pi
sage: _.n()
3.14159265358979
sage: Γ(5/2)                                                                                                                    
3/4*sqrt(pi)
sage: ζ(-1)
-1/12
}}}
See [[https://trac.sagemath.org/ticket/30111|Meta-ticket #30111: Unicode support]] for more information.

=== For developers: Using Python 3.6+ features in sagelib ===

[[https://trac.sagemath.org/ticket/29756|Meta-ticket #29756]] provides a starting point for a discussion of new features of the Python language and standard library to bring them to systematic use in sagelib.

== Package upgrades ==

The removal of support for Python 2 has enabled major package upgrades.

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

=== IPython and Jupyter notebook ===

Dropping support for Python 2 allowed us to upgrade IPython from 5.8.0 to 7.13.0 in [[https://trac.sagemath.org/ticket/28197|Trac #28197]]. See the [[https://ipython.readthedocs.io/en/stable/whatsnew/version6.html|release notes for the 6.x]] and [[https://ipython.readthedocs.io/en/stable/whatsnew/version7.html|7.x series]].

We have also upgraded the Jupyter notebook from 5.7.6 to 6.1.1 in [[https://trac.sagemath.org/ticket/26919|Trac #26919]]; see the [[https://jupyter-notebook.readthedocs.io/en/stable/changelog.html|notebook changelog]] for more information.

=== Other package updates ===

 * [[https://trac.sagemath.org/ticket/29141|Meta-ticket #29141: Upgrades and other changes that require dropping py2 support]]
 * [[https://trac.sagemath.org/query?summary=~update&milestone=sage-9.2&or&milestone=sage-9.2&summary=~upgrade&groupdesc=1&group=status&max=1500&col=id&col=summary&col=component&col=time&col=changetime&col=author&col=reviewer&col=keywords&order=component|Upgrade tickets, milestone 9.2]]

=== For developers: Upgrading packages ===

Upgrading Python packages in the Sage distribution from PyPI has again become easier, thanks to [[https://trac.sagemath.org/ticket/20104|Trac #20104]]. You can now do:
{{{
$ sage --package update-latest matplotlib
Updating matplotlib: 3.3.0 -> 3.3.1
Downloading tarball to ...matplotlib-3.3.1.tar.bz2
[......................................................................]
}}}
When you do this, please remember to check that the `checksums.ini` file has an `upstream_url` in the format
`upstream_url=https://pypi.io/packages/source/m/matplotlib/matplotlib-VERSION.tar.gz`. (This is not needed for `updated-latest` to work, but helps with automated tests of the upgrade ticket -- see [[https://wiki.sagemath.org/ReleaseTours/sage-9.1#For_developers-1|Sage 9.1 release tour]] on this topic.)

== Graphics ==

=== New features ===

 * Specify the rectangle in which to draw a matrix using the new `xrange` and `yrange` options of `matrix_plot`. For example, to draw a matrix in [0,1]×[0,1] instead of the default [-0.5,4.5]×[-0.5,4.5]: `matrix_plot(identity_matrix(5), xrange=(0, 1), yrange=(0, 1))`. [[https://trac.sagemath.org/ticket/27895|27895]] (Markus Wageringel)

 * Set the initial camera orientation in Three.js plots using the new `viewpoint` option. Pass it a list/tuple of the form `[[x,y,z],angle]`, such as that provided by the existing `Get Viewpoint` option accessible from the menu button in the lower-right corner of a Three.js plot. [[https://trac.sagemath.org/ticket/29192|29192]] (Paul Masson)

 * Save a 3D graphics object directly to an HTML file that uses the Three.js viewer, similar to how you would save a PNG image: `G.save('plot.html')`. [[https://trac.sagemath.org/ticket/29194|29194]] (Joshua Campbell)

 * Produce an interactive 3D animation that you can pan, rotate, and zoom while the animation is playing using the Three.js viewer. A slider and buttons for controlling playback are included on the page by default. To use this new feature construct an animation as you normally would, passing a list of still frames to the `animate` function, then call the `interactive` method. For example:
  {{{
#!python
def build_frame(t):
    """Build a single frame of animation at time t."""
    e = parametric_plot3d([sin(x-t), 0, x],
                          (x, 0, 2*pi), color='red')
    b = parametric_plot3d([0, -sin(x-t), x], 
                          (x, 0, 2*pi), color='green')
    return e + b

frames = [build_frame(t) 
          for t in (0, pi/32, pi/16, .., 2*pi)]
animate(frames, delay=5).interactive(
    projection='orthographic')
  }}}
  [[https://trac.sagemath.org/ticket/29194|29194]] (Joshua Campbell)

=== Implementation improvements ===

 * Points are now sampled exponentially when `scale='semilogx'` or `scale='loglog'` is specified. This decreases the number of points necessary for an accurate plot (and also increases the chance that the default number of points will produce an acceptable plot). [[https://trac.sagemath.org/ticket/29523|29523]] (Blair Mason)
 
 * Points and lines are now ignored in STL 3D export. [[https://trac.sagemath.org/ticket/29732|29732]] (Frédéric Chapoton)

 * Three.js has been upgraded to version r117. [[https://trac.sagemath.org/ticket/29809|29809]] (Paul Masson)

 * Long text is no longer clipped in Three.js plots. Multi-line text is not yet supported but is in the works. [[https://trac.sagemath.org/ticket/29758|29758]] (Joshua Campbell)
 
 * JSmol's telemetry functionality has been disabled. It will no longer phone home when, for example, using `viewer='jmol'` in a Jupyter notebook. [[https://trac.sagemath.org/ticket/30030|30030]] (Joshua Campbell)

=== For developers ===

 * Clarified that example Three.js plots in the documentation should use the `online=True` viewing option. [[https://trac.sagemath.org/ticket/30136|30136]] (Paul Masson)

== Polyhedral geometry ==

=== New features ===
It is now possible to choose which backend to use to compute regions of hyperplane arrangements
[[https://trac.sagemath.org/ticket/29506|29506]]:
{{{
#!python
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
#!python
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

It is now possible to apply an affine transformation on a polyhedron [[https://trac.sagemath.org/ticket/30327|30327]]:

{{{
#!python
sage: M = random_matrix(QQ,3,3) 
sage: v = vector(QQ,(1,2,3)) 
sage: F = AffineGroup(3, QQ) 
sage: f = F(M, v); f                                                                    
      [  0   0  -2]     [1]
x |-> [  0   1   0] x + [2]
      [ -1  -1 1/2]     [3]
sage: cube = polytopes.cube() 
sage: f * cube                                                            
A 3-dimensional polyhedron in QQ^3 defined as the convex hull of 8 vertices
sage: f(cube)                     # also works                                                        
A 3-dimensional polyhedron in QQ^3 defined as the convex hull of 8 vertices
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

== Combinatorics ==

=== Reduction from Dancing links to SAT or MILP ===

It is now possible to solve an instance of an [[https://en.wikipedia.org/wiki/Exact_cover|exact cover problem]] using a reduction from a dancing links instance to SAT [[https://trac.sagemath.org/ticket/29338|29338]] or MILP [[https://trac.sagemath.org/ticket/29955|29955]]:

{{{
#!python
sage: from sage.combinat.matrices.dancing_links import dlx_solver
sage: rows = [[0,1,2], [3,4,5], [0,1], [2,3,4,5], [0], [1,2,3,4,5]]
sage: d = dlx_solver(rows)
sage: d.one_solution()
[1, 0]
sage: d.one_solution_using_sat_solver('cryptominisat')
[2, 3]
sage: d.one_solution_using_sat_solver('glucose')
[2, 3]
sage: d.one_solution_using_sat_solver('glucose-syrup')
[2, 3]
sage: d.one_solution_using_sat_solver('picosat')
[4, 5]
sage: d.one_solution_using_milp_solver()
[0, 1]
sage: d.one_solution_using_milp_solver('Gurobi')
[0, 1]
}}}

=== Polyomino tilings ===

It is now possible to find a surrounding of a polyomino with copies of itself, see [[https://trac.sagemath.org/ticket/29160|29160]]. This is based on the dancing links solver in Sage. This is motivated by the [[https://en.wikipedia.org/wiki/Heesch%27s_problem|Heesch's problem]]. An example is below:

{{{
sage: from sage.combinat.tiling import Polyomino
sage: H = Polyomino([(-1, 1), (-1, 4), (-1, 7), (0, 0), (0, 1), (0, 2),
....: (0, 3), (0, 4), (0, 5), (0, 6), (0, 7), (0, 8), (1, 1), (1, 2),
....: (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (2, 0), (2, 2),
....: (2, 3), (2, 5), (2, 6), (2, 8)])
sage: H.show2d()
}}}

{{attachment:H.png}}

{{{
sage: %time solution = H.self_surrounding(10, ncpus=8)
CPU times: user 1.69 s, sys: 1.08 s, total: 2.77 s
Wall time: 3.85 s
sage: G = sum([p.show2d() for p in solution], Graphics())
sage: G
}}}


{{attachment:G.png}}


== Commutative algebra ==

=== Laurent polynomials ===

Rings of Laurent polynomials now support ideal creation and manipulation [[https://trac.sagemath.org/ticket/29512|29512]]:

{{{
sage: L.<x,y,z> = LaurentPolynomialRing(QQ, 3)                                                
sage: I = L.ideal([(x+y+z)^3+x*y, x^2+y^2+z^2])                                               
sage: I.groebner_basis()                                                                      
(y^4 + 4*x*y*z^2 + y^2*z^2 + 2*x*z^3 + 2*y*z^3 - z^4 + 3/2*x*y*z + 1/4*x*z^2 + 1/4*y*z^2 - 1/4*z^3 + 1/8*x*y,
 x*y^2 - y^3 + 3*x*y*z + x*z^2 - z^3 + 1/2*x*y,
 x^2 + y^2 + z^2)
sage: (x^3+y^3+z^3) in I                                                                      
False
sage: x + x^-1*y^2 + x^-1*z^2 in I                                                            
True
}}}

=== Motivic multiple zetas ===

The ring of motivic multiple zeta values has been implemented, using algorithms of Francis Brown. It allows to compute at least up to weight 12.

{{{
sage: Multizeta(1,2)**2                                                         
12*ζ(1,1,1,3) + 6*ζ(1,1,2,2) + 2*ζ(1,2,1,2)
sage: Multizeta(1,2)==Multizeta(3)                                              
True
sage: Multizeta(2,3,4).n(100)                                                   
0.0029375850405618494701189454256
}}}

== Configuration and build changes ==

Sage 9.1 introduced [[https://wiki.sagemath.org/ReleaseTours/sage-9.1#Portability_improvements.2C_increased_use_of_system_packages|informational messages at the end of a ./configure run]] regarding system packages.  To make sure that these messages are not overlooked, Sage 9.2 no longer invokes `./configure` when you type `make` in an unconfigured source tree. See [[https://groups.google.com/d/msg/sage-devel/9gOkmF6rSjY/wEV4WBQABwAJ|sage-devel: require "./configure" before "make"]], [[https://trac.sagemath.org/ticket/29316|Trac #29316]].

All standard Sage packages have been upgraded in Sage 9.2 so that they build correctly using gcc/gfortran 10.x. The Sage `./configure` script therefore now accepts these compiler versions.

=== For developers: Changes to the build system of sagelib ===

Let's talk about `src/setup.py`. The build system of the Sage library is based on `distutils` (not `setuptools`); it is implemented in the package `sage_setup`.
In particular, it implements its own version of source code discovery methods similar to [[https://setuptools.readthedocs.io/en/latest/setuptools.html#using-find-packages|setuptools.find_packages]]: `sage_setup.find.find_python_sources`. Because of source discovery, developers can add new Python modules and packages under `src/sage/` simply by creating files and directories; it is not necessary to edit `setup.py`.

Prior to Sage 9.2, the situation was different for Cython extensions. They had to be listed in `src/module_list.py`, either one by one, or using glob patterns such as `*` and `**`.
Sage 9.2 has eliminated the need for `src/module_list.py` by extending `sage_setup.find.find_python_sources`; it now also finds Cython modules in the source tree (Trac [[https://trac.sagemath.org/ticket/29701|#29701]]).

Some Cython modules need specific compiler and linker flags. Sage 9.2 has moved all of these flags from `Extension` options in `src/module_list.py` to `distutils:` directives in the individual `.pyx` source files, see [[https://trac.sagemath.org/ticket/29706|Trac #29706]] and [[https://cython.readthedocs.io/en/latest/src/userguide/source_files_and_compilation.html#compiler-directives|Cython documentation]].

Sage 9.2 has also changed the mechanism for conditionalizing a Cython extension module on the presence of a Sage package.  Consider the module [[https://git.sagemath.org/sage.git/tree/src/sage/graphs/graph_decompositions/tdlib.pyx?id=55c3fbc565fd7884f3df9555de83dd326ace276e|sage.graphs.graph_decompositions.tdlib]] as an example. Prior to Sage 9.2, this module was declared as an `OptionalExtension`, conditional on the SPKG `tdlib`, in `src/module_list.py`. The new mechanism is as follows. [[https://git.sagemath.org/sage.git/tree/src/setup.py?id=55c3fbc565fd7884f3df9555de83dd326ace276e#n53|src/setup.py]] maps the SPKG name `tdlib` to the "distribution name" `sage-tdlib`. At the top of the Cython source file [[https://git.sagemath.org/sage.git/tree/src/sage/graphs/graph_decompositions/tdlib.pyx?id=55c3fbc565fd7884f3df9555de83dd326ace276e|src/sage/graphs/graph_decompositions/tdlib.pyx]], there is a new directive `sage_setup: distribution = sage-tdlib`. Now the source discovery in [[https://git.sagemath.org/sage.git/tree/src/sage_setup/find.py?id=55c3fbc565fd7884f3df9555de83dd326ace276e#n61|sage_setup.find.find_python_sources]] includes this Cython module only if the SPKG `tdlib` is installed and current.


== Cleaning ==

 * [[https://trac.sagemath.org/ticket/29636|Trac #29636: Delete changelog sections from all SPKG information files]]; they were deprecated in favor of using Trac years ago. The contributions of Sage developers maintaining SPKGs are documented by our [[http://www.sagemath.org/changelogs/index.html|historical changelogs]].

 * Removing support for Python 2 allowed us to remove several backport packages in [[https://trac.sagemath.org/ticket/29754|Trac #29754]]

 * We also removed the deprecated SageNB (superseded a long time ago by the Jupyter notebook) in [[https://trac.sagemath.org/ticket/29754|Trac #29754]] and several of its dependencies.

 * Support for installing "old-style Sage packages" (`.spkg` files), [[https://trac.sagemath.org/ticket/19158|deprecated in Sage 6.9]], has been removed in [[https://trac.sagemath.org/ticket/29289|Trac #29289]], after making the last two missing packages, `cunningham_tables` and `polytopes_db_4d`, available as normal optional Sage packages. Users who wish to package their own Sage code for distribution may find a [[https://wiki.sagemath.org/SageMathExternalPackages|list of external packages]] helpful, many of which follow best practices in packaging.

== Availability of Sage 9.2 and installation help ==

Sage 9.2 has not been released yet.  See [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.


 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions.

== More details ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.2&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.2]]
