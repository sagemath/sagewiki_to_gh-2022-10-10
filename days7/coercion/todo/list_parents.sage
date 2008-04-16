
import sys, types

bad_methods = ['_coerce_impl', '_coerce_']

def needs_work(obj):
    if isinstance(obj.__call__, types.MethodType):
        inherit_call = False
        for b in obj.__bases__:
            try:
                if obj.__call__ == b.__call__:
                    inherit_call = True
            except AttributeError, msg:
                pass
        if not inherit_call:
            return True
            
    elif obj.__call__.__objclass__ == obj:
        return True
        
    for m in bad_methods:
        if hasattr(obj, m):
            return True
            

def list_descendants(m, t, recurse=True):
    print m.__name__
    
#    print "  Named instances: "
#    for name, obj in m.__dict__.items():
#        if isinstance(obj, t):
#            print "    ", name
#    print "  Named Classes: "

    for name, obj in m.__dict__.items():
        if isinstance(obj, type):
            if t in obj.mro():
                if obj is sage.structure.parent.Parent:
                    continue
                if needs_work(obj):
                    star = '*'
                else:
                    star = ' '
                if obj.__module__ != m.__name__:
                    print "   %s (%s.%s)" % (star, obj.__module__, name)
                else:
                    print "   %s %s" % (star, name)

    if recurse:
        for name, obj in m.__dict__.items():
            if isinstance(obj, types.ModuleType) \
                    and m.__name__ != obj.__name__ \
                    and m.__name__ in obj.__name__:
                list_descendants(obj, t, True)


if len(sys.argv) < 2:
    print """
Usage: 
  sage list_parents.sage 'sage.dotted.module'
    """

for modstr in sys.argv[1:]:
    m = __import__(modstr, fromlist=['*'])
    list_descendants(m, Parent)
