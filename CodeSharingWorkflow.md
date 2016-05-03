{{{#!rst

= On development workflows for sharing (experimental) code =

One core aim of Sage is to foster code sharing, and encourage groups
of researchers, teachers, and other users to get together to develop
new features they need either on top of or within Sage, and share
them.

Over the years, many development workflows have been experimented by
various groups of people to improve Sage in certain areas, like
Sage-Combinat for (algebraic) combinatorics, Sage-Words for
combinatorics on words, Sage-manifolds for differential geometry,
purple-sage for number theory, ...

The goal of this document is to discuss the different workflow that
have been tried, their pros and cons, to share best practices and
brainstorm about what support and recommendations Sage could provide
for various use cases.

At this point it's a collection of notes by N. Thiéry; please hack in and contribute your own vision!

== Objectives of a development workflow ==

Specifically, the objectives of a development workflow can be to:

1.  Support *fast paced development* within a group of users working on
    the same topic, or needing similar features.

2.  Support *rapid dissemination of experimental features*

    The goal is simultaneously to support users, and to get early
    feedback on the code.

    Typical needs:

    - Using, for a given calculation, experimental features from
      different areas, developped by different groups of people

    - Getting the latest version of a feature, without having to
      upgrade all of Sage (e.g. just before delivering a talk!!!)

    - Feature discovery: increasing the chances for someone to
      discover that a given feature is being implemented somewhere.

3.  Foster high quality code by promoting documentation, tests, code reviews

4.  Foster intrinsic high quality code by providing an *ecosystem*
    where (experimental) code can live, compete with other
    implementations, mature and be selected or die, all at a fine
    granularity.

5.  Strike a balance between centralized and decentralized.

    In particular mitigate the risks of code-bloat of the Sage library
    versus the risks of death of code lying out somewhere on the web.

6.  Minimize *maintenance* overhead, and in particular code rotting

7.  Remain flexible between the all-in-one versus packages development models
    (simplifying things out: between Sage's model and GAP's model)

8.  Promote extending existing Sage classes and modules with additional features.

    This eases dynamic feature discovery by users (once installed,
    things are at their usual place) and enable transparent migration
    of the code inside the Sage library if and when desired (no need
    to change the code itself, nor code using it). This also promotes
    coherent coding standards.

    Note: subclassing is not always an option to extend a class,
    e.g. when a feature is to be added to an abstract base class of
    many concrete classes (subclassing each and every concrete class
    would be a pain)

    See also the related:
    - http://www.csd.uwo.ca/~watt/pub/reprints/2006-dsal-postfacto.pdf
    - https://en.wikipedia.org/wiki/Extension_method
    - https://en.wikipedia.org/wiki/Monkey_patch

== Existing workflows ==

=== Direct integration into Sage ===

In this workflow, each feature is shared by integrating it directly into Sage.

Pros:

- Simplicity for the user: all stable features are directly available in Sage

- Simplicity for Sage developers: no additional workflow to learn, no
  need to worry about distribution

- Promote early integration of code and 3.

- 8. is straightforward

Cons:

- Limited support for 2.

- Slows down the development: once a feature is in Sage, any change
  needs to be reviewed, refactoring of the public API requires taking
  care of backward compatibility. No good for 4.

- Getting the latest feature forces updating to the latest version of Sage

- Introduces a bias toward code bloat (in doubt, features tend to be added to Sage)

=== Experimental feature branches ===

Pros:

- 8. is straightforward
- Encourages integration into Sage
- Development history is automatically kept upon integration into Sage

Cons:

- Branch needs to be regularly updated to prevent code rotting due to
  syntactical conflicts with changes in Sage (though automatic merges help).
- 2. requires basic git knowledge from end-users.
- Lack of modularity for 2.: due to potential conflicts, it's not easy
  to combine features from several branches; upgrading to the latest
  version of a branch often forces a change of version of Sage
- Cherry picking certain mature features for integration in Sage is
  somewhat cumbersome (the granularity of branches and commits is
  orthogonal to the granularity of features).
- It's hard to strike the right granularity in terms of feature /
  feature set. We tried dependency tracking among branches as a way to
  build feature sets out of features, but this did not work well.
- Because of the above, this workflow does not work well for 4.
- Introduces a bias toward the all-in-one development model.

=== Patch queue as used by Sage-Combinat between 2009 and 2013 ===

See also the following [[combinat/CodeSharingWorkflow|design notes about the Sage-Combinat workflow]].

TODO: description

Pros:

- Relatively good for 1. (except for 6.)
- Relatively good for 2. (thanks to "sage -combinat install"), except
  for modularity and requiring some Sage recompilation
- 8. is straightforward

Cons:

- Complexity of working at the meta level (version control on the patches)
- Really bad at 6: Horrible maintenance overhead due to syntactic conflicts and lack of automatic merging
- Introduces a strong bias toward code death, or at least non integration into Sage
- Monolithic: one could not use several patch queues at once, so this
  did not support overlaping groups of people working on different
  topics; this introduced a non-natural barrier between Sage-Combinat
  and the rest of the world, and prevented rapid reconfiguration of
  projects around topics and groups of developers

=== Using (pip) packages ===

Here the idea is to implement feature sets as independent Python
packages on top of Sage. Converting a bunch of Python files into such
a package, and making it easy to install is easy with e.g. pip:

https://python-packaging.readthedocs.io/en/latest/minimal.html

Pros:
- Good for 1., 2., 4.,

Cons:
- Handling of compatibility with various versions of the dependencies (in particular Sage)
- Risk of code rotting (as Sage evolves over time) or death (if it's not maintained)

=== Using (pip) packages with an integration mission ===

This is a variant on the previous development workflow, with an
explicit focus on easing (or even promoting) the integration of mature
code into Sage.

Specific steps:

- layout the code as in the Sage library, with top module called
  sage-blah instead of sage, and use *recursive monkey patching*
  (TODO: make a pip package for this, and add a link here) to insert
  all this code dynamically in the Sage library.

  The effect is to patch the Sage library, as with branches or patch
  queues; however this is done at the granularity of methods rather
  than lines in the source code.

Pros:

- Same as above

- 8. is straightforward

- Lighter maintenance overhead compared to branches or patch queues:
  one only needs to take care of semantic conflicts, not syntactic
  ones.

- The integration of mature code into Sage helps for 3 and for the
  maintenance as well: keeping the library as a "small layer" over
  Sage reduces the risks of irreversibly drifting away, and reduces
  the amount of updating.

- Depending on how strongly one pushes toward the integration of
  mature code, one can flexibly interpolate between the all-in-one
  model and the package model
}}}
