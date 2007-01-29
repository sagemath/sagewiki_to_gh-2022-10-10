= Preworkshop Reading Materials =

All participants at the MSRI Parallel Computation Workshop will be assumed to have a basic background in parallel computation already -- there will be no basic background tutorials or lectures.   Fortunately, anybody can get such a background in a day by reading the documents listed below under ''required reading''.

== Required Reading List ==

At a minimum, make sure you read the following before the workshop, in order:

 1. [http://www.llnl.gov/computing/tutorials/parallel_comp/ Introduction to Parallel Computing]

 2. [http://www.llnl.gov/computing/tutorials/pthreads/ POSIX Threads Programming]

 3. [http://www.llnl.gov/computing/tutorials/mpi/ MPI Tutorial]


== Other Relevant Documents ==

Skim or read as time permits:

 1. [http://modular.math.washington.edu/msri07/read/ Miscellaneous Papers and Files]

 1. [http://www.llnl.gov/computing/tutorials/openMP/ OpenMP tutorial] and [http://gcc.gnu.org/projects/gomp/ GOMP]

 2. [http://ocw.mit.edu/OcwWeb/Mathematics/18-337JSpring-2005/LectureNotes/index.htm Applied Parallel Computing Lectures]

 3. [http://www.eecs.berkeley.edu/Pubs/TechRpts/2006/EECS-2006-1.pdf Alternatives to threads]

 4. [http://www.erlang.org/ Erlang programming language]

 5. [http://erights.org/ E programming language]

 6. [http://twistedmatrix.com/projects/core/documentation/howto/async.html About Twisted's Deferred Objects]


== SAGE-Related Reading List ==

Because of something called the ''Global Interpreter Lock'' (or GIL) in the Python ''interpreter'', threading is pretty useless for speeding up serious mathematical compute applications.  For *multi-threaded* programs to be truly useful for SAGE computation, they will have to be implemented entirely in C/C++/Fortran libraries and SageX extension modules in blocks of code that do not make any Python/C API calls.  

 1. [http://ldp.paradoxical.co.uk/LDP/LGNET/107/pai.html Python threading tutorial]
 2. [http://docs.python.org/api/threads.html Discussion About the GIL in Python]
 3. [http://mail.python.org/pipermail/python-list/2006-May/382955.html List post about OpenMp and Python]
 4. [http://aspn.activestate.com/ASPN/search?query=parallel&x=0&y=0&section=PYTHONCKBK&type=Subsection Python Parallel Recipes]
 5. [http://poshmodule.sourceforge.net/ POSH -- Python object sharing; a way to get around using threads for what we need]
 6. [http://www.parallelpython.com/ Parallel Python -- is this useful for something? (or is it only stupid closed-source poppycock?) -- it's another way to get around threads]
