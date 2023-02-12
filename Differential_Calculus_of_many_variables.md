

## Basic notions


## Limits


## Partial Derivatives


## Local maximum and minimum for functions with two variables

We start with the definition of local max and min. 

**Definition.** Let $f(x,y)$ defined over a region $R$ which contains the point $(a,b)$. 

**1.** Function  $f(x,y)$ has local maximum in  $(a,b),$ if $f(a,b) \geq f(x,y)$ for all points $(x,y)$ in an open disk with center $(a,b)$. 

**2.** Function $f(x,y)$ has local minimum  $(a,b),$ if $f(a,b) \leq f(x,y)$ for all points $(x,y)$ in an open disk with center $(a,b)$. 

We can use the following theorem for finding them. 

**Theorem 1.** If $f(x,y)$ has local max or min in the interior of  $R$ where the first partial derivatives exist, then $f_{x}(a,b) = 0$ and $f_{y}(a,b) = 0$. 

We call these points critical. We say that a critical point is an inflexion point, if in a small disk with center  $(a,b),$ there are points with $f(x,y) > f(a,b)$ and $f(x,y) < f(a,b)$. 

In order to find out what kind of point is a critical point (i.e. local max or min) we use the following criterion. 

**Criterion.** Let $f(x,y)$ has second order partial derivatives and are continuous in a disk with center  $(a,b)$ and that $f_{x}(a,b) = f_{y}(a,b) = 0$. Then: 

**i.**  $f$ has local maximum in $(a,b)$ if $f_{xx} < 0$ and $f_{xx}f_{yy} - f_{xy}^{2} > 0$ at $(a,b)$. 

**ii.** $f$  has local maximum in  $(a,b)$ if  $f_{xx} > 0$ and $f_{xx}f_{yy} - f_{xy}^{2} > 0$ at  $(a,b)$. 

**iii.** $f$ has inflexion point in  $(a,b)$ if $f_{xx}f_{yy} - f_{xy}^{2} < 0$ at $(a,b).$ 

**iv.** The criterion does not work if  $f_{xx}f_{yy} - f_{xy}^{2} = 0$ at  $(a,b)$. 

We can easily implement the previous in Sage (we did not include the case where we have infinitely many points). 


