## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:WikiSandBox
#format wiki
#language en
'''Feel free to experiment here, after the four dashes below. Please do not create new pages without any meaningful content just to try it out!'''

You may want to open HelpOnEditing in a new window or tab while you edit.

----

== Formatting ==
''italic'' '''bold''' {{{typewriter}}}

`backtick typewriter` (configurable)

~+bigger +~ ~-smaller -~

{{{
preformatted some more
and some more lines too
}}}
{{{
#!python
def syntax(highlight):
    print "on"
    return None
}}}
{{{
#!java
  public void main(String[] args]){
     System.out.println("Hello world!");
  }
}}}
== Linking ==
HelpOnEditing MoinMoin:InterWiki

http://moinmoin.wikiwikiweb.de/ [http://www.python.org/ Python]

someone@example.com

=== Image Link ===
http://c2.com/sig/wiki.gif

== Smileys ==
/!\ Alert

== Lists ==
=== Bullet ===
 * first
  1. nested and numbered
  1. numbered lists are renumbered
 * second
 * third blockquote
  . deeper
=== Glossary ===
 Term:: Definition
=== Drawing ===
drawing:mytest

= Heading 1 =
== Heading 2 ==
=== Heading 3 ===
==== Heading 4 ====

== A graphical illustration of $\lim_{x -> 0} sin(x)/x =1$ ==

{{{
x=var('x')
@interact
def _(x = slider(-7/10,7/10,1/20,1/2)):
    html('<h3>A graphical illustration of $\lim_{x -> 0} \sin(x)/x =1$</h3>')
    html('Below is a unit circle, so the length of the <font color=red>red line</font> is |sin(x)|')
    html('and the length of the <font color=blue>blue line</font> is |tan(x)| where x is the length of the arc.') 
    html('is |sin(x)| and |tan(x)|, respectively where x is length of the arc.')
    html('From the picture, we see that |sin(x)| $\le$ |x| $\le$ |tan(x)|')
    html('and it follows easily from this that')
    html('cos(x) $\le$ sin(x)/x $\le$ 1 when x is near 0.')
    html('As $\lim_{x ->0} \cos(x) =1$, we conclude that $\lim_{x -> 0} \sin(x)/x =1$.')
    if not (x == 0):
        pretty_print("sin(x)/x = "+str(sin(float(x))/float(x)))
    elif x == 0:
        pretty_print("The limit of sin(x)/x as x tends to 0 is 1")
    C=circle((0,0),1, rgbcolor='black')
    mvp = (cos(x),sin(x));tpt = (1, tan(x))
    p1 = point(mvp, pointsize=30, rgbcolor='red'); p2 = point((1,0), pointsize=30, rgbcolor='red')
    line1 = line([(0,0),tpt], rgbcolor='black'); line2 = line([(cos(x),0),mvp], rgbcolor='red') 
    line3 = line([(0,0),(1,0)], rgbcolor='black'); line4 = line([(1,0),tpt], rgbcolor='blue')
    result = C+p1+p2+line1+line2+line3+line4
    result.show(aspect_ratio=1, figsize=[3,3], axes=False)
}}}

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
