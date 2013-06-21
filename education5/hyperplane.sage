r"""
AUTHOR:
    -- David Perkinson (2013-6-21)

VERSION: -1

EXAMPLES: (see HArrangement, below)

#*****************************************************************************
#       Copyright (C) 2013 David Perkinson <davidp@reed.edu>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#                  http://www.gnu.org/licenses/
#*****************************************************************************
"""

class AffSpace():
    r"""
    Class for an affine space (a translation of a linear subspace).

    INPUT:

    - ``W`` -- vector space
    - ``p`` -- list representing a point in W

    OUTPUT:

    - AffSpace

    EXAMPLES:

        sage: a = AffSpace([1,0,0,0],VectorSpace(QQ,4))
        sage: a.dim()
        4
        sage: a.point()
        (1, 0, 0, 0)
        sage: a.linear_part()
        Vector space of dimension 4 over Rational Field
        sage: a
        Affine space p + W where:
           p = [1, 0, 0, 0]
           W = Vector space of dimension 4 over Rational Field.
        sage: b = AffSpace((1,0,0,0),matrix(QQ,[[1,2,3,4]]).right_kernel())
        sage: c = AffSpace((0,2,0,0),matrix(QQ,[[0,0,1,2]]).right_kernel())
        sage: b.intersection(c)
        Affine space p + W where:
           p = (-3, 2, 0, 0)
           W = Vector space of degree 4 and dimension 2 over Rational Field
        Basis matrix:
        [  1   0  -1 1/2]
        [  0   1  -2   1].
        sage: b < a
        True
        sage: c < b
        False
    """

    def __init__(self, p, V):
        self._linear_part = V
        self._point = vector(V.base_field(),p)

    def __repr__(self):
        return "Affine space p + W where:\n   p = "+str(self._point)+"\n   W = "+str(self._linear_part)+"."

    def __eq__(self, other):
        V = self._linear_part
        W = other._linear_part
        if V==W and self._point-other._point in V:
            return True
        else:
            return False

    def __ne__(self, other):
        return not self==other

    def __le__(self, other):
        V = self._linear_part
        W = other._linear_part
        if V.is_subspace(W) and self._point-other._point in W:
            return True
        else:
            return False

    def __lt__(self, other):
        if self<=other and not self==other:
            return True
        else:
            return False

    def __ge__(self, other):
        return other<=self

    def __gt__(self, other):
        return other<self

    def __contains__(self,q):
        return self._point - q in self._linear_part

    def linear_part(self):
        r"""
        The linear part of the affine space.

        INPUT:

        - None

        OUTPUT:

        - vector space

        EXAMPLES::

            sage: A = AffSpace([2,3,1], matrix(QQ,[[1,2,3]]).right_kernel()) 
            sage: A.linear_part()
            Vector space of degree 3 and dimension 2 over Rational Field
            Basis matrix:
            [   1    0 -1/3]
            [   0    1 -2/3]
        """
        return copy(self._linear_part)

    def point(self):
        r"""
        A point ``p`` in the affine space.

        INPUT:

        - None

        OUTPUT:

        - vector

        EXAMPLES::

            sage: A = AffSpace([2,3,1], VectorSpace(QQ,3))
            sage: A.point()
            (2, 3, 1)
        """
        return copy(self._point)

    def dim(self):
        r"""
        The dimension of the affine space.

        INPUT:

        - None

        OUTPUT:

        - Integer

        EXAMPLES::

            sage: a = AffSpace([1,0,0,0],VectorSpace(QQ,4))
            sage: a.dim()
            4
        """
        return self._linear_part.dimension()


    def intersection(self,other):
        r"""


        INPUT:

        -

        OUTPUT:

        -

        EXAMPLES::


        """
        m = self._linear_part.matrix()
        n = other._linear_part.matrix()
        p = self._point
        q = other._point
        A = m.stack(n)
        v = q-p
        if A.rank()!=(A.stack(v)).rank():
            return -1
        else:
            t = A.solve_left(v)
            new_p = p + t[:m.nrows()]*m
            new_V = self._linear_part.intersection(other._linear_part)
            return AffSpace(new_p,new_V)

    def isomorphism_with_Kn(self,v):
        p = self._point
        W = self._linear_part
        V = VectorSpace(W.base(),W.dimension())
        f = W.hom(V.gens())
        return f(v-p)


