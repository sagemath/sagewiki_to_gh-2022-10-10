r"""
Quiver

A *quiver* is an oriented graphs without loops, two-cycles, or multiple edges. The edges are labelled by pairs `(i,-j)`
such that the matrix `M = (m_{ab})` with `m_{ab} = i, m_{ba} = -j` for an edge `(i,-j)` between vertices `a` and `b` is skew-symmetrizable.

For the compendium on the cluster algebra and quiver package see

http://arxiv.org/abs/1102.4844

AUTHORS:

- Gregg Musiker
- Christian Stump
"""

#*****************************************************************************
#       Copyright (C) 2011 Gregg Musiker <musiker@math.mit.edu>
#                          Christian Stump <christian.stump@univie.ac.at>
#                     2012 Franco Saliola < ... >
#
#  Distributed under the terms of the GNU General Public License (GPL)
#                  http://www.gnu.org/licenses/
#*****************************************************************************
from sage.structure.sage_object import SageObject
from copy import copy
from sage.interfaces.gap import gap
from sage.structure.unique_representation import UniqueRepresentation
from sage.misc.all import cached_method
from sage.rings.all import ZZ, QQ, CC, infinity
from sage.graphs.all import Graph, DiGraph
from sage.combinat.cluster_algebra_quiver.all import QuiverMutationType, QuiverMutationType_Irreducible, QuiverMutationType_Reducible
from sage.combinat.cluster_algebra_quiver.mutation_class import _edge_list_to_matrix, _principal_part, _digraph_mutate, _matrix_to_digraph, _mutation_class_iter, _dg_canonical_form, _digraph_to_dig6
from sage.combinat.cluster_algebra_quiver.mutation_type import _connected_mutation_type, _mutation_type_from_data
from sage.combinat.graph_path import GraphPaths
from sage.groups.perm_gps.permgroup import PermutationGroup
from sage.sets.family import Family
from sage.combinat.free_module import CombinatorialFreeModule
from sage.misc.lazy_attribute import lazy_attribute
from sage.categories.finite_dimensional_algebras_with_basis import FiniteDimensionalAlgebrasWithBasis

