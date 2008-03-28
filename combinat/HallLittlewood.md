= Hall-Littlewood Polynomials =
This page contains preliminary results for doing computations with the Hall-Littlewood polynomials in the P, Q, and Q' bases.

== P Basis: ==

== Q Basis: ==

== Q' Basis: ==
Timing data for arithmetic with Hall-Littlewood polynomials in the Q' basis.

=== Conversion to Schur basis ===
Conversion to the Schur basis uses symmetrica.hall_littlewood.
{{{
sage: Qp = HallLittlewood_qp(QQ)
sage: S = SFASchur(QQ['t'].fraction_field())
sage: time b = S(Qp([2,2]))
CPU times: user 0.05 s, sys: 0.00 s, total: 0.05 s
Wall time: 0.05
sage: time b = S(Qp([3,2,1]))
CPU times: user 0.16 s, sys: 0.00 s, total: 0.16 s
Wall time: 0.15
sage: time b = S(Qp([3,3,2,1]))
CPU times: user 0.87 s, sys: 0.03 s, total: 0.90 s
Wall time: 0.89
sage: time b = S(Qp([2,2]))
CPU times: user 0.02 s, sys: 0.00 s, total: 0.02 s
Wall time: 0.02
sage: time b = S(Qp([3,2,1]))
CPU times: user 0.02 s, sys: 0.00 s, total: 0.03 s
Wall time: 0.03
sage: time b = S(Qp([3,3,2,1]))
CPU times: user 0.07 s, sys: 0.00 s, total: 0.07 s
Wall time: 0.07
sage: b
s[3, 3, 2, 1] + t*s[3, 3, 3] + t*s[4, 2, 2, 1] + (t^2+t)*s[4, 3, 1, 1] + (t^3+2*t^2+t)*s[4, 3, 2] + (t^4+t^3+t^2)*s[4, 4, 1] + (t^3+t^2)*s[5, 2, 1, 1] + (t^4+t^3+t^2)*s[5, 2, 2] + (t^5+2*t^4+3*t^3+t^2)*s[5, 3, 1] + (t^6+t^5+t^4+t^3)*s[5, 4] + t^4*s[6, 1, 1, 1] + (t^6+2*t^5+2*t^4+t^3)*s[6, 2, 1] + (t^7+t^6+2*t^5+2*t^4)*s[6, 3] + (t^7+t^6+t^5)*s[7, 1, 1] + (t^8+t^7+2*t^6+t^5)*s[7, 2] + (t^9+t^8+t^7)*s[8, 1] + t^10*s[9]
}}}

=== Multiplication ===
Multiplication in the Q' basis is performed by converting to the Schur basis, performing the multiplication there, and then converting back to the Q' basis.

Over ZZ:

{{{
sage: Qp = HallLittlewood_qp(ZZ)
sage: time c = Qp([2,2])^2
CPU times: user 0.54 s, sys: 0.01 s, total: 0.55 s
Wall time: 0.55
sage: time c = Qp([3,2,1])^2
CPU times: user 11.52 s, sys: 0.24 s, total: 11.76 s
Wall time: 11.78
sage: time c = Qp([2,2])^2
CPU times: user 0.21 s, sys: 0.01 s, total: 0.22 s
Wall time: 0.22
sage: time c = Qp([3,2,1])^2
CPU times: user 1.16 s, sys: 0.02 s, total: 1.18 s
Wall time: 1.18
}}}

Over QQ:

{{{
sage: Qp = HallLittlewood_qp(QQ)
sage: time c = Qp([2,2])^2
CPU times: user 0.77 s, sys: 0.01 s, total: 0.78 s
Wall time: 0.78
sage: time c = Qp([3,2,1])^2
CPU times: user 14.00 s, sys: 0.24 s, total: 14.24 s
Wall time: 14.26
sage: time c = Qp([2,2])^2
CPU times: user 0.55 s, sys: 0.01 s, total: 0.56 s
Wall time: 0.56
sage: time c = Qp([3,2,1])^2
CPU times: user 3.57 s, sys: 0.08 s, total: 3.65 s
Wall time: 3.66
}}}
The majority of time spent in the last computation is due to coercion from ZZ['t'] to QQ('t') (which should really be much faster).


Over RR:

{{{
sage: Qp = HallLittlewood_qp(RR)
sage: time c = Qp([2,2])^2
CPU times: user 0.78 s, sys: 0.01 s, total: 0.78 s
Wall time: 0.99
sage: time c = Qp([3,2,1])^2
CPU times: user 13.28 s, sys: 0.33 s, total: 13.61 s
Wall time: 13.67
sage: time c = Qp([2,2])^2
CPU times: user 0.44 s, sys: 0.00 s, total: 0.44 s
Wall time: 0.44
sage: time c = Qp([3,2,1])^2
CPU times: user 2.88 s, sys: 0.05 s, total: 2.94 s
Wall time: 2.95
}}}
The majority of time spent in the last computation is due to coercion from ZZ['t'] to RR('t') (which should really be much faster).