class Hyperplane(AffSpace):
    def __init__(self,H,K=QQ):
        r"""
        The argument `H` is a hyperplane, given as a list ``[a1,...an,a]``
        representing the equation ``a1x1 + ... + anxn = a``. An optional field,
        `K`, may also be provided.

        INPUT:

        - `H` -- list of integers representing a hyperplane
        - `K` -- field (default = `QQ`)

        OUTPUT:

        - Hyperplane

        EXAMPLES::

            sage: h = Hyperplane([1,3,2,2,8])
            sage: h
            Hyperplane over Rational Field
            (1, 3, 2, 2)*X = 8
        """
        m = matrix(K,H[:-1])
        p = m.solve_right(vector([H[-1]]))
        AffSpace.__init__(self,p,m.right_kernel())
        self._raw_data = H
        self._normal = vector(K,H[:-1])
        self._field = K

    def __repr__(self):
        return "Hyperplane over "+str(self._field)+"\n"+str(self._normal)+"*X = "+str(self._raw_data[-1])

    def equation(self,suppress_printing=False):
        if not suppress_printing:
            print str(self._field)+"\n"+str(self._normal)+"*X = "+str(self._raw_data[-1])
        return deepcopy(self._raw_data)

    def normal(self):
        return self._normal

    # orthogonalize target basis to get less distorted picture?
    # random color option?
    def show(self,r=None,**kwds):
        if r==None:
            r = 1
        if self.dim()==1: # so the dimension of the ambient space is 2
            p = self.point()
            w = self.linear_part().matrix()
            var('t')
            parametric_plot(p+t*w[0],(t,-r,r)).show(**kwds)
        elif self.dim()==2: # so the dimension of the ambient space is 3
            p = self.point()
            w = self.linear_part().matrix()
            var('s t')
            parametric_plot3d(p+s*w[0]+t*w[1],(s,-r,r),(t,-r,r)).show(**kwds)

    def plot(self,r=None,**kwds):
        if r==None:
            r = 1
        if self.dim()==1: # so the dimension of the ambient space is 2
            p = self.point()
            w = self.linear_part().matrix()
            var('t')
            return parametric_plot(p+t*w[0],(t,-r,r),**kwds)
        elif self.dim()==2: # so the dimension of the ambient space is 3
            p = self.point()
            w = self.linear_part().matrix()
            var('s t')
            return parametric_plot3d(p+s*w[0]+t*w[1],(s,-r,r),(t,-r,r),**kwds)

