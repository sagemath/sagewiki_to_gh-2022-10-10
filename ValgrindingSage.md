= Introduction =
Sage 2.8.4 supports a number of valgrind tools:

 * memcheck
 * massif
 * cachegrind
Valgrinding Sage is difficult because it runs on top of Python which poses a number of challenges compared to pure C/C++ code.

= ToDo =
 * Add lots more info how to build and use valgrind in general, mention experimental valgrind.spkg
 * external links
 * info about --without-pymalloc and --pydebug flags.
 * examples on how to read log, find pyx code corresponding to C/C++ code
