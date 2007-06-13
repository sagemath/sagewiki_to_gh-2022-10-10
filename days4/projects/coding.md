= Coding Theory =

[:days4/projects/: Other SAGE Days 4 Project]


Robert Miller, David Joyner, Josh Kantor, Robert Bradshaw, Emily Kirkman

 * '''Leon's partition backtracking''' programs.

   * Distributed Doubly Even Codes will no longer depend on Magma.

   * Permutation groups in SAGE will benefit from Leon's code being available without the overhead of pexpect or reading/writing files.

   * Progress report: After a month (@&#%!), [http://sage.math.washington.edu/home/rlmill/leon-0.1.spkg Version 0.1] spkg! Exposes desauto and wtdist programs, without modification (i.e. still reads codes from file, outputs results to file).

   * Next baby step: write pyrex class to interface the library as is.

   * Next giant step: tweak desauto and wtdist to communicate via arguments and returns, not files.
