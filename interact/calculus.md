= Sage Interactions - Calculus =
goto [[interact|interact main page]]

<<TableOfContents>>

== Root Finding Using Bisection ==
by William Stein

{{{
def bisect_method(f, a, b, eps):
    try:
        f = f._fast_float_(f.variables()[0])
    except AttributeError:
        pass
    intervals = [(a,b)]
    two = float(2); eps = float(eps)
    while True:
        c = (a+b)/two
        fa = f(a); fb = f(b); fc = f(c)
        if abs(fc) < eps: return c, intervals
        if fa*fc < 0:
            a, b = a, c
        elif fc*fb < 0:
            a, b = c, b
        else:
            raise ValueError, "f must have a sign change in the interval (%s,%s)"%(a,b)
        intervals.append((a,b))
html("<h1>Double Precision Root Finding Using Bisection</h1>")
@interact
def _(f = cos(x) - x, a = float(0), b = float(1), eps=(-3,(-16..-1))):
     eps = 10^eps
     print "eps = %s"%float(eps)
     try:
         time c, intervals = bisect_method(f, a, b, eps)
     except ValueError:
         print "f must have opposite sign at the endpoints of the interval"
         show(plot(f, a, b, color='red'), xmin=a, xmax=b)
     else:
         print "root =", c
         print "f(c) = %r"%f(c)
         print "iterations =", len(intervals)
         P = plot(f, a, b, color='red')
         h = (P.ymax() - P.ymin())/ (1.5*len(intervals))
         L = sum(line([(c,h*i), (d,h*i)]) for i, (c,d) in enumerate(intervals) )
         L += sum(line([(c,h*i-h/4), (c,h*i+h/4)]) for i, (c,d) in enumerate(intervals) )
         L += sum(line([(d,h*i-h/4), (d,h*i+h/4)]) for i, (c,d) in enumerate(intervals) )
         show(P + L, xmin=a, xmax=b)
}}}
{{attachment:bisect.png}}

== Newton's Method ==
Note that there is a more complicated Newton's method below.

by William Stein

{{{
def newton_method(f, c, eps, maxiter=100):
    x = f.variables()[0]
    fprime = f.derivative(x)
    try:
        g = f._fast_float_(x)
        gprime = fprime._fast_float_(x)
    except AttributeError:
        g = f; gprime = fprime
    iterates = [c]
    for i in xrange(maxiter):
       fc = g(c)
       if abs(fc) < eps: return c, iterates
       c = c - fc/gprime(c)
       iterates.append(c)
    return c, iterates
html("<h1>Double Precision Root Finding Using Newton's Method</h1>")
@interact
def _(f = x^2 - 2, c = float(0.5), eps=(-3,(-16..-1)), interval=float(0.5)):
     eps = 10^(eps)
     print "eps = %s"%float(eps)
     time z, iterates = newton_method(f, c, eps)
     print "root =", z
     print "f(c) = %r"%f(z)
     n = len(iterates)
     print "iterations =", n
     html(iterates)
     P = plot(f, z-interval, z+interval, rgbcolor='blue')
     h = P.ymax(); j = P.ymin()
     L = sum(point((w,(n-1-float(i))/n*h), rgbcolor=(float(i)/n,0.2,0.3), pointsize=10) + \
             line([(w,h),(w,j)],rgbcolor='black',thickness=0.2) for i,w in enumerate(iterates))
     show(P + L, xmin=z-interval, xmax=z+interval)
}}}
{{attachment:newton.png}}

== A contour map and 3d plot of two inverse distance functions ==
by William Stein

