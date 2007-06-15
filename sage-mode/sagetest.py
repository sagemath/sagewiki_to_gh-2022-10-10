import inspect, doctest, unittest, re

SAGE_DOCTEST_RANDOM    = doctest.register_optionflag('SAGE_DOCTEST_RANDOM')
SAGE_DOCTEST_OPTIONAL  = doctest.register_optionflag('SAGE_DOCTEST_OPTIONAL')
SAGE_DOCTEST_LONG_TIME = doctest.register_optionflag('SAGE_DOCTEST_LONG_TIME')

def _in_comment_re(text):
    r"""
    Look for a comment marker followed by text, but not in a string.
    """
    return re.compile(r'''
        ^               # anchor to beginning of string
        (?P<LINE>.*?)   # anything
        (?P<COMMENT>
        \#              # up to first comment marker
        [^\'\"\n]*?     # not followed by a quote or a newline
        %s              # then text
        [^\'\"\n]*?     # not followed by a quote or a newline
        \n?             # include the newline in comment
        )
        $               # anchor the end of string
        ''' % re.escape(text), re.MULTILINE | re.VERBOSE | re.IGNORECASE)

_32BIT_RE    = _in_comment_re('32-bit')
_64BIT_RE    = _in_comment_re('64-bit')

_RANDOM_RE    = _in_comment_re('random')
_OPTIONAL_RE  = _in_comment_re('optional')
_LONG_TIME_RE = _in_comment_re('long') # ('long time')

_SAGE_PROMPT_RE = re.compile(r'''
^                                # anchor to the beginning of a line
(?P<SPACES>\s*?)                  # whitespace, which we want to keep
(?P<PROMPT>sage:|\.\.\.\.\.)      # sage: or ..... prompt
''', re.VERBOSE | re.MULTILINE)

class SageOutputChecker(doctest.OutputChecker):
    r"""
    Check the output of examples, handling SAGE extensions.

    At this time, the only extension is to ignore output
    from tests marked SAGE_DOCTEST_RANDOM.
    """
    def check_output(self, want, got, optionflags):
        if optionflags & SAGE_DOCTEST_RANDOM:
            return True
        return doctest.OutputChecker.check_output(self, want, got, optionflags)

class SageDocTestParser(doctest.DocTestParser):
    r"""
    A DocTestParser that handles SAGE doctesting extensions.

    The following comments in example source set optionflags:
    * '# random'    -- optionflag SAGE_DOCTEST_RANDOM
    * '# optional'  -- optionflag SAGE_DOCTEST_OPTIONAL
    * '# long time' -- optionflag SAGE_DOCTEST_LONG_TIME

    The optionflags are handled in SageDocTestRunner.

    The following comments in example output are stripped:
    * '# 32-bit'
    * '# 64-bit'

    By default, all 64-bit output is stripped entirely, and all
    32-bit comments are elided.
    """

    def __init__(self, arch_is_32bit=True):
        if arch_is_32bit:
            self._filter_want = self._filter_want_32bit_arch
        else:
            self._filter_want = self._filter_want_64bit_arch
        # DocTestParser has no __init__, so we don't call it
        # doctest.DocTestParser.__init__(self)

    def _replace_prompts(self, string):
        r"""Replace sage: and ..... prompts in string."""

        def _repl(x):
            if x.group('PROMPT').startswith('.'):
                return x.group('SPACES') + '...'
            else:
                return x.group('SPACES') + '>>>'

        return _SAGE_PROMPT_RE.sub(_repl, string)
    
    def parse(self, string, name='<string>'):
        r"""
        Divide the given string into examples and intervening text,
        and return them as a list of alternating Examples and strings.
        """

        # The following string replacement primes the pump: without
        # this, no tests will be recognized by the regular doctest.
        s = self._replace_prompts(string)

        # Divide the given string into examples and intervening text,
        # and return them as a list of alternating Examples and strings.
        alternating_list = doctest.DocTestParser.parse(self, s, name)

        # Now we markup the examples with the corresponding optionflags
        for e in alternating_list:
            if isinstance(e, doctest.Example):
                self.markup(e)

        return alternating_list

    def _filter_want_32bit_arch(self, want):
        r"""Strip 64-bit output completely, and remove 32-bit comments."""
        ks = []
        ls = want.splitlines(True) # keep '\n'
        for l in ls:
            if _64BIT_RE.match(l) is not None:
                continue
            l = _32BIT_RE.sub(lambda x: x.group('LINE'), l).rstrip()
            ks.append(l)
        return '\n'.join(ks)

    def _filter_want_64bit_arch(self, want):
        r"""Strip 32-bit output completely, and remove 64-bit comments."""
        ks = []
        ls = want.splitlines(True) # keep '\n'
        for l in ls:
            if _32BIT_RE.match(l) is not None:
                continue
            l = _64BIT_RE.sub(lambda x: x.group('LINE'), l).rstrip()
            ks.append(l)
        return '\n'.join(ks)
        
    def _sage_options_dict(self, example):
        r"""Find SAGE extensions in example and return a dict of them."""
        options = {}

        res = _RANDOM_RE.match(example.source)
        if res is not None:
            options[SAGE_DOCTEST_RANDOM] = True

        res = _OPTIONAL_RE.match(example.source)
        if res is not None:
            options[SAGE_DOCTEST_OPTIONAL] = True

        res = _LONG_TIME_RE.match(example.source)
        if res is not None:
            options[SAGE_DOCTEST_LONG_TIME] = True

        return options
        
    def markup(self, example):
        r"""
        Markup a single example with SAGE doctesting extensions, in place.
        """        
        # Very important to preparse!
        import sage.misc.preparser
        example.source = sage.misc.preparser.preparse(example.source)
        if not example.source.endswith('\n'):
            example.source += '\n'

        # Now search for SAGE doctesting extensions and update options
        example.options.update(self._sage_options_dict(example))

        # Now handle 32-bit vs 64-bit output
        example.want = self._filter_want(example.want)
        # An empty string means 'Expected nothing', so don't make append
        # a newline: that would make it <BLANKLINE>.
        if example.want != '' and not example.want.endswith('\n'):
            example.want += '\n'

