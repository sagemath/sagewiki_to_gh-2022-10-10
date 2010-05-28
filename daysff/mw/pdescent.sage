

This is code to compute the p-descent in char. p based on code by
D. Ulmer. Assumes we have a class for a point on elliptic curve
over function fields, a class for the elliptic curve over function
fields and a class for function fields. The class for function 
fields need to provide a separating element u (currently using
generator, will cause problem) so we can differentiate wrto u.
We also need the characteristic of the field. From the elliptic
curve class we just need the usual invariants.
Current version by F. Voloch.


def p_descent(self):
   r""" Computes the p-descent map for a point on an elliptic curve 
        defined over a function field of positive characteristic p
        as long as the j-invariant is not a p-th power in the field.
        Takes a point on an elliptic curve over a function field as
        input and returns an element of the function field as output.
        Based on formulas due to A. Broumas (Compositio 107, 1997).

    """

   E = self.curve()       #assumes that E is an elliptic curve containing the point.
   k = self.base_field()  #assumes that k is a function field.
   u = k.gen()            #later will need k/F_p(u) separable, will be nice to have workaround.
   p = k.characteristic()

   if p == 0:
         raise ValueError('p-descent specific for positive characteristic p')
   elif p == 2: 
         raise ValueError('Not implemented yet for characteristic two')
   elif p == 3:
         R = k['x']
         x = R.gen()
         ES = E.short_weierstrass_model(complete_cube=False)
         a2 = ES.a2()
         EL = ES.change_weierstrass_model([k.(1),a2,0,0])
         a6 = EL.a6()
         A = a2
         def wp(z):
            return z**p-A*z
         delta = EL.discriminant()
         a6_prime = derivative(j,u)       #assumes can differentiate wrto u
         if a6_prime == 0:
             raise ValueError('p-descent only defined if j is not a p-th power')
         def DD(z):
            return (a2*a6/a6_prime)*derivative(z,u)

         if 2*P==E(0):
            return 0
         else:
            x=self[0]/self[2]
            y=self[1]/self[2]
            return wp(DD(x)/(2*y))+y+wp((x**2+(-DD(a2)/a2+DD(a6)/a6)*x)/(2*y))


 
   else:
         R = k['x']
         x = R.gen()
         ES = E.short_weierstrass_model()
         a4 = ES.a4()
         a6 = ES.a6()
         f=(x**3 + a4*x + a6)**((p-1)//2)
         A = f.coeffs()[p-1]    #Hasse invariant of E, maybe replace by function call
         M =  f.quo_rem(x**p)[0]

         def wp(z):
            return z**p-A*z

         delta = ES.discriminant()
         j = ES.j_invariant()
         j_prime = derivative(j,u)       #assumes can differentiate wrto u
         if j_prime == 0:
             raise ValueError('p-descent only defined if j is not a p-th power')

         def DD(z):
            return 18*(a6/a4)*(j/j_prime)*derivative(z,u)


         if 2*P==E(0):
            return 0
         else:
            x=self[0]/self[2]
            y=self[1]/self[2]
            return wp(DD(x)/(2*y))+y*M(x)+wp((-2*x**2-(1/6)*(DD(delta)/delta)*x-(4/3)*a4)/(2*y))



