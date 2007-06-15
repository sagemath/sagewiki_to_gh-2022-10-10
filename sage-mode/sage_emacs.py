"""Definitions used by commands sent to inferior Python in python.el."""

# Copyright (C) 2004, 2005, 2006, 2007  Free Software Foundation, Inc.
# Author: Dave Love <fx@gnu.org>

# This file is part of GNU Emacs.

# GNU Emacs is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs; see the file COPYING.  If not, write to the
# Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
# Boston, MA 02110-1301, USA.

import os, sys, traceback, inspect, __main__
from sets import Set
import xreload

__all__ = ["eexecfile", "eargs", "complete", "ehelp", "eimport", "modpath"]

# Don't kill debug setting if it has been specified
try:
    _emacs_py_debug
except:
    _emacs_py_debug = True

# Don't kill xreload setting if it has been specified
try:
    _emacs_py_xreload
except:
    _emacs_py_xreload = False

def eexecfile (file):
    """Execute FILE and then remove it.
    Execute the file within the __main__ namespace.
    If we get an exception, print a traceback with the top frame
    (ourselves) excluded."""
    try:
       try: execfile (file, __main__.__dict__)
       except:
	    (type, value, tb) = sys.exc_info ()
	    # Lose the stack frame for this location.
	    tb = tb.tb_next
	    if tb is None:	# print_exception won't do it
		print "Traceback (most recent call last):"
	    traceback.print_exception (type, value, tb)
    finally:
	os.remove (file)

def eargs (name, imports):
    "Get arglist of NAME for Eldoc &c."
    try:
	if imports: exec imports
	parts = name.split ('.')
	if len (parts) > 1:
	    exec 'import ' + parts[0] # might fail
	func = eval (name)
	if inspect.isbuiltin (func) or type(func) is type:
	    doc = func.__doc__
	    if doc.find (' ->') != -1:
		print '_emacs_out', doc.split (' ->')[0]
	    else:
		print '_emacs_out', doc.split ('\n')[0]
	    return
	if inspect.ismethod (func):
	    func = func.im_func
	if not inspect.isfunction (func):
            print '_emacs_out '
            return
	(args, varargs, varkw, defaults) = inspect.getargspec (func)
	# No space between name and arglist for consistency with builtins.
	print '_emacs_out', \
	    func.__name__ + inspect.formatargspec (args, varargs, varkw,
						   defaults)
    except:
	print "_emacs_out "

def all_names (object):
    """Return (an approximation to) a list of all possible attribute
    names reachable via the attributes of OBJECT, i.e. roughly the
    leaves of the dictionary tree under it."""

    def do_object (object, names):
	if inspect.ismodule (object):
	    do_module (object, names)
	elif inspect.isclass (object):
	    do_class (object, names)
	# Might have an object without its class in scope.
	elif hasattr (object, '__class__'):
	    names.add ('__class__')
	    do_class (object.__class__, names)
	# Probably not a good idea to try to enumerate arbitrary
	# dictionaries...
	return names

    def do_module (module, names):
	if hasattr (module, '__all__'):	# limited export list
	    names.union_update (module.__all__)
	    for i in module.__all__:
		do_object (getattr (module, i), names)
	else:			# use all names
	    names.union_update (dir (module))
	    for i in dir (module):
		do_object (getattr (module, i), names)
	return names

    def do_class (object, names):
	ns = dir (object)
	names.union_update (ns)
	if hasattr (object, '__bases__'): # superclasses
	    for i in object.__bases__: do_object (i, names)
	return names

    return do_object (object, Set ([]))

def ipython_complete (name, imports=None):
    """Complete NAME using IPython and print a Lisp list of completions.
    IMPORTS is ignored at this time; kepy for compatibility with complete.
    """
    try:
        import __main__
        names = __main__.__IP.Completer.all_completions(name)
    except NameError:
        print "_emacs_out ()"
        
    print '_emacs_out (',
    for n in names:
        print '"%s"' % n,
    print ')'

def complete (name, imports):
    """Complete TEXT in NAMESPACE and print a Lisp list of completions.
    Exec IMPORTS first."""
    import __main__, keyword

    def class_members(object):
	names = dir (object)
	if hasattr (object, '__bases__'):
	    for super in object.__bases__:
		names = class_members (super)
	return names	

    names = Set ([])
    base = None
    try:
	dict = __main__.__dict__.copy()
	if imports: exec imports in dict
	l = len (name)
	if not "." in name:
	    for list in [dir (__builtins__), keyword.kwlist, dict.keys()]:
		for elt in list:
		    if elt[:l] == name: names.add(elt)
	else:
	    base = name[:name.rfind ('.')]
	    name = name[name.rfind('.')+1:]
	    try:
		object = eval (base, dict)
		names = Set (dir (object))
		if hasattr (object, '__class__'):
		    names.add('__class__')
		    names.union_update (class_members (object))
	    except: names = all_names (dict)
    except: return []
    l = len(name)
    print '_emacs_out (',
    for n in names:
	if name == n[:l]:
	    if base: print '"%s.%s"' % (base, n),
	    else: print '"%s"' % n,
    print ')'

def ehelp (name, imports):
    """Get help on string NAME.
    First try to eval name for, e.g. user definitions where we need
    the object.  Otherwise try the string form."""
    locls = {}
    if imports:
	try: exec imports in locls
	except: pass
    try: help (eval (name, globals(), locls))
    except: help (name)

def eimport (modname, dir, use_xreload=False):
    """Import module MODNAME from directory DIR at the head of the search path.
    NB doesn't load from DIR if MODNAME shadows a system module."""
    from __main__ import __dict__

    if _emacs_py_debug:
        print "Loading module %r from directory %r" % (modname, dir)

    old_path = sys.path
    sys.path = [dir] # XXX for now + sys.path
    try:
	if True: # try:
            already_loaded = False
            try:
                # easiest way to peel back the package structure
                # print len(__dict__.keys())
                mod = eval(modname, __dict__)
                already_loaded = True
            except:
                print "ACK!"
                already_loaded = False            

            if already_loaded:
                if use_xreload or _emacs_py_xreload:
                    if _emacs_py_debug:
                        print "xreload-ing %s" % mod
                    xreload.xreload (mod, path=[dir])
                else:
                    if _emacs_py_debug:
                        print "reload-ing %s" % mod
                    reload (mod)
	    else:
                if _emacs_py_debug:
                    print "__import__(%r)" % modname
                from __main__ import __dict__
		__dict__[modname] = __import__ (modname)
# 	except:
#             traceback.print_exc()
#             raise
    finally:
	sys.path = old_path

def modpath (module):
    """Return the source file for the given MODULE (or None).
Assumes that MODULE.py and MODULE.pyc are in the same directory."""
    try:
	path = __import__ (module).__file__
	if path[-4:] == '.pyc' and os.path.exists (path[0:-1]):
	    path = path[:-1]
	print "_emacs_out", path
    except:
	print "_emacs_out ()"

# print '_emacs_ok'		# ready for input and can call continuation

# arch-tag: d90408f3-90e2-4de4-99c2-6eb9c7b9ca46
