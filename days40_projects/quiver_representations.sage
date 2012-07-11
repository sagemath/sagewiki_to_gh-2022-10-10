"""

.. TODO::

   - Refactor Quiver to handle paths with names on the edges, toward
     multiple edges. Use a list of edge names instead of nodes for the
     repr of paths.

   - Refactor path algebras of quivers to handle those.

   - Merge Cluster's quivers with those from Jim Stark's patch #12630?
     which implements acyclic free path algebras, hom, homsets.

Basic quiver manipulations
==========================

    sage: c = Quiver(["A",4])
    sage: c = Quiver([[... some digraph data ...]])

    sage: c.path_algebra(QQ)

    sage: c.shortest_paths()   # find a good name
    ... kind of describes the minimal cycles of the quiver ...


Representation theory
=====================

In case we want to separate representations from quiver:

    sage: R = c.representations(QQ, side="right"); R
    The category of representations of c over Rational Field
    sage: R.<tab>
    sage: R.simple_modules()

Otherwise:

    sage: R = c

The projective modules, and variants::

    sage: P = R.projective_indecomposable_modules(QQ)
    A family of quiver representations
    sage: P.keys()
    ... the nodes of the quiver ...

    sage: R.simple_modules()
    ...
    sage: R.injective_indecomposable_modules()  (or just injective_modules)
    ...

Manipulating modules
--------------------

    sage: V = P[i];V    # i is some node of the quiver
    A quiver representation (typically represented internally by the
    representation matrix of each quiver edge on each module).

    sage: V.dimension_vector()
    [...] the dimensions of the vector spaces

    sage: V.dimension()
    the sum of the above

    sage: V.is_exceptional()

    sage: v = V.an_element()
    ... internal representation: a list of vector ...

    sage: W = V.submodule([v])
    Returns the submodule spanned by v

Quotients / factors::

    sage: V.factor(W)      # Peter has a slight preference for this guy
    sage: V.quotient(W)    # synonym: V.quo(W)
    sage: V/W

Arithmetic on representations::

    sage: tensor([V, W, V])
    A quiver representation
    sage: direct_sum([W, W, V, V])    # or cartesian_product
    ...

    sage: V.radical()
    sage: V.socle()
    sage: V.top()     V.semisimple_quotient()

Decompose a module into direct sums::  # implemented by Peter for reps of categories

    sage: V.decomposition()    V.indecomposable_summands() ?
    ...

    sage: V.composition_factors()   # This is not so interesting in the case of a representation of a quiver!!!
    ... the dimension vector ...

    sage: W.images(V)
    ... returns the direct sum of all isomorphic copies ov V in W ...

Characters (not that relevant in the context of representations of a quiver)::

    sage: V.character()

    sage: R.grothendieck_group()

Homomorphisms:
--------------

    sage: H = Hom(V,W)
    sage: h = H.an_element()
    sage: h.kernel()
    ... a quiver module ...
    sage: h.image_set()       / h.image()
    ... a quiver module ...

Ext groups:
-----------

    sage: Ext(V, W, degree)
    sage: Ext(V, W)
    The family of all Ext(V, W, k), k>=0
    sage: Ext(V, W, 0)
    Returns Hom(V, W)

one can further specify a category:

    sage: Ext(V, W, category=...)

internally this would call::

    sage: V._Ext_(W,degree)

    sage: V.global_dimension()
    sage: V.is_quasi_hereditary()

    sage: V.projective_resolution(minimal = False)

Nakayama functor::

    sage: V.dual()
    a module for the dual quiver

    sage: Hom(V, A, category=R)
    returns a module for the dual quiver

    sage: V.nakayama()   -> returns something isomorphic to Hom(V, A, category=R).dual(), hopefuly with better algorithms
    returns a new module

Auslander-Reiten quiver

    sage: R.auslander_reiten_quiver()
    In general: some very very lazy object on which we would compute some pieces

"""

class Quiver:
    """

    Internal representation: a digraph

    """

class QuiverRepresentation(Parent):  # discuss with John to see how this was done for chain complexes
    """

        sage: R = quiver.representations(QQ, side="left")
        sage: r = R.simple_modules()[1]    /  simple_representations() ???
        sage: r.category()   # ideally; for the moment can be just Modules(QQ)
        ... R ...
        sage:
    """

class QuiverWithRelationsRepresentations(Category):
    """
    Main job: delegate work to QPA
    """

    class SubcategoryMethods:
        def simple_modules(self):
            """
            """

class QuiverRepresentations(Category):
    """
    A subcategory of QuiverWithRelationsRepresentations
    """


class AcyclicQuiverRepresentations(Category):
    """
    subcategory of QuiverRepresentations
    """

