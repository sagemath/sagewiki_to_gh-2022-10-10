sage: E = EllipticCurve('37a1')
sage: K.<a> = QuadraticField(97)
sage: EK = E.change_ring(K)
sage: EK1 = EK.quadratic_twist(a-3)  ## random!
sage: 
sage: j = EK1.j_invariant()
sage: j in QQ
True
sage: EK2 = EllipticCurve(j=j).change_ring(K)
sage: d = EK1.is_quadratic_twist(EK2); d
-37/31104*a + 37/10368
sage: EK1.quadratic_twist(d).is_isomorphic(EK2)
True
sage: EK2
Elliptic Curve defined by y^2 = x^3 + (-15479341056/1369)*x + (-481469424205824/50653) over Number Field in a with defining polynomial x^2 - 97


