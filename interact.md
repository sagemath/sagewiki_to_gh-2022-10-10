#Choose the size D of the square matrix:
D = 3

example = [[1 if k==j else 0 for k in range(D)] for j in range(D)]
example[0][-1] = 2
example[-1][0] = 3

@interact
def _(M=input_grid(D,D, default = example,
                   label='Matrix to invert', to_value=matrix),
      tt = text_control('Enter the bits of precision used'
                        ' (only if you entered floating point numbers)'),  
      precision = slider(5,100,5,20),
      auto_update=False):
    if det(M)==0:
        print 'Failure: Matrix is not invertible'
        return
    if M.base_ring() == RR:
        M = M.apply_map(RealField(precision))
    N=M
    M=M.augment(identity_matrix(D))
    print 'We construct the augmented matrix'
    show(M)
    for m in range(0,D-1):
        if M[m,m] == 0:
            lista = [(M[j,m],j) for j in range(m,D)]
            maxi, c = max(lista)
            M[c,:],M[m,:]=M[m,:],M[c,:]
            print 'We permute rows %d and %d'%(m+1,c+1)
            show(M)
        for n in range(m+1,D):
            a=M[m,m]
            if M[n,m]!=0:
                print "We add %s times row %d to row %d"%(-M[n,m]/a, m+1, n+1)
                M=M.with_added_multiple_of_row(n,m,-M[n,m]/a)
                show(M)
    for m in range(D-1,-1,-1):
        for n in range(m-1,-1,-1):
            a=M[m,m]
            if M[n,m]!=0:
                print "We add %s times row %d to the row %d"%(-M[n,m]/a, m+1, n+1)
                M=M.with_added_multiple_of_row(n,m,-M[n,m]/a)
                show(M)       
    for m in range(0,D):
        if M[m,m]!=1:
            print 'We divide row %d by %s'%(m+1,M[m,m])
            M = M.with_row_set_to_multiple_of_row(m,m,1/M[m,m])
            show(M)   
    M=M.submatrix(0,D,D)
    print 'We keep the right submatrix, which contains the inverse'        
    html('$$M^{-1}=%s$$'%latex(M))
    print 'We check it actually is the inverse'
    html('$$M^{-1}*M=%s*%s=%s$$'%(latex(M),latex(N),latex(M*N)))