class SageDocTestFinder(doctest.DocTestFinder):
    r"""
    Find test cases in SAGE source code.
    """

    def __init__(self, sage_optionflags=0, arch_is_32bit=True,
                 *args, **kwargs):
        r"""
        Create a new SAGE doctest finder.
        
        If SAGE_DOCTEST_LONG_TIME is set in sage_optionflags, test long
        running examples.

        If SAGE_DOCTEST_OPTIONAL is set in sage_optionflags, test
        optional examples.
        """

        self.sage_optionflags = sage_optionflags
        parser = SageDocTestParser(arch_is_32bit=arch_is_32bit)
        doctest.DocTestFinder.__init__(self, parser=parser, *args, **kwargs)

    def _from_module(self, module, object):
        """
        Return true if the given object is defined in the given
        module.

        Extends the default implementation to support Sagex extension code.
        """

        # I can't determine what module a method_descriptor belongs to.
        if inspect.ismethoddescriptor(object):
            return True
        return doctest.DocTestFinder._from_module(self, module, object)

    def _find(self, tests, obj, name, module, source_lines, globs, seen):
        """
        Find tests for the given object and any contained objects, and
        add them to `tests`.

        Extends the default implementation to handle Sagex extension code.
        """

        # Start with default search
        doctest.DocTestFinder._find(self, tests, obj, name, module, source_lines,
                                    globs, seen)
        
        # Look for tests in a module's contained Sagex objects.
        if inspect.ismodule(obj) and self._recurse:
            for valname, val in obj.__dict__.items():
                valname = '%s.%s' % (name, valname)
                # Recurse to extension routines
                if (inspect.isroutine(val) and
                    self._from_module(module, val)):
                    self._find(tests, val, valname, module, source_lines,
                               globs, seen)

        # Look for tests in a class's contained Sagex objects.
        if inspect.isclass(obj) and self._recurse:
            for valname, val in obj.__dict__.items():
                # Recurse to extension routines
                if (inspect.isroutine(val) and
                      self._from_module(module, val)):
                    valname = '%s.%s' % (name, valname)
                    self._find(tests, val, valname, module, source_lines,
                               globs, seen)
        

    def find(self, *args, **kwargs):
        r"""
        Return a list of the DocTests that are defined by the given
        object's docstring, or by any of its contained objects'
        docstrings.

        Examples are removed if they are optional or run for a long time
        and the corresponding flags are not set in `self.sage_optionflags`.
        """
        
        test_optional  = self.sage_optionflags & SAGE_DOCTEST_OPTIONAL
        test_long_time = self.sage_optionflags & SAGE_DOCTEST_LONG_TIME

        tests = doctest.DocTestFinder.find(self, *args, **kwargs)
        # print tests

        # Maybe remove optional tests
        if not test_optional:
            for t in tests:
                for e in t.examples:
                    if e.options.get(SAGE_DOCTEST_OPTIONAL, False):
                        e.options[doctest.SKIP] = True

        # Maybe remove long time tests
        if not test_long_time:
            for t in tests:
                for e in t.examples:
                    if e.options.get(SAGE_DOCTEST_LONG_TIME, False):
                        e.options[doctest.SKIP] = True

                # t.examples = [ e for e in t.examples if not e.options.get(SAGE_DOCTEST_LONG_TIME, False) ]

        return tests