class HArrangement():

    def __init__(self,A,K=QQ,check_for_duplicates=True):
        r"""
        The argument `A` is a list of hyperplanes. Each hyperplane is given as a
        list ``[a1,...an,a]`` representing the equation ``a1x1 + ... + anxn =
        a``. An optional field, `K`, may also be provided.  Multiple copies of a
        hyperplane are not supported, and a check is performed by default to
        remove duplicates.

        INPUT:

        - `A` -- list
        - `K` -- field (default = QQ)
        - check_for_duplicates -- boolean

        OUTPUT:

        - HArrangement

        EXAMPLE::

            sage: A = HArrangement(([1,0,0],[2,1,5]))
            sage: A
            Hyperplane arrangement of 2 hyperplanes over Rational Field of dimension 2, rank 2.
            sage: C = B.essentialization()
            sage: B.characteristic_polynomial()
            x^4 - 6*x^3 + 11*x^2 - 6*x
            sage: C.characteristic_polynomial()
            x^3 - 6*x^2 + 11*x - 6
            sage: G = graphs.CycleGraph(4)
            sage: B = hyperplane_arrangements.graphical(G)
            sage: B.is_essential()
            False
            sage: C = B.essentialization()
            sage: B.characteristic_polynomial()
            x^4 - 4*x^3 + 6*x^2 - 3*x
            sage: G.chromatic_polynomial()
            x^4 - 4*x^3 + 6*x^2 - 3*x
            sage: C.characteristic_polynomial()
            x^3 - 4*x^2 + 6*x - 3
            sage: B.num_regions()
            14
            sage: C.num_regions()
            14
            sage: D = hyperplane_arrangements.semiorder(3)
            sage: D.is_essential()
            False
            sage: D.num_regions()
            19
            sage: D.num_bounded_regions()
            7
        """
        if hasattr(A,'Hrepresentation'):
            self._from_polytope = True  # test to see if there is a polytope for the arrangement?
            self._polytope = deepcopy(A)
            self._hrepresentation = A.Hrepresentation()
            self._raw_data = []
            for h in A.Hrepresentation():
                hh = list(h)
                self._raw_data.append(hh[1:]+[-hh[0]])
            A = self._raw_data
        else:
            self._from_polytope = False
            self._raw_data = A
        if check_for_duplicates:
            self._hyperplanes = []
            for h in A:
                H = Hyperplane(h,K)
                if any (H==k for k in self._hyperplanes)==False:
                    self._hyperplanes.append(H)
        else:
            self._hyperplanes = [Hyperplane(H,K) for H in A]
        self._base_field = K
        self._dim = len(A[0])-1
        self._ambient_space = VectorSpace(K,self._dim)

    def __getattr__(self, name):

        if not self.__dict__.has_key(name):
            if name == '_characteristic_polynomial':
                self._set_characteristic_polynomial()
                return deepcopy(self.__dict__[name])
            elif name == '_essentialization':
                self._set_essentialization()
                return self.__dict__[name]
            elif name == '_intersection_poset':
                self._set_intersection_poset()
                return deepcopy(self.__dict__[name])
            elif name == '_poincare_polynomial':
                self._set_poincare_polynomial()
                return deepcopy(self.__dict__[name])
            elif name == '_rank':
                self._set_rank()
                return self.__dict__[name]
            elif name == '_regions':
                self._set_regions()
                return self.__dict__[name]
            else:
                raise AttributeError, name

    def __repr__(self):
        return "Hyperplane arrangement of "+str(len(self._hyperplanes))+ " hyperplanes over "+str(self._base_field)+" of dimension "+str(self._dim)+", rank "+str(self.rank())+"."

    def hyperplanes(self):
        r"""
        Returns the hyperplanes of the arrangement.

        INPUT:

        - None

        OUTPUT:

        - list of Hyperplanes

        EXAMPLES::

            sage: H = HArrangement([[1,0,0],[0,1,1],[0,1,-1],[1,-1,0],[1,1,0]])
            sage: H.hyperplanes()
            [Hyperplane over Rational Field
            (1, 0)*X = 0,
             Hyperplane over Rational Field
            (0, 1)*X = 1,
             Hyperplane over Rational Field
            (0, 1)*X = -1,
             Hyperplane over Rational Field
            (1, -1)*X = 0,
             Hyperplane over Rational Field
            (1, 1)*X = 0]
        """
        return copy(self._hyperplanes)

    def cone(self):
        r"""
        NOTE: INCOMPLETE

        INPUT:

        - None

        OUTPUT:

        - hyperplane arrangement

        EXAMPLES::

            sage: HA.cone()
            Hyperplane arrangement of 3 hyperplanes over Rational Field of dimension 3, rank 3.
        """
        hyps = []
        for h in self.hyperplanes():
            new = h.equation(suppress_printing=True)
            new[-1] = -new[-1]
            new.append(0)
            hyps.append(new)
        hyps.append([0]*self.dim()+[1,0])
        return HArrangement(hyps,self.base_field())

    def dim(self):
        return self._dim

    def _set_rank(self):
        self._rank= matrix([list(H.normal()) for H in self._hyperplanes]).rank()

    def rank(self):
        return self._rank

    def has_good_reduction(self,p):
        raise UserWarning, 'not implemented'

    def is_essential(self):
        r"""
        Indicates whether the hyperplane arrangement is essential. A hyperplane
        arrangement is essential if the span of the normals of its hyperplanes
        spans the ambient space.

        INPUT:

        - None

        OUTPUT:

        - boolean

        EXAMPLES::

            sage: HArrangement([[1,0,0],[1,0,1]]).is_essential()
            False
        """
        r = matrix([list(H.normal()) for H in self._hyperplanes]).rank()
        return r==self._dim

    def _set_intersection_poset(self):
        ## initiate with codim = 0, K^n
        K = self.base_field()
        Kn = AffSpace(vector(K,[0 for i in
            range(self._dim)]),self._ambient_space)
        L = [[Kn]]
        active = True
        codim = 0
        while active:
            active = False
            new_level = []
            for T in L[codim]:
                for H in self._hyperplanes:
                    I = H.intersection(T)
                    if type(I)!=type(-1) and I!=T and I not in new_level:
                        new_level.append(I)
                        active = True
            if active:
                L.append(new_level)
            codim += 1
        L = flatten(L)
        t = {}
        for i in range(len(L)):
            t[i] = L[i]
        cmp_fn = lambda p,q: t[q]<t[p]
        self._intersection_poset = Poset((t,cmp_fn))

    def intersection_poset(self):
        return deepcopy(self._intersection_poset)

    def _set_characteristic_polynomial(self):
        #P = self._intersection_poset
        #n = self._dim
        #self._characteristic_polynomial = sum([P.mobius_function(0,p)*x^(n-P.rank(p)) for p in P])
        if self.rank()==1:
            self._characteristic_polynomial = x^(self.dim()-1)*(x-self.num_hyperplanes())
        else:
            H = self.hyperplanes()[0]
            R = self.restriction(H)
            r = R.characteristic_polynomial()
            D = self.deletion(H)
            d = D.characteristic_polynomial()
            self._characteristic_polynomial = expand(d - r)
            return

    def _set_poincare_polynomial(self):
        p = (-x)^self.dim()*self.characteristic_polynomial(-1/x)
        self._poincare_polynomial = expand(p)

    def change_base_field(self):
        raise UserWarning, 'not implemented'

    def characteristic_polynomial(self,a=None):
        if a==None:
            return self._characteristic_polynomial
        else:
            return self._characteristic_polynomial.subs(x=a)

    def poincare_polynomial(self,a=None):
        if a==None:
            return self._poincare_polynomial
        else:
            return self._poincare_polynomial.subs(x=a)

    def num_bounded_regions(self):
        r"""
        Returns the number of (relatively) bounded regions of the hyperplane
        arrangement as a subset of ``\mathbb{RR}``.

        INPUT:

        - None

        OUTPUT:

        - integer

        EXAMPLES::

            sage: A = hyperplane_arrangements.semiorder(3)
            sage: A.num_bounded_regions()
            7
        """
        if self.base_field().characteristic()!=0:
            raise UserWarning, 'base field must have characteristic zero'
        return (-1)^self.rank()*self.characteristic_polynomial(1)

    def num_regions(self):
        r"""
        Returns the number of regions of the hyperplane arrangement.

        INPUT:

        - None

        OUTPUT:

        - integer

        EXAMPLES::

            sage: A = hyperplane_arrangements.semiorder(3)
            sage: A.num_regions()
            19
        """
        if self.base_field().characteristic()!=0:
            raise UserWarning, 'base field must have characteristic zero'
        return (-1)^self._dim*self.characteristic_polynomial(-1)

    def num_hyperplanes(self):
        return len(self.hyperplanes())

    def ambient_space(self):
        r"""
        The ambient space of the hyperplane arrangement.

        INPUT:

        - None

        OUTPUT:

        - vector space

        EXAMPLES::

            sage: A = HArrangement([[1,0,0],[0,1,1],[0,1,-1],[1,-1,0],[1,1,0]])
            sage: A.ambient_space()
            Vector space of dimension 2 over Rational Field
        """
        return deepcopy(self._ambient_space)

    def base_field(self):
        r"""
        The base field of the hyperplane arrangement.

        INPUT:

        - None

        OUTPUT:

        - field

        EXAMPLES::

            sage: A = HArrangement([[1,0,0],[0,1,1],[0,1,-1],[1,-1,0],[1,1,0]])
            sage: A.base_space()
            Rational Field

	.. SEEALSO::

		:meth:`.change_base_field`
        """
        return self._base_field

    def deletion(self,h):
        r"""
        The hyperplane arrangement obtained by deleting `h` from the hyperplane arrangement.

        INPUT:

        - `h` -- Hyperplane

        OUTPUT:

        - HArrangement

        EXAMPLES::

	    sage: A = HArrangement([[1,0,0],[0,1,1],[0,1,-1],[1,-1,0],[1,1,0]])
	    sage: h = Hyperplane([1,0,0])
	    sage: A
	    Hyperplane arrangement of 5 hyperplanes over Rational Field of dimension 2, rank 2.
	    sage: A.deletion(h)
	    Hyperplane arrangement of 4 hyperplanes over Rational Field of dimension 2, rank 2.


	.. SEEALSO::

		:meth:`.restriction`
        """
        if h in self._hyperplanes:
            A = [k.equation(True) for k in self.hyperplanes()]
            A.remove(h._raw_data)
            return HArrangement(A,self.base_field())
        else:
            raise UserWarning, 'hyperplane is not in the arrangement'

    def _set_essentialization(self):
        r"""
        The essentialization of the hyperplane arrangement.  See the
        documentation for ``essentialization``.
        """
        if self.rank()==self.dim():
            raise UserWarning, 'already essential'
        else:
            n = [h.normal() for h in self._hyperplanes]
            N = self.ambient_space().subspace(n)
            # we need to be careful finding complementary spaces when the
            # characteristic is not 0
            if N.base_field().characteristic()!=0:
                m = N.echelonized_basis_matrix()
                c = [m.nonzero_positions_in_row(i)[0] for i in range(m.nrows())]
                new_basis = [self.ambient_space().basis()[i] for i in c]
                N = self.ambient_space().subspace(new_basis)
            V = VectorSpace(self.base_field(),N.dimension())
            N = AffSpace(vector([0]*self.dim()),N)
            new_hyperplanes = []
            for h in self.hyperplanes():
                I = h.intersection(N)
                basis = I.linear_part().matrix()
                p = N.isomorphism_with_Kn(I.point())
                new_basis = matrix(self.base_field(),[N.isomorphism_with_Kn(b) for b in basis])
                if new_basis.nrows()==0:
                    eqn = [1,p[0]]
                else:
                    eqn = new_basis.right_kernel_matrix()[0]
                    q = [eqn*p]
                    eqn = list(eqn)+q
                new_hyperplanes.append(eqn)
            self._essentialization = HArrangement(new_hyperplanes,self.base_field())

    def essentialization(self):
        r"""
        The essentialization of a hyperplane arrangement.  If the characteristic
        of the base field is 0, this returns the hyperplane arrangement obtained
        by intersecting the hyperplanes by the space spanned by their normal
        vectors.

        INPUT:

        - None

        OUTPUT:

        - HArrangement

        EXAMPLES::

	    sage: A = hyperplane_arrangements.braid(3)
	    sage: A.is_essential()
	    False
	    sage: A.essentialization()
	    Hyperplane arrangement of 3 hyperplanes over Rational Field of dimension 2, rank 2.
	    sage: B = HArrangement([[1,0,1],[1,0,-1]])
	    sage: B.is_essential()
	    False
	    sage: B.essentialization()
	    Hyperplane arrangement of 2 hyperplanes over Rational Field of dimension 1, rank 1.
	    sage: B.essentialization().hyperplanes()
	    [Hyperplane over Rational Field
	    (1)*X = 1,
	     Hyperplane over Rational Field
	    (1)*X = -1]
            sage: C = HArrangement([[1,1,1],[1,1,0]],GF(2))
            sage: C.essentialization().hyperplanes()
            [Hyperplane over Finite Field of size 2
            (1)*X = 1,
             Hyperplane over Finite Field of size 2
            (1)*X = 0]
        """
        return self._essentialization

    def polytope(self):
        if self._from_polytope:
            return deepcopy(self._polytope)

    def _set_regions(self):
        r"""
        Computes the regions of the hyperplane arrangement.  See the
        documentation for ``regions``.
        """
        if self.base_field().characteristic()!=0:
            raise UserWarning, 'base field must have characteristic zero'
        result = []
        num = self.num_hyperplanes()
        h = [i.equation(suppress_printing=True) for i in self.hyperplanes()]
        for pos in powerset(range(num)):
            q = []
            for i in range(num):
                if i in pos:
                    new = [-h[i][-1]]+h[i][:-1]
                    q.append(new)
                else:
                    new = [h[i][-1]]+[-t for t in h[i][:-1]]
                    q.append(new)
            P = Polyhedron(ieqs=q)
            if P.dim()==self.dim():
                result.append(P)
        self._regions = result

    def regions(self):
        r"""
        The regions of the hyperplane arrangement, i.e., the connected components of the
        complement of the union of the hyperplanes as a subset of `\mathbb{R}^n`.

        INPUT:

        - None

        OUTPUT:

        - a list of polyhedra

        EXAMPLES::

            sage: A = HArrangement([[1,0,0],[0,1,1]])
            sage: A.regions()
            [[A 2-dimensional polyhedron in QQ^2 defined as the convex hull of 1 vertex and 2 rays],
            [A 2-dimensional polyhedron in QQ^2 defined as the convex hull of 1 vertex and 2 rays],
            [A 2-dimensional polyhedron in QQ^2 defined as the convex hull of 1 vertex and 2 rays],
            [A 2-dimensional polyhedron in QQ^2 defined as the convex hull of 1 vertex and 2 rays]]
        """
        return self._regions

    def region_containing_point(self,p):
        r"""
        The region in the hyperplane arrangement containing a given point.

        INPUT:

        - a point

        OUTPUT:

        - a polyhedron

        EXAMPLES::

            sage: A = HArrangement([[1,0,0],[0,1,1],[0,1,-1],[1,-1,0],[1,1,0]])
            sage: A.region_containing_point((1,2))
            A 2-dimensional polyhedron in QQ^2 defined as the convex hull of 2 vertices and 2 rays
        """
        if self.base_field().characteristic()!=0:
            raise UserWarning, 'base field must have characteristic zero'
        h = [i.equation(suppress_printing=True) for i in self.hyperplanes()]
        q = []
        sign_vector = self.sign_vector(p)
        if 0 in sign_vector:
            raise UserWarning, 'point sits on a hyperplane'
            return
        for i in range(self.num_hyperplanes()):
            if sign_vector[i]==1:
                new = [-h[i][-1]]+h[i][:-1]
                q.append(new)
            else:
                new = [h[i][-1]]+[-t for t in h[i][:-1]]
                q.append(new)
        return Polyhedron(ieqs=q)

    def sign_vector(self,p):
        r"""
        Sign_vector indicates on which side of each hyperplane the given point `p` lies.

        INPUT:

        - point

        OUTPUT:

        - vector

        EXAMPLES::

            sage: A = HArrangement([[1,0,0],[0,1,1]])
            sage: A.sign_vector((2,-2))
            [1, -1]
            A.sign_vector((1,1))
            [1, 0]
        """
        if self.base_field().characteristic()!=0:
            raise UserWarning, 'characteristic must be zero'
        else:
            p = vector(p)
            eqns = [i.equation(suppress_printing=True) for i in self.hyperplanes()]
            return [sign(p*vector(e[:-1])-e[-1]) for e in eqns]

    def restriction(self,H):
        r"""
        The restriction of the hyperplane arrangement to the given hyperplane, `H`.
        This is obtained by intersecting  `H` with all of the other distinct
        hyperplanes.  The hyperplane `H` must be in the arrangement.


        INPUT:

        - a Hyperplane

        OUTPUT:

        - an HArrangement

        EXAMPLES::

	    sage: A = hyperplane_arrangements.braid(4)
	    sage: H = A.hyperplanes()[0]
	    sage: H
	    Hyperplane over Rational Field
	    (1, -1, 0, 0)*X = 0
	    sage: R = A.restriction(H)
	    sage: D = A.deletion(H)
	    sage: ca = A.characteristic_polynomial()
	    sage: cr = R.characteristic_polynomial()
	    sage: cd = D.characteristic_polynomial()
	    sage: ca
	    x^4 - 6*x^3 + 11*x^2 - 6*x
	    sage: cd - cr
	    x^4 - 6*x^3 + 11*x^2 - 6*x

	.. SEEALSO::

		:meth:`.deletion`
        """
        if H not in self.hyperplanes():
            raise UserWarning, 'hyperplane not in arrangement'
        else:
            new_hyperplanes = []
            for T in self.hyperplanes():
                if T!=H:
                    I = H.intersection(T)
                    if type(I)!=Integer and I not in new_hyperplanes:
                        new_hyperplanes.append(I)
        final_hyperplanes = []
        for T in new_hyperplanes:
            basis = T.linear_part().matrix()
            p = H.isomorphism_with_Kn(T.point())
            if basis.nrows()==0:
                eqn = [1] + list(p)
            else:
                new_basis = matrix(self.base_field(),[H.isomorphism_with_Kn(b+H.point())
                    for b in basis])
                eqn = new_basis.right_kernel_matrix()[0]
                q = list(eqn*p)
                eqn = list(eqn)+q
            final_hyperplanes.append(eqn)
        return HArrangement(final_hyperplanes,self.base_field())

    def show(self,r=None,**kwds):
        if r==None:
            r = 1
        if self.dim()==2 or self.dim()==3: # so the dimension of the ambient space is 3
            sum([h.plot(r) for h in self.hyperplanes()]).show(**kwds)

    def union(self,A):
        r"""
        The union of one HArrangement with another.

        INPUT:

        - `A` -- HArrangement

        OUTPUT:

        - HArrangement

        EXAMPLES::

            sage: A = HArrangement([[1,0,0],[0,1,1],[0,1,-1],[1,-1,0],[1,1,0]])
            sage: B = HArrangement([[1,1,1],[1,-1,1],[1,0,-1]])
            sage: A.union(B)
	    Hyperplane arrangement of 8 hyperplanes over Rational Field of dimension 2, rank 2.
        """
        hyps = [i.equation(true) for i in self.hyperplanes()] + [i.equation(true)
                for i in A.hyperplanes()]
        return HArrangement(hyps,self.base_field())