{{{
@interact
def _(q1=(-1,(-3,3)), q2=(-2,(-3,3)),
      cmap=['autumn', 'bone', 'cool', 'copper', 'gray', 'hot', 'hsv',
           'jet', 'pink', 'prism', 'spring', 'summer', 'winter']):
     x,y = var('x,y')
     f = q1/sqrt((x+1)^2 + y^2) + q2/sqrt((x-1)^2+(y+0.5)^2)
     C = contour_plot(f, (-2,2), (-2,2), plot_points=30, contours=15, cmap=cmap)
     show(C, figsize=3, aspect_ratio=1)
     show(plot3d(f, (x,-2,2), (y,-2,2)), figsize=5, viewer='tachyon')
}}}
{{attachment:mountains.png}}

== A simple tangent line grapher ==
by Marshall Hampton

{{{
html('<h2>Tangent line grapher</h2>')
@interact
def tangent_line(f = input_box(default=sin(x)), xbegin = slider(0,10,1/10,0), xend = slider(0,10,1/10,10), x0 = slider(0, 1, 1/100, 1/2)):
    prange = [xbegin, xend]
    x0i = xbegin + x0*(xend-xbegin)
    var('x')
    df = diff(f)
    tanf = f(x0i) + df(x0i)*(x-x0i)
    fplot = plot(f, prange[0], prange[1])
    print 'Tangent line is y = ' + tanf._repr_()
    tanplot = plot(tanf, prange[0], prange[1], rgbcolor = (1,0,0))
    fmax = f.find_maximum_on_interval(prange[0], prange[1])[0]
    fmin = f.find_minimum_on_interval(prange[0], prange[1])[0]
    show(fplot + tanplot, xmin = prange[0], xmax = prange[1], ymax = fmax, ymin = fmin)
}}}
{{attachment:tangents.png}}

== Numerical integrals with the midpoint rule ==
by Marshall Hampton
{{{
var('x')
@interact
def midpoint(n = slider(1,100,1,4), f = input_box(default = "x^2", type = str), start = input_box(default = "0", type = str), end = input_box(default = "1", type = str)):
    a = N(start)
    b = N(end)
    func = sage_eval(f, locals={'x':x})
    dx = (b-a)/n
    midxs = [q*dx+dx/2 + a for q in range(n)]
    midys = [func(x_val) for x_val in midxs]
    rects = Graphics()
    for q in range(n):
        xm = midxs[q]
        ym = midys[q]
        rects = rects + line([[xm-dx/2,0],[xm-dx/2,ym],[xm+dx/2,ym],[xm+dx/2,0]], rgbcolor = (1,0,0)) + point((xm,ym), rgbcolor = (1,0,0))
    min_y = find_minimum_on_interval(func,a,b)[0]
    max_y = find_maximum_on_interval(func,a,b)[0]
    html('<h3>Numerical integrals with the midpoint rule</h3>')
    html('$\int_{a}^{b}{f(x) dx} {\\approx} \sum_i{f(x_i) \Delta x}$')
    print "\n\nSage numerical answer: " + str(integral_numerical(func,a,b,max_points = 200)[0])
    print "Midpoint estimated answer: " + str(RDF(dx*sum([midys[q] for q in range(n)])))
    show(plot(func,a,b) + rects, xmin = a, xmax = b, ymin = min_y, ymax = max_y)
}}}
{{attachment:num_int.png}}
== Function tool ==
Enter symbolic functions $f$, $g$, and $a$, a range, then click the appropriate button to compute and plot some combination of $f$, $g$, and $a$ along with $f$ and $g$. This is inspired by the Matlab funtool GUI.