def _sagetest(obj=None, name=None, globs=None, verbose=None,
              report=True, optionflags=0, extraglobs=None,
              raise_on_error=False, exclude_empty=True,
              recurse_modules=True, arch_is_32bit=True,
              sage_optionflags=0):
    r"""
    Internal routine to test SAGE object `obj`.
    """

    # Find, parse, and run all tests in the given module.
    finder = SageDocTestFinder(sage_optionflags=sage_optionflags, exclude_empty=exclude_empty, recurse=True)

    if raise_on_error:
        runner = doctest.DebugRunner(checker=SageOutputChecker(),
                                     verbose=verbose, optionflags=optionflags)
    else:
        runner = doctest.DocTestRunner(checker=SageOutputChecker(),
                                       verbose=verbose, optionflags=optionflags)

#     import inspect
#     L = [(name, m)]
#     if inspect.ismodule(m) and recurse_modules:
#         L.extend(inspect.getmembers(m, inspect.ismodule))
#     for (n, o) in L:
#          print n # , o

    tests = finder.find(obj, name, globs=globs, extraglobs=extraglobs)
    non_empty_count = 0
    for test in tests:
        if len(test.examples) > 0:
            non_empty_count += 1
        runner.run(test)

    if report:
        runner.summarize()

    return (runner.failures, runner.tries, len(tests) - non_empty_count)

#     return { 'examples failed': runner.failures,
#              'examples run': runner.tries,
#              'docstrings tested': len(tests),
#              'docstrings with examples': non_empty_count
#            }

# def _sagetestfile(filename, module_relative=True, name=None, package=None,
#                   globs=None, verbose=None, report=True, optionflags=0,
#                   extraglobs=None, raise_on_error=False,
#                   parser=SageDocTestParser(), encoding=None,
#                   arch_is_32bit=True,
#                   sage_optionflags=0):

#     if package and not module_relative:
#         raise ValueError("Package may only be specified for module-"
#                          "relative paths.")

#     # Relativize the path
#     text, filename = doctest._load_testfile(filename, package, module_relative)

#     # If no name was given, then use the file's name.
#     if name is None:
#         name = os.path.basename(filename)

#     # Assemble the globals.
#     if globs is None:
#         globs = {}
#     else:
#         globs = globs.copy()
#     if extraglobs is not None:
#         globs.update(extraglobs)

#     if raise_on_error:
#         runner = doctest.DebugRunner(checker=SageOutputChecker(),
#                              verbose=verbose, optionflags=optionflags)
#     else:
#         runner = doctest.DocTestRunner(checker=SageOutputChecker(),
#                                        verbose=verbose, optionflags=optionflags)

#     if encoding is not None:
#         text = text.decode(encoding)

#     # Read the file, convert it to a test, and run it.
#     test = parser.get_doctest(text, globs, name, filename, 0)
#     runner.run(test)

#     if report:
#         runner.summarize()

#     return runner.failures, runner.tries    

def sagetestfile(filename="",
                 arch_is_32bit=True,
                 sage_optionflags=0,
                 raise_on_error=False,
                 report=True,
                 ):
    r"""
    Test file `filename`, taking care of IPython hooks.
    """

    import sys
    hooks = (sys.displayhook, sys.excepthook)
    try:
        try:
            sys.displayhook = sys.__displayhook__
            sys.excepthook = sys.__excepthook__
        except:
            pass

        globs = {} ; exec "from sage.all_cmdline import *" in globs
        optionflags = doctest.ELLIPSIS | doctest.IGNORE_EXCEPTION_DETAIL | doctest.NORMALIZE_WHITESPACE
        
