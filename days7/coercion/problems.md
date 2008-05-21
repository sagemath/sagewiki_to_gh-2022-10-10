= Segfaults =
{{{
sage: R = QQ['x,y'].fraction_field()
sage: x,y = R.gens()
sage: a = x
sage: str(a)

sage: P = PolynomialRing(QQ, 2, 'x')
sage: x = P.gens()
sage: from sage.combinat.misc import umbral_operation
sage: a = umbral_operation(x[0]^3) 

sage: Partition([3,2,1]).arms_legs_coeff(1,1)
}}}

= Errors =
{{{

    TypeError: sage.structure.parent.Set_generic.__new__(Set_object_enumerated) is not safe, use sage.structure.wrapper_parent.WrapperParent_model1.__new__()

}}}
