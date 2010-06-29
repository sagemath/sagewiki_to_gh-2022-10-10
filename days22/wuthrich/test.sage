def Gamma(E,r):
   alpha = r.numerator()
   beta = r.denominator()
   N = E.conductor()

   if gcd(beta,N) == 1:
       [c,d] = xgcd(N*alpha,beta)[1:3] #this is [xgcd(4,5) is a list of numbers    #where we first give gcd, then A, B such that 5A+5B = gcd (euclid) then [1:3] is #saying give me the last two. that is give me A and B (python starts count at zero)
       c=-c
       d=-d
       dummy=c*N
       Gamma = matrix(ZZ,[[-beta,alpha],[dummy,d]])
       return [Gamma,0]

   else:
       [c,d] = xgcd(N*alpha,beta)[1:3]
       [a,b] = xgcd(d,-c*N)[1:3]
       newcusp = (a*(alpha/beta) + b)/(c*N*(alpha/beta) + d)
       dummy=c*N
       Gamma = matrix(ZZ,[[a,b],[dummy,d]])
       return [Gamma,newcusp]