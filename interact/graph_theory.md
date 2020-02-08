= Sage Interactions - Graph Theory =
goto [[interact|interact main page]]

<<TableOfContents>>

== Graph Browser ==
by Marshall Hampton 
{{{#!sagecell
grs = ['BalancedTree', 'BullGraph', 'ChvatalGraph', 'CirculantGraph', 'CircularLadderGraph', 'ClawGraph', 'CompleteBipartiteGraph', 'CompleteGraph', 'CubeGraph', 'CycleGraph', 'DegreeSequence', 'DegreeSequenceConfigurationModel', 'DegreeSequenceExpected', 'DegreeSequenceTree', 'DesarguesGraph', 'DiamondGraph', 'DodecahedralGraph', 'DorogovtsevGoltsevMendesGraph', 'EmptyGraph', 'FlowerSnark', 'FruchtGraph', 'Grid2dGraph', 'GridGraph', 'HeawoodGraph', 'HexahedralGraph', 'HoffmanSingletonGraph', 'HouseGraph', 'HouseXGraph', 'IcosahedralGraph', 'KrackhardtKiteGraph', 'LCFGraph', 'LadderGraph', 'LollipopGraph', 'MoebiusKantorGraph', 'OctahedralGraph', 'PappusGraph', 'PathGraph', 'PetersenGraph', 'RandomBarabasiAlbert', 'RandomGNM', 'RandomGNP', 'RandomHolmeKim', 'RandomLobster', 'RandomNewmanWattsStrogatz', 'RandomRegular', 'RandomTreePowerlaw', 'StarGraph', 'TetrahedralGraph', 'ThomsenGraph', 'WheelGraph']
examples = {}
for g in grs:
    docs = eval('graphs.' + g + '.__doc__')
    for docline in docs.split('\n'):
        ex_loc = docline.find('graphs.' + g)
        if ex_loc != -1:
            end_paren_loc = docline[ex_loc:].find(')')
            ex_str = docline[ex_loc:end_paren_loc+ex_loc+1]
            ex_str = ex_str.replace('i+','2+')
            ex_str = ex_str.replace('(i','(4')
            break
    try:
        gt2 = eval(ex_str)
        examples[g] = ex_str
    except:
        grs.remove(g)
@interact
def graph_browser(graph_name = selector(grs, label = "Graph type:"), newargs = input_box('',type=str,label='tuple of args'), output_type = selector(['2D','3D'], default='2D')):
    base_g_str = 'graphs.' + graph_name
    docs = eval(base_g_str + '.__doc__')
    doc_ex_loc = docs.find('EXAMPLE')
    if docs.find('PLOTTING') != -1:
        doc_ex_loc = min(doc_ex_loc, docs.find('PLOTTING'))
    print(docs[0:doc_ex_loc].replace('\n        ','\n'))
    if newargs != '':
        try:
            t_graph = eval(base_g_str + newargs)
        except:
            print("Invalid arguments, using default")
            t_graph = eval(examples[graph_name])
    else: 
        t_graph = eval(examples[graph_name])
    if output_type == '2D': show(t_graph)
    if output_type == '3D': t_graph.show3d()
}}}
{{attachment:graph_browse.png}}


== Automorphism Groups of some Graphs ==
by William Stein:

{{{#!sagecell
@interact
def _(graph=['CycleGraph', 'CubeGraph', 'RandomGNP'],
      n=selector([1..10],nrows=1), p=selector([10,20,..,100],nrows=1)):
    print(graph)
    if graph == 'CycleGraph':
       print("n = %s (number of vertices)" % n)
       G = graphs.CycleGraph(n)
    elif graph == 'CubeGraph':
       if n > 8:
           print("n reduced to 8")
           n = 8
       print("n = %s (dimension)" % n)
       G = graphs.CubeGraph(n)
    elif graph == 'RandomGNP':
       print("n = %s (number of vertices)" % n)
       print("p = %s%% (edge probability)" % p)
       G = graphs.RandomGNP(n, p / 100.0)
    print(G.automorphism_group())
    show(plot(G))
}}}

{{attachment:auto_graph2.png}}

== View an induced subgraph ==
by Jason Grout

{{{#!sagecell
m=random_matrix(ZZ,10,density=.5)
a=DiGraph(m) 

@interact
def show_subgraph(to_delete=selector(range(10),buttons=True)):
    vertices=set(range(10))
    subgraph_vertices=vertices.difference([to_delete])
    html.table([["Original", "New"],
               [plot(a,save_pos=True), plot(a.subgraph(subgraph_vertices))]],
               header=True)
}}}

{{attachment:subgraph-interact.png}}


== Animations of Graph Minors ==
by Pablo Angulo

