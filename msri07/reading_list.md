

# Preworkshop Reading Materials

All participants at the MSRI Parallel Computation Workshop will be assumed to have a basic background in parallel computation already -- there will be no basic background tutorials or lectures.   Fortunately, anybody can get such a background in a day by reading the documents listed below under _required reading_. 


## Required Reading List

At a minimum, make sure you read the following before the workshop, in order: 

1. <a class="http" href="http://www.llnl.gov/computing/tutorials/parallel_comp/">Introduction to Parallel Computing</a> 
1. <a class="http" href="http://www.llnl.gov/computing/tutorials/pthreads/">POSIX Threads Programming</a> 
1. <a class="http" href="http://www.llnl.gov/computing/tutorials/mpi/">MPI Tutorial</a> 

## Other Relevant Documents

Skim or read as time permits: 

1. <a class="http" href="http://modular.math.washington.edu/msri07/read/">Miscellaneous Papers and Files</a> 
1. <a class="http" href="http://www.llnl.gov/computing/tutorials/openMP/">OpenMP tutorial</a> and <a class="http" href="http://gcc.gnu.org/projects/gomp/">GOMP</a> 
1. <a class="http" href="http://ocw.mit.edu/OcwWeb/Mathematics/18-337JSpring-2005/LectureNotes/index.htm">Applied Parallel Computing Lectures</a> 
1. <a class="http" href="http://www.eecs.berkeley.edu/Pubs/TechRpts/2006/EECS-2006-1.pdf">Alternatives to threads</a> 
1. <a class="http" href="http://www.erlang.org/">Erlang programming language</a> 
1. <a class="http" href="http://erights.org/">E programming language</a> 
1. <a class="http" href="http://twistedmatrix.com/projects/core/documentation/howto/async.html">About Twisted's Deferred Objects</a> 

## SAGE-Related Reading List

Because of something called the _Global Interpreter Lock_ (or GIL) in the Python _interpreter_, threading is pretty useless for speeding up serious mathematical compute applications.  For *multi-threaded* programs to be truly useful for SAGE computation, they will have to be implemented entirely in C/C++/Fortran libraries and SageX extension modules in blocks of code that do not make any Python/C API calls.   

1. <a class="http" href="http://ldp.paradoxical.co.uk/LDP/LGNET/107/pai.html">Python threading tutorial</a> 
1. <a class="http" href="http://docs.python.org/api/threads.html">Discussion About the GIL in Python</a> 
1. <a class="http" href="http://mail.python.org/pipermail/python-list/2006-May/382955.html">List post about OpenMp and Python</a> 
1. <a class="http" href="http://aspn.activestate.com/ASPN/search?query=parallel&amp;x=0&amp;y=0&amp;section=PYTHONCKBK&amp;type=Subsection">Python Parallel Recipes</a> 
1. <a class="http" href="http://poshmodule.sourceforge.net/">POSH -- Python object sharing; a way to get around using threads for what we need</a> 
1. <a class="http" href="http://www.parallelpython.com/">Parallel Python -- is this useful for something? (or is it only stupid closed-source poppycock?) -- it's another way to get around threads</a> 