class Quiver(SageObject):
    """
    The *quiver* associated to an *exchange matrix*.

    INPUT:

    - ``data`` -- can be any of the following::

        * QuiverMutationType
        * str - a string representing a QuiverMutationType
        * Quiver
        * Matrix - a skew-symmetrizable matrix
        * DiGraph - must be the input data for a quiver
        * List of edges - must be the edge list of a digraph for a quiver

    EXAMPLES::

        sage: Q = Quiver(['A',5]); Q
        Quiver on 5 vertices of type ['A', 5]

        sage: Q = Quiver(['A',[2,5],1]); Q
        Quiver on 7 vertices of type ['A', [2, 5], 1]

        sage: T = Quiver( Q ); T
        Quiver on 7 vertices of type ['A', [2, 5], 1]

        sage: T = Quiver( Q._M ); T
        Quiver on 7 vertices

        sage: T = Quiver( Q._digraph ); T
        Quiver on 7 vertices

        sage: T = Quiver( Q._digraph.edges() ); T
        Quiver on 7 vertices
    """
    def __init__( self, data, frozen=0 ):
        """
        TESTS::

            sage: Q = Quiver(['A',4])
            sage: TestSuite(Q).run()
        """
        from cluster_seed import ClusterSeed
        from sage.matrix.matrix import Matrix

        # constructs a quiver from a mutation type
        if type( data ) in [QuiverMutationType_Irreducible,QuiverMutationType_Reducible]:
            if frozen:
                print 'The input data is a quiver, therefore the additional parameter frozen is ignored.'

            mutation_type = data
            self.__init__( mutation_type.standard_quiver() )

        # constructs a quiver from string representing a mutation type
        elif type( data ) in [list,tuple] and ( type( data[0] ) is str or all(type( comp ) in [list,tuple] and type( comp[0] ) is str for comp in data) ):
            if frozen:
                print 'The input data is a quiver, therefore the additional parameter frozen is ignored.'
            mutation_type = QuiverMutationType( data )
            self.__init__( mutation_type.standard_quiver() )

        # constructs a quiver from a quiver
        elif type(data) is ClusterSeed:
            self.__init__( data.quiver() )

        # constructs a quiver from a quiver
        elif type(data) is Quiver:
            if frozen:
                print 'The input data is a quiver, therefore the additional parameter frozen is ignored.'

            self._M = copy(data._M)
            self._n = data._n
            self._m = data._m
            self._digraph = copy( data._digraph )
            self._mutation_type = data._mutation_type
            self._description = data._description

        # constructs a quiver from a matrix
        elif isinstance(data, Matrix):
            if not _principal_part(data).is_skew_symmetrizable( positive=True ):
                raise ValueError, 'The principal part of the matrix data must be skew-symmetrizable.'
            if frozen:
                print 'The input data is a matrix, therefore the additional parameter frozen is ignored.'

            self._M = copy(data).sparse_matrix()
            self._n = n = self._M.ncols()
            self._m = m = self._M.nrows() - self._n
            self._digraph = _matrix_to_digraph( self._M )
            self._mutation_type = None
            if n+m == 0:
                self._description = 'Quiver without vertices' %(n+m)
            elif n+m == 1:
                self._description = 'Quiver on %d vertex' %(n+m)
            else:
                self._description = 'Quiver on %d vertices' %(n+m)

        # constructs a quiver from a digraph
        elif type(data) is DiGraph:
            m = self._m = frozen
            n = self._n = data.order() - m
            dg = copy( data )
            if not set(dg.vertices()) == set(range(n+m)):
                dg.relabel()
            if dg.has_multiple_edges():
                multi_edges = {}
                for v1,v2,label in dg.multiple_edges():
                    if label not in ZZ:
                        raise ValueError, "The input DiGraph contains multiple edges labeled by non-integers"
                    elif (v1,v2) in multi_edges:
                        multi_edges[(v1,v2)] += label
                    else:
                        multi_edges[(v1,v2)] = label
                    dg.delete_edge(v1,v2)
                dg.add_edges( [ (v1,v2,multi_edges[(v1,v2)]) for v1,v2 in multi_edges ] )
            for edge in dg.edge_iterator():
                if edge[0] >= n and edge[1] >= n:
                    raise ValueError, "The input digraph contains edges within the frozen vertices"
                if edge[2] is None:
                    dg.set_edge_label( edge[0], edge[1], (1,-1) )
                    edge = (edge[0],edge[1],(1,-1))
                elif edge[2] in ZZ:
                    dg.set_edge_label( edge[0], edge[1], (edge[2],-edge[2]) )
                    edge = (edge[0],edge[1],(edge[2],-edge[2]))
                elif type(edge[2]) == list and len(edge[2]) <> 2:
                    raise ValueError, "The input digraph contains an edge with the wrong type of list as a label."
                elif type(edge[2]) == list and len(edge[2]) == 2:
                    dg.set_edge_label( edge[0], edge[1], (edge[2][0], edge[2][1]))
                    edge = (edge[0],edge[1],(edge[2][0],edge[2][1]))
                elif ( edge[0] >= n or edge[1] >= n ) and not edge[2][0] == - edge[2][1]:
                    raise ValueError, "The input digraph contains an edge to or from a frozen vertex which is not skew-symmetric."
                if edge[2][0] < 0:
                    raise ValueError, "The input digraph contains an edge of the form (a,-b) with negative a."

            M = _edge_list_to_matrix( dg.edge_iterator(), n, m )
            if not _principal_part(M).is_skew_symmetrizable( positive=True ):
                raise ValueError, "The input digraph must be skew-symmetrizable"
            self._digraph = dg
            self._M = M
            if n+m == 0:
                self._description = 'Quiver without vertices' %(n+m)
            elif n+m == 1:
                self._description = 'Quiver on %d vertex' %(n+m)
            else:
                self._description = 'Quiver on %d vertices' %(n+m)
            self._mutation_type = None

        # otherwise, data is used to construct a digraph
        else:
            dg = DiGraph()
            dg.add_edges( data )
            self.__init__(data=dg, frozen=frozen )

    def __eq__(self, other):
        """
        Returns True iff self any y represent the same quiver.

        EXAMPLES::

            sage: Q = Quiver(['A',5])
            sage: T = Q.mutate( 2, inplace=False )
            sage: Q.__eq__( T )
            False
            sage: T.mutate( 2 )
            sage: Q.__eq__( T )
            True
        """
        return type( other ) is Quiver and self._M == other._M

    def _repr_(self):
        """
        Returns the description of self.

        EXAMPLES::

            sage: Q = Quiver(['A',5])
            sage: Q._repr_()
            "Quiver on 5 vertices of type ['A', 5]"
        """
        name = self._description
        if self._mutation_type:
            if type( self._mutation_type ) in [QuiverMutationType_Irreducible,QuiverMutationType_Reducible]:
                name += ' of type ' + str(self._mutation_type)
            else:
                name += ' of ' + self._mutation_type
        if self._m == 1:
            name += ' with %s frozen vertex'%self._m
        elif self._m > 1:
            name += ' with %s frozen vertices'%self._m
        return name

    def plot(self, circular=True, center=(0,0), directed=True, mark=None, save_pos=False):
        """
        Returns the plot of the underlying digraph of self.

        INPUT:

        - ``circular`` -- (default:True) if True, the circular plot is chosen, otherwise >>spring<< is used.
        - ``center`` -- (default:(0,0)) sets the center of the circular plot, otherwise it is ignored.
        - ``directed`` -- (default: True) if True, the directed version is shown, otherwise the undirected.
        - ``mark`` -- (default: None) if set to i, the vertex i is highlighted.
        - ``save_pos`` -- (default:False) if True, the positions of the vertices are saved.

        EXAMPLES::

            sage: Q = Quiver(['A',5])
            sage: pl = Q.plot()
            sage: pl = Q.plot(circular=True)
        """
        from sage.plot.colors import rainbow
        from sage.graphs.graph_generators import GraphGenerators
        from sage.all import e,pi,I
        graphs = GraphGenerators()
        # returns positions for graph vertices on two concentric cycles with radius 1 and 2
        def _graphs_concentric_circles(n,m):
            g1 = graphs.CycleGraph(n).get_pos()
            g2 = graphs.CycleGraph(m).get_pos()
            for i in g2:
                z = CC(g2[i])*e**(-pi*I/(2*m))
                g2[i] = (z.real_part(),z.imag_part())
            for i in range(m):
                g1[n+i] = [2*g2[i][0], 2*g2[i][1]]
            return g1

        n, m = self._n, self._m
        colors = rainbow(11)
        color_dict = { colors[0]:[], colors[1]:[], colors[6]:[], colors[5]:[] }
        if directed:
            dg = DiGraph( self._digraph )
        else:
            dg = Graph( self._digraph )
        for edge in dg.edges():
            v1,v2,(a,b) = edge
            if v1 < n and v2 < n:
                if (a,b) == (1,-1):
                    color_dict[ colors[0] ].append((v1,v2))
                else:
                    color_dict[ colors[6] ].append((v1,v2))
            else:
                if (a,b) == (1,-1):
                    color_dict[ colors[1] ].append((v1,v2))
                else:
                    color_dict[ colors[5] ].append((v1,v2))
            if a == -b:
                if a == 1:
                    dg.set_edge_label( v1,v2,'' )
                else:
                    dg.set_edge_label( v1,v2,a )
        if mark is not None:
            if mark < n:
                partition = (range(mark)+range(mark+1,n),range(n,n+m),[mark])
            elif mark > n:
                partition = (range(n),range(n,mark)+range(mark+1,n+m),[mark])
            else:
                raise ValueError, "The given mark is not a vertex of self."
        else:
            partition = (range(n),range(n,n+m),[])
        vertex_color_dict = {}
        vertex_color_dict[ colors[0] ] = partition[0]
        vertex_color_dict[ colors[6] ] = partition[1]
        vertex_color_dict[ colors[4] ] = partition[2]

        options = {
            'graph_border' : True,
            'edge_colors': color_dict,
            'vertex_colors': vertex_color_dict,
            'edge_labels' : True,
            'scaling_term' : 0.1
        }
        if circular:
            pp = _graphs_concentric_circles( n, m )
            for v in pp:
                pp[v] = (pp[v][0]+center[0],pp[v][1]+center[1])
            options[ 'pos' ] = pp
        return dg.plot( **options )

    def show(self, fig_size=1, circular=False, directed=True, mark=None, save_pos=False):
        """
        Shows the plot of the underlying digraph of self.

        INPUT:

        - ``fig_size`` -- (default: 1) factor by which the size of the plot is multiplied.
        - ``circular`` -- (default: False) if True, the circular plot is chosen, otherwise >>spring<< is used.
        - ``directed`` -- (default: True) if True, the directed version is shown, otherwise the undirected.
        - ``mark`` -- (default: None) if set to i, the vertex i is highlighted.
        - ``save_pos`` -- (default:False) if True, the positions of the vertices are saved.
        """
        n, m = self._n, self._m
        plot = self.plot( circular=circular, directed=directed, mark=mark, save_pos=save_pos )
        if circular:
            plot.show( figsize=[fig_size*3*(n+m)/4+1,fig_size*3*(n+m)/4+1] )
        else:
            plot.show( figsize=[fig_size*n+1,fig_size*n+1] )

    def interact(self, fig_size=1, circular=True):
        """
        Only in notebook mode. Starts an interactive window for cluster seed mutations.

        INPUT:

        - ``fig_size`` -- (default: 1) factor by which the size of the plot is multiplied.
        - ``circular`` -- (default: False) if True, the circular plot is chosen, otherwise >>spring<< is used.
        """
        from sage.plot.plot import EMBEDDED_MODE
        from sagenb.notebook.interact import interact, selector
        from sage.misc.all import html,latex

        if not EMBEDDED_MODE:
            return "The interactive mode only runs in the Sage notebook."
        else:
            seq = []
            sft = [True]
            sss = [True]
            ssm = [True]
            ssl = [True]
            @interact
            def player(k=selector(values=range(self._n),nrows = 1,label='Mutate at: '), show_seq=("Mutation sequence:", True), show_matrix=("B-Matrix:", True), show_lastmutation=("Show last mutation:", True) ):
                ft,ss,sm,sl = sft.pop(), sss.pop(), ssm.pop(), ssl.pop()
                if ft:
                    self.show(fig_size=fig_size, circular=circular)
                elif show_seq is not ss or show_matrix is not sm or show_lastmutation is not sl:
                    if seq and show_lastmutation:
                        self.show(fig_size=fig_size, circular=circular, mark=seq[len(seq)-1])
                    else:
                        self.show(fig_size=fig_size, circular=circular )
                else:
                    self.mutate(k)
                    seq.append(k)
                    if not show_lastmutation:
                        self.show(fig_size=fig_size, circular=circular)
                    else:
                        self.show(fig_size=fig_size, circular=circular,mark=k)
                sft.append(False)
                sss.append(show_seq)
                ssm.append(show_matrix)
                ssl.append(show_lastmutation)
                if show_seq: html( "Mutation sequence: $" + str( [ seq[i] for i in xrange(len(seq)) ] ).strip('[]') + "$" )
                if show_matrix:
                    html( "B-Matrix:" )
                    m = self._M
                    #m = matrix(range(1,self._n+1),sparse=True).stack(m)
                    m = latex(m)
                    m = m.split('(')[1].split('\\right')[0]
                    html( "$ $" )
                    html( "$\\begin{align*} " + m + "\\end{align*}$" )
                    #html( "$" + m + "$" )
                    html( "$ $" )

    def save_image(self,filename,circular=False):
        """
        Saves the plot of the underlying digraph of self.

        INPUT:

        - ``filename`` -- the filename the image is saved to.
        - ``circular`` -- (default: False) if True, the circular plot is chosen, otherwise >>spring<< is used.
        """
        graph_plot = self.plot( circular=circular )
        graph_plot.save( filename=filename )

    def b_matrix(self):
        """
        Returns the b-matrix of self.

        EXAMPLES::

            sage: Quiver(['A',4]).b_matrix()
            [ 0  1  0  0]
            [-1  0 -1  0]
            [ 0  1  0  1]
            [ 0  0 -1  0]

            sage: Quiver(['B',4]).b_matrix()
            [ 0  1  0  0]
            [-1  0 -1  0]
            [ 0  1  0  1]
            [ 0  0 -2  0]

            sage: Quiver(['D',4]).b_matrix()
            [ 0  1  0  0]
            [-1  0 -1 -1]
            [ 0  1  0  0]
            [ 0  1  0  0]

            sage: Quiver(QuiverMutationType([['A',2],['B',2]])).b_matrix()
            [ 0  1  0  0]
            [-1  0  0  0]
            [ 0  0  0  1]
            [ 0  0 -2  0]
        """
        return copy( self._M )

    def digraph(self):
        """
        Returns the underlying digraph of self.

        EXAMPLES::

            sage: Quiver(['A',1]).digraph()
            Digraph on 1 vertex
            sage: Quiver(['A',1]).digraph().vertices()
            [0]
            sage: Quiver(['A',1]).digraph().edges()
            []

            sage: Quiver(['A',4]).digraph()
            Digraph on 4 vertices
            sage: Quiver(['A',4]).digraph().edges()
            [(0, 1, (1, -1)), (2, 1, (1, -1)), (2, 3, (1, -1))]

            sage: Quiver(['B',4]).digraph()
            Digraph on 4 vertices
            sage: Quiver(['A',4]).digraph().edges()
            [(0, 1, (1, -1)), (2, 1, (1, -1)), (2, 3, (1, -1))]

            sage: Quiver(QuiverMutationType([['A',2],['B',2]])).digraph()
            Digraph on 4 vertices

            sage: Quiver(QuiverMutationType([['A',2],['B',2]])).digraph().edges()
            [(0, 1, (1, -1)), (2, 3, (1, -2))]
        """
        return copy( self._digraph )

    def n(self):
        """
        Returns the number of free vertices of self.

        EXAMPLES::

            sage: Quiver(['A',4]).n()
            4
            sage: Quiver(['A',(3,1),1]).n()
            4
            sage: Quiver(['B',4]).n()
            4
            sage: Quiver(['B',4,1]).n()
            5
        """
        return self._n

    def m(self):
        """
        Returns the number of frozen vertices of self.

        EXAMPLES::

            sage: Q = Quiver(['A',4])
            sage: Q.m()
            0

            sage: T = Quiver( Q.digraph().edges(), frozen=1 )
            sage: T.n()
            3
            sage: T.m()
            1
        """
        return self._m

    def vertices(self):
        return self._digraph.vertices()

    def edges(self):
        return self._digraph.edges(labels=False)

    def copy(self):
        return Quiver(self._digraph)

    def canonical_label( self, certify=False ):
        """
        Returns the canonical labelling of self, see sage.graphs.graph.GenericGraph.canonical_label.

        INPUT:

        - ``certify`` -- (default: False) if True, the dictionary from self.vertices() to the vertices of the returned quiver is returned as well.

        EXAMPLES::

            sage: Q = Quiver(['A',4]); Q.digraph().edges()
            [(0, 1, (1, -1)), (2, 1, (1, -1)), (2, 3, (1, -1))]

            sage: T = Q.canonical_label(); T.digraph().edges()
            [(0, 3, (1, -1)), (1, 2, (1, -1)), (1, 3, (1, -1))]

            sage: T,iso = Q.canonical_label(certify=True); T.digraph().edges(); iso
            [(0, 3, (1, -1)), (1, 2, (1, -1)), (1, 3, (1, -1))]
            {0: 0, 1: 3, 2: 1, 3: 2}

            sage: Q = Quiver(QuiverMutationType([['B',2],['A',1]])); Q
            Quiver on 3 vertices of type [ ['B', 2], ['A', 1] ]

            sage: Q.canonical_label()
            Quiver on 3 vertices of type [ ['A', 1], ['B', 2] ]

            sage: Q.canonical_label(certify=True)
            (Quiver on 3 vertices of type [ ['A', 1], ['B', 2] ], {0: 1, 1: 2, 2: 0})
        """
        n = self._n
        m = self._m

        # computing the canonical form respecting the frozen variables
        dg = copy( self._digraph )
        iso, orbits = _dg_canonical_form( dg, n, m )
        Q = Quiver( dg )
        # getting the new ordering for the mutation type if necessary
        if self._mutation_type:
            if dg.is_connected():
                Q._mutation_type = self._mutation_type
            else:
                CC = sorted( self._digraph.connected_components() )
                CC_new = sorted( zip( [ sorted( [ iso[i] for i in L ] ) for L in CC ], range( len( CC ) ) ) )
                comp_iso = [ L[1] for L in CC_new ]
                Q._mutation_type = []
                for i in range( len( CC_new ) ):
                    Q._mutation_type.append( copy( self._mutation_type.irreducible_components()[ comp_iso[i] ] ) )
                Q._mutation_type = QuiverMutationType( Q._mutation_type )
        if certify:
            return Q, iso
        else:
            return Q

    def is_acyclic(self):
        """
        Returns true if self is acyclic.

        EXAMPLES::

            sage: Quiver(['A',4]).is_acyclic()
            True

            sage: Quiver(['A',[2,1],1]).is_acyclic()
            True

            sage: Quiver([[0,1],[1,2],[2,0]]).is_acyclic()
            False
        """
        return self._digraph.is_directed_acyclic()

    def is_bipartite(self,return_bipartition=False):
        """
        Returns true if self is bipartite.

        EXAMPLES::

            sage: Quiver(['A',[3,3],1]).is_bipartite()
            True

            sage: Quiver(['A',[4,3],1]).is_bipartite()
            False
        """
        dg = copy( self._digraph )
        dg.delete_vertices( range(self._n,self._n+self._m) )
        innie = dg.in_degree()
        outie = dg.out_degree()
        is_bip = sum( [ innie[i]*outie[i] for i in range(len(innie)) ] ) == 0
        if not is_bip:
            return False
        else:
            if not return_bipartition:
                return True
            else:
                g = dg.to_undirected()
                return g.bipartite_sets()

    def principal_restriction(self):
        """
        Returns the restriction to the principal part of self. I.e., the subquiver obtained by deleting the frozen vertices of self.

        EXAMPLES::

            sage: Q = Quiver(['A',4])
            sage: T = Quiver( Q.digraph().edges(), frozen=1 )
            sage: T.digraph().edges()
            [(0, 1, (1, -1)), (2, 1, (1, -1)), (2, 3, (1, -1))]

            sage: T.principal_restriction().digraph().edges()
            [(0, 1, (1, -1)), (2, 1, (1, -1))]
        """
        dg = DiGraph( self._digraph )
        dg.delete_vertices( range(self._n,self._n+self._m) )
        Q = Quiver( dg )
        Q._mutation_type = self._mutation_type
        return Q

    def principal_extension(self):
        """
        Returns the principal extension of self if self does not have any frozen vertices. I.e., the quiver obtained by adding an outgoing edge to every vertex of self.

        EXAMPLES::

            sage: Q = Quiver(['A',2])
            sage: T = Q.principal_extension()
            sage: Q.digraph().edges()
            [(0, 1, (1, -1))]
            sage: T.digraph().edges()
            [(0, 1, (1, -1)), (2, 0, (1, -1)), (3, 1, (1, -1))]

        """
        if self._m > 0:
            raise ValueError, "Quiver contains frozen vertices"
        dg = DiGraph( self._digraph )
        dg.add_edges( [(self._n+i,i) for i in range(self._n)] )
        Q = Quiver( dg, frozen=self._n )
        Q._mutation_type = self._mutation_type
        return Q

    def mutate(self, data, inplace=True):
        """
        Mutates self at a sequence of vertices.

        INPUT:

        - ``sequence`` -- a vertex of self or an iterator of vertices of self.
        - ``inplace`` -- (default: True) if False, the result is returned, otherwise self is modified.

        EXAMPLES::

            sage: Q = Quiver(['A',4]); Q.b_matrix()
            [ 0  1  0  0]
            [-1  0 -1  0]
            [ 0  1  0  1]
            [ 0  0 -1  0]

            sage: Q.mutate(0); Q.b_matrix()
            [ 0 -1  0  0]
            [ 1  0 -1  0]
            [ 0  1  0  1]
            [ 0  0 -1  0]

            sage: T = Q.mutate(0, inplace=False); T
            Quiver on 4 vertices

            sage: Q.mutate(0)
            sage: Q == T
            True

            sage: Q.mutate([0,1,0])
            sage: Q.b_matrix()
            [ 0 -1  1  0]
            [ 1  0  0  0]
            [-1  0  0  1]
            [ 0  0 -1  0]

            sage: Q = Quiver(QuiverMutationType([['A',1],['A',3]]))
            sage: Q.b_matrix()
            [ 0  0  0  0]
            [ 0  0  1  0]
            [ 0 -1  0 -1]
            [ 0  0  1  0]

            sage: T = Q.mutate(0,inplace=False)
            sage: Q == T
            True
        """
        n = self._n
        m = self._m
        dg = self._digraph
        V = range(n)

        if data in V:
            seq = [data]
        else:
            seq = data
        if type( seq ) is tuple:
            seq = list( seq )
        if not type( seq ) is list:
            raise ValueError, 'The quiver can only be mutated at a vertex or at a sequence of vertices'
        if any( v not in V for v in seq ):
            v = filter( lambda v: v not in V, seq )[0]
            raise ValueError, 'The quiver cannot be mutated at the vertex ' + str( v )

        for v in seq:
            dg = _digraph_mutate( dg, v, n, m )
        M = _edge_list_to_matrix( dg.edge_iterator(), n, m )
        if inplace:
            self._M = M
            self._digraph = dg
        else:
            return Quiver( M )

    def mutation_sequence(self, sequence, show_sequence=False, fig_size=1.2 ):
        """
        Returns a list containing the sequence of quivers obtained from self by a sequence of mutations on vertices.

        INPUT:

        - ``sequence`` -- a list or tuple of vertices of self.
        - ``show_sequence`` -- (default: False) if True, a png containing the mutation sequence is shown.
        - ``fig_size`` -- (default: 1.2) factor by which the size of the sequence is expanded.

        EXAMPLES::

            sage: Q = Quiver(['A',4])
            sage: seq = Q.mutation_sequence([0,1]); seq
            [Quiver on 4 vertices of type ['A', 4], Quiver on 4 vertices of type ['A', 4], Quiver on 4 vertices of type ['A', 4]]
            sage: [T.b_matrix() for T in seq]
            [
            [ 0  1  0  0]  [ 0 -1  0  0]  [ 0  1 -1  0]
            [-1  0 -1  0]  [ 1  0 -1  0]  [-1  0  1  0]
            [ 0  1  0  1]  [ 0  1  0  1]  [ 1 -1  0  1]
            [ 0  0 -1  0], [ 0  0 -1  0], [ 0  0 -1  0]
            ]
        """
        from sage.plot.plot import Graphics
        from sage.plot.text import text
        n = self._n
        m = self._m
        if m == 0:
            width_factor = 3
            fig_size = fig_size*2*n/3
        else:
            width_factor = 6
            fig_size = fig_size*4*n/3
        V = range(n)

        if type( sequence ) is tuple:
            sequence = list( sequence )
        if not type( sequence ) is list:
            raise ValueError, 'The quiver can only be mutated at a vertex or at a sequence of vertices'
        if any( v not in V for v in sequence ):
            v = filter( lambda v: v not in V, sequence )[0]
            raise ValueError, 'The quiver can only be mutated at the vertex ' + str( v )

        quiver = copy( self )
        quiver_sequence = []
        quiver_sequence.append( copy( quiver ) )

        for v in sequence:
            quiver.mutate( v )
            quiver_sequence.append( copy( quiver ) )

        if show_sequence:
            def _plot_arrow( v, k, center=(0,0) ):
                return text("$\longleftrightarrow$",(center[0],center[1]), fontsize=25) + text("$\mu_"+str(v)+"$",(center[0],center[1]+0.15), fontsize=15) \
                    + text("$"+str(k)+"$",(center[0],center[1]-0.2), fontsize=15)
            plot_sequence = [ quiver_sequence[i].plot( circular=True, center=(i*width_factor,0) ) for i in range(len(quiver_sequence)) ]
            arrow_sequence = [ _plot_arrow( sequence[i],i+1,center=((i+0.5)*width_factor,0) ) for i in range(len(sequence)) ]
            sequence = []
            for i in xrange( len( plot_sequence ) ):
                if i < len( arrow_sequence ):
                    sequence.append( plot_sequence[i] + arrow_sequence[i] )
                else:
                    sequence.append( plot_sequence[i] )
            plot_obj = Graphics()
            for elem in sequence:
                plot_obj += elem
            plot_obj.show(axes=False, figsize=[fig_size*len(quiver_sequence),fig_size])
        return quiver_sequence

    def reorient( self, data ):
        """
        Reorients self with respect to the given total order, or with respect to an iterator of edges in self to be reverted.

        WARNING::

        This operation might change the mutation type of self.

        INPUT:

        - ``data`` -- an iterator defining a total order on self.vertices(), or an iterator of edges in self to be reoriented.

        EXAMPLES::

            sage: Q = Quiver(['A',(2,3),1])
            sage: Q.mutation_type()
            ['A', [2, 3], 1]

            sage: Q.reorient([(0,1),(1,2),(2,3),(3,4)])
            sage: Q.mutation_type()
            ['D', 5]

            sage: Q.reorient([0,1,2,3,4])
            sage: Q.mutation_type()
            ['A', [1, 4], 1]
        """
        if all( 0 <= i and i < self._n + self._m for i in data ) and len( set( data ) ) == self._n+self._m :
            dg_new = DiGraph()
            for edge in self._digraph.edges():
                if data.index( edge[0] ) < data.index( edge[1] ):
                    dg_new.add_edge( edge[0],edge[1],edge[2] )
                else:
                    dg_new.add_edge( edge[1],edge[0],edge[2] )
            self._digraph = dg_new
            self._M = _edge_list_to_matrix( dg_new.edges(), self._n, self._m )
            self._mutation_type = None
        elif all( type(edge) in [list,tuple] and len(edge)==2 for edge in data ):
            edges = self._digraph.edges(labels=False)
            for edge in data:
                if (edge[1],edge[0]) in edges:
                    label = self._digraph.edge_label(edge[1],edge[0])
                    self._digraph.delete_edge(edge[1],edge[0])
                    self._digraph.add_edge(edge[0],edge[1],label)
            self._M = _edge_list_to_matrix( self._digraph.edges(), self._n, self._m )
            self._mutation_type = None
        else:
            raise ValueError, 'The order is no total order on the vertices of the quiver or a list of edges to be oriented.'

    def mutation_class_iter( self, depth=infinity, show_depth=False, return_paths=False, data_type="quiver", up_to_equivalence=True, sink_source=False ):
        """
        Returns an iterator for the mutation class of self together with certain constrains.

        INPUT:

        - ``depth`` -- (default: infinity) integer, only quivers with distance at most depth from self are returned.
        - ``show_depth`` -- (default: False) if True, the actual depth of the mutation is shown.
        - ``return_paths`` -- (default: False) if True, a shortest path of mutation sequences from self to the given quiver is returned as well.
        - ``data_type`` -- (default: "quiver") can be one of the following::
            - "quiver", "matrix", "digraph", "dig6", "path"
        - ``up_to_equivalence`` -- (default: True) if True, only quivers up to equivalence are considered.
        - ``sink_source`` -- (default: False) if True, only mutations at sinks and sources are applied.

        EXAMPLES::

            sage: Q = Quiver(['A',3])
            sage: it = Q.mutation_class_iter()
            sage: for T in it: print T
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]

            sage: it = Q.mutation_class_iter(depth=1)
            sage: for T in it: print T
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]

            sage: it = Q.mutation_class_iter(show_depth=True)
            sage: for T in it: pass
            Depth: 1     found: 3          Time: ... s
            Depth: 2     found: 4          Time: ... s

            sage: it = Q.mutation_class_iter(return_paths=True)
            sage: for T in it: print T
            (Quiver on 3 vertices of type ['A', 3], [])
            (Quiver on 3 vertices of type ['A', 3], [1])
            (Quiver on 3 vertices of type ['A', 3], [0])
            (Quiver on 3 vertices of type ['A', 3], [0, 1])

            sage: it = Q.mutation_class_iter(up_to_equivalence=False)
            sage: for T in it: print T
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]

            sage: it = Q.mutation_class_iter(return_paths=True,up_to_equivalence=False)
            sage: for T in it: print T
            (Quiver on 3 vertices of type ['A', 3], [])
            (Quiver on 3 vertices of type ['A', 3], [2])
            (Quiver on 3 vertices of type ['A', 3], [1])
            (Quiver on 3 vertices of type ['A', 3], [0])
            (Quiver on 3 vertices of type ['A', 3], [2, 1])
            (Quiver on 3 vertices of type ['A', 3], [0, 1])
            (Quiver on 3 vertices of type ['A', 3], [0, 1, 2])
            (Quiver on 3 vertices of type ['A', 3], [0, 1, 0])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 2])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 0])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 0, 2])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 0, 1])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 2, 1])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 2, 0])
        """
        if data_type == "dig6":
            return_dig6 = True
        else:
            return_dig6 = False
        dg = DiGraph( self._digraph )
        MC_iter = _mutation_class_iter( dg, self._n, self._m, depth=depth, return_dig6=return_dig6, show_depth=show_depth, up_to_equivalence=up_to_equivalence, sink_source=sink_source )
        for data in MC_iter:
            if data_type == "quiver":
                Q = Quiver( data[0] )
                Q._mutation_type = self._mutation_type
                if return_paths:
                    yield ( Q, data[1] )
                else:
                    yield Q
            elif data_type == "matrix":
                Q = Quiver( data[0] )
                yield Q._M
            elif data_type == "digraph":
                yield data[0]
            elif data_type == "dig6":
                yield data[0]
            elif dig6_or_path == "path":
                yield data[1]
            else:
                raise ValueError, "The parameter for dig6_or_path was not recognized."

    def mutation_class( self, depth=infinity, show_depth=False, return_paths=False, data_type="quiver", up_to_equivalence=True, sink_source=False ):
        """
        Returns the mutation class of self together with certain constrains.

        INPUT:

        - ``depth`` -- (default: infinity) integer, only seeds with distance at most depth from self are returned.
        - ``show_depth`` -- (default: False) if True, the actual depth of the mutation is shown.
        - ``return_paths`` -- (default: False) if True, a shortest path of mutation sequences from self to the given quiver is returned as well.
        - ``data_type`` -- (default: "quiver") can be one of the following::
            - "quiver" -- the quiver is returned
            - "dig6" -- the dig6-data is returned
            - "path" -- shortest paths of mutation sequences from self are returned
        - ``sink_source`` -- (default: False) if True, only mutations at sinks and sources are applied.


        EXAMPLES::

            sage: Q = Quiver(['A',3])
            sage: Ts = Q.mutation_class()
            sage: for T in Ts: print T
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]

            sage: Ts = Q.mutation_class(depth=1)
            sage: for T in Ts: print T
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]

            sage: Ts = Q.mutation_class(show_depth=True)
            Depth: 1     found: 3          Time: ... s
            Depth: 2     found: 4          Time: ... s

            sage: Ts = Q.mutation_class(return_paths=True)
            sage: for T in Ts: print T
            (Quiver on 3 vertices of type ['A', 3], [])
            (Quiver on 3 vertices of type ['A', 3], [1])
            (Quiver on 3 vertices of type ['A', 3], [0])
            (Quiver on 3 vertices of type ['A', 3], [0, 1])

            sage: Ts = Q.mutation_class(up_to_equivalence=False)
            sage: for T in Ts: print T
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]
            Quiver on 3 vertices of type ['A', 3]

            sage: Ts = Q.mutation_class(return_paths=True,up_to_equivalence=False)
            sage: for T in Ts: print T
            (Quiver on 3 vertices of type ['A', 3], [])
            (Quiver on 3 vertices of type ['A', 3], [2])
            (Quiver on 3 vertices of type ['A', 3], [1])
            (Quiver on 3 vertices of type ['A', 3], [0])
            (Quiver on 3 vertices of type ['A', 3], [2, 1])
            (Quiver on 3 vertices of type ['A', 3], [0, 1])
            (Quiver on 3 vertices of type ['A', 3], [0, 1, 2])
            (Quiver on 3 vertices of type ['A', 3], [0, 1, 0])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 2])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 0])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 0, 2])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 0, 1])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 2, 1])
            (Quiver on 3 vertices of type ['A', 3], [2, 1, 2, 0])

        """
        if depth is infinity:
            assert self.is_mutation_finite(), 'The mutation class can - for infinite mutation types - only be computed up to a given depth'
        return [ Q for Q in self.mutation_class_iter( depth=depth, show_depth=show_depth, return_paths=return_paths, data_type=data_type, up_to_equivalence=up_to_equivalence, sink_source=sink_source ) ]

    def group_of_mutations( self ):
        """
        Returns the group generated by mutations on self.mutation_class(up_to_equivalence=False).

        .. WARNING::

        This group is very big, and can be computed only very small examples - see below.

        EXAMPLES::

            sage: Q = Quiver(['A',2])
            sage: Q.group_of_mutations()
            Permutation Group with generators [(1,2)]

            sage: Q = Quiver(['A',3])
            sage: Q.group_of_mutations()
            Permutation Group with generators [(1,2)(3,4)(5,9)(6,7)(8,12)(10,11)(13,14), (1,3)(2,5)(4,6)(7,14)(8,11)(9,13)(10,12), (1,4)(2,3)(5,10)(6,8)(7,13)(9,14)(11,12)]

            sage: Q = Quiver(['B',2])
            sage: Q.group_of_mutations()
            Permutation Group with generators [(1,2)]
            sage: Q = Quiver(['B',3])
            sage: Q.group_of_mutations()
            Permutation Group with generators [(1,2)(3,4)(5,6)(7,10)(8,9), (1,3)(2,6)(4,5)(7,9)(8,10), (1,4)(2,3)(5,7)(6,8)(9,10)]

            sage: Q = Quiver(['A',1])
            sage: Q.group_of_mutations().cardinality()
            1

            sage: Q = Quiver(['A',2])
            sage: Q.group_of_mutations().cardinality()
            2

            sage: Q = Quiver(['A',3])
            sage: Q.group_of_mutations().cardinality()
            322560
        """
        assert self.is_mutation_finite(), 'The group of mutations can only be computed for finite types.'
        MC = self.mutation_class(up_to_equivalence=False)
        V = range( self._n )
        l = len( MC )
        gens = []
        for i in V:
            gen = [0]*l
            for j in range(l):
                if gen[j] == 0:
                    S = MC[ j ]
                    S_new = S.mutate( i, inplace=False )
                    j_prime = MC.index( S_new )
                    gen[ j ] = j_prime+1
                    gen[ j_prime ] = j+1
            gens.append( gen )
        return PermutationGroup( gens )

    def is_simply_laced( self ):
        return all( l == (1,-1) for l in self._digraph.edge_labels() )

    def is_finite( self ):
        """
        Returns True if self is of finite type.

        EXAMPLES::

        sage: Q = Quiver(['A',3])
        sage: Q.is_finite()
        True
        sage: Q = Quiver(['A',[2,2],1])
        sage: Q.is_finite()
        False
        """
        mt = self.mutation_type()
        if type(mt) is str:
            return False
        else:
            return mt.is_finite()

    def is_mutation_finite( self, nr_of_checks=None, return_path=False ):
        """
        Uses a non-deterministic method by random mutations in various directions. Can result in a wrong answer.

        INPUT:

        - ``nr_of_checks`` -- (default: None) number of mutations applied. Standard is 500*(number of vertices of self).
        - ``return_path`` -- (default: False) if True, in case of self not being mutation finite, a path from self to a quiver with an edge label (a,-b) and a*b > 4 is returned.

        ALGORITHM:

        A quiver is mutation infinite if and only if every edge label (a,-b) satisfy a*b > 4.
        Thus, we apply random mutations in random directions

        EXAMPLES::

            sage: Q = Quiver(['A',10])
            sage: Q._mutation_type = None
            sage: Q.is_mutation_finite()
            True

            sage: Q = Quiver([(0,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(2,9)])
            sage: Q.is_mutation_finite()
            False
        """
        if self._n <= 2:
            return True
        elif not return_path and self._mutation_type == 'undetermined infinite mutation type':
            return False
        elif type( self._mutation_type ) in [QuiverMutationType_Irreducible, QuiverMutationType_Reducible] and self._mutation_type.is_mutation_finite():
            return True
        elif not return_path and type( self._mutation_type ) in [QuiverMutationType_Irreducible, QuiverMutationType_Reducible] and not self._mutation_type.is_mutation_finite():
            return False
        else:
            import random
            n, m = self._n, self._m
            if nr_of_checks is None:
                nr_of_checks = 1000*n
            M = copy( self._M )
            k = 0
            path = []
            for i in xrange( nr_of_checks ):
                # this test is done to avoid mutating back in the same direction
                k_test = k
                while k_test == k:
                    k = random.randint(0,n-1)
                M.mutate( k )
                path.append(k)
                for i,j in M.nonzero_positions():
                    if i<j and M[i,j]*M[j,i] < -4:
                        self._mutation_type = 'undetermined infinite mutation type'
                        if return_path:
                            return ( False, path )
                        else:
                            return False
            return True

    def mutation_type( self ):
        """
        Returns the mutation_type of each connected component of self if it can be determined,
        otherwise, the mutation type of this component is set to be unknown.

        The mutation types of the components are ordered by vertex labels.

        WARNING:

        - All finite types can be detected,
        - All affine types can be detected, EXCEPT affine type D (the algorithm is not yet implemented)
        - All exceptional types can be detected.

        - Might fail to work if it is used within different Sage processes simultaneously (that happend in the doctesting).

        EXAMPLES:

        - finite types::

            sage: Q = Quiver(['A',5])
            sage: Q._mutation_type = None
            sage: Q.mutation_type()
            ['A', 5]

            sage: Q = Quiver([(0,1),(1,2),(2,3),(3,4)])
            sage: Q.mutation_type()
            ['A', 5]

        - affine types::

            sage: Q = Quiver(['E',8,[1,1]]); Q
            Quiver on 10 vertices of type ['E', 8, [1, 1]]
            sage: Q._mutation_type = None; Q
            Quiver on 10 vertices
            sage: Q.mutation_type()
            ['E', 8, [1, 1]]

        - the not yet working affine type D::

            sage: Q = Quiver(['D',4,1])
            sage: Q._mutation_type = None
            sage: Q.mutation_type()
            'undetermined finite mutation type'

        - the exceptional types::

            sage: Q = Quiver(['X',6,2])
            sage: Q._mutation_type = None
            sage: Q.mutation_type()
            ['X', 6, 2]

        -  infinite types::

            sage: Q = Quiver(['GR',[4,9],3])
            sage: Q._mutation_type = None
            sage: Q.mutation_type()
            'undetermined infinite mutation type'
        """
        # checking if the mutation type is known alreadye
        if self._mutation_type is None:
            # checking mutation type only for the principal part
            if self._m > 0:
                dg = self._digraph.subgraph( range(self._n) )
            else:
                dg = self._digraph

            # checking the type for each connected component
            mutation_type = []
            connected_components = dg.connected_components()
            connected_components.sort()
            for component in connected_components:
                dg_component = dg.subgraph( component )
                mut_type_part = _connected_mutation_type( dg_component )
                if mut_type_part == 'unknown':
                    iso, orbits = _dg_canonical_form( dg_component, self._n, self._m )
                    dig6 = _digraph_to_dig6( dg_component, hashable=True )
                    mut_type_part = _mutation_type_from_data( dg_component.order(), dig6 )
                if mut_type_part == 'unknown':
                    self.is_mutation_finite()
                    if self._mutation_type is None:
                        self._mutation_type = 'undetermined finite mutation type'
                    return self._mutation_type
                mutation_type.append( mut_type_part )

            # the empty quiver case
            if len( mutation_type ) == 0:
                mutation_type = QuiverMutationType( ['A',0] )
            # the connected quiver case
            elif len( mutation_type ) == 1:
                mutation_type = mutation_type[0]
            elif len( mutation_type ) > 1:
                mutation_type = QuiverMutationType( mutation_type )

            self._mutation_type = mutation_type
        return self._mutation_type

