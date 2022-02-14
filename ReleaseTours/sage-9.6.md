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

Our portability CI on !GitHub Actions builds [[https://github.com/orgs/sagemath/packages?tab=packages&q=with-targets-optional|Docker images]] for all tested Linux platforms (and system package configurations) and makes them available on ghcr.io. [[https://trac.sagemath.org/ticket/30933|#39033]]

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

The [[https://wiki.sagemath.org/patchbot#Running_the_patchbot_on_GitHub_Actions|Sage patchbot can now be run on !GitHub Actions]],
on top of any of the Linux platforms for which we have prebuilt Docker images.[[https://trac.sagemath.org/ticket/33253|#33253]]


== Availability of Sage 9.6 and installation help ==

The first development release of the 9.6 series, 9.6.beta0, was tagged on 2022-02-06.
The current development release is 9.6.beta1, tagged on 2022-02-13.

The Sage source code is available in the [[https://github.com/sagemath/sage/tree/develop|sage git repository]].

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions and [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.

== More details ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.6&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.6]]

 * [[https://github.com/sagemath/sage/compare/9.5...develop#files_bucket|Diff from 9.5]]
