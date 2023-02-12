

## Interactive Parallel Computing using Python and IPython

<a class="http" href="http://txcorp.com">Brian Granger - Tech X Corp.</a> 

Interactive computing environments, such as Matlab, IDL and Mathematica are popular among researchers because their interactive nature is well matched to the exploratory nature of research.  However, these systems have one critical weakness: they are not designed to take advantage of parallel computing hardware such as multi-core CPUs, clusters and supercomputers. Thus, researchers usually turn to non-interactive compiled languages, such as C/C++/Fortran when parallelism is needed. 

In this talk I will describe recent work on the IPython project to implement a software architecture that allows parallel applications to be developed, debugged, tested, executed and monitored in a fully interactive manner using the Python programming language.  This system is fully functional and allows many types of parallelism to be expressed, including message passing (using MPI), task farming, shared memory, and custom user defined approaches.  I will describe the architecture, provide an overview of its basic usage and then provide more sophisticated examples of how it can be used in the development of new parallel algorithms.  Because IPython is one of the components of the SAGE system, I will also discuss how IPython's parallel computing capabilities can be used in that context. 
