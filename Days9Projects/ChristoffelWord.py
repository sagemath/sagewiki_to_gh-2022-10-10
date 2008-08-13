from JyModule import *

xmax = 10
ymax = 8
def draw():
    beginpage()

    scale(50)
    translate(1,1)

    #grid
    newpath()
    for i in range(xmax):
        moveto(i,0)
        lineto(i,ymax)
    
    for i in range(ymax):
        moveto(0,i)
        lineto(xmax,i)
    stroke(0.5)

    #vecteur
    dx = int(upperright.x)
    dy = int(upperright.y)
    newpath()
    moveto(0,0)
    lineto(dx,dy)
    setlinewidth(3)
    stroke([0,0,1])

    #path
    dir={'a':(1,0),'b':(0,1),'A':(-1,0),'B':(0,-1)}
    w = ChristoffelWord(dy,dx)
    newpath()
    moveto(0,0)
    for a in w:
        rlineto(dir[a])
    setlinewidth(3)
    stroke([1,0,0])

    #origine
    newpath()
    circle(0,0,0.08)
    fill(1,0,0)
    stroke(0)

    #is christoffel
    if isChristoffel(dx,dy):
        newpath()
        moveto(xmax/2,-.5)
        setfont(12)
        show('is Christoffel!!!')

    #the word
    newpath()
    moveto(0,-.5)
    setfont(12)
    show('Word : '+w)

    #Coordinates
    newpath()
    moveto(dx + .1,dy + .2)
    setfont(12)
    show('( %s, %s )'%(dx,dy))

    #moveable point
    newpath()
    placemoveable(upperright)

    endpage()

def move(point, px, py):
    x = max(0, int(px))
    y = max(0, int(py))
    point.setpoint(x, y)
    

upperright = Moveablepoint(1, 1, move)
addmoveable(upperright)

openframe((xmax+2)*50, (ymax+2)*50, draw)

def isChristoffel(p,q):
    return GCD(p,q) == 1

def ChristoffelWord(p, q):
    if p<0:
        return ChristoffelWord(-p,q).replace('A','a')
    elif q<0:
        return ChristoffelWord(p,-q).replace('B','b')
    
    # Compute the Christoffel word
    w = '' 
    u = 0
    if p == 0:
        w = 'a'*q
    else:
        for i in range(p + q):
            v = (u+p) % (p+q)
            if u < v:
                new_letter = 'a'
            else:
                new_letter = 'b'
            w += new_letter
            u = v
    return w

def GCD(x, y):
# The greatest common denominator (GCD) is the largest positive integer
# that divides into both numbers without a remainder.
# Examples: GCD(256,64)=64, GCD(12,8)=4, GCD(5,3)=1

 # Work With absolute values (positive integers)
    if x < 0 : x = -x
    if y < 0 : y = -y

    if x + y > 0 :
        g = y
        # Iterate Until x = 0
        while x > 0:
             g = x
             x = y % x
             y = g
        return g
    else:
  # Error, both parameters zero
        return 0
