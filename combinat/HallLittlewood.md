= Hall-Littlewood Polynomials =

== P basis ==
{{{
sage: HallLittlewoodP(QQ)
Hall-Littlewood polynomials in the P basis over Fraction Field of Univariate Polynomial Ring in t over Rational Field
sage: HallLittlewoodP(QQ, t=-1)
Hall-Littlewood polynomials in the P basis with t=-1 over Rational Field
sage: HLP = HallLittlewoodP(QQ)
sage: s = SFASchur(HLP.base_ring())
sage: s(HLP([2,1]))
(-t^2-t)*s[1, 1, 1] + s[2, 1]
}}}

The Hall-Littlewood polynomials in the P basis at $t = 0$ are the Schur functions.
{{{
sage: HLP = HallLittlewoodP(QQ,t=0)
sage: s = SFASchur(HLP.base_ring())
sage: s(HLP([2,1])) == s([2,1])
True
}}}

The Hall-Littlewood polynomials in the P basis at $t = 1$ are the monomial symmetric functions.
{{{
sage: HLP = HallLittlewoodP(QQ,t=1)
sage: m = SFAMonomial(HLP.base_ring())
sage: m(HLP([2,2,1])) == m([2,2,1])
True
}}}

== Q basis ==
The Q basis is dual to the P basis with respect to the Hall-Littlewood scalar product $<,>_t$.
{{{
sage: HallLittlewoodQ(QQ)
Hall-Littlewood polynomials in the Q basis over Fraction Field of Univariate Polynomial Ring in t over Rational Field
sage: HallLittlewoodQ(QQ, t=-1)
Hall-Littlewood polynomials in the Q basis with t=-1 over Rational Field
}}}

== Qp basis ==
The Qp basis is dual to the P basis with respect to the standard Hall scalar product.
{{{
sage: HallLittlewoodQp(QQ)
Hall-Littlewood polynomials in the Qp basis over Fraction Field of Univariate Polynomial Ring in t over Rational Field
sage: HallLittlewoodQp(QQ, t=-1)
Hall-Littlewood polynomials in the Qp basis with t=-1 over Rational Field
}}}
{{{

}}}