# methods for path algebras for quivers
    def quiver_paths_from_source(self, v):
        assert self.is_simply_laced(), "Paths can only be considered for simply laced quivers."
        dg = self._digraph.copy()
        for a,b in dg.edges(labels=False):
            dg.set_edge_label(a,b,None)
        gp = GraphPaths(self._digraph)
        source_paths = [ [v] ]
        for e in gp.outgoing_edges(v):
            target = e[1]
            target_paths = self.quiver_paths_from_source(target)
            target_paths = [ (e,)+path  for path in target_paths]
            source_paths += target_paths
        labelled_source_paths = []
        for path in source_paths:
            if len(path) > 1 and not isinstance(path[-1], tuple):
                labelled_source_paths.append(path[:-1])
            else:
                labelled_source_paths.append(path)
        assert len(labelled_source_paths) == len(source_paths)
        return map(tuple,labelled_source_paths)

    def quiver_paths(self):
        paths = []
        for source in self.vertices():
            paths += self.quiver_paths_from_source(source)
        return paths

    def quiver_paths_from_source_to_target(self, source, target):
        source_paths = self.quiver_paths_from_source(source)
        paths = []
        for path in source_paths:
            if isinstance(path[-1], tuple) and path[-1][1] == target:
                paths.append(path)
            else:
                if path[0] == target:
                    paths.append(path)
        return paths

    def quiver_paths_to_target(self, target):
        paths = []
        for path in self.quiver_paths():
            if isinstance(path[-1], tuple) and path[-1][1] == target:
                paths.append(path)
            else:
                if path[0] == target:
                    paths.append(path)
        return paths

    def quiver_path_length(self, path):
        return add(1 for edge in path if isinstance(edge, tuple))

    def concatenate_paths_l2r(self, p, q):
        # p is a nontrivial path
        if isinstance(p[-1], tuple):
            if isinstance(q[0], tuple) and p[-1][1] == q[0][0]:
                return p + q
            elif p[-1][1] == q[0]:
                return p
        else: # p is a vertex
            if isinstance(q[0], tuple) and p[0] == q[0][0]:
                return q
            elif p[0] == q[0]:
                return p
        return None

    def concatenate_paths_r2l(self, p, q):
        # q is a nontrivial path
        if isinstance(q[-1], tuple):
            if isinstance(p[0], tuple) and q[-1][1] == p[0][0]:
                return q + p
            elif q[-1][1] == p[0]:
                return q
        else: # q is a vertex
            if isinstance(p[0], tuple) and q[0] == p[0][0]:
                return p
            elif q[0] == p[0]:
                return q
        return None

    def path_algebra(self, ring):
        return PathAlgebra(ring, self)

    def to_gap_quiver(self, rename=True):
        r"""
            sage: Q = Quiver({0:[1,1,3],1:[2],2:[4],3:[4]})
            sage: Q.to_gap_quiver()
            sage: V = Family(dict([(v,i+1) for (i,v) in enumerate(Q.vertices())]))
            sage: arrows = [[V[p[0]], V[p[1]]] for p in Q.edges()]

        ::

            sage: Q = Quiver({'a':['b','b']})
            sage: 
        gap> Quiver(len(V), arrows)
        """
        return GAPQuiver(self)

