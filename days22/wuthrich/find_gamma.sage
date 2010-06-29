def Gamma(E,r):
   alpha = r.numerator()
   beta = r.denominator()
   N = E.conductor()
   newcusp=0
   epsilon=var('epsilon')
   if gcd(beta,N) == 1:
       [c,d] = xgcd(N*alpha,beta)[1:3]
       c=-c
       d=-d
       Gamma = matrix(ZZ,[[-beta,alpha],[c*N,d]])
       #Gamma = Gamma0(N)([-beta,alpha,c*N,d])
       A = 0
       B = 1
       [C,D] = xgcd(-B,A)[1:3]
       M = matrix(ZZ,[[A,B],[C,D]])
       #M = SL2Z([A,C,B,D])
       M = M.transpose()



       Q = N/B

       #[x,y] = xgcd(Q^2,N)[1:3]

       #x = -x/A
       #y=-y

       #wQ = matrix(ZZ,[[Q*x,y],[N,-A*Q]])

       print solve(epsilon == 1/Q * imag(SL2Z(M.inverse()).acton(SL2Z(Gamma).acton(r+i*epsilon)) ), epsilon)

   else:
       [c,d] = xgcd(N*alpha,beta)[1:3]
       [a,b] = xgcd(d,-c*N)[1:3]
       newcusp = (a*alpha + b*beta)/(c*N*alpha + d*beta)
       Gamma = matrix(ZZ,[[a,b],[c*N,d]])
       #Gamma = Gamma0(N)([-beta,alpha,c*N,d])
       A = newcusp.numerator()
       B = newcusp.denominator()
       [C,D] = xgcd(-B,A)[1:3]
       M = matrix(ZZ,[[A,B],[C,D]])
       #M = SL2Z([A,C,B,D])
       M = M.transpose()

       Q = N/B

       #[x,y] = xgcd(Q^2,N)[1:3]

       #x = -x/A
       #y=-y

       #wQ = matrix(ZZ,[[Q*x,y],[N,-A*Q]])

       print solve(epsilon == 1/Q * imag(SL2Z(M.inverse()).acton(SL2Z(Gamma).acton(r+i*epsilon)) ), epsilon)



   return [Gamma,newcusp]


