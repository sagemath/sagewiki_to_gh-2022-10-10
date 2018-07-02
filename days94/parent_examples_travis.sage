


from sage.structure.category_object import normalize_names

class MyFreeAlgebraElement(CombinatorialFreeModule.Element):
    def _repr_(self):
        return ' + '.join(repr(c) + '*' + repr(m) for m,c in self)

class MyFreeAlgebra(CombinatorialFreeModule):
    def __init__(self, base_ring, names):
        names = normalize_names(-1, names)
        indices = FreeMonoid(len(names), names)
        cat = Algebras(base_ring).WithBasis()
        CombinatorialFreeModule.__init__(self, base_ring, indices, category=cat)

    def _repr_(self):
        return "Free algebra in variables {}".format(self.indices().variable_names())

    def product_on_basis(self, x, y):
        return self.monomial(x*y)

    def one_basis(self):
        return self.indices().one()

    def _coerce_map_from_(self, R):
        if isinstance(R, MyFreeAlgebra) and self.base_ring().has_coerce_map_from(R.base_ring()):
            if set(R.indices().variable_names()).issubset(self.indices().variable_names()):
                return R.module_morphism(self.monomial, codomain=self)
        return super(MyFreeAlgebra, self)._coerce_map_from_(R)

    #def one(self):
    #    return self.monomial(self.indices().one())

    def algebra_generators(self):
        I = self.indices()
        return Family({repr(g): self.monomial(g) for g in I.gens()})

    def gens(self):
        I = self.indices()
        G = self.algebra_generators()
        return tuple([G[name] for name in I.variable_names()])

    Element = MyFreeAlgebraElement

###############################################################################

from sage.structure.element import Element
from sage.structure.parent import Parent
from sage.structure.unique_representation import UniqueRepresentation
from sage.structure.richcmp import richcmp

class MyCustomFreeAlgebra(Parent, UniqueRepresentation):
    def __init__(self, base_ring, names):
        names = normalize_names(-1, names)
        cat = Algebras(base_ring).WithBasis()
        self._indices = FreeMonoid(len(names), names)
        Parent.__init__(self, base_ring, category=cat)

    def _repr_(self):
        return "Free algebra in variables {}".format(self._indices.variable_names())

    def _an_element_(self):
        return self.monomial(self._indices.an_element())

    def product_on_basis(self, x, y):
        return self.monomial(x*y)

    def one_basis(self):
        return self._indices.one()

    def one(self):
        return self.monomial(self.one_basis())

    def algebra_generators(self):
        I = self._indices
        return Family({repr(g): self.monomial(g) for g in I.gens()})

    def gens(self):
        I = self._indices
        G = self.algebra_generators()
        return tuple([G[name] for name in I.variable_names()])

    def _element_constructor_(self, x):
        if x in self.base_ring():
            return self.element_class(self, {self.one_basis(): x})
        return super(MyCustomFreeAlgebra, self)._element_constructor_(x)

    def monomial(self, x):
        one = self.base_ring().one()
        return self.element_class(self, {self._indices(x): one})

    class Element(Element):
        def __init__(self, parent, data):
            self._data = data
            Element.__init__(self, parent)

        def _repr_(self):
            return ' + '.join(repr(c) + '*' + repr(m) for m,c in self)

        def __iter__(self):
            return iter(self._data.items())

        def _richcmp_(self, other, op):
            return richcmp(self._data, other._data, op)

        def monomial_coefficients(self, copy=True):
            if copy:
                return dict(self._data)
            else:
                return self._data

        def _add_(self, other):
            d = dict(self._data)
            for m,c in other:
                if m in d:
                    d[m] += c
                else:
                    d[m] = c
                if d[m] == 0:
                    del d[m]
            return type(self)(self.parent(), d)

        def _sub_(self, other):
            d = dict(self._data)
            for m,c in other:
                if m in d:
                    d[m] -= c
                else:
                    d[m] = c
                if d[m] == 0:
                    del d[m]
            return type(self)(self.parent(), d)

        def _mul_(self, other):
            d = {}
            for ml,cl in self:
                for mr,cr in other:
                    m = ml * mr
                    c = cl * cr
                    if m in d:
                        d[m] += c
                    else:
                        d[m] = c
                    if d[m] == 0:
                        del d[m]
            return type(self)(self.parent(), d)

        def _acted_upon_(self, x, self_on_left=True):
            if x not in self.base_ring():
                return None
            d = dict(self._data)
            for k in d:
                d[k] *= x
            return type(self)(self.parent(), d)




