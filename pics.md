 * Everywhere continuous, nowhere differentiable function (in the infinite limit, anyway):
{{{p = Graphics()
for n in range(1,20):
  f = lambda x: sum([sin(x*3^i)/(2^i) for i in range(1,n)])
  p += plot(f,0,float(pi/3),plot_points=2000,rgbcolor=hue(n/20))

p.show(xmin=0, ymin=0,dpi=250)
}}}

[http://sage.math.washington.edu/home/wdj/art/cool-sage-pic-small1.png cool pic 1]

 * Math art by Tom Boothby:
{{{
# Author: Tom Boothby
# This is a remake of an old art piece I made in POVRay


t = Tachyon(xres=1000,yres=600, camera_center=(1,0,5), antialiasing=3)
t.light((4,3,2), 0.2, (1,1,1))
t.texture('t0', ambient=0.1, diffuse=0.9, specular=0.5, opacity=1.0, color=(1.0,1,1))
t.texture('t1', ambient=0.5, diffuse=0.5, specular=0.0, opacity=1.0, color=(0,0,0))
t.texture('t2', ambient=0.2, diffuse=0.7, specular=0, opacity=0.7, color=(.5,.5,.5))
t.texture('t3', ambient=.9, diffuse=5, specular=0,opacity=.1, color=(1,0,0))
t.sphere((1,0,0), 30, 't2')



k=0
for i in srange(-pi*10,0,.01):
  k += 1
  t.sphere((cos(i/10)-.1, sin(i/10)*cos(i), sin(i/10)*sin(i)), 0.1, 't0')
  t.sphere((cos(i/10) + 2.1, sin(i/10)*cos(i), sin(i/10)*sin(i)), 0.1, 't1')

t.show(verbose=1)
}}}

[http://sage.math.washington.edu/home/wdj/art/boothby-tachyon1.png cool pic 2]

 * Twisted cubic in tachyon:
{{{
t = Tachyon(xres=512,yres=512, camera_center=(5,0,0))
t.light((4,3,2), 0.2, (1,1,1))
t.texture('t0', ambient=0.1, diffuse=0.9, specular=0.5, opacity=1.0, color=(1.0,0,0))
t.texture('t1', ambient=0.1, diffuse=0.9, specular=0.3, opacity=1.0, color=(0,1.0,0))
t.texture('t2', ambient=0.2, diffuse=0.7, specular=0.5, opacity=0.7, color=(0,0,1.0))
k=0
for i in srange(-5,1.5,0.1):
    k += 1
    t.sphere((i,i^2-0.5,i^3), 0.1, 't%s'%(k%3))

t.show()
}}}

[http://sage.math.washington.edu/home/wdj/art/boothby-tachyon2.png cool pic 3]

 * Reflections from four spheres in tachyon
{{{
t6 = Tachyon(camera_center=(0,-4,1), xres = 800, yres = 600, raydepth = 12, aspectratio=.75, antialiasing = True)
t6.light((0.02,0.012,0.001), 0.01, (1,0,0))
t6.light((0,0,10), 0.01, (0,0,1))
t6.texture('s', color = (.8,1,1), opacity = .9, specular = .95, diffuse = .3, ambient = 0.05)
t6.texture('p', color = (0,0,1), opacity = 1, specular = .2)
t6.sphere((-1,-.57735,-0.7071),1,'s')
t6.sphere((1,-.57735,-0.7071),1,'s')
t6.sphere((0,1.15465,-0.7071),1,'s')
t6.sphere((0,0,0.9259),1,'s')
t6.plane((0,0,-1.9259),(0,0,1),'p')
t6.show()
}}}

[attachment:fourspheres.png]

 * A cone inside a sphere:
{{{
sage: p1 = parametric_plot3d([cos(u)*v, sin(u)*v, 3*v/2-1/3], (u, 0, 2*pi), (v, 0, 0.95),plot_points=[20,20])
sage: p2 = sphere((0,0,2/3), color='red', opacity=0.5, aspect_ratio=[1,1,1])
sage: show(p1+p2)
}}}

 * A cylinder inside a cone:
{{{
sage: p1 = parametric_plot3d([cos(u)*v, sin(u)*v, 3/2-3*v/2], (u, 0, 2*pi), (v, 0, 1.5), opacity = 0.5, plot_points=[20,20])
sage: p2 = parametric_plot3d([cos(u)/2, sin(u)/2, v-3/4], (u, 0, 2*pi), (v, 0, 3/2), plot_points=[20,20])
sage: show(p1+p2)
}}}

 * An animation by Dean Moore: 
Hypotrochoid. Written by Dean Moore, February 2008                            

http://sage.math.washington.edu/home/wdj/art/hypotrochoid_R_equals_7,_r_equals_2,_d=3.gif

                     Inspiration:                                                                  
                                                                               
 But a SAGE newbie & out to do projects & learn more, one day I was surfing    
 Wikipedia and hit < http://en.wikipedia.org/wiki/Hypotrochoid >, saw          
 the animated graph, and thought, ...                                                                                                                          "I bet I can make SAGE do that."                                                                                                         
 Never one to back from a challenge, I did it.  A few mistakes & wrong turns,  
 at times some strong language & threatening the computer with violence, a few 
 questions to SAGE support groups, but, I finally pounded out code that        
 worked.         
                                                                                                                                                                                                 
 I named it "Hypotrochoid," as animating this was the original inspiration,    
 but the code easily animates other graphs.                         
                           
                                                    
 What this program does:                                                       
                                                                               
 This program animates (not just "draws," but "animates") graphs of several    
 relations, the hypotrochoid, the hypocycloid, the limacon (or "limacon of     
 Pascal"; SAGE doesn't like the French character in the original), the         
 cardioid, the epitrochoid, and the epicycloid.                                
                                                 
                              
 The parametric equations that define a hypotrochoid follow; the parameter     
 is *t*; for hypotrochoid we have R, r, d > 0, R > r > 0:                      
             
{{{                                                                  
 x-coordinate: x = (R - r)*cos(t) + d*cos(((R - r)/r)*t)                       
 y-coordinate: y = (R - r)*sin(t) - d*sin(((R - r)/r)*t)                       
}}}
                                                                            
 For a epitrochoid, the equations are:                                         

{{{                                                                               
 x = (R + r)*cos(t) - d*cos(((R + r)/r)*t)                                                          
 y = (R + r)*sin(t) - d*sin(((R + r)/r)*t)                                     
}}}                                                                            
 The parametric equations are important in computing the period of the         
 relation (below).                                                             
                                                                               
 These parametric equations live all over the Internet; Wikipedia has:
 
  ** for the hypochotroid:  < http://en.wikipedia.org/wiki/Hypotrochoid >.                                
 See also < http://linuxgazette.net/133/luana.html >                           
                           
  ** For the epitrochoid, see < http://en.wikipedia.org/wiki/Epitrochoid >.        
     
  ** For the Limacon (SAGE completely choked and spewed error messages on the      
 French character in the original, even in a comment) of Pascal, see           
 < http://en.wikipedia.org/wiki/Lima%C3%A7on >.                                
     
  ** For the cardioid, see < http://en.wikipedia.org/wiki/Cardioid >.              
                                                                               
  ** For the epitrochoid, see < < http://en.wikipedia.org/wiki/Epitrochoid >       
                                                                               
  ** For the hypocycloid, see < http://en.wikipedia.org/wiki/Hypocycloid >         
        
  ** For the Deltoid Curve, see < http://en.wikipedia.org/wiki/Deltoid_curve >.                                                         

 A few further comments: Some curves of the "roulette" family (see             
 < http://en.wikipedia.org/wiki/Roulette_%28curve%29 > may be easily           
 animated with this program, as follows:                                       

                                                                                  
 1) The epitrochoid (use the negative of "small" radius *r*, easy, puts        
    rotating circle on the outside.                                            

 2) The hypocycloid, by setting 0 < r < R, d = r.                              

 3) The limacon (or "limacon of Pascal"; SAGE doesn't like the French          
    character in the original), use r < 0, R = abs(r).                         

 4) The epicycloid, use r < 0 (put rotating circle on outside), d = r          

 5) The cardioid, r < 0 d = r                                                  
                                                                                                

To draw different graphs, vary that parameters *R* (fixed circle's radius), *r* 
(rotating circle's radius), and *d* (length of "bar" from rotating circle), 
below; other parameters may be tweaked at will.                      


Of some note, the *epitrochoid* is the "epicycle" curve of Ptolemaic system   
astronomy; one project is to animate some of the Ptolemaic system, but this   
is for the future.  

Program commences:


{{{
#*****************************************************************************
#       Copyright (C) 2007 Dean Moore < dino@boulder.net >
#
#  Distributed under the terms of the GNU General Public License (GPL)
#                  http://www.gnu.org/licenses/
#*****************************************************************************
# Parameters that define the image:

R = 5   # Fixed circle's radius.
r = 3   # Rotating circle's radius, rotates about fixed circle's radius; make
        # this negative to place rotating circle on outside.
d = 5   # Length of the "bar" extending from the center of the rotating circle.

step = 0.025    # Size of "step" in below loops; the smaller the step, the more
                # "frames" in the final "movie" & the better the image, but the
                # slower the program runs -- and the more bytes to the image.

figuresize = 4  # A constant, regulates size of final picture

delayBetweenImages = 0 # A constant, delay between images in final "movie."

colorOfFixedCircle    = (0, 0, 1) # Colors of final image,
colorOfRotatingCircle = (0, 1, 0) # all described by
colorOfCenterPoint    = (0, 0, 0) # names.
colorOfBar            = (0, 0, 0)
colorOfCurve          = (1, 0, 0)

thicknessOfFixedCircle            =  1   # Thickness of "fixed" circle that never moves.
thicknessOfRotatingCircle         =  1   # Thickness of circle that rotates.
thicknessOfCenterOfRotatingCircle = 15   # Size of small circle's center.
thicknessOfBar                    =  1   # Thickness of "bar" from rotating circle.
penSize                           = 10   # Size of "pen" at end of the "bar."
thicknessOfCurve                  =  0.5 # Thickness of final curve, really a lot of line segments.

# End of parameters user can realistically vary.

origin = (0, 0) # Maybe irrelevant, but NO MAGIC NUMBERS!!  See
                # < http://en.wikipedia.org/wiki/Magic_number_(programming) >.
                # Comes from my days as a C/C++ programmer.

# Graphic parameters, defined here:

L = Graphics() # Graphics for the curve -- really a lot of segments of straight
               # lines.  If the image looks choppy, drop variable *step* above.

v = []         # Holds the curve from *L*, later converted to variable *curve*.

# More parameters, all of which are defined by earlier parameters:

rDiff = (R-r)              # The rotating circle may exceed fixed circle;
                           # values may be negative, so we may have a
                           # negative value.  We use this so much, we give
                           # it a name.

sizeOfGraph = max(R, abs(r) + abs(d), abs(R) - (r) + abs(d)) # Big as it can get -- may be
                                                             # a liberal estimate.

circle2PI = (abs(rDiff)/r).denom() # Number of rotations about 2*pi.  It
                                   # takes a bit of thought, but see the above
                                   # parametric equations.  An example is best:
                                   # picture R=8, r=6.  We have
                                   # (rDiff)/r = (8-6)/6 = 2/6 = 1/3, reduced. For
                                   # the argument *((rDiff)/r)t* to get back to 2*pi
                                   # (i.e., zero) in cos(((R - r)/r)t) & sin(((R - r)/r)t),
                                   # we need to go 2*(3*pi).  A pen & paper & some
                                   # scribbling makes this easy, be it this not
                                   # clear.  The *abs* is probably irrelevant.

limit =  ceil(2*circle2PI/step)    # Loop about circle this many times, by *step*.
                                   # Parameter *circle2PI* never is again used.  Factor
                                   # of 2 is unavoidable, circle 2*pi; see below loops.

}}}

First: I use the same trig functions, over an over again.  Why re-invent the
wheel & waste computer time? Put the needed trig functions in arrays & "recycle" them as needed.

{{{
sin1 = [ 0 for i in range(limit) ] # First
sin2 = [ 0 for i in range(limit) ] # define
cos1 = [ 0 for i in range(limit) ] # arrays, ...
cos2 = [ 0 for i in range(limit) ]

increment = 0 # Adding a bunch of numbers is more efficient than multiplying
              # *i*pi*step, but it is a trivial difference.

multiplier = pi*rDiff/r # Efficiency!  Don't repeat the same math
                        # countless times.

for i in srange(limit): # Note above definition of parameter *limit*, the
                        # factor of 2, and the below trig functions.  All
                        # this program's loops go *limit*.

    sin1[i] = sin(increment*pi)         # Now fill
    cos1[i] = cos(increment*pi)         # arrays
    sin2[i] = sin(increment*multiplier) # with our trig
    cos2[i] = cos(increment*multiplier) # functions.

    increment += step                   # End *i*-loop.

}}}

The next are described by names, but a few notes:

  ** The parameter *fixedCircle* is merely a circle of radius *R* centered at the origin.  
I animated it, as that makes it appear in all frames.  It never moves.

  ** The parameter *rotatingCircle* is more computation-intense.  It's center is on the 
circle at *rDiff* from the edge of the fixed circle; its radius is *r*, and it 
rotates about the fixed circle a total of *circle2PI* times.  Find any internet 
reference on these curves to see it.

  ** The parameter *centerPoints* is solely to make the rotating circle look nicer, 
a clear center.

  ** The parameter *bar* is the "bar" extending from the center of the rotating circle, 
that follows its rotation around the fixed circle.  It always emanates from the 
same center as *fixedCircle*, -- see *fixedCircle* documentation, above -- and its 
terminal point comes from the parametric equation of a hypotrochoid (top).

  ** The parameter *pointAtPen* makes a point where the end of the bar draws the figure, 
of the same color as the final curve.  Note it is at the same point as the terminal point of the "bar."

{{{
fixedCircle     = animate([circle(origin, R,          # Centered at origin, radius *R*.
                           rgbcolor=colorOfFixedCircle,
                           thickness = thicknessOfFixedCircle)
                           for i in srange(limit)            # Animating loop.
                          ],
                           xmin=-sizeOfGraph, ymin=-sizeOfGraph,
                           xmax= sizeOfGraph, ymax= sizeOfGraph,
                           figsize=[figuresize, figuresize])

rotatingCircle  = animate([circle((rDiff*cos1[i],rDiff*sin1[i]), r, # Note center, radius *r*
                           thickness = thicknessOfRotatingCircle,
                           rgbcolor=colorOfRotatingCircle)
                           for i in srange(limit)        # Animating loop
                          ],
                           xmin=-sizeOfGraph, ymin=-sizeOfGraph,
                           xmax= sizeOfGraph, ymax= sizeOfGraph,
                           figsize=[figuresize,figuresize])

centerPoints    = animate([point((rDiff*cos1[i],rDiff*sin1[i]), # Center of *fixedCircle*.
                           rgbcolor=colorOfCenterPoint,
                           pointsize=thicknessOfCenterOfRotatingCircle)
                           for i in srange(limit)                      # Animating loop
                          ],
                           xmin=-sizeOfGraph, ymin=-sizeOfGraph,
                           xmax= sizeOfGraph, ymax= sizeOfGraph,
                           figsize=[figuresize,figuresize])

bar             = animate(line([(rDiff*cos1[i], rDiff*sin1[i]), # Starts here, and ...
                                (d*cos2[i] + rDiff*cos1[i],     # Ends at
                                  rDiff*sin1[i] - d*sin2[i])    # this point.
                               ],
                           thickness = thicknessOfBar,
                           rgbcolor=colorOfBar)
                           for i in srange(limit))               # Animating loop

pointAtPen      = animate([point((d*cos2[i]+rDiff*cos1[i],     # End of pen, same x & y
                                 (rDiff)*sin1[i] - d*sin2[i]), # coordinates as endpoints of *bar*
                           rgbcolor=colorOfCurve, 
                           pointsize=penSize)
                           for i in srange(limit)                   # Animating loop
                           ],
                           xmin=-sizeOfGraph, ymin=-sizeOfGraph,
                           xmax= sizeOfGraph, ymax= sizeOfGraph,
                           figsize=[figuresize,figuresize])

# Prepare to draw the curve; we use four "important" variables: x0, x1, y0 & y1;
# the line segment goes from (x0, y0) to (x1, y1):

x0 = rDiff + d     # Initial values of these variables; bumped up at bottom
                   # of next loop -- see a graph or look at parametric equations
                   # at zero to understand why it has this value.

y0 = 0             # The "pen" out the small circle starts at this (x0, y0).

# Now to compute the curve, in the next loop.  Starts at zero, even if
# this seems to make the first a junk computation; otherwise the output
# looks weird:

for i in srange(limit): # Parameter *circle2PI* is number of times we rotate
                        # the "fixed" circle; limit=2*circle2PI; see above
                        # documentation.

    x1 = rDiff*cos1[i] + d*cos2[i]   # Initial, starting point of
                                    # the line; see parametric
                                    # equations.

    y1 = rDiff*sin1[i] - d*sin2[i] # Again, see the parametric
                                  # equation at top.
    # Now make the line:

    L += line([(x0, y0),(x1, y1)], rgbcolor = colorOfCurve , thickness=thicknessOfCurve)

    L.xmin(-sizeOfGraph)  # Some nonsense
    L.ymin(-sizeOfGraph)  # that needs done.
    L.xmax( sizeOfGraph)
    L.ymax( sizeOfGraph)

    x0 = x1 # Bump up these variables, start of
    y0 = y1 # next line segment is end of last.

    v.append(L) # *** End of loop ***
               # Stash curve *L* in the variable *v*.

curve = animate(v) # Animate the curve, and ...

# Show the entire "movie":

(fixedCircle + rotatingCircle + pointAtPen + bar + centerPoints + curve).show(delay=delayBetweenImages)

}}}
We've shown the final image; done with program.
