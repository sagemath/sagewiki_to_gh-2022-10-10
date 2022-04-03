= Sage 9.6 Release Tour =

Current development cycle (2022)

<<TableOfContents>>

== User interface, plotting and graphics ==

=== JupyterLab 3.3 ===

[[https://jupyter.org/|JupyterLab]], the latest web-based interactive development environment for notebooks, code, and data, is slated to replace the now-classic Jupyter notebook interface.  The version of !JupyterLab in the Sage distribution has been upgraded to the major new version 3.3. [[https://trac.sagemath.org/ticket/32069|#32069]], [[https://trac.sagemath.org/ticket/33607|#33607]]

After `./sage -i jupyterlab_widgets`, you can run it using `./sage -n jupyterlab`. 

Also two new interface variants are provided: `./sage -n nbclassic` and `./sage -n retrolab`. 

=== Interactive graph editing with phitigra ===

With the new optional package [[https://pypi.org/project/phitigra|phitigra]] (use `./sage -i phitigra` to install), graphs can be edited by interactively placing vertices, edges, etc.  This works both in the classic Jupyter notebook and in !JupyterLab.

=== Hyperbolic plots ===

 * Added the ability to choose the hyperbolic model for hyperbolic plots. [[https://trac.sagemath.org/ticket/22081|#22081]]

=== Graphics with TikZ ===

[[https://trac.sagemath.org/ticket/20343|#20343]]

=== Other improvements ===

[[https://trac.sagemath.org/ticket/33469|#33469]]

[[https://trac.sagemath.org/ticket/32942|#32942]]



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

=== SymPy 1.10.1 ===

!SymPy has been upgraded to version 1.10.1 ([[https://github.com/sympy/sympy/wiki/release-notes-for-1.10|release notes]]). [[https://trac.sagemath.org/ticket/33398|#33398]], [[https://trac.sagemath.org/ticket/33547|#33547]], [[https://trac.sagemath.org/ticket/33584|#33584]]

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

=== polymake 4.6 ===

polymake, a comprehensive system for computations in polyhedral geometry, tropical geometry, etc., has been upgraded to version 4.6 ([[https://polymake.org/doku.php/news/release_4_6|release notes]]). [[https://trac.sagemath.org/ticket/33251|#33251]]

=== CyLP ===

The new optional package [[https://github.com/coin-or/CyLP|CyLP]] (`./sage -i cylp`) provides a detailed interface to [[https://github.com/coin-or/Clp|Clp]], the COIN-OR linear programming solver, and [[https://github.com/coin-or/Cbc|Cbc]], the COIN-OR branch-and-cut solver for mixed-integer linear programs.  [[https://trac.sagemath.org/ticket/33487|#33847]]

In a future version of Sage, CyLP is intended to provide a replacement for the Sage-specific backend interface to Clp and Cbc, [[https://pypi.org/project/sage-numerical-backends-coin/|sage-numerical-backends-coin]]; see [[https://trac.sagemath.org/ticket/26511|Meta-ticket #26511]].

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

=== Finitely presented modules over graded algebras ===

Sage 9.6 allows the construction of finitely presented modules over graded algebras, even algebras which are infinite and/or noncommutative like the mod ''p'' Steenrod algebra. Some homological algebra is implemented in general, and more tools are implemented specifically for modules over the Steenrod algebra ([[https://trac.sagemath.org/ticket/32505|#32505]], [[https://trac.sagemath.org/ticket/30680|#30680]]).

{{{
sage: from sage.modules.fp_graded.module import FPModule
sage: E.<x,y> = ExteriorAlgebra(QQ)
# M has one generator g in degree 0 and two relations, x*g and y*g.
# That is, M is QQ as a trivial E-module.
sage: M = FPModule(E, [0], [[x], [y]])
# Free resolution:
sage: M.resolution(3)
[Module morphism:
   From: Free graded left module on 1 generator over The exterior algebra of rank 2 over Rational Field
   To:   Finitely presented left module on 1 generator and 2 relations over The exterior algebra of rank 2 over Rational Field
   Defn: g[0] |--> g[0],
 Module morphism:
   From: Free graded left module on 2 generators over The exterior algebra of rank 2 over Rational Field
   To:   Free graded left module on 1 generator over The exterior algebra of rank 2 over Rational Field
   Defn: g[1, 0] |--> x*g[0]
         g[1, 1] |--> y*g[0],
 Module morphism:
   From: Free graded left module on 3 generators over The exterior algebra of rank 2 over Rational Field
   To:   Free graded left module on 2 generators over The exterior algebra of rank 2 over Rational Field
   Defn: g[2, 0] |--> x*g[1, 0]
         g[2, 1] |--> y*g[1, 0] + x*g[1, 1]
         g[2, 2] |--> y*g[1, 1],
 Module morphism:
   From: Free graded left module on 4 generators over The exterior algebra of rank 2 over Rational Field
   To:   Free graded left module on 3 generators over The exterior algebra of rank 2 over Rational Field
   Defn: g[3, 0] |--> x*g[2, 0]
         g[3, 1] |--> y*g[2, 0] + x*g[2, 1]
         g[3, 2] |--> y*g[2, 1] + x*g[2, 2]
         g[3, 3] |--> y*g[2, 2]]
}}}

There is a new thematic tutorial providing many details and examples.

=== Miscellaneous improvements ===

 * Ideal membership over quotient rings can now be decided (by reducing to ideal membership in the parent ring). [[https://trac.sagemath.org/ticket/33237|#33237]]
 * Iterating over (some) infinite modules (including ''ℤ^n'') now enumerates the entire module, in a "natural" order. [[https://trac.sagemath.org/ticket/33287|#33287]]
 * `BinaryQF.solve_integer()` now also works for quadratic forms of square discriminant. [[https://trac.sagemath.org/ticket/33026|#33026]]
 * `Quaternion fractional ideals` (including orders) now support the usual operations (e.g., `a*I`, `I*a`, `I+J`). [[https://trac.sagemath.org/ticket/32264|#32264]]
 * `AdditiveAbelianGroupWrapper` now exposes `.discrete_log()` for (multi-dimensional) logarithms in finite abelian groups. [[https://trac.sagemath.org/ticket/32384|#32384]]
 * Graded submodules of graded modules now know they are graded (with respect to the ambient grading); similarly for filtered submodules. [[https://trac.sagemath.org/ticket/33321|#33321]]
 * Polynomials now evaluate faster on monomial inputs. [[https://trac.sagemath.org/ticket/33165|#33165]]
 * Implement specialized code for summing terms and monomials in `CombinatorialFreeModule`. [[https://trac.sagemath.org/ticket/33267|#33267]]
 * Improvements and fixes to `skew_by()` in symmetric functions. [[https://trac.sagemath.org/ticket/33313|#33313]]
 * Attempt to invert elements generically in a finite dimensional algebra. [[https://trac.sagemath.org/ticket/33250|#33250]]
 * Tensor products of finite dimensional modules know they are finite dimensional (Sage does not currently have any structure for infinite tensor products, which can have some subtleties). [[https://trac.sagemath.org/ticket/30252|#30252]]
 * Improved coercions and conversions with Laurent polynomials and their fraction field. [[https://trac.sagemath.org/ticket/31320|#31320]] [[https://trac.sagemath.org/ticket/33477|#33477]]

== Number theory ==

=== Elliptic curves ===

 * Elliptic-curve DLP and Weil pairings over finite fields are now ''much'' faster (thanks to PARI). [[https://trac.sagemath.org/ticket/33121|#33121]]
 * Scalar multiplication on elliptic curves over finite fields is now significantly faster (thanks to PARI). [[https://trac.sagemath.org/ticket/33147|#33147]]
 * Computing the Weierstraß ℘ function of an elliptic curve is now significantly faster (thanks to PARI). [[https://trac.sagemath.org/ticket/33223|#33223]]

== Coding theory ==

Optimizations to `SBox`. [[https://trac.sagemath.org/ticket/25633|#25633]]

== Package upgrades ==

For a list of all packages and their versions, see
 * https://repology.org/projects/?inrepo=sagemath_develop

=== Python 3.10 ===

Sage 9.6 continues to support system Python 3.7.x to 3.10.x. If no suitable version of Python is installed in the system, Sage will install its own copy of Python. Sage now ships Python 3.10.3 for this purpose. [[https://trac.sagemath.org/ticket/30767|#30767]], [[https://trac.sagemath.org/ticket/33512|#33512]]

=== FLINT 2.8.x and arb 2.22.x ===

[[https://flintlib.org/|FLINT]] has been upgraded from 2.7.1 to 2.8.4.[[https://trac.sagemath.org/ticket/32211|#32211]]

The FLINT 2.8 series brings major new algorithms and general speedups ([[https://github.com/wbhart/flint2/blob/flint-2.8/NEWS#L1262|release notes]]).

Note that Sage accepts system installations of FLINT >= 2.6.x. Users on older distributions who want to benefit from the speed ups in FLINT 2.8.x may want to use `./configure --without-system-flint`.

Meta-ticket [[https://trac.sagemath.org/ticket/31408|#31408]] tracks the effort to make use of new features added in recent FLINT releases in the Sage library.

[[https://arblib.org/|arb]] has been upgraded from 2.19.0 to 2.22.1. [[https://trac.sagemath.org/ticket/32211|#32211]], [[https://trac.sagemath.org/ticket/33189|#33189]]

The 2.20, 2.21, and 2.22 series have brought major new algorithms and other improvements ([[https://arblib.org/history.html#version-2-22-1|changelog]]).

=== lrcalc 2.1 ===

lrcalc, Anders Buch's Littlewood-Richardson Calculator, has been upgraded to the major new version 2.1 [[https://bitbucket.org/asbuch/lrcalc/src/master/ChangeLog|changelog]]. [[https://trac.sagemath.org/ticket/31355|#31355]]

=== igraph 0.9.x ===

The `igraph` library and its Python interface (now also just called `igraph`) have been upgraded to versions 0.9.7/0.9.9. [[https://trac.sagemath.org/ticket/32510|#32510]], [[https://trac.sagemath.org/ticket/33526|#33526]]

== Refactoring and modularization ==



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

=== Sage development in the cloud with Gitpod ===

[[https://www.gitpod.io/|Gitpod]] is a service that provides a development environment in the cloud based on VS Code. It is free to use for up to 50 hours per month. Sage now includes a configuration for Gitpod; see the new section [[https://620901c077fb7caa9f914f33--sagemath-tobias.netlify.app/developer/workspace.html#section-gitpod|Setting up your workspace]] in the Sage Developer's Guide. 
[[https://trac.sagemath.org/ticket/33103|#33103]], [[https://trac.sagemath.org/ticket/33589|#33589]]

To launch Gitpod on a branch of a Trac ticket, you can use the new Gitpod badge in the ticket box.

=== Linting workflow on GitHub Actions ===

A [[https://github.com/sagemath/sage/blob/develop/.github/workflows/lint.yml|linting workflow]] on GitHub Actions runs on all pushes to a branch on Trac. It checks that the code of the current branch adheres to the style guidelines using [[https://doc.sagemath.org/html/en/developer/tools.html#pycodestyle|pycodestyle]] and [[https://doc.sagemath.org/html/en/developer/tools.html#relint|relint]]. 

In order to see details when it fails, you can click on the badge and then select the most recent workflow run.

=== Automatic incremental build for ticket branches on GitHub Actions ===

The [[https://github.com/sagemath/sage/blob/develop/.github/workflows/build.yml|build & test workflow]] on GitHub Actions builds Sage for the current branch (incrementally on top of the system packages of the develop branch) and runs the test. 

Details are again available by clicking on the badge.

Note that in contrast to the patchbot, the ticket branch is not merged into the current beta version.

=== Automatic documentation build for ticket branches on GitHub Actions ===

Build documentation workflow that builds the HTML documentation for the current branch. If you click on it, you get the HTML output of the successful run. The idea is to use this to easily inspect changes to the documentation without the need to locally rebuild the docs yourself. If the doc build fails, you can go to [[https://github.com/sagemath/sagetrac-mirror/actions/workflows/doc-build.yml|the Actions tab of sagemath/sagetrac-mirror repo]] and choose the particular branch to see what went wrong.

The idea is that these three status badges complement the existing patchbots (and maybe even replace them in the future). In particular, they are supposed to always be green.

=== Codecov ===

[[https://trac.sagemath.org/ticket/33355|#33355]]

=== sage -pytest ===

After the optional package [[https://docs.pytest.org/en/7.1.x/|pytest]] is installed (`./sage -i pytest`), a new command `./sage -pytest` is available, which runs pytest on the Sage library sources. [[https://trac.sagemath.org/ticket/33572|#33572]]

Also the Sage doctester (`./sage -t` or `./sage -tox -e doctest`) invokes `pytest`. This functionality has been improved in Sage 9.6. [[https://trac.sagemath.org/ticket/31924|#31924]], [[https://trac.sagemath.org/ticket/32975|#32975]]

=== sage -t --baseline-stats-path ===

[[https://trac.sagemath.org/ticket/33233|#33233]]

=== Sage patchbot on GitHub Actions ===

The [[https://wiki.sagemath.org/patchbot#Running_the_patchbot_on_GitHub_Actions|Sage patchbot can now be run on GitHub Actions]],
on top of any of the Linux platforms for which we have prebuilt Docker images.[[https://trac.sagemath.org/ticket/33253|#33253]]


== Availability of Sage 9.6 and installation help ==

The first development release of the 9.6 series, 9.6.beta0, was tagged on 2022-02-06.
The current development release is 9.6.beta7, tagged on 2022-04-02.

The [[https://6212659123a9467b3cb0cd07--sagemath-tobias.netlify.app/installation/index.html|SageMath installation guide]] now provides a decision tree that guides users and developers to a type of installation suitable for their system and their needs.

=== Sources ===

The Sage source code is available in the [[https://github.com/sagemath/sage/tree/develop|sage git repository]].

!SageMath 9.6 supports all [[https://wiki.sagemath.org/ReleaseTours/sage-9.5#Sources|platforms that were supported by Sage 9.5]] and '''adds support for building on distributions that use the (unreleased) [[https://gcc.gnu.org/gcc-12/changes.html|GCC 12]] series''' (`fedora-36`). [[https://trac.sagemath.org/ticket/33187|#33187]]

(On platforms marked with the superscript&nbsp;⁺, installing optional packages
is not supported in Sage 9.6; and support for these platforms will be removed in the next release cycle. Upgrade to a newer version of the distribution or at least upgrade  the toolchain (gcc, binutils).)

 * '''Linux 64-bit''' (x86_64)
   * ubuntu-{[[https://launchpad.net/ubuntu/trusty|trusty]]⁺,[[https://launchpad.net/ubuntu/xenial|xenial]],[[https://launchpad.net/ubuntu/bionic|bionic]],[[https://launchpad.net/ubuntu/focal|focal]],[[https://launchpad.net/ubuntu/hirsute|hirsute]],[[https://launchpad.net/ubuntu/impish|impish]],[[https://launchpad.net/ubuntu/jammy|jammy]]} 
   * debian-{[[https://wiki.debian.org/DebianStretch|stretch]], [[https://wiki.debian.org/DebianBuster|buster]],[[https://wiki.debian.org/DebianBullseye|bullseye]],[[https://wiki.debian.org/DebianBookworm|bookworm]],[[https://wiki.debian.org/DebianUnstable|sid]]}
   * linuxmint-{[[https://www.linuxmint.com/edition.php?id=158|17]]⁺,[[https://www.linuxmint.com/edition.php?id=217|18]],[[https://linuxmint.com/rel_tara_cinnamon.php|19]],[[https://linuxmint.com/rel_tricia_cinnamon.php|19.3]],[[https://www.linuxmint.com/rel_ulyssa_cinnamon_whatsnew.php|20.1]],[[https://linuxmint.com/rel_uma_cinnamon.php|20.2]],[[https://linuxmint.com/rel_una_cinnamon.php|20.3]]}
   * fedora-{[[https://docs.fedoraproject.org/en-US/fedora/f26/release-notes/|26]],[[https://docs.fedoraproject.org/en-US/fedora/f27/release-notes/|27]],[[https://docs.fedoraproject.org/en-US/fedora/f28/release-notes/|28]],[[https://docs.fedoraproject.org/en-US/fedora/f29/release-notes/|29]],[[https://docs.fedoraproject.org/en-US/fedora/f30/release-notes/|30]],[[https://docs.fedoraproject.org/en-US/fedora/f31/release-notes/|31]],[[https://docs.fedoraproject.org/en-US/fedora/f32/release-notes/|32]],[[https://docs.fedoraproject.org/en-US/fedora/f33/release-notes/|33]],[[https://docs.fedoraproject.org/en-US/fedora/f34/release-notes/|34]],[[https://docs.fedoraproject.org/en-US/fedora/f35/release-notes/|35]],[[https://fedoraproject.org/wiki/Releases/36/ChangeSet|36]]}
   * centos-{7⁺,[[https://www.centos.org/centos-stream/|stream-8]],[[https://www.centos.org/centos-stream/|stream-9]]}
   * gentoo
   * archlinux
   * opensuse-{15,[[https://doc.opensuse.org/release-notes/x86_64/openSUSE/Leap/15.3/|15.3]],[[https://get.opensuse.org/tumbleweed/|tumbleweed]]}
   * slackware-14.2
 * '''Linux 32-bit''' (i386/i686)
   * ubuntu-bionic
   * [[https://github.com/pypa/manylinux#manylinux_2_24-debian-9-based|manylinux-2_24]]
   * debian-buster
   * centos-7⁺ (but docbuild is broken, [[https://trac.sagemath.org/ticket/32768|#32768]])
 * '''macOS (Intel)''' (x86_64) - with [[https://brew.sh/|Homebrew]] or without
   * macOS 10.15 (Catalina)
   * macOS 11.x (Big Sur)
   * macOS 12.x (Monterey) [[https://trac.sagemath.org/ticket/32855|#32855]]
 * '''macOS (Apple Silicon, M1)''' [[https://trac.sagemath.org/ticket/30592|#30592]]
   * Building Sage 9.5 from source on Apple Silicon (M1) requires the use of [[https://brew.sh/|Homebrew]] (recommended) or conda-forge, which package versions of `gfortran` 11 with necessary changes for this platform that are not in a released upstream version of GCC. (The `gfortran` package that comes with Sage is not suitable for the M1.)
   * Make sure that `/usr/local` does not contain an old copy of homebrew (or other software) for x86_64 that you may have copied from an old machine. Homebrew for the M1 is installed in `/opt/homebrew`, not `/usr/local`.
   * Be sure to follow the [[https://github.com/sagemath/sage/blob/develop/README.md|README]] and the instructions that the `./configure` command issues regarding the installation of system packages from Homebrew or conda.
 * '''Cygwin''' (x86_64)

=== Help ===

See [[https://github.com/sagemath/sage/blob/9.4/README.md|README.md]] in the source distribution for installation instructions.

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions and [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.

== More details ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.6&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.6]]

 * [[https://github.com/sagemath/sage/compare/9.5...develop#files_bucket|Diff from 9.5]]
