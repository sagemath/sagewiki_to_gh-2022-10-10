= Sage Interactions - Loop Quantum Gravity =
goto [[interact|interact main page]]

<<TableOfContents>>

{{attachment:5-cell.gif}}

== Holomorphic factorization of the Quantum Tetrahedron ==
by David Horgan. 


Moduli Space of Shapes of a Tetrahedron with Faces of Equal Area

The space of shapes of a tetrahedron with fixed face areas is naturally a symplectic manifold of real dimension two. This symplectic manifold turns out to be a Kahler manifold and can be 

parametrized by a single complex coordinate Z given by the cross ratio of four complex numbers obtained by stereographically projecting the unit face normals onto the complex plane. 

This Demonstration illustrates how this works in the simplest case of a tetrahedron T whose four face areas are equal. For convenience, the cross-ratio coordinate Z is shifted and rescaled 

to z=(2Z-1)/Sqrt[3] so that the regular tetrahedron corresponds to z=i, in which case the upper half-plane is mapped conformally into the unit disc w=(i-z)/(i+z). The equi-area tetrahedron 

T is then drawn as a function of the unit disc coordinate w. 

Reference: L. Freidel, K. Krasnov, and E. R. Livine, "Holomorphic Factorization for a Quantum Tetrahedron".

{{{#!sagecell                

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
             print 'angle between faces 1 and 2 in quantum tetrahedron = ',d8a, 'radians'
             print 'angle between faces 1 and 2 in quantum tetrahedron = ',angle,'degrees'        

        html('<h3>main sequence Area eigenvalues</h3>')
        lp=1.61619926*10^-35
        main1=numerical_approx(sqrt(j1*(j1+1)),digits=4)
        areamain1 =0.5*lp^2*main1
        print 'Area of face 1=', areamain1, 'm2' 
        main2=numerical_approx(sqrt(j2*(j2+1)),digits=4)
        areamain2 =0.5*lp^2*main2
        print 'Area of face 2=', areamain2, 'm2' 
        main3=numerical_approx(sqrt(j3*(j3+1)),digits=4)
        areamain3 =0.5*lp^2*main3
        print 'Area of face 3=', areamain3, 'm2' 
        main4=numerical_approx(sqrt(j4*(j4+1)),digits=4)
        areamain4 =0.5*lp^2*main4
        print 'Area of face 4=', areamain4, 'm2' 
        area = areamain1 + areamain3 +areamain3+areamain4
        print 'Total area of quantum tetrahedron =', area, 'm2'









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
            #print r
        for j in range(d-1):
            kmatrix[[j],[j+1]]=r[j+1]
            kmatrix[[j+1],[j]]=-r[j+1]
            #print kmatrix
    
        M = (2/9)*kmatrix
        #print M
        s=M.eigenvalues()
        #print s    
        lp3=6*10^-104
        for j in range(d):
            e= sqrt(s[j])
            vol = lp3*e
            volume = numerical_approx(vol, digits=2)
            if e.imag() ==0:
                print "volume eigenvalue =",(e)
                print "volume of tetrahedron =", volume, 'm3'
                

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
        print "Angle eigenvalue in radians=",(d8)


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
            #print r
        for j in range(d-1):
            kmatrix[[j],[j+1]]=r[j+1]
            kmatrix[[j+1],[j]]=-r[j+1]
            #print kmatrix
    
        M = (2/9)*kmatrix
        #print M
        s=M.eigenvalues()
        #print s    
        lp3=6*10^-104
        for j in range(d):
            e= sqrt(s[j])
            vol = lp3*e
            volume = numerical_approx(vol, digits=2)
            if e.imag() ==0:
                print "volume eigenvalue =",(e)
                print "volume of tetrahedron in m3 =", volume
                

}}}