#         return _sagetestfile(filename, module_relative=False, name=None,
#                              package=None,
#                              globs=globs, verbose=verbose, report=True,
#                              optionflags=optionflags,
#                              extraglobs=None, raise_on_error=raise_on_error,
#                              parser=SageDocTestParser(), encoding=None,
#                              arch_is_32bit=arch_is_32bit,
#                              sage_optionflags=sage_optionflags)

        fglobals = {}
        flocals = {}
        exec "import %s as m; reload(m)" % filename in fglobals, flocals

        mod = flocals['m']
        if inspect.ismodule(mod):
            return _sagetest(mod, name=mod.__name__,
                             globs=globs,
                             extraglobs=mod.__dict__,
                             optionflags=optionflags,
                             sage_optionflags=sage_optionflags,
                             arch_is_32bit=arch_is_32bit,
                             report=report,
                             )

    finally:
        try:
            sys.displayhook = hooks[0]
            sys.excepthook  = hooks[1]
        except:
            pass

def sagetest(obj=None, arch_is_32bit=True, sage_optionflags=0, **kwargs):
    r"""
    Test SAGE object `obj`, taking care of IPython hooks.
    """

    import sys
    hooks = (sys.displayhook, sys.excepthook)
    try:
        try:
            sys.displayhook = sys.__displayhook__
            sys.excepthook = sys.__excepthook__
        except:
            pass

        globs = {} ; exec "from sage.all_cmdline import *" in globs
        optionflags = doctest.ELLIPSIS | doctest.IGNORE_EXCEPTION_DETAIL | doctest.NORMALIZE_WHITESPACE
        return _sagetest(obj, name=str(obj), optionflags=optionflags,
                         globs=globs, arch_is_32bit=arch_is_32bit,
                         sage_optionflags=sage_optionflags,
                         **kwargs)
    finally:
        try:
            sys.displayhook = hooks[0]
            sys.excepthook  = hooks[1]
        except:
            pass

# def SageDocFileSuite(*paths, **kw):
#     print paths
#     return doctest.DocFileSuite(*paths, **kw)

def helper_func():
    r"""
    sage: def Integer(n):
    .....     return n
    sage: 2
    2 # 32-bit
    2 # 64-bit

    # sage: R.<x> = ['x'] # long time
    sage: def blah(z, x):
    .....     return 2
    sage: blah(2, x=None) # optional # long time
    2

    sage: 2 # random
    3

    sage: 2
    3

    sage: blah(2, x=None) # long time # optional
    2

    sage: 3 # long time
    3

    sage: 4 # optional
    4
    """

def internal_tests():
    r'''
    Test a file:
        >>> sagetestfile(filename="test1", raise_on_error=False)
    
    # SAGE_DOCTEST_LONG_TIME | SAGE_DOCTEST_OPTIONAL
    Fix a bug:
        >>> fs = 0
        >>> D = {} ; exec "from sage.all_cmdline import *" in D
        
        >>> T = SageDocTestFinder(recurse=True, sage_optionflags=fs).find(sage.rings.rational, globs=D)
        >>> T = [ t for t in T if len(t.examples) > 0 ]
        >>> len(T)

        >>> sum([ len(t.examples) for t in T])

        >>> X = [ (t.name, len(t.examples)) for t in T ]
        >>> r = doctest.DocTestRunner(optionflags=doctest.NORMALIZE_WHITESPACE)
        >>> for t in T:
        ...     r.run(t)
        (0, ...)
        
#         >>> for x in X:
#         ...     print x

#         >>> SageDocTestFinder(recurse=True).find(sage.rings.rational.Rational.__index__)
#         >>> SageDocTestFinder(recurse=True).find(sage.rings.rational.Rational.list)
#         >>> SageDocTestFinder(recurse=True).find(sage.rings.rational.Rational)
#         >>> SageDocTestFinder(recurse=True).find(sage.rings.rational)

#         >>> SageDocTestFinder(recurse=True).find(SageDocTestFinder)
    '''

