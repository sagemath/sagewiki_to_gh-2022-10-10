= Sage 9.6 Release Tour =

Current development cycle (2022)

<<TableOfContents>>

== Manifolds ==

=== Symplectic manifolds ===

Symplectic structures have been added to Sage ([[https://trac.sagemath.org/ticket/30362|#30362]]).


== Package upgrades ==

For a list of all packages and their versions, see
 * https://repology.org/projects/?inrepo=sagemath_develop

=== FLINT and arb ===

FLINT from 2.7.1 to 2.8.4, arb to 2.22.1 [[https://trac.sagemath.org/ticket/32211|#32211]], [[https://trac.sagemath.org/ticket/33189|#33189]]

The FLINT 2.8 series brings major new algorithms and general speedups. [[https://github.com/wbhart/flint2/blob/flint-2.8/NEWS#L1262]]
Note that Sage accepts system installations of FLINT >= 2.6.x. Users on older distributions who want to benefit from the speed ups in FLINT 2.8.x may want to use `./configure --without-system-flint`.

Meta-ticket [[https://trac.sagemath.org/ticket/31408|#31408]] tracks the effort to make use of new features added in recent FLINT releases in the Sage library.

== New developer tools ==

=== Pre-built Docker containers on ghcr.io ===

Our portability CI builds [[https://github.com/orgs/sagemath/packages?tab=packages&q=with-targets-optional|Docker containers]] for all tested Linux platforms and makes them available on ghcr.io. [[https://trac.sagemath.org/ticket/30933|#39033]]

Since 9.6.beta1, the Docker image for the latest development release receives the additional Docker tag `dev`; thus, for example, the following command will work:
{{{
$ docker run -it ghcr.io/sagemath/sage/sage-docker-ubuntu-impish-standard-with-targets-optional:dev bash
}}}

=== Gitpod ===

[[https://www.gitpod.io/|Gitpod]] is a service that provides a development environment in the cloud based on VS Code. It is free to use for up to 50 hours per month. Sage now includes a configuration for Gitpod; see the new section [[https://620901c077fb7caa9f914f33--sagemath-tobias.netlify.app/developer/workspace.html#section-gitpod|Setting up your workspace]] in the Sage Developer's Guide. 
[[https://trac.sagemath.org/ticket/33103|#33103]]


== Availability of Sage 9.6 and installation help ==

The first development release of the 9.6 series, 9.6.beta0, was tagged on 2022-02-06.

The Sage source code is available in the [[https://github.com/sagemath/sage/tree/9.5|sage git repository]].

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions and [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.

== More details ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.6&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.6]]

 * [[https://github.com/sagemath/sage/compare/9.5...develop#files_bucket|Diff from 9.5]]