{{{
x = var('x')
@interact
def _(f=sin(x), g=cos(x), xrange=input_box((0,1)), yrange='auto', a=1,
      action=selector(['f', 'df/dx', 'int f', 'num f', 'den f', '1/f', 'finv',
                       'f+a', 'f-a', 'f*a', 'f/a', 'f^a', 'f(x+a)', 'f(x*a)',
                       'f+g', 'f-g', 'f*g', 'f/g', 'f(g)'],
             width=15, nrows=5, label="h = "),
      do_plot = ("Draw Plots", True)):
    try:
        f = SR(f); g = SR(g); a = SR(a)
    except TypeError, msg:
        print msg[-200:]
        print "Unable to make sense of f,g, or a as symbolic expressions."
        return
    if not (isinstance(xrange, tuple) and len(xrange) == 2):
          xrange = (0,1)
    h = 0; lbl = ''
    if action == 'f':
        h = f
        lbl = 'f'
    elif action == 'df/dx':
        h = f.derivative(x)
        lbl = '\\frac{df}{dx}'
    elif action == 'int f':
        h = f.integrate(x)
        lbl = '\\int f dx'
    elif action == 'num f':
        h = f.numerator()
        lbl = '\\text{numer(f)}'
    elif action == 'den f':
        h = f.denominator()
        lbl = '\\text{denom(f)}'
    elif action == '1/f':
        h = 1/f
        lbl = '\\frac{1}{f}'
    elif action == 'finv':
        h = solve(f == var('y'), x)[0].rhs()
        lbl = 'f^{-1}(y)'
    elif action == 'f+a':
        h = f+a
        lbl = 'f + a'
    elif action == 'f-a':
        h = f-a
        lbl = 'f - a'
    elif action == 'f*a':
        h = f*a
        lbl = 'f \\times a'
    elif action == 'f/a':
        h = f/a
        lbl = '\\frac{f}{a}'
    elif action == 'f^a':
        h = f^a
        lbl = 'f^a'
    elif action == 'f^a':
        h = f^a
        lbl = 'f^a'
    elif action == 'f(x+a)':
        h = f(x+a)
        lbl = 'f(x+a)'
    elif action == 'f(x*a)':
        h = f(x*a)
        lbl = 'f(xa)'
    elif action == 'f+g':
        h = f+g
        lbl = 'f + g'
    elif action == 'f-g':
        h = f-g
        lbl = 'f - g'
    elif action == 'f*g':
        h = f*g
        lbl = 'f \\times g'
    elif action == 'f/g':
        h = f/g
        lbl = '\\frac{f}{g}'
    elif action == 'f(g)':
        h = f(g)
        lbl = 'f(g)'
    html('<center><font color="red">$f = %s$</font></center>'%latex(f))
    html('<center><font color="green">$g = %s$</font></center>'%latex(g))
    html('<center><font color="blue"><b>$h = %s = %s$</b></font></center>'%(lbl, latex(h)))
    if do_plot:
        P = plot(f, xrange, color='red', thickness=2) +  \
            plot(g, xrange, color='green', thickness=2) + \
            plot(h, xrange, color='blue', thickness=2)
        if yrange == 'auto':
            show(P, xmin=xrange[0], xmax=xrange[1])
        else:
            yrange = sage_eval(yrange)
            show(P, xmin=xrange[0], xmax=xrange[1], ymin=yrange[0], ymax=yrange[1])
}}}
{{attachment:funtool.png}}

== Newton-Raphson Root Finding ==
by Neal Holtz

This allows user to display the Newton-Raphson procedure one step at a time. It uses the heuristic that, if any of the values of the controls change, then the procedure should be re-started, else it should be continued.