r'''

#     Make some examples into a unittest suite:

#         >>> doctest.DocFileSuite('sagetestnewadsf.py')
#         >>> SageDocFileSuite('sagetestnewadsf.py')

    Find some examples:

        >>> f = SageDocTestFinder()
        >>> f.find(helper_func)
        [...(4 examples)>]

        >>> f.find(helper_func)
        [...(4 examples)>]

        >>> f.sage_optionflags = SAGE_DOCTEST_LONG_TIME
        >>> f.find(helper_func)
        [...(5 examples)>]
        
        >>> f.sage_optionflags = SAGE_DOCTEST_OPTIONAL
        >>> f.find(helper_func)
        [...(5 examples)>]

        >>> f.sage_optionflags = SAGE_DOCTEST_OPTIONAL | SAGE_DOCTEST_LONG_TIME
        >>> f.find(helper_func)
        [...(8 examples)>]
            
    Parse some examples:

        >>> p = SageDocTestParser()
        >>> es = p.parse("""
        ... sage: test()
        ... sage: R.<x> = Z['x'] # long time
        ... sage: time blah(2, x=None) # optional # long time
        ... sage: time blah(2, x=None) # long time # optional
        ... """)
        >>> for e in es:
        ...     if isinstance(e, doctest.Example):
        ...         print sorted(e.options.keys())
        ...         print e.source,
        []
        test()
        [4096]
        R = Z["x"] ; (x,) = R.gens()# long time
        [2048, 4096]
        time blah(Integer(2), x=None) # optional # long time
        [2048, 4096]
        time blah(Integer(2), x=None) # long time # optional

    Run some examples:
    
        >>> p = SageDocTestParser()
        >>> f = doctest.DocTestFinder(parser=p)
        >>> t = f.find(helper_func, globs=globals())[0]
        >>> r = doctest.DocTestRunner(checker=SageOutputChecker())
        >>> r.run(t)
        (0, 8)

#     Check some text:
#         >>> c = SageOutputChecker()
#         >>> c.check_output('test', 'test', 0)
#         >>> c.check_output('test', 'test2', 0)

#         >>> r = SageDocTestRunner()
#         >>> r._filter_examples(t.examples, {SAGE_DOCTEST_OPTIONAL : True})
#         [...]
#         >>> r._filter_examples(t.examples, {SAGE_DOCTEST_LONG_TIME: True})
#         [...,...]
#         >>> r.run(t)
#         (0, ...)
#         >>> r.run(t)
#         (0, ...)

    Verify that prompt replacement is working as desired:

        >>> p._replace_prompts("""
        ... sage: blah
        ... sage blah sage: nuts
        ... sage: first part .....
        ... ..... second part
        ... ... test
        ...    sage: test
        ...    ..... blah
        ... """).strip()
        '>>> blah\nsage blah sage: nuts\n>>> first part .....\n... second part\n... test\n   >>> test\n   ... blah'        

    Verify that our regular expressions are reasonable:
    
        >>> _RANDOM_RE.findall("""
        ... blah # random
        ... 'blah # random''
        ... blah # random''
        ... blah # comp # rando m
        ... blah random #random
        ... random # RANDom
        ... test""")
        [('blah ', '# random'), ('blah random ', '#random'), ('random ', '# RANDom')]

        >>> _OPTIONAL_RE.findall("""
        ... blah # optional
        ... 'blah # optional'
        ... blah # OPTioNAL
        ... blah #optIONal''
        ... test""")
        [('blah ', '# optional'), ('blah ', '# OPTioNAL')]        
    
        >>> _LONG_TIME_RE.findall("""
        ... blah # long time
        ... 'blah # long time'
        ... blah # LONG time
        ... blah #LONG time''
        ... test""")
        [('blah ', '# long time'), ('blah ', '# LONG time')]
    ''' # Emacs syntax highlighting gets confused without this "

def stable_sagetest(m=None, name=None, globs=None, verbose=None,
            report=True, optionflags=0, extraglobs=None,
            raise_on_error=False, exclude_empty=True,
            recurse_modules=True):
    r"""
    Internal testing routine, until the code stablizes.
    """
    # global master

    # If no module was given, then use __main__.
    if m is None:
        # DWA - m will still be None if this wasn't invoked from the command
        # line, in which case the following TypeError is about as good an error
        # as we should expect
        m = sys.modules.get('__main__')

    # Check that we were actually given a module.
    # if not inspect.ismodule(m):
    #    raise TypeError("testmod: module required; %r" % (m,))

    # If no name was given, then use the module's name.
    if name is None:
        name = m.__name__

    # Find, parse, and run all tests in the given module.
    parser = doctest.DocTestParser()
    finder = doctest.DocTestFinder(exclude_empty=exclude_empty, parser=parser, recurse=True)

    if raise_on_error:
        runner = doctest.DebugRunner(verbose=verbose, optionflags=optionflags)
    else:
        runner = doctest.DocTestRunner(verbose=verbose, optionflags=optionflags)

    import inspect
    L = [(name, m)]
    if inspect.ismodule(m) and recurse_modules:
        L.extend(inspect.getmembers(m, inspect.ismodule))

    for (n, o) in L:
        # print n # , o
        for test in finder.find(o, n, globs=globs, extraglobs=extraglobs):
            # for e in test.examples[0:5]:
            #    print sage.misc.preparser.preparse(e.source)
            # pass
            runner.run(test)

    if report:
        runner.summarize()

    # if doctest.master is None:
    doctest.master = runner
    # else:
    #    doctest.master.merge(runner)

    return runner.failures, runner.tries
    
