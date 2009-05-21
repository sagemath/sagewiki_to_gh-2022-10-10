= Sage Interactions - Miscellaneous =
goto [[interact|interact main page]]


<<TableOfContents>>

== An Interactive Venn Diagram ==

{{{
def f(s, braces=True): 
    t = ', '.join(sorted(list(s)))
    if braces: return '{' + t + '}'
    return t
def g(s): return set(str(s).replace(',',' ').split())

@interact
def _(X='1,2,3,a', Y='2,a,3,4,apple', Z='a,b,10,apple'):
    S = [g(X), g(Y), g(Z)]
    X,Y,Z = S
    XY = X.intersection(Y)
    XZ = X.intersection(Z)
    YZ = Y.intersection(Z)
    XYZ = XY.intersection(Z)
    html('<center>')
    html("$X \cap Y$ = %s"%f(XY))
    html("$X \cap Z$ = %s"%f(XZ))
    html("$Y \cap Z$ = %s"%f(YZ))
    html("$X \cap Y \cap Z$ = %s"%f(XYZ))
    html('</center>')
    centers = [(cos(n*2*pi/3), sin(n*2*pi/3)) for n in [0,1,2]]
    scale = 1.7
    clr = ['yellow', 'blue', 'green']
    G = Graphics()
    for i in range(len(S)):
        G += circle(centers[i], scale, rgbcolor=clr[i], 
             fill=True, alpha=0.3)
    for i in range(len(S)):
        G += circle(centers[i], scale, rgbcolor='black')

    # Plot what is in one but neither other
    for i in range(len(S)):
        Z = set(S[i])
        for j in range(1,len(S)):
            Z = Z.difference(S[(i+j)%3])
        G += text(f(Z,braces=False), (1.5*centers[i][0],1.7*centers[i][1]), rgbcolor='black')


    # Plot pairs of intersections
    for i in range(len(S)):
        Z = set(S[i]).intersection(S[(i+1)%3]).difference(set(XYZ))
        C = (1.3*cos(i*2*pi/3 + pi/3), 1.3*sin(i*2*pi/3 + pi/3))
        G += text(f(Z,braces=False), C, rgbcolor='black')

    # Plot intersection of all three
    G += text(f(XYZ,braces=False), (0,0), rgbcolor='black')

    # Show it
    G.show(aspect_ratio=1, axes=False)
}}}

{{attachment:veng.png}}

== Unreadable code ==
by Igor Tolkov
{{{
@interact
def _(h=(20,(1,36,1))):
    print (lambda f:f(0,f))(
        lambda n,f:'%s\n%s'%(
            ('*'*(2*n+1)).join([' '*(h-n-1)]*2),
            ((n<h-1 and f(n+1,f)) or '')
        )
    )
}}}
{{attachment:unreadable.png}}


== Profile a snippet of code ==
{{{
html('<h2>Profile the given input</h2>')
import cProfile; import profile
@interact
def _(cmd = ("Statement", '2 + 2'), 
      do_preparse=("Preparse?", True), cprof =("cProfile?", False)):
    if do_preparse: cmd = preparse(cmd)
    print "<html>"  # trick to avoid word wrap
    if cprof:
        cProfile.run(cmd)
    else:
        profile.run(cmd)
    print "</html>"
}}}
{{attachment:profile.png}}


=== Evaluate a bit of code in a given system ===

by William Stein (there is no way yet to make the text box big):
{{{
@interact
def _(system=selector([('sage0', 'Sage'), ('gp', 'PARI'), ('magma', 'Magma')]), code='2+2'):
    print globals()[system].eval(code)
}}}

{{attachment:evalsys.png}}

== A Random Walk ==

by William Stein

{{{
html('<h1>A Random Walk</h1>')
vv = []; nn = 0
@interact
def foo(pts = checkbox(True, "Show points"), 
        refresh = checkbox(False, "New random walk every time"),
        steps = (50,(10..500))):
    # We cache the walk in the global variable vv, so that
    # checking or unchecking the points checkbox doesn't change
    # the random walk. 
    html("<h2>%s steps</h2>"%steps)
    global vv
    if refresh or len(vv) == 0:
        s = 0; v = [(0,0)]
        for i in range(steps): 
             s += random() - 0.5
             v.append((i, s)) 
        vv = v
    elif len(vv) != steps:
        # Add or subtract some points
        s = vv[-1][1]; j = len(vv)
        for i in range(steps - len(vv)):
            s += random() - 0.5
            vv.append((i+j,s))
        v = vv[:steps]
    else:
        v = vv
    L = line(v, rgbcolor='#4a8de2')
    if pts: L += points(v, pointsize=10, rgbcolor='red')
    show(L, xmin=0, figsize=[8,3])
}}}
{{attachment:randomwalk.png}}