class PathAlgebra(CombinatorialFreeModule):
    @staticmethod
    def __classcall__(cls, ring, quiver):
        quiver = quiver.copy()
        quiver._immutable = True
        return super(PathAlgebra, cls).__classcall__(cls, ring, quiver)

    def __init__(self, ring, quiver, prefix="Q"):
        self._quiver = quiver
        CombinatorialFreeModule.__init__(self, 
            ring,
            quiver.quiver_paths(),
            prefix = prefix,
            category = FiniteDimensionalAlgebrasWithBasis(ring))

    def _repr_(self):
        return "Path algebra of %s over %s" % (self._quiver, self.base_ring())

    def quiver(self):
        return self._quiver

    @cached_method
    def one(self):
        return self.sum_of_monomials((v,) for v in self._quiver.vertices())

    @cached_method
    def product_on_basis(self, p, q):
        r"""
        Product of two basis elements.

        EXAMPLES::

            sage: A = Quiver({0:[1,2],1:[2]}).path_algebra(QQ)
            sage: a = A[(0,)], A[(1,)], A[((1,2,None),)]
            sage: b = A[(0,)], A[((0, 1, None),)]
            sage: for ai in a:
                for bi in b:
                    print "%s * %s == %s" % (ai, bi, ai*bi)
            ....:         
            A[(0,)] * A[(0,)] == A[(0,)]
            A[(0,)] * A[((0, 1, None),)] == 0
            A[(1,)] * A[(0,)] == 0
            A[(1,)] * A[((0, 1, None),)] == A[((0, 1, None),)]
            A[((1, 2, None),)] * A[(0,)] == 0
            A[((1, 2, None),)] * A[((0, 1, None),)] == A[((0, 1, None), (1, 2, None))]

        """
        pq = self._quiver.concatenate_paths_r2l(p, q)
        return self.monomial_or_zero_if_none(pq)

    def vertices(self):
        return tuple([self.monomial((v,)) for v in self._quiver.vertices()])

    def arrows(self):
        return tuple([self.monomial((edge,)) for edge in self._quiver.edges()])

    @cached_method
    def algebra_generators(self):
        return Family(self.vertices() + self.arrows())

    def radical_basis(self):
        return self.arrows()

    #def my_quotient(self, I):
    #    I = self.submodule(I)
    #    D = self.quotient(submodule=I, check=True, already_echelonized=False,
    #            category=self.category().Subquotients())
    #    D.rename("Quotient of %s" % (self,))
    #    D._print_options['prefix'] = '%s/%s' % (self._print_options, 'I')
    #    D._repr_option_bracket = False
    #    return D

    def projective_module(self, vertex):
        Q = self.quiver()
        v = vertex.support()[0][0]
        basis = [self.monomial(path) for path in Q.quiver_paths_to_target(v)]
        return self.submodule(basis, check=True, already_echelonized=False)

    def projective_module_in_quotient(self, vertex, I):
        B = self.quotient(I)
        P = self.projective_module(v)
        return B.submodule([B.retract(p.lift()) for p in P.basis()])

    def projective_module_in_quotient_decomposition(self, vertex, I):
        B = self.quotient(I)
        P = self.projective_module(v)
        M = B.submodule([B.retract(p.lift()) for p in P.basis()])
        Mx = {}
        for x in self.vertices():
            Mx[x] = M.submodule([M.retract(B.retract(m.lift().lift()*x)) for m in M.basis()])
        mats = {}
        for a in self.arrows():
            a_supp = a.support()[0][0]
            y, x = a_supp[:2]
            x = self.monomial((x,))
            y = self.monomial((y,))
            mat = []
            for mx in Mx[x].basis():
                mxa = Mx[y].retract(M.retract(B.retract(mx.lift().lift().lift()*a)))
                mat.append(vector(mxa))
            mats[a_supp] = matrix(mat)
        return mats

