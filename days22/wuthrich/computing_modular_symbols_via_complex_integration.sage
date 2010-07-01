
def Gamma(E,r,an=None):
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
        assert Gamma.det() == 1
        #Gamma = Gamma0(N)([-beta,alpha,c*N,d])
        A = 0
        B = 1
        [C,D] = xgcd(-B,A)[1:3]
        M = matrix(ZZ,[[A,B],[C,D]])
        #M = SL2Z([A,C,B,D])
        M = M.transpose()



        Q = N/B

        [x,y] = [1,-1]

        #x = -x/A
        #y=-y

        wQ = matrix(ZZ,[[Q*x,y],[N,-A*Q]])
        wQ = (wQ*M)[0,0]*wQ
        assert wQ[1,1]==0
        h = (wQ*M)[1,1]
       
        ep_solutions_dict = solve(epsilon == 1/Q * imag(SL2Z(M.inverse()).acton(SL2Z(Gamma).acton(r+i*epsilon)) ), epsilon, solution_dict=True)
        ep_solutions = list()
        for j in range(0,len(ep_solutions_dict)):
            ep_solutions.append(ep_solutions_dict[j][epsilon])
        ep = max(ep_solutions)
        #print 'epsilon = ',ep, ' = ', round(ep,10)
        #assert ep <= 0, 'Error: epsilon negative!'

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

        [x,y] = xgcd(Q^2,N)[1:3]

        x = -x/A
        y=-y

        wQ = matrix(ZZ,[[Q*x,y],[N,-A*Q]])
        wQ = (wQ*M)[0,0]*wQ
        h = (wQ*M)[1,1]
   
        ep_solutions_dict = solve(epsilon == 1/Q * imag(SL2Z(M.inverse()).acton(SL2Z(Gamma).acton(r+i*epsilon)) ), epsilon, solution_dict=True)
        ep_solutions = list()
        for j in range(0,len(ep_solutions_dict)):
            ep_solutions.append(ep_solutions_dict[j][epsilon])
        ep = max(ep_solutions)
        #print 'epsilon = ',ep, ' = ', round(ep,10)
        if ep <= 0:
            print 'Error: epsilon negative!'

    #manually fix ep
    #ep = .05
    #
    T = SL2Z(M.inverse()).acton(SL2Z(Gamma).acton(r+I*ep))
    #delta = E.period_lattice().basis()[0] / (2*E.torsion_order() )
    #print 'tau1 = ', round(r,10) + I*round(ep,10)
    #print 'tau2 = ', round(real((T+h)/Q),10) + I*round(imag((T+h)/Q),10)
    integral1 = CompApprox(E, r + I*ep,an)
    integral2 = CompApprox(E, (T + h)/Q,an)
   
    eps = dict([d,prod(E.root_number(p) for p in d.prime_divisors() )] for
d in E.conductor().divisors())
    AL_eigenvalue = eps[Q]
   
    integral = integral1 - AL_eigenvalue*(round(real(integral2),10) + I * round(imag(integral2),10))
    m = E.torsion_order() * real(integral) / E.period_lattice().basis()[0]
    integral_exact = m.round() / E.torsion_order()
    #print integral / E.period_lattice().basis()[0]

    return integral_exact

def CompApprox(E, tau, an=None):
    delta = E.period_lattice().basis()[0] / (3 * E.torsion_order() )
    #delta = 10^-6
    #print 'delta = ',delta
    epsilon_local = imag_part(tau)
    M = max(ceil((-1/(2*pi*epsilon_local))*ln(delta*9999/10000*(1-exp(-2*pi*epsilon_local)))),100) #optional lower bound
    #print 'M: ',M
    if M>10^9:
        print 'Warning: M large'
    b=max(ceil(log(2*pi*M,2) - log(log(1+delta/10000 / M),2)), 25)
    CC=ComplexField(b)
    tau = CC(tau)
    #print 'bits: ',CC(b)
    if an==None or len(an) < M+1:
        an = E.anlist(M)
    #print 'length of an: ',len(an)
    return sum(   (an[n]/n)*exp(2*CC.pi()*CC(I)*n*tau)  for n in range(1, M+1) )