def stable_test(obj=None):
    import sys
    hooks = (sys.displayhook, sys.excepthook)
    try:
        try:
            sys.displayhook = sys.__displayhook__
            sys.excepthook = sys.__excepthook__
        except:
            pass
    
        print stable_sagetest(obj, name=str(obj)
                       , optionflags=doctest.ELLIPSIS
                       | doctest.IGNORE_EXCEPTION_DETAIL
                       | doctest.NORMALIZE_WHITESPACE,
                       globs=globals()
                       )

#         X = doctest.DocTestSuite(module=sage.rings.rational,
#                                  test_finder=SageDocTestFinder(),
#                                  globs=globals(),
#                                  optionflags = doctest.IGNORE_EXCEPTION_DETAIL | doctest.ELLIPSIS | doctest.NORMALIZE_WHITESPACE)

#         X = doctest.DocTestSuite(module=sage.rings.rational,
#                                  test_finder=SageDocTestFinder(),
#                                  globs=globals(),
#                                  optionflags = doctest.IGNORE_EXCEPTION_DETAIL | doctest.ELLIPSIS | doctest.NORMALIZE_WHITESPACE)

        
#         # print [ [ e.source for e in t._dt_test.examples ] for t in X._tests ]
#         runner = unittest.TextTestRunner()
#         runner.run(X)

    finally:
        try:
            sys.displayhook = hooks[0]
            sys.excepthook  = hooks[1]
        except:
            pass

if __name__ == '__main__':
    # stable_test(internal_tests)
    pass

# class SageDocTestRunner(doctest.DocTestRunner):
#     r"""
#     Run test cases according to SAGE extensions.

#     This means checking output with a SageOutputChecker, and
#     skipping examples marked with SAGE_DOCTEST_OPTIONAL or
#     SAGE_DOCTEST_LONG_TIME if those flags are not set.
#     """

#     def __init__(self, *args, **kwargs):
#         checker = SageOutputChecker()
#         return doctest.DocTestRunner.__init__(self, checker=checker, *args, **kwargs)
    
#     def _filter_examples(self, examples, sage_options):
#         r"""
#         Filter examples we don't want from test.
#         """
#         if sage_options is None: sage_options = {}
#         optional  = sage_options.get(SAGE_DOCTEST_OPTIONAL, False)
#         long_time = sage_options.get(SAGE_DOCTEST_LONG_TIME, False)

#         # Filter the examples we don't want
#         L = []
#         for e in examples:
#             # print e.options.get(SAGE_DOCTEST_OPTIONAL, False), optional
            
#             if e.options.get(SAGE_DOCTEST_OPTIONAL, False)  and not optional:
#                 continue
#             if e.options.get(SAGE_DOCTEST_LONG_TIME, False) and not long_time:
#                 continue
#             L.append(e)
#         return L

#     def run(self, test, compileflags=None, out=None, clear_globs=True, sage_options=None):
#         r"""
#         Run the examples in `test`, and display the results using the
#         write function `out`.

#         `sage_options` should be a hash containing SAGE_DOCTEST_* flags.
#         If sage_options[SAGE_DOCTEST_OPTIONAL] is True, run tests marked optional.
#         If sage_options[SAGE_DOCTEST_LONG_TIME] is True, run tests marked long time.
#         """

#         # Filter examples we don't want
#         orig = test.examples
#         test.examples = self._filter_examples(test.examples, sage_options)

#         # Run remaining examples
#         res = doctest.DocTestRunner.run(self, test, compileflags, out, clear_globs)

#         # Replace examples we didn't run
#         test.examples = orig

#         return res
