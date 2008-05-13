= Sage Interactions - Graph Theory =
goto [:interact:interact main page]

[[TableOfContents]]

== Automorphism Groups of some Graphs ==
by William Stein (I spent less than five minutes on this):

{{{
@interact
def _(graph=['CycleGraph', 'CubeGraph', 'RandomGNP'],
      n=selector([1..10],nrows=1), p=selector([10,20,..,100],nrows=1)):
    print graph
    if graph == 'CycleGraph':
       print "n (=%s): number of vertices"%n
       G = graphs.CycleGraph(n)
    elif graph == 'CubeGraph':
       if n > 8:
           print "n reduced to 8"
           n = 8
       print "n (=%s): dimension"%n
       G = graphs.CubeGraph(n)
    elif graph == 'RandomGNP':
       print "n (=%s) vertices"%n
       print "p (=%s%%) probability"%p
       G = graphs.RandomGNP(n, p/100.0)
    print G.automorphism_group()
    show(plot(G))
}}}

attachment:autograph.png