== 3D Random Walk ==
{{{
@interact
def rwalk3d(n=(50,1000), frame=True):
    pnt = [0,0,0]
    v = [copy(pnt)]
    for i in range(n):
        pnt[0] += random()-0.5
        pnt[1] += random()-0.5
        pnt[2] += random()-0.5
        v.append(copy(pnt))
    show(line3d(v,color='black'),aspect_ratio=[1,1,1],frame=frame)
}}}
{{attachment:randomwalk3d.png}}

== Minkowski Sum ==
by Marshall Hampton
{{{
def minkdemo(list1,list2):
    '''
    Returns the Minkowski sum of two lists.
    '''
    output = []
    for stuff1 in list1:
        for stuff2 in list2:
            temp = [stuff1[i] + stuff2[i] for i in range(len(stuff1))]
            output.append(temp)
    return output
@interact
def minksumvis(x1tri = slider(-1,1,1/10,0, label = 'Triangle point x coord.'), yb = slider(1,4,1/10,2, label = 'Blue point y coord.')):
    t_list = [[1,0],[x1tri,1],[0,0]]
    kite_list = [[3, 0], [1, 0], [0, 1], [1, yb]]
    triangle = polygon([[q[0]-6,q[1]] for q in t_list], alpha = .5, rgbcolor = (1,0,0))
    t_vert = point([x1tri-6,1], rgbcolor = (1,0,0))
    b_vert = point([kite_list[3][0]-4,yb], rgbcolor = (0,0,1))
    kite = polygon([[q[0]-4,q[1]] for q in kite_list], alpha = .5,rgbcolor = (0,0,1))
    p12 = minkdemo(t_list, kite_list)
    p12 = [[q[0],q[1]] for q in p12]
    p12poly = Polyhedron(p12)
    edge_lines = Graphics()
    verts = p12poly.vertices()
    for an_edge in p12poly.vertex_adjacencies():
        edge_lines = edge_lines + line([verts[an_edge[0]], verts[an_edge[1][0]]])
        edge_lines = edge_lines + line([verts[an_edge[0]], verts[an_edge[1][1]]])
    triangle_sum = Graphics()
    for vert in kite_list:
        temp_list = []
        for q in t_list:
            temp_list.append([q[i] + vert[i] for i in range(len(t_list[0]))])
        triangle_sum = triangle_sum + polygon(temp_list, alpha = .5, rgbcolor = (1,0,0))
    kite_sum = Graphics()
    for vert in t_list:
        temp_list = []
        for q in kite_list:
            temp_list.append([q[i] + vert[i] for i in range(len(t_list[0]))])
        kite_sum = kite_sum + polygon(temp_list, alpha = .3,rgbcolor = (0,0,1))
    labels = text('+', (-4.3,.5), rgbcolor = (0,0,0))
    labels = labels + text('=', (-.2,.5), rgbcolor = (0,0,0))
    show(labels + t_vert + b_vert+ triangle + kite + triangle_sum + kite_sum + edge_lines, axes=False, figsize = [11.0*.7, 4*.7], xmin = -6, ymin = 0, ymax = 4)
}}}
{{attachment:minksum.png}}
== Queens on board ==
An interaction to play with the problem of placing eight queens on a board so that they do not threaten each other. This interaction exemplifies the use of persistent data, and the auto_update=False option coded by mhansen and included in sage 3.3.
by Pablo Angulo
{{{
queens=[]
opciones=['Clean board', 'Add queen', 'Remove queen' ]

@interact
def _(queen=input_box(default=(0,0)), opcion=selector(opciones, buttons=True), auto_update=False ):
    global queens
    if opcion=='Clean board':
        queens=[]
    elif opcion=='Add queen':
        if queen not in queens:
            queens.append(queen)
    else:
        queens.remove(queen)
        
    board=matrix(ZZ,8,8)
    for x in range(8):
        for y in range(8):
            board[x,y]=(x+y)%2*7
    for x,y in queens:
        for i in range(8):
            if i!=y:  board[x,i]=1+(x+i)%2*5
            if i!=x:  board[i,y]=1+(i+y)%2*5
        for i in range(-min(x,y),min(8-x,8-y)):
            if i!=0: board[x+i,y+i]=1+(x+y)%2*5
        for i in range(max(-x,y-7),min(8-x,y+1)):
            if i!=0: board[x+i,y-i]=1+(x+y)%2*5
    for x,y in queens:
        if ( board[x,y]==1 or board[x,y]==6 ):
            print 'Queen at (%d,%d) is threatened by another queen'%(x,y)
            board[x,y]=4  
        else:
            board[x,y]=3
    show(matrix_plot(board, cmap='Oranges' ))
    
}}}
{{attachment:queens.png}}