```txt
"""
Find local maxima and minima of functions with two variables in R^2

 AUTHORS:

 Argyris Kalampakas, argiriskala@yahoo.com : initial version 25/5/2015

    Copyright (C) 2015  Argyris Kalampakas

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>

"""

#############
# We work at R^2 so we don't have boundary points.
# f : symbolic expression with two variables <<x,y>>
# flag : default=true, enables plotting 
# TODO : fmin : default=0, for growing the plain of the function, accepts only positive
# TODO : symbolic expression become variable independent
#############

def local_maxmin(f, flag = true):

    print "The function f is: "
    print f

    # Algorithm for Fermat's theorem

    ### Algorithm for keeping only the real critical points
    type(f)
    fx = diff(f,x)
    fy = diff(f,y)
    criticalpoint_ = solve([fx, fy], x, y)

    def are_real_roots(s):
        criticalpoint=[]
        for i in range(0,len(s)):
             if s[i][0].rhs() in RR and s[i][1].rhs() in RR:
                criticalpoint.append(criticalpoint_[i])
        return criticalpoint
    criticalpoint=are_real_roots(criticalpoint_)
    ###

    if criticalpoint:

        print "--------------------"
        print "The critical points are:"
        print [[cr[0], cr[1]] for cr in criticalpoint]


        Min = [[cr[0].rhs()] for cr in criticalpoint] + [[cr[1].rhs()] for cr in criticalpoint] + [[f(cr[0].rhs(),cr[1].rhs())] for cr in criticalpoint]
        Min = min(Min) + max(Min)
        Min = abs(Min[0]),abs(Min[1])
        Min = min(Min)

        # Change the range of the plain
        F = plot3d(f,(x,-Min-2,Min+2),(y,-Min-2,Min+2))

        # Algorithm for second derivative test

        fxx = diff(fx,x)
        fyy = diff(fy,y)
        fxy = diff(fx,y)
        h = fxx*fyy - fxy**2
        if h.has(x) & h.has(y):
            H = [[h(cr[0].rhs(), cr[1].rhs())] for cr in criticalpoint]
        elif h.has(x):
            H = [[h(cr[0].rhs())] for cr in criticalpoint]
        elif h.has(y):
            H = [[h(cr[1].rhs())] for cr in criticalpoint]
        else:
            H = h

        LM=[]
        if type(H) is list:

            for i in range(0,len(H)):
               i = 0

               if H[i][0] > 0:

                    if fxx.has(x):

                        if fxx(criticalpoint[i][0].rhs()) > 0:
                            LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='black', size=15))
                            print "--------------------"
                            print criticalpoint[i]
                            print "It is local minimum, the value of the function at this point is:"
                            print f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())
                        elif fxx(criticalpoint[i][0].rhs()) < 0:
                            LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='red', size=15))
                            print "--------------------"
                            print criticalpoint[i]
                            print "It is local maximum, the value of the function at this point is:"
                            print f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())
                        else:
                            LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='yellow', size=15))
                            print "--------------------"
                            print criticalpoint[i]
                            print "Hessian is zero. We do not have a method for this point, to examine what it is."
                            ## We have to create higher-order derivative test

                        criticalpoint.pop(H.index(H[i]))
                        H.pop(H.index(H[i]))

                    else:

                        if fxx > 0:
                            LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='black', size=15))
                            print "--------------------"
                            print criticalpoint[i]
                            print "It is local minimum, the value of the function at this point is:"
                            print f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())
                        elif fxx < 0:
                            LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='red', size=15))
                            print "--------------------"
                            print criticalpoint[i]
                            print "It is local maximum, the value of the function at this point is:"
                            print f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())
                        else:
                            LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='yellow', size=15))
                            print "--------------------"
                            print criticalpoint[i]
                            print "Hessian is zero. We do not have a method for this point, to examine what it is."
                            ## We have to create higher-order derivative test

                        criticalpoint.pop(H.index(H[i]))
                        H.pop(H.index(H[i]))

               elif H[i][0] < 0:
                   LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='green', size=15))
                   print "--------------------"
                   print criticalpoint.pop(H.index(H[i]))
                   print "It is saddle point."
                   H.pop(H.index(H[i]))
               else:
                   LM.append(point3d((criticalpoint[i][0].rhs(), criticalpoint[i][1].rhs(),
 f(criticalpoint[i][0].rhs(),criticalpoint[i][1].rhs())),color='yellow', size=15))
                   print "--------------------"
                   print criticalpoint.pop(H.index(H[i]))
                   print "Hessian is zero. We do not have a method for this point, to examine what it is."
                   H.pop(H.index(H[i]))

        else:
            if H > 0:

                    if fxx.has(x):

                        if fxx(criticalpoint[0][0].rhs()) > 0:
                            LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='black', size=15))
                            print "--------------------"
                            print criticalpoint[0]
                            print "It is local minimum, the value of the function at this point is:"
                            print f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())
                        elif fxx(criticalpoint[0][0].rhs()) < 0:
                            LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='red', size=15))
                            print "--------------------"
                            print criticalpoint[0]
                            print "It is local maximum, the value of the function at this point is:"
                            print f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())
                        else:
                            LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='yellow', size=15))
                            print "--------------------"
                            print criticalpoint[0]
                            print "Hessian is zero. We do not have a method for this point, to examine what it is."
                            ## We have to create higher-order derivative test

                    else:

                        if fxx > 0:
                            LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='black', size=15))
                            print "--------------------"
                            print criticalpoint[0]
                            print "It is local minimum, the value of the function at this point is:"
                            print f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())
                        elif fxx < 0:
                            LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='red', size=15))
                            print "--------------------"
                            print criticalpoint[0]
                            print "It is local maximum, the value of the function at this point is:"
                            print f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())
                        else:
                            LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='yellow', size=15))
                            print "--------------------"
                            print criticalpoint[0]
                            print "Hessian is zero. We do not have a method for this point, to examine what it is."
                            ## We have to create higher-order derivative test

            elif H < 0:
                   LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='green', size=15))
                   print "--------------------"
                   print criticalpoint.pop()
                   print "It is saddle point."
            else:
                   LM.append(point3d((criticalpoint[0][0].rhs(), criticalpoint[0][1].rhs(),
 f(criticalpoint[0][0].rhs(),criticalpoint[0][1].rhs())),color='yellow', size=15))
                   print "--------------------"
                   print criticalpoint.pop()
                   print "Hessian is zero. We do not have a method for this point, to examine what it is."

        if flag:
            print "--------------------"
            print "Green points are saddle points."
            print "Red points are local maximum."
            print "Black points are local minimum."
            print "Yellow points are for those that we do not have a method to examine what it is."
            PLOT = F
            while LM:
                PLOT = PLOT + LM.pop(0)

            show(PLOT)

    else:
        print "--------------------"
        print "This function either has infinite many critical points or does not have any. In the first case we can not compute them with our code."

    return None
```

```python
#!python numbers=none 
# Define the function
sage:var('x,y')
sage:f = x**3 + y**3 - x
sage:local_maxmin(f,false)

The function f is:
x^3 + y^3 - x
--------------------
The critical points are:
[[x == -1/3*sqrt(3), y == 0], [x == 1/3*sqrt(3), y == 0]]
--------------------
[x == -1/3*sqrt(3), y == 0]
Hessian is zero. We do not have a method for this point, to examine what it is.
--------------------
[x == 1/3*sqrt(3), y == 0]
Hessian is zero. We do not have a method for this point, to examine what it is.


```

## Local maximum and minimum for functions with three variables


## Finding extrema points of functions subject to some constraints (Lagrange multipliers)
