R.<x> = QQ[]
K.<w> = NumberField(x^2 - x + 1)

def norm_in_K(x):
    if x in ZZ:
        return x*x
    else:
        return x.norm()

def get_primary_prime(p):
    if p%3 == 2:
        fp = p
    elif p == 3:
        fp = 1 + w
    else:
        R.<x> = GF(p)[]
        fp = (x^2 - x + 1).roots()[1][0].lift()
        fp = find_gcd(p, fp-w)
    fp = K(fp)
    for u in [1, -1, w, -w, w^2, -w^2]:
        if (fp*u)[0] % 3 == 2 and (fp*u)[1] % 3 == 0:
            return fp*u
    assert False

def is_in_ring_of_int(a):
    return a in a.parent().maximal_order()

def find_gcd(f1, f2):
    g1 = find_primary(f1)
    g2 = find_primary(f2)
    if is_in_ring_of_int(g1/g2): return g2
    if is_in_ring_of_int(g2/g1): return g1
    if norm_in_K(g1) >= norm_in_K(g2):
        return find_gcd(g2, find_primary(g1-g2))
    else:
        return find_gcd(g1, find_primary(g2-g1))

def find_primary(inp):
    nm = norm_in_K(inp)
    if nm == 1:
        return inp
    while nm/3 in ZZ:
        inp = inp/(1+w)
        nm = nm/3
    if is_in_ring_of_int((inp - 1)/3):   return inp
    if is_in_ring_of_int((-inp - 1)/3):  return -inp
    if is_in_ring_of_int((inp*w - 1)/3): return inp*w
    if is_in_ring_of_int((-inp*w-1)/3):  return -inp*w
    if is_in_ring_of_int((inp*w^2-1)/3): return inp*w^2
    if is_in_ring_of_int((-inp*w^2-1)/3): return -inp*w^2
    return inp


