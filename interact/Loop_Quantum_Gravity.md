= Sage Interactions - Loop Quantum Gravity =
goto [[interact|interact main page]]

<<TableOfContents>>

{{attachment:5-cell.gif}}

== Holomorphic factorization of the Quantum Tetrahedron ==
by David Horgan. 


Moduli Space of Shapes of a Tetrahedron with Faces of Equal Area

The space of shapes of a tetrahedron with fixed face areas is naturally a symplectic manifold of real dimension two. This symplectic manifold turns out to be a Kähler manifold and can be 

parametrized by a single complex coordinate Z given by the cross ratio of four complex numbers obtained by stereographically projecting the unit face normals onto the complex plane. 

This Demonstration illustrates how this works in the simplest case of a tetrahedron T whose four face areas are equal. For convenience, the cross-ratio coordinate Z is shifted and rescaled 

to z=(2Z-1)/Sqrt[3] so that the regular tetrahedron corresponds to z=i, in which case the upper half-plane is mapped conformally into the unit disc w=(i-z)/(i+z). The equi-area tetrahedron 

T is then drawn as a function of the unit disc coordinate w. 

Reference: L. Freidel, K. Krasnov, and E. R. Livine, "Holomorphic Factorization for a Quantum Tetrahedron".

{{{#!sagecell                

# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 20:05:11 2014

@author: David Horgan
"""

from scipy.optimize import fsolve
import math



#scene.range = 10

#cylinder(pos=(0,0,0), radius=1.0,axis=(0,0,1), color=color.white)

#scene2 = display(title='Examples of Tetrahedrons',
    # x=0, y=0, width=600, height=600,
    # center=(0,0,0), background=(1,1,1))

#scene2.visible = True
#scene2.range = 10




#unit circle plot
C = circle((0,0), 1)





#input points from unit circle

p1=0.6
p2=0.7


#face1
a1=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
a2=(((1 - p2**2)/(2*(1 + p1)))**(1/4),  (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0 )
a3=(((1/2)*( (1 + p1)**3)* (1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
a=[a1,a2,a3]


#face2

b1=(0, 0, 0)
b2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
b3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4),p2*((2*(1 + p1))/(1 - p2**2))**(1/4), sqrt(1-p1**2)*((1-p2**2)/(2*(1+p1)))**(1/4)  )
b=[b1,b2,b3]

#face3
c1=(0, 0, 0)
c2=( ((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
c3=(((1/2)*((1 + p1)**3)*(1 - p2**2))**(1/4), p2*((2*(1 + p1))/(1 - p2**2))**(1/4),  sqrt(1 - p1**2)*((1 - p2**2)/(2*(1 + p1)))**(1/4) )
c=[c1,c2,c3]


#face4
d1=(0, 0, 0)
d2=(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 + 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
d3 =(((1 - p2**2)/(2*(1 + p1)))**(1/4), (1/2)*(p2 - 1)*((2*(1 + p1))/(1 - p2**2))**(1/4), 0)
d=[d1,d2,d3]

#printresults
print('a1={}'.format(a1))
print('a2={}'.format(a2))
print('a3={}'.format(a3))

print('b1={}'.format(b1))
print('b2={}'.format(b2))
print('b3={}'.format(b3))

print('c1={}'.format(c1))
print('c2={}'.format(c2))
print('c3={}'.format(c3))

print('d1={}'.format(d1))
print('d2={}'.format(d2))
print('d3={}'.format(d3))



G = Graphics()

#tetrahedron faces - coloured
P1=polygon([a1,a2, a3], color='red')
P2=polygon([b1,b2, b3],color='yellow')
P3=polygon([c1,c2, c3],color='blue')
P4=polygon([d1,d2, d3],color='green')

#polygon faces
#P1=polygon([a1,a2, a3])
#P2=polygon([b1,b2, b3])
#P3=polygon([c1,c2, c3])
#P4=polygon([d1,d2, d3])

#polygon([a1,a2, a3])
#polygon([b1,b2, b3])
#polygon([c1,c2, c3])
#polygon([d1,d2, d3])

g=G+P1+P2+P3+P4
show(g, title='tet(w)', viewer='tachyon')
show(C, title='w plane')
}}}







== Quantum tetrahedron volume, area and angle eigenvalues ==
by David Horgan. 


In this interact I calculate the angle,   area and volume for a quantum tetrahedron
The angle is found using the expression: 
theta = arccos((j3*(j3+1)-(j1*(j1+j1)-j2*(j2+1))/(2*sqrt(j1*(j1+j1)*j2*(j2+1))))
The area is found using the expression:
A=sqrt(j1*(j1+1))
The volume is fund using the expression
V^2 =M = 2/9(real antisymmetrix matrix)


Values of constants
gamma is Immirzi parameter
gamma =numerical_approx( ln(2)/(pi*sqrt(2)))
#G = 6.63*10^-11
hbar= (1.61619926*10^-35)/(2*pi)
lp is the planck length
lp3=6*10^-104
Reference: Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard. 
Reference: Shape in an atom of space: exploring quantum geometry phenomenology by Seth A. Major. 


Research Blog: http://quantumtetrahedron.wordpress.com



Given the values of J1, J2, J3 and J4 this interact calculates the volume, area and angle eigenvalues of a quantum tetrahedron.

{{{#!sagecell








import numpy



@interact




def _(j1 = input_box(6.0, 'J1'),
      j2= input_box(6.0, 'J2'),
      j3= input_box(6.0, 'J3'),
      j4= input_box(7.0, 'J1'), auto_update=False):
    if (j1+j2)<= (j3+j4):
        html('<h3>Value of Angle eigenvalue in radians</h3>')
        d2=j3*(j3+1)
        d3=j1*(j1+1)
        d4=j2*(j2+1)
        d5=d2-d3-d4
        d6=2*sqrt(d3*d4)
        d7=d5/d6
        d8=arccos(d7)
        d8a=numerical_approx(d8, digits=4)
        angle = numerical_approx(d8*180/pi, digits=4)
        if angle != NaN:
             print('angle between faces 1 and 2 in quantum tetrahedron = {} radians'.format(d8a))
             print('angle between faces 1 and 2 in quantum tetrahedron = {} degrees'.format(angle))

        html('<h3>main sequence Area eigenvalues</h3>')
        lp=1.61619926*10^-35
        main1=numerical_approx(sqrt(j1*(j1+1)),digits=4)
        areamain1 =0.5*lp^2*main1
        print('Area of face 1=', areamain1, 'm2')
        main2=numerical_approx(sqrt(j2*(j2+1)),digits=4)
        areamain2 =0.5*lp^2*main2
        print('Area of face 2=', areamain2, 'm2')
        main3=numerical_approx(sqrt(j3*(j3+1)),digits=4)
        areamain3 =0.5*lp^2*main3
        print('Area of face 3=', areamain3, 'm2')
        main4=numerical_approx(sqrt(j4*(j4+1)),digits=4)
        areamain4 =0.5*lp^2*main4
        print('Area of face 4=', areamain4, 'm2')
        area = areamain1 + areamain3 +areamain3+areamain4
        print('Total area of quantum tetrahedron =', area, 'm2')

        html('<h3>Values of Volume Eigenvalue</h3>')
        kmin = int(max(abs(j1-j2),abs(j3 -j4)))
        kmax = int(min((j1+j2),(j3 +j4)))
        d = kmax -kmin + 1
        y=numpy.arange(kmin,kmax+1,1)
        kmatrix = matrix(CDF,int(d), int(d))
        r=list()
        for j in range(d):
            k=int(y[j])
            c1 = -i*k
            c2 = sqrt(4*k*k - 1)
            c3 = sqrt(j1*(j1+1))
            c4 = sqrt((2*j1+1))
            c5 = sqrt(j3*(j3+1))
            c6 = sqrt((2*j3+1))
            c7 = wigner_6j(j1,1,j1,k,j2,k-1)
            c8 = wigner_6j(j3,1,j3,k,j4,k-1)
            a = c1*c2*c3*c4*c5*c6*c7*c8
            r.append(a)
            q = numerical_approx(a, digits=10)
        for j in range(d-1):
            kmatrix[[j],[j+1]]=r[j+1]
            kmatrix[[j+1],[j]]=-r[j+1]
    
        M = (2/9)*kmatrix
        s = M.eigenvalues()
        lp3=6*10^-104
        for j in range(d):
            e = sqrt(s[j])
            vol = lp3*e
            volume = numerical_approx(vol, digits=2)
            if e.imag() ==0:
                print("volume eigenvalue =", e)
                print("volume of tetrahedron =", volume, 'm3')
                

}}}


== Quantum tetrahedron Area Operator eigenvalues ==
by David Horgan. 

Given the values of J1, J2, J3 and J4 this interact calculates the area eigenvalues of a quantum tetrahedron.

{{{#!sagecell

html('<h3>Quantum tetrahedron Volume and Angle Eigenvalues</h3>')
html('Enter the four J values into the input boxes')
html('k values k ranges from kmin to kmax in integer steps')
html('The dimension d of the Hilbert space H4,  d = kmax - kmin + 1')
html('kmin = max(|j1-j2|,|j3 -j4|) kmax = min(j1+j2,j3 +j4)')
html('The the dimension of the hilbert space is given by d = kmax -kmin + 1') 
html('V^2 =M = 2/9(real antisymmetrix matrix))')
html('Spins must satisfy (j1+j2)<= (j3+j4)')
html('Reference: Bohr-Sommerfeld Quantization of Space by Eugenio Bianchi and Hal M. Haggard ')
html('Reference: Shape in an atom of space: exploring quantum geometry phenomenology by Seth A. Major ')






import numpy



@interact




def _(j1 = input_box(6.0, 'J1'),
      j2= input_box(6.0, 'J2'),
      j3= input_box(6.0, 'J3'),
      j4= input_box(7.0, 'J1'), auto_update=False):
    if (j1+j2)<= (j3+j4):
        html('<h3>Value of Angle eigenvalue in radians</h3>')
        d2=j3*(j3+1)
        d3=j1*(j1+1)
        d4=j2*(j2+1)
        d5=d2-d3-d4
        d6=2*sqrt(d3*d4)
        d7=d5/d6
        d8=arccos(d7)
        print("Angle eigenvalue in radians=", d8)


        html('<h3>Values of Volume Eigenvalue</h3>')
        kmin = int(max(abs(j1-j2),abs(j3 -j4)))
        kmax = int(min((j1+j2),(j3 +j4)))
        d = kmax -kmin + 1
        y=numpy.arange(kmin,kmax+1,1)
        kmatrix = matrix(CDF,int(d), int(d))
        r=list()
        for j in range(d):
            k=int(y[j])
            c1 = -i*k
            c2 = sqrt(4*k*k - 1)
            c3 = sqrt(j1*(j1+1))
            c4 = sqrt((2*j1+1))
            c5 = sqrt(j3*(j3+1))
            c6 = sqrt((2*j3+1))
            c7 = wigner_6j(j1,1,j1,k,j2,k-1)
            c8 = wigner_6j(j3,1,j3,k,j4,k-1)
            a = c1*c2*c3*c4*c5*c6*c7*c8
            r.append(a)
            q=numerical_approx(a, digits=10)
        for j in range(d-1):
            kmatrix[[j],[j+1]]=r[j+1]
            kmatrix[[j+1],[j]]=-r[j+1]
    
        M = (2/9)*kmatrix
        s = M.eigenvalues()
        lp3=6*10^-104
        for j in range(d):
            e= sqrt(s[j])
            vol = lp3*e
            volume = numerical_approx(vol, digits=2)
            if e.imag() ==0:
                print("volume eigenvalue =", e)
                print("volume of tetrahedron in m3 =", volume)
                

}}}
