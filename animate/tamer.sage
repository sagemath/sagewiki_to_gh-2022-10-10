#*****************************************************************************
#       Copyright (C) 2009 Xavier Provencal <provencal at gmail.com>
#                     2009 Sebastien Labbe <slabqc at gmail.com >
#
#  Distributed under the terms of the GNU General Public License (GPL)
#                  http://www.gnu.org/licenses/
#*****************************************************************************
# Parameters that define the image:
step  = n(0.01,digits=10)
lion_speed = 4

def to_polar(v) :
    if (v.norm() == 0) :
        return vector([0,0])
    x = v[0]
    y = v[1]
    if (x == 0 and y > 0) :
        angle = pi/2
    elif (x == 0 and y < 0) :
        angle = 3*pi/2
    elif x > 0 :
        angle = atan(y/x)
    elif x < 0 :
        angle = pi+atan(y/x)
    else :
        raise TypeError
    return vector([sqrt(x^2+y^2),angle])

def to_carte(v) :
    rho = v[0]
    theta = v[1]
    return vector([rho*cos(theta), rho*sin(theta)]);

def monMod(x,p) :
    nb = floor(x / p)
    return x - nb*p

@CachedFunction
def dompteur_pos(n) :
    r"""
    Return the position of the dompteur in cartesian coordinates.

    EXAMPLES::

        sage: dompteur_pos(0)
        (0, 0)
        sage: dompteur_pos(1)
        (-0.01000000000, 0)
        sage: dompteur_pos(2)
        (-0.01999215862, -0.0003959371065)
        sage: dompteur_pos(3)
        (-0.02996111130, -0.001183326674)
    """
    if (n == 0) :
        return vector([0,0])
    v = dompteur_pos(n-1) - to_carte(lion_polar_pos(n-1))
    return dompteur_pos(n-1) + step * v/v.norm();

@CachedFunction
def lion_polar_pos(n) :
    r"""
    Return the lion's position in polar coordinates.

    EXAMPLES::

        sage: lion_polar_pos(0)
        (1, 0)
        sage: lion_polar_pos(1)
        (1.000000000, 0.04000000000)
        sage: lion_polar_pos(1)
        (1.000000000, 0.04000000000)
        sage: lion_polar_pos(2)
        (1.000000000, 0.08000000000)
        sage: lion_polar_pos(3)
        (1.000000000, 0.1200000000)
    """
    if (n == 0) :
        return vector([1,0])
    angle_L = lion_polar_pos(n-1)[1]
    angle_D = to_polar(dompteur_pos(n-1))[1]
    diff = monMod(angle_L - angle_D,2*pi) 
    if 0 < diff < pi :
        return lion_polar_pos(n-1) - lion_speed*step*vector([0,1])
    else :
        return lion_polar_pos(n-1) + lion_speed*step*vector([0,1])


def initialize_up_to(n=1000) :
    r"""
    Because ``dompteur_pos`` and ``lion_polar_pos`` are defined recursively
    on can get a ``RuntimeError: maximum recursion depth exceeded`` if both
    of these functions are not evaluated succesively. Here, we compute by
    step of 100.

    I'm sure that there is a better solution like changing the default
    value of the maximal recurxsion depth.
    """
    for i in range(0,n,100):
        lion_polar_pos(i)

@CachedFunction
def dessine(n) :
    r"""
    Returns a plot of the position of the lion and dompteur (tamer) at the n-th
    step.

    EXAMPLES::

        sage: dessine(10)
        sage: dessine(100)
        sage: for i in range(0,1000,100): dessine(i)
    """
    r = circle((0,0),1)

    rho,teta = lion_polar_pos(n)
    lion_text_pos = to_carte((rho-0.1,teta))
    lion_pos = to_carte((rho,teta))
    r += point(lion_pos,color="red",pointsize=25)
    r += text('Lion',lion_text_pos,rgbcolor='red')

    r += line(map(dompteur_pos,range(n+1)),color="blue",thickness=2)
    x,y = dompteur_pos(n)
    r += point((x,y),color="blue",pointsize=25)
    r += text('Tamer',(x,y+0.1),color='blue')

    r += text('Relative speed: Lion/Tamer = %s'%lion_speed ,(-1,1.2),color='purple',horizontal_alignment='left')
    r += text('Tamer step = %s times the radius'%N(step,digits=2),(-1,1.1),color='purple',horizontal_alignment='left')
    r += text('%s-th step'%n,(-1,1),color='purple',horizontal_alignment='left')

    r.set_aspect_ratio(1)
    r.axes(False)
    return r

def anime(l) :
    r"""
    Returns an animation of the tamer and lion from start to stop by step.

    EXAMPLES::

        sage: l = range(0,100,10)
        sage: anime(l)
        Animation with 10 frames
    """
    initialize_up_to(l[-1])
    return animate(map(dessine, l))