{{{
# ideas from 'A simple tangent line grapher' by Marshall Hampton
# http://wiki.sagemath.org/interact

State = Data = None   # globals to allow incremental changes in interaction data

@interact
def newtraph(f = input_box(default=8*sin(x)*exp(-x)-1, label='f(x)'), 
             xmin = input_box(default=0), 
             xmax = input_box(default=4*pi), 
             x0 = input_box(default=3, label='x0'),
             show_calcs = ("Show Calcs",True),
             step = ['Next','Prev', 'Reset'] ):
    global State, Data
    state = [f,xmin,xmax,x0,show_calcs]
    if (state != State) or (step == 'Reset'):   # when any of the controls change
        Data = [ 1 ]                            # reset the plot
        State = state
    elif step == 'Next':
        N, = Data
        Data = [ N+1 ]
    elif step == 'Prev':
        N, = Data
        if N > 1:
            Data = [ N-1 ]
    N, = Data
    df = diff(f)

    theplot = plot( f, xmin, xmax )
    theplot += text( '\n$x_0$', (x0,0), rgbcolor=(1,0,0),
                     vertical_alignment="bottom" if f(x0) < 0 else "top" )
    theplot += points( [(x0,0)], rgbcolor=(1,0,0) )

    Trace = []
    def Err( msg, Trace=Trace ):
        Trace.append( '<font color="red"><b>Error: %s!!</b></font>' % (msg,) )
    def Disp( s, color="blue", Trace=Trace ):
        Trace.append( """<font color="%s">$ %s $</font>""" % (color,s,) )

    Disp( """f(x) = %s""" % (latex(f),) )
    Disp( """f'(x) = %s""" % (latex(df),) )

    stop = False
    is_inf = False
    xi = x0
    for i in range(N):
        fi = RR(f(xi))
        fpi = RR(df(xi))

        theplot += points( [(xi,fi)], rgbcolor=(1,0,0) )
        theplot += line( [(xi,0),(xi,fi)], linestyle=':', rgbcolor=(1,0,0) ) # vert dotted line
        Disp( """i = %d""" % (i,) )
        Disp( """~~~~x_{%d} = %.4g""" % (i,xi) )
        Disp( """~~~~f(x_{%d}) = %.4g""" % (i,fi) )
        Disp( """~~~~f'(x_{%d}) = %.4g""" % (i,fpi) )

        if fpi == 0.0:
            Err( 'Derivative is 0 at iteration %d' % (i+1,) )
            is_inf = True
            show_calcs = True
        else:
            xip1 = xi - fi/fpi
            Disp( r"""~~~~x_{%d} = %.4g - ({%.4g})/({%.4g}) = %.4g""" % (i+1,xi,fi,fpi,xip1) )
            if abs(xip1) > 10*(xmax-xmin):
                Err( 'Derivative is too close to 0!' )
                is_inf = True
                show_calcs = True
            elif not ((xmin - 0.5*(xmax-xmin)) <= xip1 <= (xmax + 0.5*(xmax-xmin))):
                Err( 'x value out of range; probable divergence!' )
                stop = True
                show_calcs = True
 
        if is_inf:
            xl = xi - 0.05*(xmax-xmin)
            xr = xi + 0.05*(xmax-xmin)
            yl = yr = fi
        else:
            xl = min(xi,xip1) - 0.01*(xmax-xmin)
            xr = max(xi,xip1) + 0.01*(xmax-xmin)
            yl = -(xip1-xl)*fpi
            yr = (xr-xip1)*fpi
            theplot += text( '\n$x_{%d}$' % (i+1,), (xip1,0), rgbcolor=(1,0,0),
                             vertical_alignment="bottom" if f(xip1) < 0 else "top" )
            theplot += points( [(xip1,0)], rgbcolor=(1,0,0) )

        theplot += line( [(xl,yl),(xr,yr)], rgbcolor=(1,0,0) )  # tangent

        if stop or is_inf:
            break
        epsa = 100.0*abs((xip1-xi)/xip1)
        nsf = 2 - log(2.0*epsa)/log(10.0)
        Disp( r"""~~~~~~~~\epsilon_a = \left|(%.4g - %.4g)/%.4g\right|\times100\%% = %.4g \%%""" % (xip1,xi,xip1,epsa) )
        Disp( r"""~~~~~~~~num.~sig.~fig. \approx %.2g""" % (nsf,) )
        xi = xip1

    show( theplot, xmin=xmin, xmax=xmax )
    if show_calcs:
        for t in Trace:
            html( t )
}}}
{{attachment:newtraph.png}}

== Coordinate Transformations ==
by Jason Grout