{{{#!sagecell
def animate_contraction(g, e, frames = 12, **kwds):
    v1, v2 = e
    if not g.has_edge(v1,v2):
        raise ValueError("Given edge not found on Graph")
    ls = []
    posd = g.get_pos()
    for j in range(frames):
        gp = Graph(g)
        posdp = dict(posd)
        p1 = posdp[v1]
        p2 = posdp[v2]
        posdp[v2] = [a*(frames-j)/frames + b*j/frames
                    for a,b in zip(p2,p1)]

        gp.set_pos(posdp)
        ls.append(plot(gp, **kwds))
    return ls

def animate_vertex_deletion(g, v, frames = 12, **kwds):
    kwds2 = dict(kwds)
    if 'vertex_colors' in kwds:
        cs = dict(kwds['vertex_colors'])
        for c, vs in kwds['vertex_colors'].items():
            if v in vs:
                vs2 = list(vs)
                vs2.remove(v)
                cs[c] = vs2
        kwds2['vertex_colors'] = cs
    else:
        kwds2 = dict(kwds)
    g2 = Graph(g)
    posd = dict(g.get_pos())
    del posd[v]
    g2.delete_vertex(v)
    g2.set_pos(posd)
    return [plot(g, **kwds),plot(g2, **kwds2)]*int(frames/2)
    
def animate_edge_deletion(g, e, frames = 12, **kwds):
    v1, v2 = e
    g2 = Graph(g)
    g2.delete_edge(e)
    return [plot(g, **kwds),plot(g2, **kwds)]*int(frames/2)
    
def animate_glide(g, pos1, pos2, frames = 12, **kwds):
    ls = []
    for j in range(frames):
        gp = Graph(g)
        pos = {}
        for v in gp.vertices():
            p1 = pos1[v]
            p2 = pos2[v]
            pos[v] = [b*j/frames + a*(frames-j)/frames
                        for a,b in zip(p1,p2)]    
        gp.set_pos(pos)
        ls.append(plot(gp, **kwds))
    return ls
    
def medio(p1, p2):
    return tuple((a+b)/2 for a,b in zip(p1, p2))

def new_color():
    return (0.1+0.8*random(), 0.1+0.8*random(), 0.1+0.8*random())
    
def animate_minor(g, m, frames = 12, pause = 50, step_time = 100):
    '''Crea una animación que muestra cómo un grafo tiene un menor m
    '''
    posd = dict(g.get_pos())
    posg = posd.values()
    posm = m.get_pos().values()
    xmax = max(max(x for x,y in posg), max(x for x,y in posm))
    ymax = max(max(y for x,y in posg), max(y for x,y in posm))
    xmin = min(min(x for x,y in posg), min(x for x,y in posm))
    ymin = min(min(y for x,y in posg), min(y for x,y in posm))
    dd = g.minor(m)
    
    #Set colors
    m_colors = dict((v,new_color()) for v in m.vertices())
    g_colors = dict((m_colors[k],vs) 
                        for k,vs in dd.items())

    extra_vs = (set(g.vertices()) - 
                set(v for vs in dd.values() 
                      for v in vs))
    g_colors[(0,0,0)] = list(extra_vs)

    #pics contains the frames of the animation 
    #no colors at the beggining   
    gg = Graph(g)
    pics = [plot(gg)]*frames

    #First: eliminate extra vertices
    for v in extra_vs:
        pics.extend(animate_vertex_deletion(gg, v, frames,
                            vertex_colors = g_colors))
        gg.delete_vertex(v)
        del posd[v]
        g_colors[(0,0,0)].remove(v)
    del g_colors[(0,0,0)]
    
    #Second: contract edges
    for color, vs in g_colors.items():
        while len(vs) > 1:
            for j in range(1, len(vs)):
                if gg.has_edge(vs[0], vs[j]):
                    break
            pics.extend(animate_contraction(gg, (vs[0], vs[j]), frames,
                                vertex_colors = g_colors))
            for v in gg.neighbors(vs[j]):
                gg.add_edge(vs[0],v)
            gg.delete_vertex(vs[j])
            del posd[vs[j]]
            gg.set_pos(posd)
            posd = dict(gg.get_pos())
            del vs[j]

    #Relabel vertices of m so that they match with those of gg
    m = Graph(m)
    dd0 = dict((k, vs[0])  
                  for k,vs in dd.items() )
    m.relabel(dd0)
    

    #Third: glide to position in m
    pos_m = m.get_pos()
    pos_g = gg.get_pos()
    pics.extend(animate_glide(gg, pos_g, pos_m, frames,
                                vertex_colors = g_colors))
    gg.set_pos(pos_m)
            
    #Fourth: delete redundant edges
    for e in gg.edges(labels = False):
        if not m.has_edge(e):
            pics.extend(animate_edge_deletion(gg, e, frames,
                                vertex_colors = g_colors))
            gg.delete_edge(*e)

    #And wait for a moment
    pics.extend([plot(gg, vertex_colors = g_colors)]*frames)
    
    return animate(pics, xmin = xmin - 0.1, xmax = xmax + 0.1, 
                         ymin = ymin - 0.1, ymax = ymax + 0.1)

graph_list = {'CompleteGraph4':graphs.CompleteGraph(4),
              'CompleteGraph5':graphs.CompleteGraph(5),
              'CompleteGraph6':graphs.CompleteGraph(6),
              'BipartiteGraph3,3':graphs.CompleteBipartiteGraph(3,3),
              'BipartiteGraph4,3':graphs.CompleteBipartiteGraph(4,3),
              'PetersenGraph':graphs.PetersenGraph(),
              'CycleGraph4':graphs.CycleGraph(4),
              'CycleGraph5':graphs.CycleGraph(5),
              'BarbellGraph(3,2)':graphs.BarbellGraph(3,2)
              }
@interact
def _(u1 = text_control(value='Does this graph'),
      g  = selector(graph_list.keys(), buttons = True,default='CompleteGraph4'),
      u2 = text_control(value='have a minor isomorphic to this other graph:'),
      m  = selector(graph_list.keys(), buttons = True,default='CycleGraph4'),
      u3 = text_control(value='''? If it has, show it to me, 
      with an animation with the following parameters'''),
      frames = slider(1,15,1,4, label = 'Frames per second'),
      step_time = slider(1/10,2,1/10,1, label = 'Seconds per step')):
    g = graph_list[g]
    m = graph_list[m]
    if g == m:
        html('<h3>Please select two different graphs</h3>')
        return
    try:
        a = animate_minor(g, m, frames = frames)
        a.show(delay=100*step_time/frames)
    except ValueError:
        html('''<h3>The first graph have <strong>NO</strong> minor isomorphic to the second</h3>''')
}}}
{{attachment:wagner.gif}}
