
WELCOME/INTRO 

PROGRAMMING IN THE NOTEBOOK 

WRITING .SAGE FILES: Imports Preparser Style 

         * documentation 
                     * formating spaces and tabs (no really, this matters) 
WRITING .SPYX FILES: Cdefs Cimports <class_name> Interfacing with C and C++ libraries and files Tips for writing fast cython 

         * PY_TYPE_CHECK 
Things that don't work in cython (yet) Point to cython wiki 

PARENTS AND ELEMENTS: Intro Coercion Comparison Functions 

* Parent functions 
      * Must Implement 
            * <ins>init</ins> 
            * has_coercion_from         (cpdef) 
            * gen 
            * ngens 
            * base_extend? 
      * For Advanced Users 
            * make_coercion_from        (cpdef) 
            * make_conversion_from      (cpdef) 
            * make_action_on            (cpdef) 
            * make_action_by            (cpdef) 
            * _populate_coercion_lists  (cpdef) 
      * Advanced Calls 
            * get_coercion_from         (cpdef) 
            * get_conversion_from       (cpdef) 
            * get_action                (cpdef) 
      * Generic Functions you might override 
            * <ins>contains</ins> 
                  * Do we really want to do this?  Cases: is mod(3, 5) in ZZ?  is Zp(5)(17) in ZZ?  is QQ(2) in ZZ?  is RR(2) in ZZ? 
            * <ins>cmp</ins> 
            * <ins>call</ins> 
      * Not defined functions you may want to define 
            * <ins>iter</ins> 
* Element functions 
      * Arithmetic (raise <a href="/NotImplemented">NotImplemented</a>) 
            * _add_                     (cpdef) 
            * _mul_                     (cpdef) 
            * <ins>neg</ins>                   (spec) 
            * <ins>invert</ins>                (spec) 
      * Arithmetic (With Defaults) 
            * _sub_                     (cpdef) 
            * _div_                     (cpdef) 
            * _powlong_ 
            * _pow_ 
      * Functions you may want to implement 
            * _polynomial_ 
MERCURIAL: Mercurial tutorial Referees Style 

         * naming conventions 
                     * capitalization/underscores functions pretending to be classes Underscores in subtypes of classes 
DOCUMENTATION: 

            * philosophy automated testing headers what r**** means and when you should use it. flags on doctests manuals and latex documentation 
ADDING TO THE SAGE LIBRARY: Browse the source Doctesting and documentation Exceptions Imports 

         * Finding things in the global namespace 
                     * last word may or may not be appropriate from blah import * circular 
Factories and weakrefs 

         * uniqueness of parents how and why to use a factory other methods for uniqueness 
Latex 

         * why to include sage.misc.latex 
_matrix_ and _vector_ Printing model Licensing Use method functions rather than global functions (eg sqrt()) how to add a directory to sage 

         * Add an <ins>init</ins>.py Add an all.py Add package name to list of packages at bottom of setup.py 
Optional packages 

TRANSITIONING SAGE LIBRARY CODE TO CYTHON: .pxd and .pxi files pickling 

         * automate Talk to William 
setup.py <ins>hash</ins> and <ins>richcmp</ins> must be written together. _sig_on and _sig_off 

         * functions that have a _sig_off inside 
cpdef Crap in the build directory: 

      * After deleting a .pyx file. 
                  * so files in build/sage/... and build/lib.macosx-20.3-i386-2.5/... 
                  * o file in build/temp.macosx-10.3-i386-2.5/sage/... After deleting a .py file 
                  * nuke .pyc files in the build directory nuke the build directory/ sage -ba download the tarball, build from scratch, pull from mercurial repository download the tarball, manually copy files over. 
SPKGS Have someone else write this. 

HIDDEN GEMS OF THE SAGE LIBRARY: c_lib setup.py sage.ext 

sage.rings.integer (check out the bottom for crazy hackery) 

sage.structure.element sage.structure.parent sage.structure.coerce sage.categories.morphism 

APPENDIX: COERCION Assumption: Codomains are likely to become inaccessible before domains.  The main exception is for subobjects, implemented with a single embedding. 

Because of this assumption, we store in each Implementing morphisms Implementing Coercion morphisms 
