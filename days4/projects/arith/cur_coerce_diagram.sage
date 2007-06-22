def brute_force_rings(args):
    """
    Just try and create all sorts of rings, with the given arguments as constructors
    """
    for name, obj in sage.rings.all.__dict__.iteritems():
        if obj is farey or obj is ComplexNumber:
            continue
        for arg in args:
            try:
                R = obj(*arg)
                if is_Ring(R):
                    yield R
            except Exception, e:
                pass
                
def rand_elm(R):
    try:
        return R.random_element()
    except:
        try:
            return R.random_element(10)
        except:
            return R.random_element(-10, 10)


def coercion_graph(objs):
    G = DiGraph()
    for obj in objs:
        G.add_vertex(obj)
    for A in objs:
        for B in objs:
            try:
                a, b = canonical_coercion(rand_elm(A), rand_elm(B))
                if a.parent() != A:
                    G.add_arc(A, a.parent())
                if b.parent() != B:
                    G.add_arc(B, b.parent())
            except:
                pass
    return G

# The functions below are kind of brute-force, but work for small graphs. 

def find_longest_path(G, a, b, max_len=None):
    if a is b:
        return []
    elif max_len is None:
        max_len = len(G)-1
    elif max_len < 1:
        return None
    all = []
    for out in G.outgoing_arc_iterator(a):
        s = out[1]
        if s is b:
            all.append([b])
        else:
            p = find_longest_path(G, s, b, max_len-1)
            if p:
                all.append([s] + p)
    if len(all) == 0:
        return None
    else:
        m = max([len(p) for p in all])
        for p in all:
            if len(p) == m:
                return p
                
# Performs a kind of inverse to transative closure. 
                
def remove_redundant(G):
    """
    Performs a kind of inverse to transative closure 
    on a directed acyclic graph.
    """
    G = G.copy()
    for top in G.vertex_iterator():
        if len(G.incoming_arcs([top])) == 0:
            dists = {}
            for v in G.vertex_iterator():
                p = find_longest_path(G, top, v)
                if p is None:
                    dists[v] = -1
                else:
                    dists[v] = len(p)
            for e in G.arcs():
                if dists[e[1]] - dists[e[0]] > 1 and dists[e[0]] != -1:
                    p = find_longest_path(G, e[0], e[1], dists[e[1]] - dists[e[0]])
                    if len(p) != 1:
                        G.delete_arc(e[0], e[1])
    return G
    

def dot(G):
    s = "digraph" if G.is_directed() else "graph"
    s += ' "%r" {\n'%G
    for v in G.vertex_iterator():
        s += '  "%r"\n'%v
    if G.is_directed():
        for e in G.arc_iterator():
            s += '  "%r" -> "%r"\n'%(e[0], e[1])
    else:
        for e in G.edge_iterator():
            s += '  "%r" -> "%r"\n'%(e[0], e[1])
    s += "}"
    return s
        
################

args = [(), (7,), (7^3,), (7^3, 'a'), (ZZ, 'x')]
print "Constructing rings"
all = set(brute_force_rings(args))
# all.remove(RR) # gets messy

print len(all), "unique rings"
print "Creating coercion graph..."
G = coercion_graph(all);
G.save("coerce")
G.plot().save("coerce.png")
f = open("coerce.dot", "w")
f.write(dot(G))
f.close()

print "Simplifying..."
GG = remove_redundant(G)
G.save("coerce_simple")
G.plot().save("coerce_simple.png")
f = open("coerce_simple.dot", "w")
f.write(dot(GG))
f.close()
