= Add pthread Support to SageX =

Make it possible to use C-level POSIX threads from SageX programs.  

== 1. Create a pxi file with all the pthreads.h functions declared. ==
  Here's a start: 
{{{
cdef extern from "pthread.h":
    ctypedef int pthread_t       # actual type will be used by Pyrex below...
    ctypedef int pthread_attr_t     
    int pthread_create(pthread_t *thread, 
                       pthread_attr_t *attr,
                       void *(*start_routine)(void *), 
                       void *arg)
    int pthread_join(pthread_t thread, void **value_ptr)
    void pthread_exit(void *value_ptr)
}}}

The file should be nicely documented, etc. 