class QuiverMorphism(SageObject):
    def __init__(self, quiver, quiver_map_on_paths):
        self._quiver = quiver
        self._quiver_map_dict = quiver_map_on_paths
        self._codomain = quiver_map_on_paths.values()[0].parent()

    def _repr_(self):
        return "Quiver map from %s to %s" % (self.quiver(), self.codomain())

    def __iter__(self):
        Q = self.quiver()
        keys = sorted(self._quiver_map_dict.keys(),
                key=lambda x:Q.quiver_path_length((x,)))
        d = self._quiver_map_dict
        for key in keys:
            yield (key,d[key])

    def quiver(self):
        return self._quiver

    @cached_method
    def domain(self):
        ring = self.codomain().base_ring()
        return self.quiver().path_algebra(ring)

    def codomain(self):
        return self._codomain

    @lazy_attribute
    def algebra_morphism(self):
        return self.domain().module_morphism(on_basis=self.quiver_map_on_basis, codomain=self.codomain())

    __call__ = algebra_morphism

    def quiver_map_on_basis(self, path):
        qmapdict = self._quiver_map_dict
        if len(path) == 1:
            return qmapdict[path[0]]
        else:
            return self.codomain().prod(qmapdict[arrow] for arrow in path)

    def quiver_relations_iter(self):
        quiver = self.quiver()
        for x in quiver.vertices():
            for y in quiver.vertices():
                for relation in self.quiver_relations(x,y):
                    yield relation

    def quiver_relations(self, x=None, y=None):
        if x is None and y is None:
            return list(self.quiver_relations_iter())
        quiver_paths = self.quiver().quiver_paths_from_source_to_target(x,y)
        kQ = self.domain()
        rows = []
        for path in quiver_paths:
            rows.append(self(kQ.monomial(path)).to_vector())

        relations = []
        for relation in matrix(rows).kernel().basis():
            relations.append( kQ.sum_of_terms(zip(quiver_paths, relation)) )
        return relations

