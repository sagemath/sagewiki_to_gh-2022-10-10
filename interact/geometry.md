= Sage Interactions - Geometry =
goto [[interact|interact main page]]

<<TableOfContents>>

== Intersecting tetrahedral reflections ==
by Marshall Hampton.  Inspired by a question from Hans Schepker of Glass Geometry.
{{{
p1 = Polyhedron(vertices = [[1,1,1],[1,1,0],[0,1,1],[1,0,1]])
p2 = Polyhedron(vertices = [[1/3,1/3,1/3],[1,1,0],[0,1,1],[1,0,1]])
p12 = p1.union(p2)
p3 = Polyhedron(vertices = [[0,0,1],[0,0,0],[0,1,1],[1,0,1]])
p4 = Polyhedron(vertices = [[2/3,2/3,1/3],[0,0,0],[0,1,1],[1,0,1]])
p34 = p3.union(p4)
p5 = Polyhedron(vertices = [[1,0,0],[1,0,1],[0,0,0],[1,1,0]])
p6 = Polyhedron(vertices = [[1/3,2/3,2/3],[1,0,1],[0,0,0],[1,1,0]])
p56 = p5.union(p6)
p7 = Polyhedron(vertices = [[0,1,0],[0,0,0],[1,1,0],[0,1,1]])
p8 = Polyhedron(vertices = [[2/3,1/3,2/3],[0,0,0],[1,1,0],[0,1,1]])
p78 = p7.union(p8)
pti = p12.intersection(p34).intersection(p56).intersection(p78)
}}}
