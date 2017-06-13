= Quick and Dirty Intro =
To use Valgrind (last verified in Sage 4.1), you should untar a fresh copy of Sage, set an environment variable, and build:
{{{
$ tar xf sage-4.1.tar
...
$ cd sage-4.1
$ SAGE_VALGRIND="yes"
$ export SAGE_VALGRIND
$ make
}}}
You may also want to change `$SAGE_LOCAL/lib/python/config/Makefile` to have optimization `-O0` for easier to read stack traces. After doing this, you will need to do a `sage -ba`, of course.

After installing the Sage optional package "valgrind*," you can test interactive sessions:
{{{
$ ./sage -valgrind
}}}
or run valgrind on a set of doctests:

{{{
$ ./sage -t -valgrind devel/sage/sage/groups/perm_gps/
}}}

(Note that currently the "valgrind" option cannot be the first argument.)

Once the session is finished, the results can be found in `$HOME/.sage/valgrind/`. Each file can be searched for phrases like "definitely lost" or "conditional jump", and the stack traces give line numbers in the generated C source (remember to look up that line number in the `.c` file and use that to figure out which line it is in the `.pyx` file).

Also note that if you want to test components, you may need to add the `--trace-children=yes` option to the `MEMCHECK_FLAGS` line in `$SAGE_LOCAL/bin/sage-valgrind` script.

= Introduction =
Sage 2.8.5 and later supports a number of valgrind tools:

 * memcheck: memory leak detector
 * massif: heap and stack profiler
 * cachegrind: cache profiler, i.e. L1 & L2 hit and misses
 * callgrind: general profiler
 * omega: another memory leak detector (x86 and x86-64 only)

Valgrinding Sage is difficult because it runs on top of Python which poses a number of challenges compared to pure C/C++ code. Run
{{{
sage -optional
}}}
to see the list of optional packages. You should install the valgrind.spkg with the highest revision number.

= Valgrind Version =
As of Sage 3.1.2, Valgrind 3.3.1 is available as an optional package.

= Known Issues With Sage Components =

 * GAP cannot be valgrinded. It isn't due to the use of sbrk, but GAP somehow fails to extend its own workspace when run under valgrind
 * libpari makes valgrind terminate itself when it expands its own allocated heap. There is no known workaround at this time. You should see an error message like:
{{{
valgrind: m_mallocfree.c:209 (get_bszB_as_is): Assertion 'bszB_lo == bszB_hi' failed.
valgrind: Heap block lo/hi size mismatch: lo = 100000048, hi = 280100984.
Probably caused by overrunning/underrunning a heap block's bounds.
}}}

= Using callgrind with Sage =

callgrind is a powerful profiler that is part of valgrind (but it slows down your program a lot).  Just do {{{sage -callgrind}}} to run Sage under callgrind; this will produce files {{{callgrind.out.nnnn}}} in $SAGE_ROOT/local/bin that can be interpreted by callgrind_annotate or by kcachegrind.  (A single run of Sage will create multiple files, one for each process involved.  That is, one for Sage, one for Singular, etc...)

To profile only part of a Sage run, edit $SAGE_ROOT/local/bin/sage-callgrind and add the flag {{{--instr-atstart=no}}} to the valgrind command line (before {{{python -i}}}).  Then run {{{sage -callgrind}}}, and do whatever setup until you're ready to start profiling.  In another window, run {{{callgrind_control -i on}}}, then press Enter in your Sage window.  Now do whatever you want profiled.  When that's completed, go back to your other window, run {{{callgrind_control -i off}}}, then press Enter in your Sage window again.

The default settings for callgrind do not interact well with Cython-generated code--it will assume that each call to PyEval_CallObjectWithKeywords is equally costly.  To get callgrind to differentiate calls by their caller, add {{{--seperate-callers=10}}} to $SAGE_ROOT/local/bin/sage-callgrind.

= Preliminary Presentation =

More to come at SD6. But: [[attachment:SageDays5_preliminary_valgrind_talk.pdf]]

= Interesting Experimental Valgrind Tools/Components =

 * client requests: see http://valgrind.org/docs/manual/mc-manual.html#mc-manual.clientreqs
 * omega: Is getting integrate as experimental tool into 3.3.0svn
 * chronicle-recorder: Uses a patched 3.2.3 release - see http://code.google.com/p/chronicle-recorder/ - for a python interface see http://www.visophyte.org/blog/2007/07/26/chroniquery-chronicle-recorder-and-python-boogie-down/

= Getting Chronicle to work with 3.3.0trunk =

The following info was supplied by Carl Witty:
{{{
To create my (apparently working) chronicle tree:

Check out svn revision 51 of chronicle-recorder
move chronicle/valgrind/chronicle out of the way somewhere
remove chronicle/valgrind
replace chronicle/valgrind with r6959 of valgrind, from valgrind-3.3.0svn-r6959
apply the patch sage.math:/home/cwitty/valgrind-r6959-to-chronicle.patch 
    to this replaced valgrind directory
move chronicle/valgrind/chronicle back under the (new) valgrind directory
apply the patch sage.math:/home/cwitty/chronicle-r51-to-chronicle.patch
    to the chronicle/valgrind/chronicle directory
}}}

= ToDo =
 * Add lots more info how to build and use valgrind in general, mention experimental valgrind.spkg
 * external links
 * info about --without-pymalloc and --pydebug flags.
 * examples on how to read log, find pyx code corresponding to C/C++ code
