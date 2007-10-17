= Introduction =
Sage 2.8.5 supports a number of valgrind tools:

 * memcheck: memory leak detector
 * massif: heap and stack profiler
 * cachegrind: cache profiler, i.e. L1 & L2 hit and misses
 * callgrind: general profiler

Valgrinding Sage is difficult because it runs on top of Python which poses a number of challenges compared to pure C/C++ code. Run
{{{
sage -optional
}}}
to see the list of optional packages. You should install the valgrind.spkg with the highest revision number. 

= Valgrind Version =
The latest official valgrind 3.2.3 does not work. You need to build from 3.3.0svn trunk. There is an experimental Sage valgrind.spkg that works and is used by many of the Sage developers.

= Known Issues With Sage components =
 * GAP cannot be valgrinded. It isn't due to the use of sbrk, but GAP somehow fails to extend its own workspace when run under valgrind
 * libpari makes valgrind terminate itself when it expands its own allocated heap. There is no known workaround at this time. You should see an error message like:
{{{
valgrind: m_mallocfree.c:209 (get_bszB_as_is): Assertion 'bszB_lo == bszB_hi' failed.
valgrind: Heap block lo/hi size mismatch: lo = 100000048, hi = 280100984.
Probably caused by overrunning/underrunning a heap block's bounds.
}}}

= Preliminary Presentation =

More to come at SD6. But: [attachment:SageDays5_preliminary_valgrind_talk.pdf]

= ToDo =
 * Add lots more info how to build and use valgrind in general, mention experimental valgrind.spkg
 * external links
 * info about --without-pymalloc and --pydebug flags.
 * examples on how to read log, find pyx code corresponding to C/C++ code
