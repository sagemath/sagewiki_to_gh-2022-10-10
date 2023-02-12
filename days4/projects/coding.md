

# Coding Theory

<a href="/days4/projects/">Other SAGE Days 4 Project</a> 

Robert Miller, David Joyner, Josh Kantor, Robert Bradshaw, Emily Kirkman 

* **Leon's partition backtracking** programs. Distributed Doubly Even Codes will no longer depend on Magma. Permutation groups in SAGE will benefit from Leon's code being available without the overhead of pexpect or reading/writing files. 
      * After a month (@&#%!), <a class="http" href="http://sage.math.washington.edu/home/rlmill/leon-0.1.spkg">Version 0.1</a> spkg! Exposes desauto and wtdist programs. 
      * spkg exposes modified desauto and wtdist, which do not read from or write to file. 
      * First attempt at Pyrex wrapping showed that Leon's code, as is, is nowhere near ready for release as a dynamic library. The main reason for this is its bad memory management. Since the program was originally released as standalone command-line applications, they don't free memory, which means they Don't Play Well With Others. In fact, the main bugs I have heard of so far are complaints that the program is out of memory. These are while computing isomorphism of codes, which are only objects on 34 coordinates. There is no reason to run out of memory on something this small. 
* <a href="/Leon">Leon</a> code project page 