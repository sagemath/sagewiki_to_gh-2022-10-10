#format text_markdown

# On development workflows for (experimental) code sharing

One core aim of Sage (and subprojects like Sage-manifolds,
Sage-Combinat, Sage-Words, ...)  is to improve the open source
mathematical system \texttt{Sage} as an extensible toolbox for
computer exploration (in geometry, algebraic and enumerative
combinatorics, combinatorics on words, etc), and foster code sharing
between researchers in those areas.

Over the years, many development workflows have been experimented
with; the goal of this document is to discuss them toward recommending
best practice.

Specifically, the objectives of a development workflow are:

1.  Support fast paced development within a group of researchers
    working on the same topic, or needing similar features.

2.  Support rapid and modular dissemination of experimental features

    Typical needs:

    - Using, for a given calculation, experimental features from
      different areas, developped by different groups of people

    - Getting the latest version of a feature, without having to
      upgrade all of Sage (e.g. just before delivering a talk!!!)

    This is important to get early feedback on the code.

3.  Foster high quality code by promoting documentation, tests, code reviews

4.  Foster intrinsic high quality code by providing an ecosystem where
    (experimental) code can live, compete with other implementations,
    mature and be selected or die, all at a fine granularity.

5.  Strike a balance between the risks of code-bloat and of code death

6.  Minimize maintenance overhead, and in particular code rotting

7.  Remain flexible between the all-in-one versus packages development models
    (simplifying things out: between Sage's model and GAP's model)

8.  Promote extending existing Sage classes and modules with additional features.

    This eases feature discovery by users (things are at their
    expected place) and enable transparent migration of the code
    inside the Sage library if and when desired (no need to change the
    code itself, nor code using it). This also promotes coherent
    coding standards.

    Note: subclassing is not always an option to extend a class,
    e.g. when a feature is to be added to an abstract base class of
    many concrete classes (subclassing each and every concrete class
    would be a pain)

    See also the related:
    - http://www.csd.uwo.ca/~watt/pub/reprints/2006-dsal-postfacto.pdf
    - https://en.wikipedia.org/wiki/Extension_method
    - https://en.wikipedia.org/wiki/Monkey_patch

## Direct integration into Sage

In this workflow, sharing a feature goes by integrating it into Sage.

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

## Patch queue as used by Sage-Combinat between 2009 and 2013

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


## Experimental feature branches

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

## Using (pip) packages

Pros:
- Good for 1., 2., 4.,

Cons:
- Risk of code rotting or death
- Handling of compatibility with various versions of the dependencies (in particular Sage)

## Using (pip) packages with an integration mission

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
- Same as for usual (pip) packages
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
