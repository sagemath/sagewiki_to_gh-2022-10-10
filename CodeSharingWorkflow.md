<<TableOfContents>>

= On development models for sharing (experimental) code =

One core aim of Sage is to foster code sharing, and to encourage groups
of researchers, teachers, and other users to get together to develop
new features they need either on top of or within Sage, and share
them.

Over the years, many development workflows have been experimented by
various groups of people to improve Sage in certain areas, like
Sage-Combinat for (algebraic) combinatorics, Sage-Words for
combinatorics on words, [[http://sagemanifolds.obspm.fr/|SageManifolds]] for differential geometry,
purple-sage for number theory, ...

The goal of this document is to discuss the different workflows that
have been tried with their pros and cons, to share best practices and
to brainstorm about what support and recommendations Sage could provide
for various use cases. Eventually, this could become a section of the
developer's manual (though this can be of interest for other people
wanting to start sharing code without necessarily contributing to
Sage), or a page of the sagemath.org website.

At this point this is a collection of notes by N. Thiéry; please hack in and contribute your own vision!

See also:

 * A [[SageMathExternalPackages]]
 * A [[https://groups.google.com/d/topic/sage-devel/oZbdbo1kHW0/discussion|discussion on sage-devel about modularization of the Sage library]]

== Objectives of a development workflow ==

Of course the milleage will vary from project to project, but the objectives
of a development workflow can typically be to:

1.  Support ''fast paced development'' within a group of users working on
    the same topic, or needing similar features.

2.  Support ''rapid dissemination of experimental features''.

    The goal is simultaneously to support users, and to get early
    feedback on the code.

    Typical needs:

    * Using, for a given calculation, experimental features from
    different areas, developed by different groups of people

    * Getting the latest version of a feature, without having to
    upgrade all of Sage (e.g. just before delivering a talk!!!)

    * Feature discovery: increasing the chances for someone to
    discover that a given feature is being implemented somewhere

3.  Foster high quality code by promoting documentation, tests, code reviews.

4.  Foster intrinsic high quality code by providing an *ecosystem*
    where (experimental) code can live, compete with other
    implementations, mature and be selected or die, all at a fine
    granularity.

5.  Strike a balance between centralized and decentralized.

    In particular mitigate the risks of code-bloat of the Sage library
    versus the risks of death of code lying out somewhere on the web.

6.  Minimize *maintenance* overhead, and in particular code rotting.

7.  Remain flexible between the all-in-one versus packages development models
    (simplifying things out: between Sage's model and GAP's model).

8.  Promote extending existing Sage classes and modules with additional features.

    This eases dynamic feature discovery by users (once installed,
    features can be found at their expected location) and enable
    transparent migration of code inside the Sage library if and when
    desired (no need to change the code itself, nor code using
    it). This also promotes coherent coding standards.

    Note: subclassing is not always an option to extend a class,
    e.g. when a feature is to be added to an abstract base class of
    many concrete classes (subclassing each and every concrete class
    would be a pain).

    See also:

    * http://www.csd.uwo.ca/~watt/pub/reprints/2006-dsal-postfacto.pdf
    * https://en.wikipedia.org/wiki/Extension_method
    * https://en.wikipedia.org/wiki/Monkey_patch

= Existing workflows =

== Direct integration into Sage ==

In this workflow, each feature is shared by integrating it directly into Sage.

Pros:

 * Simplicity for the user: all stable features are directly available in Sage
 * Simplicity for Sage developers: no additional workflow to learn
 * No need to worry about release, distribution, test infrastructure, ...
 * Promotes early integration of code and objective 3
 * Makes objective 8 straightforward

Cons:

 * Limited support for objective 2
 * Slows down the development: once a feature is in Sage, any change
 needs to be reviewed, refactoring of the public API requires taking
 care of backward compatibility. No good for objective 4
 * Getting the latest feature forces updating to the latest version of Sage
 * Introduces a bias toward code bloat (in doubt, features tend to be added to Sage)
 * When development is faster than reviews, the maintenance effort in having many open tickets 
 gets heavy when minor changes to an early ticket has to be merged into all later ones. 

Examples: 

 * [[http://sagemanifolds.obspm.fr/|SageManifolds]], cf. the metaticket 
 [[http://trac.sagemath.org/ticket/18528|#18528]]
 * [[http://bitbucket.org/lucasdavid/sage_coding_project/wiki/Home|ACTIS: Algebraic Coding Theory for Sage]], cf. the metaticket 
 [[http://trac.sagemath.org/ticket/18846|#18846]]

Discussion:

 * Soften model using external repo: In the beginning of ACTIS (see above), we maintained a public clone of Sage on Bitbucket where each major feature 
 set was a branch. Once our main design was mature enough, the first few branches were made into Trac tickets and merged in Sage. This fully achieved 
 objective 2 and 4 in this phase. When choosing the scope of a branch, attention was given to minimising dependencies, easing the maintenance burden of 
 parallel development. However, extracting tickets from branches was manual and error-prone, and changes done in the trac review phase were annoying to 
 port back to the public repo. So after the most volatile period of design, we abandoned this model.
 * Use the @experimental decorator to mitigate the backward compatibility issue while the code is not yet fully mature. The decorator is a bit clumsy to 
 use due to doc-testing in Sphinx (tricks need to be done to avoid printing the experimental warning on each doc-test), see e.g. 
 [[http://doc.sagemath.org/html/en/reference/asymptotic/sage/rings/asymptotic/growth_group.html|AsymptoticRing]].

== Feature branches ==

In this workflow, features or feature sets are implemented as
branches on the Sage sources.

Pros:

 * Makes objective 8 straightforward
 * Encourages integration into Sage
 * Development history is automatically kept upon integration into Sage

Cons:

 * Branch needs to be regularly updated to prevent code rotting due to
 syntactical conflicts with changes in Sage (though automatic merges help)
 * Objective 2 requires basic git knowledge from end-users
 * Lack of modularity for objective 2: due to potential conflicts, it's not easy
 to combine features from several branches; upgrading to the latest
 version of a branch often forces a change of version of Sage
 * Cherry picking certain mature features for integration in Sage is
 somewhat cumbersome (the granularity of branches and commits is
 orthogonal to the granularity of features)
 * It's hard to strike the right granularity in terms of feature /
 feature set. We tried dependency tracking among branches as a way to
 build feature sets out of features, but this did not work well
 * Because of the above, this workflow does not work well for objective 4
 * Introduces a bias toward the all-in-one development model

Examples:

 * [[https://trac.sagemath.org/ticket/22982|Global function fields]]

Features in trac:

Sage development trac can be used to host the features. The ticket for a feature has milestone `sage-feature`
and keeps a feature branch that provides a special functionality that can be merged to the Sage core by the user. 
The ticket is not reviewed (i.e, not goes into `needs review` status) until it is accepted as a standard feature 
and integrated to Sage. The user can select a set of features at build time and pull the feature branches from trac
and start to make in the usual way. A special script "make-sage-with features" might be provided to make this easy. 

A feature in trac should provide at least

 * Description about the feature.
 * Info about the author.
 * Info about the latest Sage release with which the feature works. 
 * Info about dependencies, that is, other tickets that this feature depends on.
 * Optionally a link to the host at which actual development occurs, like Github repos.

Other remarks:

 * The feature branch contain code and documentation. 
 * The patchbots test the feature against the latest Sage release regularly.
 * The features in trac should be either orthogonal or competent to other features in their functionality.
 * Some parts of the present Sage library may be turned into features.

== Patch queue as used by Sage-Combinat between 2009 and 2013 ==

See also the bottom of this page.

TODO: description

This section is just for reference: there used to be a strong rationale for this workflow with the
former Sage development workflow and a given context. But not
any more. 

Pros:

 * Relatively good for objective 1 (except for objective 6)
 * Relatively good for objective 2 (thanks to "sage -combinat install"), except
 for modularity and requiring some Sage recompilation
 * Objective 8 is straightforward

Cons:

 * Complexity of working at the meta level (version control on the patches)
 * Really bad at objective 6: Horrible maintenance overhead due to syntactic conflicts
 and lack of automatic merging
 * Introduces a strong bias toward code death, or at least non integration into Sage
 * Monolithic: one could not use several patch queues at once, so this
 did not support overlaping groups of people working on different
 topics; this introduced a non-natural barrier between Sage-Combinat
 and the rest of the world, and prevented rapid reconfiguration of
 projects around topics and groups of developers

== Standalone (pip) packages ==

Here the idea is to implement feature sets as independent Python
packages on top of Sage. Converting a bunch of Python files into such
a package to make it `easy to install
<http://python-packaging-user-guide.readthedocs.io/en/latest/distributing/>`_ is
straightforward.

Examples:

 * [[https://github.com/cswiercz/sage_packages|Template for creating Sage packages]]
 * [[https://github.com/williamstein/sage_modabvar|Modular Abelian Varities]]
 * [[https://github.com/cswiercz/pychebfun|Python implementation of chebfun]]
 * [[https://github.com/williamstein/psage|Purple Sage]]
 * [[http://www.slabbe.org/blogue/categorie/slabbe-spkg/|slabbe-0.2.spkg]]

 See also this [[http://www.slabbe.org/blogue/2014/08/releasing-slabbe-my-own-sage-package/|blog post]]
 Note that this is an spkg, rather than a standard pip-installable package.

NON-Examples:

 * [[http://sagemanifolds.obspm.fr/|SageManifolds]]
 
  The [[http://sagemanifolds.obspm.fr/spkg/sm-install.sh|install script]]
  for this does all kinds of copying files directly into the sage
  install, using sed to modify parts of the sage library, etc.  It's
  terrifying.  -- William.

  True but that's only a provisory thing for an easy install by a newbie, until the process of full integration of SageManifolds in
  Sage, started at [[http://trac.sagemath.org/ticket/18528|#18528]],
  is finished. For a developer, the recommended installation process
  is via git, not via the above script. Actually, we started
  SageManifolds as a (new-style) spkg and it was distributed as such
  until version 0.4. Then, in order to ease the review process, we
  split it in many tickets (listed at [[http://trac.sagemath.org/ticket/18528|#18528]]) and devise the above
  script just for end users not familiar with git and make. 

  Really the development workflow of SageManifolds pertains to the category
  ''Direct integration into Sage'' above, hence it is a Non-Example
  here -- Eric.

  Or maybe to the category "standalone package with an integration
  mission below". By the way, the usage of scripts could potentially
  be replaced by the monkey patching approach described below, though
  I'd need to check the exact use cases. Let's discuss this at some
  point!  -- Nicolas

  UPDATE (15 Jan 2017): SageManifolds is now fully integrated in 
  Sage 7.5. There is therefore no need for an install script, even
  for a newbie; cf. the new 
  [[http://sagemanifolds.obspm.fr/download.html|download page]] -- Eric.

 * [[https://bitbucket.org/nborie/cha|CHA]]   "It is recommended to use the more recent implementation from the branch attached to this ticket rather than this library."; I think this is just some code to copy into the sage library or run directly, with no package support at all.

Pros:

 * Good for objectives 1, 2, 4

Cons:

 * Handling of compatibility with various versions of the dependencies (in particular Sage)
 * Risk of code rotting (as Sage evolves over time) or death (if it's not maintained)
 * Requires coordination with Sage and related packages to not step on each other

=== Standalone (pip) packages with an integration mission ===

This is a variant on the previous development workflow, with an
explicit focus on easing (or even promoting) the integration of mature
code into Sage.

Specifics:

 * Layout the code as in the Sage library, with top module called
 e.g. ``sage-blah`` instead of ``sage``. For example, to add a method to the
 Sage class Partition, one would put it in an otherwise empty class
 ``sage-blah.combinat.partition.Partition``.

 * Use recursive monkey patching to insert all the code dynamically in
 the Sage library, for example by using the
 [[https://pypi.python.org/pypi/recursive-monkey-patch|recursive-monkey-patch]] pip package

 The effect is to patch the Sage library, as with branches or patch
 queues; however this is done semantically at the granularity of
 methods rather than syntactically at the granularity of lines in the
 source code.

Examples:

 * [[https://github.com/nthiery/sage-semigroups/|Sage-semigroups]] (quite preliminary!!!)

Pros:

 * Same as above
 * Objective 8 is straightforward
 * Lighter maintenance overhead compared to branches or patch queues:
 one only needs to take care of semantic conflicts, not syntactic
 ones.
 * The integration of mature code into Sage helps for objective 3 and for the
 maintenance as well: keeping the library as a "small layer" over
 Sage reduces the risks of irreversibly drifting away, and reduces
 the amount of updating.
 * Depending on how strongly one pushes toward the integration of
 mature code, one can flexibly interpolate between the all-in-one
 model and the package model

Cons:

 * The concept has not yet been really battlefield tested!
 * Moving code into the Sage library is done by copy pasting. This
 makes for a clean diff showing just the addition of the new methods,
 but means that one looses the history and author tracking (that's
 not that different from history squashing as used by many projects)

= What is this Sage-Combinat queue madness about??? =

Sage-Combinat is a software project whose mission is: "to improve the
open source mathematical system Sage as an extensible toolbox for
computer exploration in (algebraic) combinatorics, and foster code
sharing between researchers in this area".

In practice it's a community of a dozen regular contributors, 20
occasional ones and, maybe, 30 users. They collaborate together on a
collection of experimental patches (i.e. extensions) on top of
Sage. Each one describes a relatively atomic modification which may
span several files; it may fix a bug, implement a new feature, improve
some documentation. The intent is that most of those extensions get
integrated into Sage as soon as they are mature enough, with a typical
life-cycle ranging from a few days to a couple months. In average 20
extensions are merged in each version of Sage (42 in Sage 5.0!), and
more than 200 are under development.


== Why do we want to share our experimental code ==
Here are our goals in using the Sage-Combinat queue for sharing patches:

 * Preintegration

   It is very common that an advanced feature needs some infrastructure
   support. For example, advanced Hopf algebras or representation theory
   features needs basic linear algebra stuff (eg: tensor product) which them
   self needs support from categories which them self may need support for
   optimized dynamic classes. Having a central repository for experimental
   code allows us for sharing several layer of dependant patch. In our
   (Nicolas and Florent) experience it is fairly common that during research,
   we end up improving dependant patches with more than four layers of
   dependencies.

 * Pair programming (or more than pair!)

   Many Sage-Combinat patches have several authors. We need an easy way to
   exchange patches (note that this is not specific to the Sage-Combinat
   project).

 * Easy review even with many dependencies

   As said in preintegration, we can have several layer of dependant
   patches. We need some tool to apply a bunch of patches (not necessarily in
   a stable/needs-review status), experiment with the code and launch the
   tests.

 * Maturation

   Due to the kind of computation we need (gluing algebra and combinatorics
   together), we have to be extra careful on the interface. Therefore, it is
   very common that we wait for a feature to be used several time before
   entering Sage. This is particularly true for infrastructure stuff.

 * Overview of what's developed by who

   Having a centralized place where all development is seen is a good
   tool for team coordination and code management. It also helps early
   detection of patch conflicts.

 * Sharing code with beginner colleagues

   The queue is also an easy way to distribute experimental code to non
   developer colleagues. The two commands

       * sage -combinat install 
       * sage -combinat update

   need no mercurial or developer skills

== What are our constraints == 

 * Vital necessity of supporting several versions of Sage at once
 * For the convenience of the user, it is usually possible to use the sage-combinat patches with older versions of sage. The intent is only to 
 temporarily support one or two older versions of sage (that is about one month old). Typical use case: a developer urgently needs the latest version of 
 a patch for a software demonstration at a conference, but can't instantly upgrade because of a slow internet connection. There is no guarantee 
 whatsoever; on occasion we do not support this when this causes technical difficulties.
 * By nature, our calculations are transversal. Thus it would be hard to split Sage-Combinat in smaller chunks by subareas.

== Some random questions ==

 * linear order versus DAG (directed acyclic graph) of dependencies: what's easier to maintain ?

== Foreseeable future ==

 * More contributors
 * Less overlap between patches as development goes from core to peripheral features
