def CompApprox(E, tau, l = 0, an=None):
   
   # delta determines how close we would like to get to our answer
   delta = E.period_lattice().basis()[0] / (2 * E.torsion_order() )
   print 'delta: ',delta
   if l == 0:
       epsilon = imag_part(tau)
   else:
       epsilon = l * imag_part(tau)
      
   # How far we need to sum given delta (and epsilon)
   M = ceil((-1/(2*pi*epsilon))*ln(delta*9999/10000*(1-exp(-2*pi*epsilon))))
   print 'M: ',M
   if M>10^9:
       print 'Warning: M large'
      
   # Given delta and M, let's determine the bits of precision necessary
   # to carry out the computations to our wanted degree of accuracy.
  
   b=max(ceil(log(2*pi*M,2) - log(log(1+delta/10000 / M),2)), 20)
   CC=ComplexField(b)
   tau = CC(tau)
   print 'bits: ',CC(b)
   if an==None or len(an) < M+1:
       an = E.anlist(M)
   print 'length of an: ',len(an)

   #Speeding things up for large M
   partialSum = list()
   partialSum.append((an[0]/1)*exp(2*CC.pi()*CC(I)*1*tau))

   n=1
   while n < M+1:
       partialSum.append((an[n]/n)*exp(2*CC.pi()*CC(I)*n*tau) + partialSum[n-1])
       n+=1  
  
   #Give us our result   
   return partialSum[n-1]
