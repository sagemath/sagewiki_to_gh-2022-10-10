= Sage 9.6 Release Tour =

Current development cycle (2022)

<<TableOfContents>>

== Linear Algebra ==

The new classes `Matrix_numpy_integer_dense` and `Vector_numpy_integer_dense` implement matrices and vectors with 64-bit integer entries backed by `numpy` arrays. [[https://trac.sagemath.org/ticket/32465|#32465]].

As a first application, several methods of `GenericGraph` that return matrices, such as `adjacency_matrix`, now accept keyword arguments that can select the matrix implementation. [[https://trac.sagemath.org/ticket/33377|#33377]], [[https://trac.sagemath.org/ticket/33387|#33387]], [[https://trac.sagemath.org/ticket/33388|#33388]], [[https://trac.sagemath.org/ticket/33389|#33389]]
{{{
sage: graphs.PathGraph(5).adjacency_matrix(sparse=False, implementation='numpy')
[0 1 0 0 0]
[1 0 1 0 0]
[0 1 0 1 0]
[0 0 1 0 1]
[0 0 0 1 0]
sage: type(_)
<class 'sage.matrix.matrix_numpy_integer_dense.Matrix_numpy_integer_dense'>
}}}

== Symbolics ==

=== ImageSet ===

Sage 9.6 defines a new class `ImageSet`. [[https://trac.sagemath.org/ticket/32121|#32121]]

{{{
sage: ImageSet(sin, RealSet.open(0, pi/4))
Image of (0, 1/4*pi) by The map sin from (0, 1/4*pi)
sage: _.an_element()
1/2*sqrt(-sqrt(2) + 2)

sage: sos(x,y) = x^2 + y^2; sos
(x, y) |--> x^2 + y^2
sage: ImageSet(sos, ZZ^2)
Image of
 Ambient free module of rank 2 over the principal ideal domain Integer Ring by
 The map (x, y) |--> x^2 + y^2 from Vector space of dimension 2 over Symbolic Ring
sage: _.an_element()
1
sage: ImageSet(sos, Set([(3, 4), (3, -4)]))
Image of {...(3, -4)...} by
 The map (x, y) |--> x^2 + y^2 from Vector space of dimension 2 over Symbolic Ring
sage: _.an_element()
25
}}}

The new class mirrors and translates to [[https://docs.sympy.org/latest/modules/sets.html#imageset|SymPy's ImageSet]]:
{{{
sage: from sage.sets.image_set import ImageSet
sage: S = ImageSet(sin, RealSet.open(0, pi/4)); S
Image of (0, 1/4*pi) by The map sin from (0, 1/4*pi)
sage: S._sympy_()
ImageSet(Lambda(x, sin(x)), Interval.open(0, pi/4))
}}}

Most methods of `ImageSet` are actually provided by its base class, the new class `ImageSubobject`. 
For all morphisms in the `Sets` category, there is now a default method `image`, which constructs an instance of either `ImageSubobject` or `ImageSet`.

== Polyhedral geometry ==

=== Equivariant Ehrhart theory ===

[[https://trac.sagemath.org/ticket/27637|#27637]]


== Manifolds ==

The `structure` parameter of the `Manifold` constructor has new, more convenient defaulting behavior. [[https://trac.sagemath.org/ticket/33001|#33001]]

When parameters such as `diff_degree` or `metric_name` are given, the implied structure is selected:
{{{
sage: M = Manifold(3, 'M', diff_degree=0); M
3-dimensional topological manifold M
sage: M = Manifold(3, 'M', diff_degree=2); M
3-dimensional differentiable manifold M
sage: M = Manifold(3, 'M', metric_name='g'); M
3-dimensional Riemannian manifold M
}}}

=== Symplectic manifolds ===

Symplectic structures have been added to Sage ([[https://trac.sagemath.org/ticket/30362|#30362]]).

=== Projective spaces ===

Real projective spaces have been added to the manifold catalog ([[https://trac.sagemath.org/ticket/33221|#33221]]).

== Algebra ==

 * Ideal membership over quotient rings can now be decided (by reducing to ideal membership in the parent ring). [[https://trac.sagemath.org/ticket/33237|#33237]]
 * Iterating over (some) infinite modules (including ''ℤ^n'') now enumerates the entire module, in a "natural" order. [[https://trac.sagemath.org/ticket/33287|#33287]]
 * ''BinaryQF.solve_integer()'' now also works for quadratic forms of square discriminant. [[https://trac.sagemath.org/ticket/33026|#33026]]
 * Quaternion fractional ideals (including orders) now support the usual operations (e.g., ''a*I'', ''I*a'', ''I+J''). [[https://trac.sagemath.org/ticket/32264|#32264]]
 * ''AdditiveAbelianGroupWrapper'' now exposes ''.discrete_log()'' for (multi-dimensional) logarithms in finite abelian groups. [[https://trac.sagemath.org/ticket/32384|#32384]]

== Number theory ==

=== Elliptic curves ===

 * Elliptic-curve DLP and Weil pairings over finite fields are now ''much'' faster (thanks to PARI). [[https://trac.sagemath.org/ticket/33121|#33121]]
 * Scalar multiplication on elliptic curves over finite fields is now significantly faster (thanks to PARI). [[https://trac.sagemath.org/ticket/33147|#33147]]
 * Computing the Weierstraß ℘ function of an elliptic curve is now significantly faster (thanks to PARI). [[https://trac.sagemath.org/ticket/33223|#33223]]

== Package upgrades ==

For a list of all packages and their versions, see
 * https://repology.org/projects/?inrepo=sagemath_develop

=== Python 3.10 ===

Sage 9.6 continues to support system Python 3.7.x to 3.10.x. If no suitable version of Python is installed in the system, Sage will install its own copy of Python. Sage now ships Python 3.10.2 for this purpose. [[https://trac.sagemath.org/ticket/30767|#30767]]

=== FLINT and arb ===

FLINT from 2.7.1 to 2.8.4, arb to 2.22.1 [[https://trac.sagemath.org/ticket/32211|#32211]], [[https://trac.sagemath.org/ticket/33189|#33189]]

The FLINT 2.8 series brings major new algorithms and general speedups. [[https://github.com/wbhart/flint2/blob/flint-2.8/NEWS#L1262]]
Note that Sage accepts system installations of FLINT >= 2.6.x. Users on older distributions who want to benefit from the speed ups in FLINT 2.8.x may want to use `./configure --without-system-flint`.

Meta-ticket [[https://trac.sagemath.org/ticket/31408|#31408]] tracks the effort to make use of new features added in recent FLINT releases in the Sage library.

=== lrcalc ===

lrcalc, Anders Buch's Littlewood-Richardson Calculator, has been upgraded to the major new version 2.1 [[https://bitbucket.org/asbuch/lrcalc/src/master/ChangeLog|changelog]]. [[https://trac.sagemath.org/ticket/31355|#31355]]

=== SymPy ===

!SymPy has been upgraded to version 1.10 ([[https://github.com/sympy/sympy/wiki/release-notes-for-1.10|release notes]]). [[https://trac.sagemath.org/ticket/33398|#33398]]

=== polymake ===

polymake, a comprehensive system for computations in polyhedral geometry, tropical geometry, etc., has been upgraded to version 4.6 ([[https://polymake.org/doku.php/news/release_4_6|release notes]]). [[https://trac.sagemath.org/ticket/33251|#33251]]

=== igraph ===

The `igraph` library and its Python interface (now also just called `igraph`) have been upgraded to versions 0.9.5/0.9.8. [[https://trac.sagemath.org/ticket/32510|#32510]]


== New developer tools ==

=== Pre-built Docker containers on ghcr.io ===

Our portability CI on !GitHub Actions builds [[https://github.com/orgs/sagemath/packages?tab=packages&q=with-targets-optional|Docker images]] for all tested Linux platforms (and system package configurations) and makes them available on !GitHub Packages (ghcr.io). [[https://trac.sagemath.org/ticket/30933|#39033]]

Since 9.6.beta1, the image version corresponding to the latest development release receives the additional Docker tag `dev`, see for example the Docker image for [[https://github.com/sagemath/sage/pkgs/container/sage%2Fsage-docker-ubuntu-impish-standard-with-targets-optional|ubuntu-impish-standard]]. Thus, for example, the following command will work:
{{{
$ docker run -it ghcr.io/sagemath/sage/sage-docker-ubuntu-impish-standard-with-targets-optional:dev bash
}}}

Images whose names end with the suffix `-with-targets-optional` are the results of full builds and a run of `make ptest`. They also contain a copy of the source tree and the full logs of the build and test. 

[[https://github.com/orgs/sagemath/packages?tab=packages&q=sage-docker-debian-bullseye-standard|Smaller images corresponding to earlier build stages]] are also available: 

 * `-with-system-packages` provides a system installation with system packages installed, no source tree,

 * `-configured` contains a partial source tree and has completed bootstrap and the `configure`,

 * `-with-targets-pre` contains the full source tree and a full installation of all non-Python packages,

 * `-with-targets` contains the full source tree and a full installation of Sage, including the HTML documentation, but `make ptest` has not been run yet.

=== Gitpod ===

[[https://www.gitpod.io/|Gitpod]] is a service that provides a development environment in the cloud based on VS Code. It is free to use for up to 50 hours per month. Sage now includes a configuration for Gitpod; see the new section [[https://620901c077fb7caa9f914f33--sagemath-tobias.netlify.app/developer/workspace.html#section-gitpod|Setting up your workspace]] in the Sage Developer's Guide. 
[[https://trac.sagemath.org/ticket/33103|#33103]]

To launch Gitpod on a branch of a Trac ticket, you can use the new Gitpod badge in the ticket box.

=== New status badges on Trac tickets ===

We have now:

1. Linter that checks that the code of the current branch adheres to the style guidelines. In order to see details when it fails, you can click on it and then select the most recent workflow run.

2. Build & test that builds sage for the current branch (incrementally on top of the system packages of the develop branch) and runs the test. Details are again available by clicking on the badge. (This is currently still gray until [[https://trac.sagemath.org/ticket/33263|#33263]] is merged.)

3. Build documentation workflow that builds the HTML documentation for the current branch. If you click on it, you get the HTML output of the successful run. The idea is to use this to easily inspect changes to the documentation without the need to locally rebuild the docs yourself. If the doc build fails, you can go to [[https://github.com/sagemath/sagetrac-mirror/actions/workflows/doc-build.yml|the Actions tab of sagemath/sagetrac-mirror repo]] and choose the particular branch to see what went wrong.

The idea is that these three status badges complement the existing patchbots (and maybe even replace them in the future). In particular, they are supposed to always be green.

=== Sage patchbot on GitHub Actions ===

The [[https://wiki.sagemath.org/patchbot#Running_the_patchbot_on_GitHub_Actions|Sage patchbot can now be run on GitHub Actions]],
on top of any of the Linux platforms for which we have prebuilt Docker images.[[https://trac.sagemath.org/ticket/33253|#33253]]


== Availability of Sage 9.6 and installation help ==

The first development release of the 9.6 series, 9.6.beta0, was tagged on 2022-02-06.
The current development release is 9.6.beta4, tagged on 2022-03-08.

The [[https://6212659123a9467b3cb0cd07--sagemath-tobias.netlify.app/installation/index.html|SageMath installation guide]] now provides a decision tree that guides users and developers to a type of installation suitable for their system and their needs.

The Sage source code is available in the [[https://github.com/sagemath/sage/tree/develop|sage git repository]].

!SageMath 9.6 supports all [[https://wiki.sagemath.org/ReleaseTours/sage-9.5#Sources|platforms that were supported by Sage 9.5]] and '''adds support for building on distributions that use the (unreleased) [[https://gcc.gnu.org/gcc-12/changes.html|GCC 12]] series''' (`fedora-36`). [[https://trac.sagemath.org/ticket/33187|#33187]]

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions and [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.

== More details ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.6&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.6]]

 * [[https://github.com/sagemath/sage/compare/9.5...develop#files_bucket|Diff from 9.5]]
