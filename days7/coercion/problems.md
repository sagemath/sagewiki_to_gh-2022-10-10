= Segfaults =


= Errors =
{{{

    TypeError: sage.structure.parent.Set_generic.__new__(Set_object_enumerated) is not safe, use sage.structure.wrapper_parent.WrapperParent_model1.__new__()

}}}

{{{
    NotImplementedError: _call_with_args not overridden to accept arguments for <type 'sage.categories.morphism.IdentityMorphism'>

}}}

{{{
sage:         sage: S = Set(QQ)
sage:         sage: T = Set(ZZ['x'])
sage:         sage: X = S.intersection(T)
sage: a = X._X(4); a
4
sage: b = X._Y(4); b
4
sage: a == b
False
sage: QQ(4) == ZZ['x'](4)
True
}}}

{{{
sage: pi in QQ
---------------------------------------------------------------------------
<type 'exceptions.AttributeError'>        Traceback (most recent call last)

/opt/sage-2.10.1/devel/sage-main/sage/sets/<ipython console> in <module>()

/opt/sage-2.10.1/devel/sage-main/sage/sets/parent.pyx in sage.structure.parent.Parent.__contains__ (sage/structure/parent.c:2221)()

/opt/sage-2.10.1/devel/sage-main/sage/sets/parent.pyx in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:1993)()

/opt/sage-2.10.1/devel/sage-main/sage/sets/morphism.pyx in sage.categories.morphism.Morphism.__call__ (sage/categories/morphism.c:2677)()

/opt/sage-2.10.1/devel/sage-main/sage/sets/coerce_maps.pyx in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3414)()

<type 'exceptions.AttributeError'>: 'Pi' object has no attribute '_rational_'
}}}
