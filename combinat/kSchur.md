

# k-Schur Functions


```txt
sage: ks3 = kSchurFunctions(QQ,3); ks3
k-Schur Functions at level 3 over Univariate Polynomial Ring in t over Rational Field
sage: s(ks3([3,2,1]))
s[3, 2, 1] + t*s[4, 1, 1] + t*s[4, 2] + t^2*s[5, 1]

sage: ks4 = kSchurFunctions(QQ,4)
sage: ks4( ks3([2,2,2,2,2,1]) )
ks4[2, 2, 2, 2, 2, 1] + t^2*ks4[3, 2, 2, 2, 1, 1] + t^2*ks4[3, 2, 2, 2, 2] + t^3*ks4[3, 3, 2, 1, 1, 1] + t^4*ks4[3, 3, 2, 2, 1] + t^5*ks4[3, 3, 3, 2]

sage: H = MacdonaldPolynomialsH(QQ)
sage: q,t = H.base_ring().gens()
sage: s = SFASchur(H.base_ring())
sage: s(H([2,1,1]))
q*s[1, 1, 1, 1] + (q*t^2+q*t+1)*s[2, 1, 1] + (q*t^2+t)*s[2, 2] + (q*t^3+t^2+t)*s[3, 1] + t^3*s[4]
sage: ks3 = kSchurFunctions(H.base_ring(), 3, t=t)
sage: ks3(H([2,1,1]))
q*ks3[1, 1, 1, 1] + (q*t^2+1)*ks3[2, 1, 1] + (q*t^2+t)*ks3[2, 2] + t^2*ks3[3, 1]
```