{{{




var('u v')
from sage.ext.fast_eval import fast_float
from functools import partial
@interact
def trans(x=input_box(u2-v2, label="x=",type=SR), \
         y=input_box(u*v+cos(u*v), label="y=",type=SR), \
         t_val=slider(0,10,0.2,6, label="Length of curves"), \
         u_percent=slider(0,1,0.05,label="<font color='red'>u</font>", default=.7),
         v_percent=slider(0,1,0.05,label="<font color='blue'>v</font>", default=.7),
         u_range=input_box(range(-5,5,1), label="u lines"),
         v_range=input_box(range(-5,5,1), label="v lines")):
     thickness=4
     u_val = min(u_range)+(max(u_range)-min(u_range))*u_percent
     v_val = min(v_range)+(max(v_range)-min(v_range))*v_percent
     t_min = -t_val
     t_max = t_val
     g1=sum([parametric_plot((i,v), t_min,t_max, rgbcolor=(1,0,0)) for i in u_range])
     g2=sum([parametric_plot((u,i), t_min,t_max, rgbcolor=(0,0,1)) for i in v_range])
     vline_straight=parametric_plot((u,v_val), t_min,t_max, rgbcolor=(0,0,1), linestyle='-',thickness=thickness)
     uline_straight=parametric_plot((u_val, v), t_min,t_max,rgbcolor=(1,0,0), linestyle='-',thickness=thickness)
 
    (g1+g2+vline_straight+uline_straight).save("uv_coord.png",aspect_ratio=1, figsize=[5,5], axes_labels=['$u$','$v$'])
     xuv = fast_float(x,'u','v')
     yuv = fast_float(y,'u','v')
     xvu = fast_float(x,'v','u')
     yvu = fast_float(y,'v','u')
     g3=sum([parametric_plot((partial(xuv,i),partial(yuv,i)), t_min,t_max, rgbcolor=(1,0,0)) for i in u_range])
     g4=sum([parametric_plot((partial(xvu,i),partial(yvu,i)), t_min,t_max, rgbcolor=(0,0,1)) for i in v_range])
     vline=parametric_plot((partial(xvu,v_val),partial(yvu,v_val)), t_min,t_max, rgbcolor=(0,0,1), linestyle='-',thickness=thickness)
     uline=parametric_plot((partial(xuv,u_val),partial(yuv,u_val)), t_min,t_max,rgbcolor=(1,0,0), linestyle='-',thickness=thickness)
     (g3+g4+vline+uline).save("xy_coord.png", aspect_ratio=1, figsize=[5,5], axes_labels=['$x$','$y$'])
     print jsmath("x=%s, \: y=%s"%(latex(x), latex(y)))
     print "<html><table><tr><td><img src='cell://uv_coord.png'/></td><td><img src='cell://xy_coord.png'/></td></tr></table></html>"
}}}


{{attachment:coordinate-transform-1.png}} {{attachment:coordinate-transform-2.png}}

== Taylor Series ==
by Harald Schilly

{{{
var('x')
x0  = 0
f   = sin(x)*e^(-x)
p   = plot(f,-1,5, thickness=2)
dot = point((x0,f(x0)),pointsize=80,rgbcolor=(1,0,0))
@interact
def _(order=(1..12)):
    ft = f.taylor(x,x0,order)
    pt = plot(ft,-1, 5, color='green', thickness=2)
    html('$f(x)\;=\;%s$'%latex(f))
    html('$\hat{f}(x;%s)\;=\;%s+\mathcal{O}(x^{%s})$'%(x0,latex(ft),order+1))
    show(dot + p + pt, ymin = -.5, ymax = 1)
}}}
{{attachment:taylor_series_animated.gif}}

== Illustration of the precise definition of a limit ==
by John Perry

I'll break tradition and put the image first. Apologies if this is Not A Good Thing.

{{attachment:snapshot_epsilon_delta.png}}

