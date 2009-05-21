= Sage Interactions - Geometry =
goto [[interact|interact main page]]

<<TableOfContents>>

== Intersecting tetrahedral reflections ==
by Marshall Hampton.  Inspired by a question from Hans Schepker of Glass Geometry.
{{{
#Pairs of tetrahedra, one the reflection of the other in the internal face, are joined by union operations:
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
@interact
def tetra_plot(opac = slider(srange(0,1.0,.25), default = .25)):
    p12r = p12.render_wireframe()+p12.render_solid(opacity = opac)
    p34r = p34.render_wireframe()+p34.render_solid(rgbcolor = (0,0,1),opacity = opac)
    p56r = p56.render_wireframe()+p56.render_solid(rgbcolor = (0,1,0),opacity = opac)
    p78r = p78.render_wireframe()+p78.render_solid(rgbcolor = (0,1,1),opacity = opac)
    ptir = pti.render_wireframe()+pti.render_solid(rgbcolor = (1,0,1),opacity = .9)
    show(p12r+p34r+p56r+p78r+ptir, frame = False)
}}}
{{attachment:tetrareflect.png}}

== Evolutes ==
by Pablo Angulo. Computes the evolute of a plane curve given in parametric coordinates. The curve must be parametrized from the interval [0,2pi]. The following animation was done with similar code:
http://www.uam.es/personal_pdi/ciencias/pangulo/adjuntos/evoluta.gif
{{{
var('t');
def norma(v):
    return sqrt(sum(x^2 for x in v))    
paso_angulo=5

@interact
def _( gamma1=input_box(default=sin(t)), gamma2=input_box(default=1.3*cos(t)), 
    rango_angulos=range_slider(0,360,paso_angulo,(0,45),label='Draw lines for these angles') ):
    print rango_angulos
    gamma=(gamma1,gamma2)
    gammap=(gamma[0].derivative(),gamma[1].derivative())
    normal=(gammap[1]/norma(gammap), -gammap[0]/norma(gammap))
    gammapp=(gammap[0].derivative(),gammap[1].derivative())
    
    np=norma(gammap)
    npp=norma(gammapp)
    pe=gammap[0]*gammapp[0]+gammap[1]*gammapp[1]
    radio=np^3/sqrt(np^2*npp^2-pe^2)
    centros=(gamma[0]+radio*normal[0],gamma[1]+radio*normal[1])
    
    curva=parametric_plot(gamma,(t,0,2*pi))
    evoluta=parametric_plot(centros,(t,0,2*pi), color='red')

    f=2*pi/360
    lineas=sum(line2d([(gamma[0](t=i*f), gamma[1](t=i*f)), (centros[0](t=i*f), centros[1](t=i*f)) ], thickness=1,rgbcolor=(1,0.8,0.8)) for i in range(rango_angulos[0],rango_angulos[1]+paso_angulo,paso_angulo))

    show(curva+evoluta+lineas,aspect_ratio=1,xmin=-2,xmax=2,ymin=-2,ymax=2)
}}}
{{attachment:evoluta3.png}}