# Idea: calculate characteristic polynomials and set
# self._characteristic_polynomial while constructing the special hyperplane
# arrangement.  Also set poset?
class HArrangementGenerators():

    def semiorder(self,n,K=QQ):
        r"""
        The semiorder arrangement is the set of `n(n-1)` hyperplanes: `\{ x_i - x_j = -1,1 : 1\leq i \leq j\leq n\}.`

        INPUT:

        - `n` -- integer
        - `K` (default `QQ`)

        OUTPUT:

        - HArrangement

        EXAMPLES::

            sage: hyperplane_arrangements.semiorder(4)
            Hyperplane arrangement of 12 hyperplanes over Rational Field of dimension 4, rank 3.
        """
        hyperplanes = []
        for i in range(n):
            for j in range(i+1,n):
                new = [0]*n
                new[i] = 1
                new[j] = -1
                for k in [-1,1]:
                    h = deepcopy(new)
                    h.append(k)
                    hyperplanes.append(h)
        return HArrangement(hyperplanes,K)

    def Shi(self,n,K=QQ):
        r"""
        The Shi arrangement is the set of `n(n-1)` hyperplanes: `\{ x_i - x_j = 0,1 : 1\leq i \leq j\leq n\}.`

        INPUT:

        - `n` -- integer

        OUTPUT:

        - HArrangement

        EXAMPLES::

            sage: hyperplane_arrangements.Shi(4)
            Hyperplane arrangement of 12 hyperplanes over Rational Field of dimension 4, rank 3.
        """
        hyperplanes = []
        for i in range(n):
            for j in range(i+1,n):
                new = [0]*n
                new[i] = 1
                new[j] = -1
                for k in [0,1]:
                    h = deepcopy(new)
                    h.append(k)
                    hyperplanes.append(h)
        return HArrangement(hyperplanes,K)

    def Catalan(self,n,K=QQ):
        r"""
        The Catalan arrangement is the set of `3n(n-1)/2` hyperplanes: `\{ x_i - x_j = -1,0,1 : 1\leq i \leq j\leq n\\}.`

        INPUT:

        - `n` -- integer

        OUTPUT:

        - HArrangement

        EXAMPLES::

            sage: hyperplane_arrangements.Catalan(5)
            Hyperplane arrangement of 30 hyperplanes over Rational Field of dimension 5, rank 4.
        """
        hyperplanes = []
        for i in range(n):
            for j in range(i+1,n):
                new = [0]*n
                new[i] = 1
                new[j] = -1
                for k in [-1,0,1]:
                    h = deepcopy(new)
                    h.append(k)
                    hyperplanes.append(h)
        Cn = HArrangement(hyperplanes,K)
        Cn._characteristic_polynomial = expand(x*prod([x-n-i for i in range(1,n)]))
        return Cn

    def coordinate(self,n,K=QQ):
        r"""
        The coordinate hyperplane arrangement is the central hyperplane arrangement consisting of the coordinate hyperplanes `x_i=0`.

        INPUT:

        - `n` -- integer

        OUTPUT:

        - HArrangement

        EXAMPLES::

            sage: hyperplane_arrangements.coordinate(5)
            Hyperplane arrangement of 5 hyperplanes over Rational Field of dimension 5, rank 5.
        """
        hyperplanes = []
        for i in range(n):
            new = [0]*(n+1)
            new[i]=1
            hyperplanes.append(new)
        return HArrangement(hyperplanes,K)

    def graphical(self,G,K=QQ):
        hyperplanes = []
        n = G.num_verts()
        for e in G.edges():
            i = G.vertices().index(e[0])
            j = G.vertices().index(e[1])
            new = [0]*(n+1)
            new[i] = 1
            new[j] = -1
            hyperplanes.append(new)
        A = HArrangement(hyperplanes,K)
        A._characteristic_polynomial = G.chromatic_polynomial()
        return A

    def braid(self,n,K=QQ):
        r"""
        The braid arrangement is the set of `n(n-1)/2` hyperplanes: `\{ x_i - x_j = 0 : 1\leq i \leq j\leq n\\}.`

        INPUT:

        - `n` integer

        OUTPUT:

        - HArrangement

        EXAMPLES::

            sage: hyperplane_arrangements.braid(4)
            Hyperplane arrangement of 6 hyperplanes over Rational Field of dimension 4, rank 3.
        """
        A = self.graphical(graphs.CompleteGraph(n),K)
        A._characteristic_polynomial = expand(prod(x-i for i in range(n)))
        return A

    def G_Shi(self,G,K=QQ):
        hyperplanes = []
        n = G.num_verts()
        for e in G.edges():
            i = G.vertices().index(e[0])
            j = G.vertices().index(e[1])
            new = [0]*(n+1)
            new[i] = 1
            new[j] = -1
            hyperplanes.append(new)
            new = deepcopy(new)
            new[-1]=1
            hyperplanes.append(new)
        return HArrangement(hyperplanes,K)

    def G_semiorder(self,G,K=QQ):
        hyperplanes = []
        n = G.num_verts()
        for e in G.edges():
            i = G.vertices().index(e[0])
            j = G.vertices().index(e[1])
            new = [0]*(n+1)
            new[i] = 1
            new[j] = -1
            new[-1] = -1
            hyperplanes.append(new)
            new = deepcopy(new)
            new[-1]=1
            hyperplanes.append(new)
        return HArrangement(hyperplanes,K)

    def G_arrangement(self,G,A=None,K=QQ):
        r"""
        A - None (semiorder), 'generic'
        """
        n = G.num_verts()
        if A==None:  #default to G-semiorder arrangement
            A = matrix(K,n,lambda i,j: 1)
        elif A=='generic':
            A = random_matrix(ZZ,n,x=10000)
            A = matrix(K,A)
        hyperplanes = []
        for e in G.edges():
            i = G.vertices().index(e[0])
            j = G.vertices().index(e[1])
            new = [0]*(n+1)
            new[i] = 1
            new[j] = -1
            new[-1] = A[i,j]
            hyperplanes.append(new)
            new = [0]*(n+1)
            new[j] = 1
            new[i] = -1
            new[-1] = A[j,i]
            hyperplanes.append(new)
        return HArrangement(hyperplanes,K)

hyperplane_arrangements = HArrangementGenerators()
harrangements = HArrangementGenerators()

# idea: store information about some of these hyperplanes

def repr_point(P,scale=1):
    c = P.center()
    if P.n_rays()==0:
        return c
    else:
        r = sum([vector(QQ,i) for i in P.rays()])
        return c + scale*r/r.norm()
