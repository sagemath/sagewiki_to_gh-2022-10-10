= Numerical Computation =

[:days4/projects/: Other SAGE Days 4 Project]

Participants: Kirsten Fagnan, Josh Kantor, didier deshommes

Possible Projects depending on interests of participants. Unless more people join our group we will probably
have to focus on one or two projects. I believe we or someone should definitely do the first one listed below. This would
be mostly pure python coding. Projects 2,3,4 and 5 would require pyrex and maybe some C programming.
The last one would be great to have someone do, but I'm not very good at writing interfaces. 
  
  1.  Extend numerical sparse matrix capabilities. In particular add additional constructors for matrices with special forms, such as tridiagonal matrices. 
  2.  Implement numerical complex sparse matrices based on Josh's real sparse matrices.
  3.  Incorporate clapack into SAGE (Not much to do here, just to make an spkg and make sure it works). Actually there are a couple specialized routines in lapack that the numpy/gsl don't include which we could directly call. For example specialized solvers for banded matrices.  
  4.  Write an interface to ARPACK for computing eigenvalues of large spare matrices. This depends on clapack.
  5.  Wrap the optimization/minimization/root finding/least squares  routines in GSL. (These would all be very similar to the code in sage/gsl/ode.pyx).
  6.  Improve SAGE's support for octave and matlab. 
 
 
