= Sage Interactions - Graphics =
goto [:interact:interact main page]


[[TableOfContents]]

== Catalog of 3D Parametric Plots ==
{{{
var('u,v')
plots = ['Two Interlinked Tori', 'Star of David', 'Double Heart',
         'Heart', 'Green bowtie', "Boy's Surface", "Maeder's Owl",
         'Cross cap']
plots.sort()

@interact
def _(example=selector(plots, buttons=True, nrows=2),
      tachyon=("Raytrace", False), frame = ('Frame', False),
      opacity=(1,(0.1,1))):
    url = ''
    if example == 'Two Interlinked Tori':
        f1 = (4+(3+cos(v))*sin(u), 4+(3+cos(v))*cos(u), 4+sin(v))
        f2 = (8+(3+cos(v))*cos(u), 3+sin(v), 4+(3+cos(v))*sin(u))
        p1 = parametric_plot3d(f1, (u,0,2*pi), (v,0,2*pi), color="red", opacity=opacity)
        p2 = parametric_plot3d(f2, (u,0,2*pi), (v,0,2*pi), color="blue",opacity=opacity)
        P = p1 + p2
    elif example == 'Star of David':
        f_x = cos(u)*cos(v)*(abs(cos(3*v/4))^500 + abs(sin(3*v/4))^500)^(-1/260)*(abs(cos(4*u/4))^200 + abs(sin(4*u/4))^200)^(-1/200)
        f_y = cos(u)*sin(v)*(abs(cos(3*v/4))^500 + abs(sin(3*v/4))^500)^(-1/260)*(abs(cos(4*u/4))^200 + abs(sin(4*u/4))^200)^(-1/200)
        f_z = sin(u)*(abs(cos(4*u/4))^200 + abs(sin(4*u/4))^200)^(-1/200)
        P = parametric_plot3d([f_x, f_y, f_z], (u, -pi, pi), (v, 0, 2*pi),opacity=opacity)
    elif example == 'Double Heart':
        f_x = ( abs(v) - abs(u) - abs(tanh((1/sqrt(2))*u)/(1/sqrt(2))) + abs(tanh((1/sqrt(2))*v)/(1/sqrt(2))) )*sin(v)
        f_y = ( abs(v) - abs(u) - abs(tanh((1/sqrt(2))*u)/(1/sqrt(2))) - abs(tanh((1/sqrt(2))*v)/(1/sqrt(2))) )*cos(v)
        f_z = sin(u)*(abs(cos(4*u/4))^1 + abs(sin(4*u/4))^1)^(-1/1)
        P = parametric_plot3d([f_x, f_y, f_z], (u, 0, pi), (v, -pi, pi),opacity=opacity)
    elif example == 'Heart':
        f_x = cos(u)*(4*sqrt(1-v^2)*sin(abs(u))^abs(u))
        f_y = sin(u) *(4*sqrt(1-v^2)*sin(abs(u))^abs(u))
        f_z = v
        P = parametric_plot3d([f_x, f_y, f_z], (u, -pi, pi), (v, -1, 1), frame=False, color="red",opacity=opacity)
    elif example == 'Green bowtie':
        f_x = sin(u) / (sqrt(2) + sin(v))
        f_y = sin(u) / (sqrt(2) + cos(v))
        f_z = cos(u) / (1 + sqrt(2))
        P = parametric_plot3d([f_x, f_y, f_z], (u, -pi, pi), (v, -pi, pi), frame=False, color="green",opacity=opacity)
    elif example == "Boy's Surface":
        url = "http://en.wikipedia.org/wiki/Boy's_surface"
        fx = 2/3* (cos(u)* cos(2*v) + sqrt(2)* sin(u)* cos(v))* cos(u) / (sqrt(2) - sin(2*u)* sin(3*v))
        fy = 2/3* (cos(u)* sin(2*v) - sqrt(2)* sin(u)* sin(v))* cos(u) / (sqrt(2) - sin(2*u)* sin(3*v))
        fz = sqrt(2)* cos(u)* cos(u) / (sqrt(2) - sin(2*u)* sin(3*v))
        P = parametric_plot3d([fx, fy, fz], (u, -2*pi, 2*pi), (v, 0, pi), plot_points = [90,90], frame=False, color="orange",opacity=opacity) 
    elif example == "Maeder's Owl":
        fx = v *cos(u) - 0.5* v^2 * cos(2* u)
        fy = -v *sin(u) - 0.5* v^2 * sin(2* u)
        fz = 4 *v^1.5 * cos(3 *u / 2) / 3
        P = parametric_plot3d([fx, fy, fz], (u, -2*pi, 2*pi), (v, 0, 1),plot_points = [90,90], frame=False, color="purple",opacity=opacity)
    elif example =='Cross cap':
        url = 'http://en.wikipedia.org/wiki/Cross-cap'
        fx = (1+cos(v))*cos(u)
        fy = (1+cos(v))*sin(u)
        fz = -tanh((2/3)*(u-pi))*sin(v)
        P = parametric_plot3d([fx, fy, fz], (u, 0, 2*pi), (v, 0, 2*pi), frame=False, color="red",opacity=opacity)
    else:
        print "Bug selecting plot?"
        return


    html('<h2>%s</h2>'%example)
    if url:
        html('<h3><a target="_new" href="%s">%s</a></h3>'%(url,url))
    show(P, viewer='tachyon' if tachyon else 'jmol', frame=frame)
}}}

