# Add pthread Support to SageX
Make it possible to use C-level POSIX threads from SageX programs.   ## 1. Create a pxi file with the pthread.h functions declared.

   * Here's a start:  

```txt
cdef extern from "pthread.h":
    ctypedef int pthread_t       # actual type will be used by Pyrex 
    ctypedef int pthread_attr_t     
    int pthread_create(pthread_t *thread, 
                       pthread_attr_t *attr,
                       void *(*start_routine)(void *), 
                       void *arg)
    int pthread_join(pthread_t thread, void **value_ptr)
    void pthread_exit(void *value_pt)
    int pthread_attr_init(pthread_attr_t *)
    int pthread_attr_destroy(pthread_attr_t *)
    int pthread_attr_setdetachstate(pthread_attr_t *,int)
    int pthread_join(pthread_t ,void **)

    cdef enum:
       PTHREAD_CREATE_JOINABLE
```
The file should be nicely documented, etc.  


## 2. Create spyx files that illustrate how to use various threading constructs

Illustrating calling into interesting C libraries, etc. 

Here's an example (you can paste this into foo.spyx, load it, and call go(10)): 


```txt
cdef extern from "pthread.h":
    ctypedef int pthread_t       # actual type will be used by Pyrex below...
    ctypedef int pthread_attr_t     
    int pthread_create(pthread_t *thread, 
                       pthread_attr_t *attr,
                       void *(*start_routine)(void *), 
                       void *arg)
    int pthread_join(pthread_t thread, void **value_ptr)
    void pthread_exit(void *value_ptr)

cdef extern from "unistd.h":
    unsigned int sleep(unsigned int seconds)


cdef void *PrintHello(void *thread_id):
   printf("\n%d: Hello World...", thread_id)
   sleep(1)
   printf("Thread %d ending\n", thread_id)
   pthread_exit(NULL)

def go(int n):
    cdef pthread_t* threads
    threads = <pthread_t*> malloc(sizeof(pthread_t) * n)
    cdef int rc, t
    for t from 0 <= t < n:
        printf("Creating thread %d...", t)
        rc = pthread_create(&threads[t], NULL, PrintHello, <void*> t)
        if rc:
            printf("ERROR; return code from pthread_create() is %d\n", rc)
            return
    print('done creating all threads; now waiting')
    for t from 0 <= t < n:
        pthread_join(threads[t], <void**> NULL)
    free(threads)
    print('done freeing all memory used to store thread data.')


cdef int n
cdef void *PrintDot(void* thread_id):
    global n
    while 1:
        printf(".. %d ..\n", n)
        sleep(3)
        n += 1

def print_dot():
    cdef pthread_t t
    pthread_create(&t, NULL, PrintDot, <void*> NULL)

def nval():
    print n
    
```