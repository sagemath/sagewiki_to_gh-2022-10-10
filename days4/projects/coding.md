= Coding Theory =

[:days4/projects/: Other SAGE Days 4 Project]


Robert Miller, David Joyner, Josh Kantor, Robert Bradshaw, Emily Kirkman

 * '''Leon's partition backtracking''' programs. Distributed Doubly Even Codes will no longer depend on Magma. Permutation groups in SAGE will benefit from Leon's code being available without the overhead of pexpect or reading/writing files.

   * After a month (@&#%!), [http://sage.math.washington.edu/home/rlmill/leon-0.1.spkg Version 0.1] spkg! Exposes desauto and wtdist programs.

   * spkg exposes modified desauto and wtdist, which do not read from or write to file!

   * First attempt at Pyrex wrapping showed that Leon's code, as is, is nowhere near ready for release as a dynamic library.

   * Next step: investigate documented bugs.