{{{
html("<h2>Limits: <i>ε-δ</i></h2>")
html("This allows you to estimate which values of <i>δ</i> guarantee that <i>f</i> is within <i>ε</i> units of a limit.")
html("<ul><li>Modify the value of <i>f</i> to choose a function.</li>")
html("<li>Modify the value of <i>a</i> to change the <i>x</i>-value where the limit is being estimated.</li>")
html("<li>Modify the value of <i>L</i> to change your guess of the limit.</li>")
html("<li>Modify the values of <i>δ</i> and <i>ε</i> to modify the rectangle.</li></ul>")
html("If the blue curve passes through the pink boxes, your values for <i>δ</i> and/or <i>ε</i> are probably wrong.")
@interact
def delta_epsilon(f = input_box(default=(x^2-x)/(x-1)), a=input_box(default=1), L = input_box(default=1), delta=input_box(label="δ",default=0.1), epsilon=input_box(label="ε",default=0.1), xm=input_box(label="<i>x</i><sub>min</sub>",default=-1), xM=input_box(label="<i>x</i><sub>max</sub>",default=4)):
    f_left_plot = plot(f,xm,a-delta/3,thickness=2)
    f_right_plot = plot(f,a+delta/3,xM,thickness=2)
    epsilon_line_1 = line([(xm,L-epsilon),(xM,L-epsilon)], rgbcolor=(0.5,0.5,0.5),linestyle='--')
    epsilon_line_2 = line([(xm,L+epsilon),(xM,L+epsilon)], rgbcolor=(0.5,0.5,0.5),linestyle='--')
    ym = min(f_right_plot.ymin(),f_left_plot.ymin())
    yM = max(f_right_plot.ymax(),f_left_plot.ymax())
    bad_region_1 = polygon([(a-delta,L+epsilon),(a-delta,yM),(a+delta,yM),(a+delta,L+epsilon)], rgbcolor=(1,0.6,0.6))
    bad_region_2 = polygon([(a-delta,L-epsilon),(a-delta,ym),(a+delta,ym),(a+delta,L-epsilon)], rgbcolor=(1,0.6,0.6))
    aL_point = point((a,L),rgbcolor=(1,0,0),pointsize=20)
    delta_line_1 = line([(a-delta,ym),(a-delta,yM)],rgbcolor=(0.5,0.5,0.5),linestyle='--')
    delta_line_2 = line([(a+delta,ym),(a+delta,yM)],rgbcolor=(0.5,0.5,0.5),linestyle='--')
    (f_left_plot +f_right_plot +epsilon_line_1 +epsilon_line_2 +delta_line_1 +delta_line_2 +aL_point +bad_region_1 +bad_region_2).show(xmin=xm,xmax=xM)
}}}

== A graphical illustration of sin(x)/x -> 1 as x-> 0 ==
by Wai Yan Pong

{{{
x=var('x')
@interact
def _(x = slider(-7/10,7/10,1/20,1/2)):
    html('<h3>A graphical illustration of $\lim_{x -> 0} \sin(x)/x =1$</h3>')
    html('Below is the unit circle, so the length of the <font color=red>red line</font> is |sin(x)|')
    html('and the length of the <font color=blue>blue line</font> is |tan(x)| where x is the length of the arc.') 
    html('From the picture, we see that |sin(x)| $\le$ |x| $\le$ |tan(x)|.')
    html('It follows easily from this that cos(x) $\le$ sin(x)/x $\le$ 1 when x is near 0.')
    html('As $\lim_{x ->0} \cos(x) =1$, we conclude that $\lim_{x -> 0} \sin(x)/x =1$.')
    if not (x == 0):
        pretty_print("sin(x)/x = "+str(sin(float(x))/float(x)))
    elif x == 0:
        pretty_print("The limit of sin(x)/x as x tends to 0 is 1.")
    C=circle((0,0),1, rgbcolor='black')
    mvp = (cos(x),sin(x));tpt = (1, tan(x))
    p1 = point(mvp, pointsize=30, rgbcolor='red'); p2 = point((1,0), pointsize=30, rgbcolor='red')
    line1 = line([(0,0),tpt], rgbcolor='black'); line2 = line([(cos(x),0),mvp], rgbcolor='red') 
    line3 = line([(0,0),(1,0)], rgbcolor='black'); line4 = line([(1,0),tpt], rgbcolor='blue')
    result = C+p1+p2+line1+line2+line3+line4
    result.show(aspect_ratio=1, figsize=[3,3], axes=False)
}}}
{{attachment:sinelimit.png}}

