= Sage Interactions - Calculus =
goto [:interact:interact main page]

[[TableOfContents]]


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
attachment:bisect.png


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

attachment:newton.png

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
attachment:mountains.png

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
attachment:tangents.png

== Function tool ==
Enter symbolic functions $f$, $g$, and $a$, a range, then click the appropriate
button to compute and plot some combination of $f$, $g$, and $a$ along with $f$ and $g$.
This is inspired by the Matlab funtool GUI. 

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

attachment:funtool.png

== Newton-Raphson Root Finding ==

by Neal Holtz

This allows user to display the Newton-Raphson procedure one step at a time.
It uses the heuristic that, if any of the values of the controls change,
then the procedure should be re-started, else it should be continued.

{{{
# ideas from 'A simple tangent line grapher' by Marshall Hampton
# http://wiki.sagemath.org/interact

State = Data = None   # globals to allow incremental additions to graphics

@interact
def newtraph(f = input_box(default=8*sin(x)*exp(-x)-1, label='f(x)'), 
             xmin = input_box(default=0), 
             xmax = input_box(default=4*pi), 
             x0 = input_box(default=3, label='x0'),
             show_calcs = ("Show Calcs",True),
             step = ['Next','Reset'] ):
    global State, Data
    prange = [xmin,xmax]
    state = [f,xmin,xmax,x0,show_calcs]
    if (state != State) or (step == 'Reset'):   # when any of the controls change
        X = [RR(x0)]                     # restart the plot
        df = diff(f)
        Fplot = plot(f, prange[0], prange[1])
        Data = [X, df, Fplot]
        State = state

    X, df, Fplot = Data
    i = len(X) - 1              # compute and append the next x value
    xi = X[i]
    fi = RR(f(xi))
    fpi = RR(df(xi))
    xip1 = xi - fi/fpi
    X.append(xip1)

    msg = xip1s = None          # now check x value for reasonableness
    is_inf = False
    if abs(xip1) > 10E6*(xmax-xmin):
        is_inf = True
        show_calcs = True
        msg = 'Derivative is 0!'
        xip1s = latex(xip1.sign()*infinity)
        X.pop()
    elif not ((xmin - 0.5*(xmax-xmin)) <= xip1 <= (xmax + 0.5*(xmax-xmin))):
        show_calcs = True
        msg = 'x value out of range; probable divergence!'
    if xip1s is None:
        xip1s = '%.4g' % (xip1,)

    def Disp( s, color="blue" ):
        if show_calcs:
            html( """<font color="%s">$ %s $</font>""" % (color,s,) )
    Disp( """f(x) = %s""" % (latex(f),)  +
          """~~~~f'(x) = %s""" % (latex(df),) )
    Disp( """i = %d""" % (i,)  +
          """~~~~x_{%d} = %.4g""" % (i,xi)  +
          """~~~~f(x_{%d}) = %.4g""" % (i,fi)  +
          """~~~~f'(x_{%d}) = %.4g""" % (i,fpi) )
    if msg:
        html( """<font color="red"><b>%s</b></font>""" % (msg,) )
        c = "red"
    else:
        c = "blue"
    Disp( r"""x_{%d} = %.4g - ({%.4g})/({%.4g}) = %s""" % (i+1,xi,fi,fpi,xip1s), color=c )

    Fplot += line( [(xi,0),(xi,fi)], linestyle=':', rgbcolor=(1,0,0) ) # vert dotted line
    Fplot += points( [(xi,0),(xi,fi)], rgbcolor=(1,0,0) )
    labi = text( '\nx%d\n' % (i,), (xi,0), rgbcolor=(1,0,0),
                 vertical_alignment="bottom" if fi < 0 else "top" )
    if is_inf:
        xl = xi - 0.05*(xmax-xmin)
        xr = xi + 0.05*(xmax-xmin)
        yl = yr = fi
    else:
        xl = min(xi,xip1) - 0.02*(xmax-xmin)
        xr = max(xi,xip1) + 0.02*(xmax-xmin)
        yl = -(xip1-xl)*fpi
        yr = (xr-xip1)*fpi
        Fplot += points( [(xip1,0)], rgbcolor=(0,0,1) )       # new x value
        labi += text( '\nx%d\n' % (i+1,), (xip1,0), rgbcolor=(1,0,0),
                 vertical_alignment="bottom" if fi < 0 else "top" )
    Fplot += line( [(xl,yl),(xr,yr)], rgbcolor=(1,0,0) )  # tangent

    show( Fplot+labi, xmin = prange[0], xmax = prange[1] )
    Data = [X, df, Fplot]
}}}


attachment:newtraph.png


== Coordinate Transformations ==
by Jason Grout

{{{
var('u v')
from sage.ext.fast_eval import fast_float
@interact
def trans(x=input_box(u^2-v^2, label="x=",type=SR), \
    y=input_box(u*v, label="y=",type=SR), \
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

    g1=sum([parametric_plot((SR(u.subs(u=i))._fast_float_('v'),v.subs(u=i)._fast_float_('v')), t_min,t_max, rgbcolor=(1,0,0)) for i in u_range])
    g2=sum([parametric_plot((u.subs(v=i)._fast_float_('u'),SR(v.subs(v=i))._fast_float_('u')), t_min,t_max, rgbcolor=(0,0,1)) for i in v_range])
    vline_straight=parametric_plot((SR(u.subs(v=v_val))._fast_float_('u'),SR(v.subs(v=v_val))._fast_float_('u')), t_min,t_max, rgbcolor=(0,0,1), linestyle='-',thickness=thickness)
    uline_straight=parametric_plot((SR(u.subs(u=u_val))._fast_float_('v'),SR(v.subs(u=u_val))._fast_float_('v')), t_min,t_max,rgbcolor=(1,0,0), linestyle='-',thickness=thickness)

    (g1+g2+vline_straight+uline_straight).save("uv_coord.png",aspect_ratio=1, figsize=[5,5], axes_labels=['$u$','$v$'])


    g3=sum([parametric_plot((x.subs(u=i)._fast_float_('v'),y.subs(u=i)._fast_float_('v')),  t_min,t_max, rgbcolor=(1,0,0)) for i in u_range])
    g4=sum([parametric_plot((x.subs(v=i)._fast_float_('u'),y.subs(v=i)._fast_float_('u')),  t_min,t_max, rgbcolor=(0,0,1)) for i in v_range])
    vline=parametric_plot((SR(x.subs(v=v_val))._fast_float_('u'),SR(y.subs(v=v_val))._fast_float_('u')),  t_min,t_max, rgbcolor=(0,0,1), linestyle='-',thickness=thickness)
    uline=parametric_plot((SR(x.subs(u=u_val))._fast_float_('v'),SR(y.subs(u=u_val))._fast_float_('v')),  t_min,t_max,rgbcolor=(1,0,0), linestyle='-',thickness=thickness)
    (g3+g4+vline+uline).save("xy_coord.png", aspect_ratio=1, figsize=[5,5], axes_labels=['$x$','$y$'])


    print jsmath("x=%s, \: y=%s"%(latex(x), latex(y)))
    print "<html><table><tr><td><img src='cell://uv_coord.png'/></td><td><img src='cell://xy_coord.png'/></td></tr></table></html>"
}}}

attachment:coordinate-transform-1.png
attachment:coordinate-transform-2.png

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
attachment:taylor_series_animated.gif
