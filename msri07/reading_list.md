= Preworkshop Reading Materials =

All participants at the MSRI Parallel Computation Workshop will be assumed to have a basic background in parallel computation already -- there will be no basic background tutorials or lectures.   Fortunately, anybody can get such a background in a day by reading the documents listed below under ''required reading''.

== Required Reading List ==

At a minimum, make sure you are completely familiar with the following before the workshop, in order:

 1. [http://www.llnl.gov/computing/tutorials/parallel_comp/ Introduction to Parallel Computing]

 2. [http://www.llnl.gov/computing/tutorials/pthreads/ POSIX Threads Programming]

 3. [http://www.llnl.gov/computing/tutorials/openMP/ OpenMP tutorial]

 4. [http://www.llnl.gov/computing/tutorials/mpi/ MPI Tutorial]

== Other Relevant Documents ==

Skim or read as time permits:

* [http://ocw.mit.edu/OcwWeb/Mathematics/18-337JSpring-2005/LectureNotes/index.htm Applied Parallel Computing Lectures]


== SAGE-Related Reading List ==

Because of something called the ''Global Interpreter Lock'' (or GIL) in the Python ''interpreter'', threading is pretty useless for speeding up serious mathematical compute applications.  For multi-threaded programs to be truly useful for SAGE, they will have to be implemented entirely in C/C++/Fortran libraries and SageX extension modules in blocks of code that do not make any Python/C API   calls.  

 1. [http://ldp.paradoxical.co.uk/LDP/LGNET/107/pai.html Python threading tutorial]
 2. [http://docs.python.org/api/threads.html Discussion About the GIL in Python]
 3. [http://mail.python.org/pipermail/python-list/2006-May/382955.html List post about OpenMp and Python]
 4. [http://aspn.activestate.com/ASPN/search?query=parallel&x=0&y=0&section=PYTHONCKBK&type=Subsection Python Parallel Recipes]
