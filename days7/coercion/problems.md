

# Segfaults


# Errors

The following infinite recursion comes up in a couple places.  For example sage/rings/qqbar.py 
```txt
      File "coerce_maps.pyx", line 135, in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3429)
      File "/opt/sage-2.10.1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 5052, in _polynomial_
        return R( R.base_ring()(self) )
      File "parent.pyx", line 189, in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:1993)
      File "morphism.pyx", line 124, in sage.categories.morphism.Morphism.__call__ (sage/categories/morphism.c:2677)
        Defn: Choice of lifting map
      File "coerce_maps.pyx", line 135, in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3429)
      File "/opt/sage-2.10.1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 5052, in _polynomial_
        return R( R.base_ring()(self) )
      File "parent.pyx", line 189, in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:1993)
      File "morphism.pyx", line 124, in sage.categories.morphism.Morphism.__call__ (sage/categories/morphism.c:2677)
        Defn: Choice of lifting map
      File "coerce_maps.pyx", line 135, in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3429)
      File "/opt/sage-2.10.1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 5052, in _polynomial_
        return R( R.base_ring()(self) )
      File "parent.pyx", line 189, in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:1993)
      File "morphism.pyx", line 124, in sage.categories.morphism.Morphism.__call__ (sage/categories/morphism.c:2677)
        Defn: Choice of lifting map
      File "coerce_maps.pyx", line 135, in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3429)
      File "/opt/sage-2.10.1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 5052, in _polynomial_
        return R( R.base_ring()(self) )
      File "parent.pyx", line 189, in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:1993)
      File "morphism.pyx", line 124, in sage.categories.morphism.Morphism.__call__ (sage/categories/morphism.c:2677)
        Defn: Choice of lifting map
      File "coerce_maps.pyx", line 135, in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3429)
      File "/opt/sage-2.10.1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 5052, in _polynomial_
        return R( R.base_ring()(self) )
      File "parent.pyx", line 189, in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:1993)
      File "morphism.pyx", line 124, in sage.categories.morphism.Morphism.__call__ (sage/categories/morphism.c:2677)
        Defn: Choice of lifting map
      File "coerce_maps.pyx", line 135, in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3429)
      File "/opt/sage-2.10.1/local/lib/python2.5/site-packages/sage/calculus/calculus.py", line 5049, in _polynomial_
        if self.number_of_arguments() == 0
```

```txt
    TypeError: sage.structure.parent.Set_generic.__new__(Set_object_enumerated) is not safe, use sage.structure.wrapper_parent.WrapperParent_model1.__new__()

```

```txt
    NotImplementedError: _call_with_args not overridden to accept arguments for <type 'sage.categories.morphism.IdentityMorphism'>

```

```txt
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
```

```txt
sage: pi in QQ
---------------------------------------------------------------------------
<type 'exceptions.AttributeError'>        Traceback (most recent call last)

/opt/sage-2.10.1/devel/sage-main/sage/sets/<ipython console> in <module>()

/opt/sage-2.10.1/devel/sage-main/sage/sets/parent.pyx in sage.structure.parent.Parent.__contains__ (sage/structure/parent.c:2221)()

/opt/sage-2.10.1/devel/sage-main/sage/sets/parent.pyx in sage.structure.parent.Parent.__call__ (sage/structure/parent.c:1993)()

/opt/sage-2.10.1/devel/sage-main/sage/sets/morphism.pyx in sage.categories.morphism.Morphism.__call__ (sage/categories/morphism.c:2677)()

/opt/sage-2.10.1/devel/sage-main/sage/sets/coerce_maps.pyx in sage.structure.coerce_maps.NamedConvertMorphism._call_ (sage/structure/coerce_maps.c:3414)()

<type 'exceptions.AttributeError'>: 'Pi' object has no attribute '_rational_'
```