############################################################
# Preliminary functions that are used in combining posets: #
############################################################

def max_j_value(p):
    m = 0
    for i in range(len(p.list())):
        if p.list()[i].element[1]>m:
            m = p.list()[i].element[1]
    return(m)
    
def max_i_value(p):
    m = 0
    for i in range(len(p.list())):
        if p.list()[i].element[0]>m:
            m = p.list()[i].element[0]
    return(m)
    
def determining_fxn(p,x):
    return( (max_j_value(p)/max_i_value(p))*x )

##################################
# Function for combining posets: #
##################################

r"""
Combine two Posets, A and B, by making some b in B a cover of some a in A

This function only works for posets A and B, whose elements are of the form (i,j), where i and j are integers. Also, B must contain the element (0,0)
By inputting two posets A,B, and an ordered pair (x,y) (which is an element of A), the function will perform a translation, phi, on all the vertices and relations in B, so that A and phi(B) have no common elements. It will then make phi((0,0)) a cover of (x,y).
Finally, the function will output the poset created from the elements of A and phi(B) and the relations of A, phi(B), and [(x,y),phi(0,0)]

AUTHORS:

- Gaelan Hanlon (2011-05-05): initial version

Example
    
    sage: elms1 = [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
    sage: rels1 = [[(0,0),(0,1)],[(0,0),(1,0)],[(0,1),(1,1)],[(0,1),(0,2)],[(0,2),(1,2)],[(1,1),(1,2)],[(1,0),(1,1)]]
    sage: elms2 = [(0,0),(0,1),(1,0),(1,1),(2,0)]
    sage: rels2 = [[(0,0),(0,1)],[(0,0),(1,0)],[(0,1),(1,1)],[(1,0),(1,1)],[(1,0),(2,0)]]
    sage: P1 = Poset((elms1, rels1), cover_relations = True)
    sage: P2 = Poset((elms2, rels2), cover_relations = True)
    
    sage: P = join_posets(P1,P2,(0,1))
    Sage: P
    Finite poset containing 11 elements
    Sage: P.list()
    [(0, 0), (1, 0), (0, 1), (-1, 4), (-1, 5), (0, 4), (0, 5), (1, 4), (0,
    2), (1, 1), (1, 2)]
    Sage: P.cover_relations()
    [[(0, 0), (1, 0)], [(0, 0), (0, 1)], [(1, 0), (1, 1)], [(0, 1), (-1,
    4)], [(0, 1), (0, 2)], [(0, 1), (1, 1)], [(-1, 4), (-1, 5)], [(-1, 4),
    (0, 4)], [(-1, 5), (0, 5)], [(0, 4), (0, 5)], [(0, 4), (1, 4)], [(0, 2),
    (1, 2)], [(1, 1), (1, 2)]]
        
"""

#*****************************************************************************
#       Copyright (C) 2010 YOUR NAME <your email>
#
#  Distributed under the terms of the GNU General Public License (GPL)
#  as published by the Free Software Foundation; either version 2 of
#  the License, or (at your option) any later version.
#                  http://www.gnu.org/licenses/
#*****************************************************************************

def join_posets(p1,p2,x):      

    i,j = x
    new_coords = []
    new_rels = []
      
    ##Case 1
    if determining_fxn(p1,i)<j:
        for k in range(len(p2.list())):
            new_coords.append( ((p2.list()[k].element[0] + i-1, p2.list()[k].element[1] + max_j_value(p1) + 2)) )
        for k in range(len(p2.cover_relations()) ):
            new_rels.append( [(p2.cover_relations()[k][0].element[0] + i-1, p2.cover_relations()[k][0].element[1] + max_j_value(p1) + 2), (p2.cover_relations()[k][1].element[0] + i-1, p2.cover_relations()[k][1].element[1] + max_j_value(p1) + 2)] )
        new_rels = new_rels + [ [(i,j),(i-1,max_j_value(p1) + 2)] ]
       
    ##Case 2
    if determining_fxn(p1,i)>=j:
        for k in range(len(p2.list())):
            new_coords.append( ((p2.list()[k].element[0] + max_i_value(p1)+2, p2.list()[k].element[1] + j-1)) )
        for k in range(len(p2.cover_relations()) ):
            new_rels.append( [(p2.cover_relations()[k][0].element[0] + max_i_value(p1)+2, p2.cover_relations()[k][0].element[1] + j-1), (p2.cover_relations()[k][1].element[0] + max_i_value(p1)+2, p2.cover_relations()[k][1].element[1] + j-1)] )
        new_rels = new_rels + [ [(i,j),(max_i_value(p1)+2,j-1)] ]
            
    L1=[a.element for a in p1.list()]
    L2=new_coords+L1
    R1=[[P1.cover_relations()[i][0].element,P1.cover_relations()[i][1].element] for i in range(len(P1.cover_relations()))]
    R2=new_rels + R1
       
    return(Poset((L2,R2)))