class GAPQuiver(SageObject):
    def __init__(self, quiver, rename=True):
        if gap.RequirePackage('"qpa"') != True:
            raise RuntimeError, "QPA package for GAP not installed"
        if rename is True:
            V = Family(dict([(v,i+1) for (i,v) in enumerate(quiver.vertices())]))
            gap_arrows = []
            to_gap_arrows = {}
            from_gap_arrows = {}
            for (i,p) in enumerate(quiver.edges()):
                label = '"a%s"'%(i+1,)
                gap_arrows.append([V[p[0]], V[p[1]], label])
                to_gap_arrows[p] = label
                from_gap_arrows[label] = p
            self._quiver = gap.Quiver(len(V), gap_arrows)
            self._to_gap_vertex = V
            self._from_gap_vertex = V.inverse_family()
            self._to_gap_arrow = to_gap_arrows
            self._from_gap_arrow = from_gap_arrows
        else:
            return NotImplemented

    def vertices(self):
        return self._quiver.VerticesOfQuiver()

    def arrows(self):
        return self._quiver.ArrowsOfQuiver()

    def to_arrow(self, arrow):
        return self._to_gap_arrow[arrow]

    def from_arrow(self, arrow):
        return self._from_gap_arrow['"%s"'%arrow]

    def to_vertex(self, vertex):
        return self._to_gap_vertex[vertex]

    @cached_method
    def path_algebra(self, ring=QQ):
        return gap.PathAlgebra(QQ, self._quiver)

    def path_algebra_quotient(self, generators, ring=QQ):
        A = self.path_algebra(ring)
        I = self.ideal(generators)
        GBNPGroebnerBasis(I)
        return gap("%s/%s" % (A.name(), I.name()))

    def path_algebra_element(self, element):
        r"""
        TESTS::

            sage: time Q, I = go(n=4)
            sage: q = Q.to_gap_quiver()
            sage: p = I[0]
            sage: q.path_algebra_element(p)
        """
        A = self.path_algebra()
        z = gap.Zero(A)
        for (path, coeff) in element:
            z += coeff * gap('*'.join('%s.%s' %
                (A.name(),str(self.to_arrow(arrow)).replace('"',''))
                for arrow in path))
        return z

    def path_algebra_vertex(self, vertex):
        r"""
        TESTS::

            sage: time Q, I = go(n=4)
            sage: q = Q.to_gap_quiver()
            sage: q.path_algebra_vertex(Q.vertices()[-2])
        """
        A = self.path_algebra()
        return gap.get_record_element(A, "v"+str(self.to_vertex(vertex)))

    def ideal(self, generators):
        r"""
        TESTS::

            sage: time Q, I = go(n=4)
            sage: q = Q.to_gap_quiver()
            sage: q.ideal(I)
        """
        elems = map(self.path_algebra_element, generators)
        return gap.Ideal(self.path_algebra(), elems)

    def projective_indecomposable(self, vertex, generators):
        r"""
        TESTS::

            sage: time Q, I = go(n=4)
            sage: q = Q.to_gap_quiver()
            sage: v = Q.vertices()[-1]; v
            sage: q.projective_indecomposable(v, I)

        GAP code for our example::

            Q := Quiver( ["v1","v2","v3","v4","v5","v6","v7","v8","v9","v10","v11","v12","v13","v14","v15","v16"], [["v1","v5","a1"],["v1","v12","a2"],["v2","v4","a3"],["v5","v15","a4"],["v8","v10","a5"],["v12","v15","a6"],["v13","v11","a7"],["v16","v7","a8"]]);
            A := PathAlgebra(Rationals,Q);
            I := Ideal(A, [ A.a1*A.a4 - A.a2*A.a6 ]);
            gb := GBNPGroebnerBasis(I);
            GroebnerBasis(I,gb);
            B := A/I;
            B.a1*B.a4 - B.a2*B.a6;
            P := RightProjectiveModule(B, [B.v16]);
        """
        Q = self._quiver
        A = gap.PathAlgebra(QQ, Q)
        gap_generators = []
        z = gap.Zero(A)
        for element in generators:
            for (path, coeff) in element:
                z += coeff * gap('*'.join('%s.%s' %
                    (A.name(),str(self.to_arrow(arrow)).replace('"',''))
                    for arrow in path))
            gap_generators.append(z.name())
        I = gap('Ideal(%s, [%s])' % (A.name(), ','.join(gap_generators)))
        gb = gap.GBNPGroebnerBasis(I)
        gap.GroebnerBasis(I,gb)
        B = gap('%s/%s' % (A.name(), I.name()))
        v = self.to_vertex(vertex)
        #print "RightProjectiveModule(%s,[%s.v%s])" % (B.name(),B.name(),v)
        return gap("RightProjectiveModule(%s,[%s.v%s])" % (B.name(),B.name(),v))

    def grobner_basis_of_ideal(self, generators):
        r"""
        TESTS::

            sage: time Q, I = go(n=4)
            sage: q = Q.to_gap_quiver()
            sage: q.ideal(I)
            sage: q.grobner_basis_of_ideal(I)
        """
        gap.RequirePackage('"GBNP"')
        A = self.path_algebra()
        elems = map(self.path_algebra_element, generators)
        gb = gap.GBNPGroebnerBasis(elems, A)
        return GroebnerBasis(I, gb)

    # TODO: INCOMPLETE
    def representation(self, matrices):
        r"""
        gap> Q := Quiver(2, [[1, 2, "a"], [2, 1, "b"],[1, 1, "c"]]); 
        <quiver with 2 vertices and 3 arrows>
        gap> P := PathAlgebra(Rationals, Q);
        <algebra-with-one over Rationals, with 5 generators>
        gap> matrices := [["a", [[1,0,0],[0,1,0]]], ["b", [[0,1],[1,0],[0,1]]],
        > ["c", [[0,0],[1,0]]]];
        [ [ "a", [ [ 1, 0, 0 ], [ 0, 1, 0 ] ] ],
          [ "b", [ [ 0, 1 ], [ 1, 0 ], [ 0, 1 ] ] ],
          [ "c", [ [ 0, 0 ], [ 1, 0 ] ] ] ]
        gap> M := RightModuleOverPathAlgebra(P,matrices);

        EXAMPLES::

            sage: Q = Quiver({1:[1,2],2:[1]})
            sage: matrices = [["a", [[1,0,0],[0,1,0]]],
            ...     ["b", [[0,1],[1,0],[0,1]]], ["c", [[0,0],[1,0]]]]
            sage: q = Q.to_gap_quiver()

        """
        rep = []
        for arrow in self.arrows():
            m = matrices[self.from_arrow(arrow)]
            if m.nrows() == 0 or m.ncols() == 0:
                m = [m.nrows(), m.ncols()]
            rep.append( ['"%s"'%arrow, m] )
        Q = self._quiver
        A = gap.PathAlgebra(QQ, Q)
        print gap(rep)
        return gap.RightModuleOverPathAlgebra(A, rep)