def p_reduction(p, ell, n):
    # reduction by p, if p|l, p^3|n, then return reduction(l/p,n/p^3)
    e = min(ell.valuation(p), n.valuation(p)//3)
    if e == 0:
        return ell, n
    else:
        return ell//p**e, n//p**(3*e)

def mconcat(v):
    return "".join(map(str, v))
    
def eqn_print(coef, vars, is_first=False):
    if coef == 0:
        return ""
    if coef < 0:
        prefix = "-"
        coef = -coef
    else:
        prefix = "" if is_first else "+"
    if vars == "":
        return prefix + str(coef)
    elif coef == 1:
        return prefix + vars
    else:
        return prefix + str(coef) + "*" + vars

def cubic_residue(p, q):
    """
    sage: for p in primes(20, 50):
    ...       print p
    ...       for a in range(1, p):
    ...           if cubic_residue(p, a^2) != 2*cubic_residue(p, a):
    ...               print "\t", a, cubic_residue(p, a^2), 2*cubic_residue(p, a)
    ...           assert cubic_residue(p, a^3) == 0
    23
    29
    31
    37
    41
    43
    47
    
    sage: for p in primes(10, 50):
    ...       print p, get_primary_prime(p) == gp.GetPrimaryPrime(p)
    ...       for a in range(1,p):
    ...           if cubic_residue(p, a) != gp.CubicResidue(p, a):
    ...               print "\t", a, cubic_residue(p, a), gp.CubicResidue(p, a)

    """
    if is_prime(p) and p%3 == 2 and q%p != 0:
        return mod(0, 3)
    if is_prime(p) and p%3 == 1 and q%p != 0:
        cr = mod(q, p)^((p-1)/3)
        if cr == 1:
            return mod(0, 3)
        # pp=pa+pb*w^2 ( w^2 = (-1+sqrt(-3))/2 )
        pp = get_primary_prime(p)
        pa = pp[0] + pp[1]
        pb = pp[1]
        if cr == mod(-pa/pb, p):
            return mod(1, 3)
        else:
            return mod(2, 3)
    elif p == 9:
        mq = mod(q, p)
        if mq in [1,8]:
            return mod(0, 3)
        elif mq in [2, 7]:
            return mod(2, 3)
        else:
            return mod(1, 3)
    else:
        raise ValueError, "p = %s, q = %s" % (p,q)

def three_isogeny_descent(A1, A3, upto=10, verbose = -1):
    #local(da1,da3,cf,fda3,nda3,a1,a3,fac,p,p1,pv,qv,pred,mpow,clist,rlist,m9a1,m9a3,twist,RET,KERNEL,cr,ci,tmp,rcn,rrn,mapto)
    
    rrn = rcn = 0
    
    if A3 * (A1^3 - 27*A3) == 0:
        raise ValueError, "Singular curve in ThreeIsogenyDescent"
    t = cputime()    
      
    da1 = A1.denominator()
    da3 = A3.denominator()
    
    if A1 == 1 or A3==1: # Changed to upper case.  ?
        cf = 1
    else:
        fda3 = factor(da3)
        nda3 = 1
        for k in range(1, len(fda3)+1):
            nda3 *= fda3[k][0]**(floor((fda3[k][1] - 1)/3) + 1)
        cf = lcm(da1,nda3)
        
    a1 = A1*cf
    a3 = A3*cf^3
    
    fac = factor(a3.abs())
    
    clist=[]
    rlist=[]
    
    pred=[a1,a3]
    
    for i in range(len(fac)):
        p = fac[i][0]
        pred = p_reduction(p, pred[0], pred[1])
            
        mpow = pred[1].valuation(p)
        if mpow > 0:
            clist.append((p, mpow))
      
    if verbose>0:
        print "clist: ", clist
        print "reduced [a1,a3]: ", pred
      
    fac = factor((pred[0]**3-27*pred[1]).abs())
    
    for i in range(len(fac)):
        p = fac[i][0]
        if mod(p, 3) == 1:
            p1 = get_primary_prime(p)
            L = p1.galois_conjugates(p1.parent())
            pconj = L[0] if L[0] != p1 else L[1]
            rlist.append((p, p1/pconj))

    if verbose > 0:
        print "rlist: ", rlist
      
    m9a1 = mod(pred[0], 9)
    m9a3 = mod(pred[1], 9);
    
    if (m9a1==0 and m9a3==0) \
            or (m9a1==0 and m9a3==1) \
            or (m9a1==0 and m9a3==8) \
            or (m9a1==3 and m9a3==6) \
            or (m9a1==6 and m9a3==3) \
            or (m9a1==3 and m9a3==8) \
            or (m9a1==6 and m9a3==1) \
            or (m9a1==3 and m9a3==1 and mod(a1-a3, 27) != 11) \
            or (m9a1==6 and m9a3==8 and mod(a1-a3, 27) != 16):
        rlist.append((9,1-w))
      
    RET = matrix(GF(3), len(rlist), len(clist))
      
    for i in range(len(rlist)):
        for j in range(len(clist)):
            pv = rlist[i]
            qv = clist[j]
            
            if mod(pv[0], qv[0]) != 0:
                RET[i, j] = cubic_residue(pv[0], qv[0])
            else:
                RET[i, j] = 2*qv[1]*cubic_residue(pv[0], pred[1]/qv[0]**qv[1])
            if verbose>1:
                print "p = %s, q = %s, CubicResidue = %s"%(pv[1], qv[1], RET[i,j])
      
    if verbose>0:
        print "Selmer matrix:"
        print RET
      
    # when a1^3 - 27*a3 has no prime divisors, we use the 1 by len(clist) zero matrix to get homogeneous spaces
    if (pred[0]**3 - 27*pred[1]).abs() == 1:
        RET=matrix(GF(3), 1,len(clist))
      
    KERNEL = RET.right_kernel().basis_matrix()
      
    count = 0
    rcn = KERNEL.nrows()
      
    for idx in GF(3)**rcn:
        if count > upto:
            break
        count += 1
        i = 0
        while i < rcn and idx[i] == 1:
            i += 1


        if i < rcn and idx[i] == 0:
            kerelmt = (idx - vector([1]*rcn)) * KERNEL
            twist = 1
            for j in range(rcn):
                twist *= clist[j][0]**(kerelmt[j].lift())
            twist = K(twist)
            print "=== Curve Over Rational Field Defined By ==="
            print "-u^3", eqn_print(twist^2, "v^3"), eqn_print(A1*twist, "u*v"), eqn_print(A3*twist, ""), ","
            print "    the Map to the Curve Defined by y^2", eqn_print(A1, "x*y"), eqn_print(A3, "y"), "-x^3"
            print " (u,v) -> (u*v,", "0" if twist == 0 else eqn_print(twist, "v^3", 1), ")"
            print ""
                                   
    # when a3 has no prime divisors, we use the 1 by len(rlist) zero matrix to get homogeneous spaces
    if pred[1].abs() == 1:
        RET = matrix(GF(3), len(rlist), 1)
    if (pred[0]**3 - 27*pred[1]).abs() != 1:
        KERNEL=RET.transpose().right_kernel().basis_matrix()
        
        count=0;
        rrn=KERNEL.nrows()
        
        for idx in GF(3)**rrn:
            if count > upto:
                break
            count += 1
            i = 0
            while i < rrn and idx[i]==1:
                i += 1
          
            if i < rrn and idx[i] == 0:
                kerelmt = (idx - vector([1]*rrn)) * KERNEL
                twist = 1
                for j in range(rrn):
                    twist *= rlist[j][1]**(kerelmt[j].lift())
                twist = K(twist)
            
                print("=== Curve Over Rational Field Defined By ");
            
                # twist = n + mw where w^2 - w + 1 = 0, so let w = (1+\sqrt{-3})/2
                # then cr = n + m/2, ci = m/2
            
                cr = twist[0] + twist[1]/2
                ci = twist[1]/2
 
                tmp = -(A1**3 - 27*A3)
                print eqn_print(ci, "(u^3-9*u*v^2)", 1), eqn_print(3*cr, "(u^2*v-v^3)"), eqn_print(3/2*A1, "(u^2+3*v^2)"), eqn_print(3/2*tmp,""), ","
                print "    the Map to the Curve Defined By y^2 - x^3 + 27/4*(", eqn_print(A1, "x", 1), eqn_print(tmp, "", 1) if A1 == 0 else 0, ")^2"
                mapto = eqn_print(cr, "(u^3-9*u*v^2)", 1) + eqn_print(-9*ci, "(u^2*v-v^3)", 1 if cr==0 else 0)
                print " (u,v) -> (u^2+3*v^2,", mapto if mapto != "" else "0", ")"
                print ""
                
    if verbose > 0:
        print "Time Elapsed: ", cputime(t)
        print "Upper Bound of Rank: ", rcn + rrn - 1
        print "Selmer matrix: ", RET
    return rcn+rrn-1