== The midpoint rule for numerically integrating a function of two variables ==
by Marshall Hampton
{{{
from sage.plot.plot3d.platonic import index_face_set
def cuboid(v1,v2,**kwds):
    """
    Cuboid defined by corner points v1 and v2.
    """
    ptlist = []
    for vi in (v1,v2):
        for vj in (v1,v2):
            for vk in (v1,v2):
                ptlist.append([vi[0],vj[1],vk[2]])
    f_incs = [[0, 2, 6, 4], [0, 1, 3, 2], [0, 1, 5, 4], [1, 3, 7, 5], [2, 3, 7, 6], [4, 5, 7, 6]]
    
    if 'aspect_ratio' not in kwds:
        kwds['aspect_ratio'] = [1,1,1]
    return index_face_set(f_incs,ptlist,enclosed = True, **kwds)
var('x,y')
R16 = RealField(16)
npi = RDF(pi)
sin,cos = math.sin,math.cos 
html("<h1>The midpoint rule for a function of two variables</h1>")
@interact
def midpoint2d(func = input_box('y*sin(x)/x+sin(y)',type=str,label='function of x and y'), nx = slider(2,20,1,3,label='x subdivisions'), ny = slider(2,20,1,3,label='y subdivisions'), x_start = slider(-10,10,.1,0), x_end = slider(-10,10,.1,3*npi), y_start= slider(-10,10,.1,0), y_end= slider(-10,10,.1,3*npi)):
    f = sage_eval('lambda x,y: ' + func)
    delx = (x_end - x_start)/nx
    dely = (y_end - y_start)/nx
    xvals = [RDF(x_start + (i+1.0/2)*delx) for i in range(nx)]
    yvals = [RDF(y_start + (i+1.0/2)*dely) for i in range(ny)]
    num_approx = 0
    cubs = []
    darea = delx*dely
    for xv in xvals:
        for yv in yvals:
            num_approx += f(xv,yv)*darea
            cubs.append(cuboid([xv-delx/2,yv-dely/2,0],[xv+delx/2,yv+dely/2,f(xv,yv)], opacity = .5, rgbcolor = (1,0,0)))
    html("$$\int_{"+str(R16(y_start))+"}^{"+str(R16(y_end))+"} "+ "\int_{"+str(R16(x_start))+"}^{"+str(R16(x_end))+"} "+func+"\ dx \ dy$$")
    html('<p style="text-align: center;">Numerical approximation: ' + str(num_approx)+'</p>')
    p1 = plot3d(f,(x,x_start,x_end),(y,y_start,y_end))
    show(p1+sum(cubs))
}}}
{{attachment:numint2d.png}}

== Gaussian (Legendre) quadrature ==
by Jason Grout