attachment:parametricplot3d.png

== Interactive rotatable raytracing with Tachyon3d ==

{{{
C = cube(color=['red', 'green', 'blue'], aspect_ratio=[1,1,1],
         viewer='tachyon') + sphere((1,0,0),0.2)
@interact
def example(theta=(0,2*pi), phi=(0,2*pi), zoom=(1,(1,4))):
    show(C.rotate((0,0,1), theta).rotate((0,1,0),phi), zoom=zoom)
}}}


attachment:tachyonrotate.png


== Interactive 3d plotting ==
{{{
var('x,y')
@interact
def example(clr=Color('orange'), f=4*x*exp(-x^2-y^2), xrange='(-2, 2)', yrange='(-2,2)', 
    zrot=(0,pi), xrot=(0,pi), zoom=(1,(1/2,3)), square_aspect=('Square Frame', False),
    tachyon=('Ray Tracer', True)):
    xmin, xmax = sage_eval(xrange); ymin, ymax = sage_eval(yrange)
    P = plot3d(f, (x, xmin, xmax), (y, ymin, ymax), color=clr)
    html('<h1>Plot of $f(x,y) = %s$</h1>'%latex(f))
    aspect_ratio = [1,1,1] if square_aspect else [1,1,1/2]
    show(P.rotate((0,0,1), -zrot).rotate((1,0,0),xrot), 
         viewer='tachyon' if tachyon else 'jmol', 
         figsize=6, zoom=zoom, frame=False,
         frame_aspect_ratio=aspect_ratio)
}}}


attachment:tachyonplot3d.png

[[Anchor(eggpaint)]]

== Somewhat Silly Egg Painter ==
by Marshall Hampton (refereed by William Stein)
{{{
var('s,t')
g(s) = ((0.57496*sqrt(121 - 16.0*s^2))/sqrt(10.+ s))
def P(color, rng):
    return parametric_plot3d((cos(t)*g(s), sin(t)*g(s), s), (s,rng[0],rng[1]), (t,0,2*pi), plot_points = [150,150], rgbcolor=color, frame = False, opacity = 1)
colorlist = ['red','blue','red','blue']
@interact
def _(band_number = selector(range(1,5)), current_color = Color('red')):
    html('<h1 align=center>Egg Painter</h1>')
    colorlist[band_number-1] = current_color
    egg = sum([P(colorlist[i],[-2.75+5.5*(i/4),-2.75+5.5*(i+1)/4]) for i in range(4)])
    show(egg)
}}}
attachment:eggpaint.png
