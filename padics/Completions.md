
* _Goal_ -- Make the command "K.completion(p, absprec=30)" work when K is a number field and p is a prime of K 
* _Type_ -- basic features, structural improvements 
* _Priority_ -- Medium-High 
* _Difficulty_ -- Medium-Easy 
* _Prerequisites_ -- the later stages need <a href="/padics/GeneralExtensions">general extension rings</a> 
* _Background_ -- completions of number fields, residue fields, `sage.structure.factory` 
* _Contributors_ -- David Roe 
* _Progress_ - I have a patch implementing `coerce_keys`, and have changed most of residue fields for number fields to use it. 
* _Related Tickets_ --  

## Discussion


### Coerce Keys

By a "coerce key" I mean the following.  It's an object that is accepted as a keyword argument by `UniqueFactory.__call__` that serves two purposes: 

1. It overrides uniqueness of parents, allow you to get a new parent object with the same parameters as an existing one.  The factory will cache these parents using keys that have the coerce key appended. 
1. It provides facilities to change the class of the returned parent (using dynamic classes) and to insert coercions and conversions mapping to the new parent.  These are accomplished by overriding appropriate functions on the `coerce_key` object. 
This will allow one to create a residue field as follows: 
```python
#!python 
class CoerceKey_res_field(CoerceKey):
    def __init__(self, OK, p):
        self.OK = OK
        self.K = OK.fraction_field()
        self.p = p
    def __hash__(self):
        return hash(self.p)
    def __cmp__(self, other):
        return cmp(self.p, other.p)
    def __call__(self, new_object):
        new_object.__class__ = dynamic_class(new_object.__class__.__name__, (new_object.__class__, ResidueField), doccls=new_object.__class__)
        return new_object

    def coerce_list(self, new_object):
        return [self.OK._residue_homomorphism(self.p, new_object)]
    def convert_list(self, new_object):
        return [self.K._residue_conversion(self.p, new_object)]

sage: K = NumberField(x^3-2); p = K.prime_above(17)
sage: k.<a> = GF(17, coerce_key=CoerceKey_res_field(K.maximal_order(), p))
```

## Tasks

1. Implement `coerce-keys`. 
1. Change the implementation of residue fields for number fields to use `coerce_keys` 
1. Change the implementation of residue fields for local fields to use `coerce_keys` 
1. Write completions using `coerce_keys`. 