The output shows the points evaluated using Gaussian quadrature (using a weight of 1, so using Legendre polynomials).  The vertical bars are shaded to represent the relative weights of the points (darker = more weight).  The error in the trapezoid, Simpson, and quadrature methods is both printed out and compared through a bar graph.  The "Real" error is the error returned from scipy on the definite integral.
{{{
from scipy.special.orthogonal import p_roots
from scipy.integrate import quad, trapz, simps
from sage.ext.fast_eval import fast_float
from numpy import linspace
show_weight_graph=False
#  'Hermite': {'w': e**(-x**2), 'xmin': -numpy.inf, 'xmax': numpy.inf, 'func': h_roots},
#  'Laguerre': {'w': e**(-x), 'xmin': 0, 'xmax': numpy.inf, 'func': l_roots},

methods = {'Legendre': {'w': 1, 'xmin': -1, 'xmax': 1, 'func': p_roots},
                'Chebyshev': {'w': 1/sqrt(1-x**2), 'xmin': -1, 'xmax': 1, 'func': t_roots},
                'Chebyshev2': {'w': sqrt(1-x**2), 'xmin': -1, 'xmax': 1, 'func': u_roots},
                'Trapezoid': {'w': 1, 'xmin': -1, 'xmax': 1, 'func': lambda n: (linspace(-1r,1,n), numpy.array([1.0r]+[2.0r]*(n-2)+[1.0r])*1.0r/n)},
                'Simpson': {'w': 1, 'xmin': -1, 'xmax': 1, 'func': lambda n: (linspace(-1r,1,n), numpy.array([1.0r]+[4.0r,2.0r]*int((n-3.0r)/2.0r)+[4.0r,1.0r])*2.0r/(3.0r*n))}}
var("x")
def box(center, height, area,**kwds):
    width2 = 1.0*area/height/2.0
    return polygon([(center-width2,0),(center+width2,0),(center+width2,height),(center-width2,height)],**kwds)
    
    
@interact
def weights(n=slider(1,30,1,default=10),f=input_box(default=3*x+cos(10*x)),show_method=["Legendre", "Chebyshev", "Chebyshev2", "Trapezoid","Simpson"]):
    ff = fast_float(f,'x')
    method = methods[show_method]
    xcoords,w = (method['func'])(int(n))
    xmin = method['xmin']
    xmax = method['xmax']
    plot_min = max(xmin, -10)
    plot_max = min(xmax, 10)
    scaled_func = f*method['w']
    scaled_ff = fast_float(scaled_func)

    coords = zip(xcoords,w)
    max_weight = max(w)
    coords_scaled = zip(xcoords,w/max_weight)

    f_graph = plot(scaled_func,plot_min,plot_max)
    boxes = sum(box(x,ff(x),w*ff(x),rgbcolor=(0.5,0.5,0.5),alpha=0.3) for x,w in coords)
    stems = sum(line([(x,0),(x,scaled_ff(x))],rgbcolor=(1-y,1-y,1-y),thickness=2,markersize=6,alpha=y) for x,y in coords_scaled)
    points = sum([point([(x,0),(x,scaled_ff(x))],rgbcolor='black',pointsize=30) for x,_ in coords])
    graph = stems+points+f_graph+boxes
    if show_weight_graph:
        graph += line([(x,y) for x,y in coords_scaled], rgbcolor='green',alpha=0.4)
    
    show(graph,xmin=plot_min,xmax=plot_max)

    approximation = sum([w*ff(x) for x,w in coords])
    integral,integral_error = scipy.integrate.quad(scaled_ff, xmin, xmax)
    x_val = linspace(min(xcoords), max(xcoords),n)
    y_val = map(scaled_ff,x_val)
    trapezoid = integral-trapz(y_val, x_val)
    simpson = integral-simps(y_val, x_val)
    html("$$\sum_{i=1}^{i=%s}w_i\left(%s\\right)= %s\\approx %s =\int_{-1}^{1}%s \,dx$$"%(n,latex(f.subs(x="x_i")), approximation, integral, latex(scaled_func)))
    error_data = [trapezoid, simpson, integral-approximation,integral_error]
    print "Trapezoid: %s, Simpson: %s, \nMethod: %s, Real: %s"%tuple(error_data)
    show(bar_chart(error_data,width=1),ymin=min(error_data), ymax=max(error_data))
}}}
{{attachment:quadrature1.png}}
{{attachment:quadrature2.png}}
