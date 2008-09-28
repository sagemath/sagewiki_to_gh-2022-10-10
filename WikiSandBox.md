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
attachment:sinelimit.png
