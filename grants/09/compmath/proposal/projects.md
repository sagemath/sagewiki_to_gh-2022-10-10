

# Projects


```txt
\section{Proposed Sage Days Workshops}

In the following sections we describe $N$ [[update when done]]
proposed Sage Days workshops.  The general format is about 5 days of
intensive work by about 20 highly-motivated participants, which often
leads to substantial additional work and research as a result of the
workshop.  We describe below how each project fits into the thrust of
Sage development and builds on existing work.

\subsection{Sage Days: The Notebook Interface} 

\subsubsection{Background}
\begin{wrapfigure}{r}{0.5\textwidth}
\shadowbox{\includegraphics[width=0.5\textwidth]{sagenb.png}}\\
\end{wrapfigure}
Imagine an interactive web-based worksheet in which one can enter
arbitrary Sage commands, see beautifully typeset output, create 2D and
3D graphics, publish worksheets, and collaborate with other users.
The Sage notebook is the only math software that offers this
capability; it is somewhere between a Maple or Mathematica notebook
and the online Google Documents web application, with its extensive
collaborative features. 

The PI and several UW undergraduates together developed the basic
implementation of the current version of the Sage notebook during an
extremely intense three-week coding session in Summer 2007.  

Many mathematicians in both pure and applied mathematics at dozens of
universities around the world are excited about how they can leverage
the Sage notebook in their own research and teaching.  There is much
excitement about this being a new collaboration tool that enhances
their teaching and research.  For example, the FEMHUB project
\url{http://femhub.org/} at University of Nevada has adopted and
rebranded the Sage notebook for teaching courses and doing research on
finite element methods.  See \url{http://wiki.sagemath.org/sagenb} for
a list of deployed notebook servers.

\subsubsection{The Workshop}
At a Sage Days workshop on the Sage notebook, we would attack the
following problems:

\begin{enumerate}
\item Address all {\em known security vulnerabilities in the Sage
    notebook}, and implement a more sophisticated user security model.
  Yoav Aner, a cryptography graduate student in London, has written an
  extensive threat assessment for the notebook as his Masters Thesis,
  which provides a list of issues to tackle.

\item Add complete {\em spreadsheet capabilities} to the Sage
  notebook.  This would be similar to Microsoft Excel spreadsheets,
  but the formulas would be Sage code.  This could be extremely
  powerful for applications that are very data-centric, yet involve
  advanced mathematics.

\item Add sophisticated {\em software engineering capabilities} to the Sage
  Notebook.  This could include integrating a sophisticated code
  editor (such as BeSpin \url{} or [[something else]]), providing an
  interface to the Sage libraries revision control system and the
  capability of editing any files in the Sage library, checking in
  changes, creating and submitting patches, etc., all from the Sage
  notebook interface.  This would also included creating a
  sophisticated web-based interactive debugger, which would provide
  access to the Python debugger, the Python profiler, the GNU C
  debugger (gdb), and Valgrind.


\item Create a {\em repository for contributions} to Sage.  This would
  provide a central location for people to manipulate, share, and
  publish Sage worksheets, and Python and Sage code.  These materials
  could be rated by other users, there could be an RSS feed of new
  contributions, etc.  This would be a Sage-specific analogue of
  Google Code, Sourceforge, and many of the other popular open source
  project hosting sites.

\item  Implement {\em additional 3d plotting functionality}.  There are
  many functions and options for 3d plots that have not yet been
  implemented, and this could be done.  Also improve Sage's ability to
  render using HTML5's canvas, including animation output, as
  something that can be embedded in a webpage, or viewed separately.
  This is an open-ended project, but 1 month fulltime would provide
  enough time to improve implicit plotting, options for parametric and
  function plotting, and for adding text rendering and axes to canvas
  rendering.

\end{enumerate}

\subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Software Engineering}

\subsubsection{Background}
Sage is big.  The printed reference manual is over 4,000 pages. Sage
is the largest active software engineering projects currently under
development by the mathematical community.  Several Sage developers
are experienced software engineers, some with over a decade of
experience in industry, and as it grows the project has benefited
greatly from their input.

Sage consists of well over {\em 5 million} lines of code from 97
distinct packages.  This entire systems builds in a completely
automated way from source on over 20 supported platforms (many flavors
of Linux, OS X, and Solaris 10), using a cross-platform build system
that we created using standard tools (autoconf, scons, make, bash).

\begin{wrapfigure}{r}{0.4\textwidth}
\shadowbox{\includegraphics[width=0.4\textwidth]{tickets.png}}\\
\mbox{}\,\,\,\,\,Over 1200 Open Tickets...
\end{wrapfigure}
The core Sage library, which we have written over the last few years
is, well over 400,000 lines of Python, Cython, C/C++ code, and
documentation. We regularly run a test suite that involves evaluating
over 100,000 lines of input examples and verifying that the output is
correct, with care taken to initialize random seeds before each test.
This test suite is often run in parallel (thanks to the NSF/REU-funded
work of undergraduate Gary Furnish), and it covers 80\% of the
functions in the Sage library (that is about 18,000 functions).

We use the Mercurial distributed revision control system to track all
changes to the Sage codebase.  All new code that goes into Sage is
publicly subjected to a rigorous peer review process which is
organized using Trac (\url{http://trac.sagemath.org}).  Since January
2007 [[??]], We have closed about 6,000 [[??]] tickets using this
system, and there are 270 [[update!]] trac user accounts.

\subsubsection{The Workshop}
At a Sage Days workshop on software enginnering, we would attack the
following problems:
\begin{enumerate}
\item Create a \emph{benchmarking and regression testing system} for
  Sage, which can record and compare timings automatically between
  different versions of Sage. Once this system is in place, create a
  large battery of tests based on the current Sage library, to prevent
  any future speed regressions in Sage. This should also be completely
  usable for end-user code, so that users can maintain their own list
  of timing tests.   This is approximately one and a half weeks of
  fulltime work, split evenly between creating and debugging the
  regression testing system, and writing a thorough set of benchmarks
  for the Sage library.

\item \emph{Improve support for testing end-user code} via the Sage
  doctest system. Support for this exists in Sage, but often has bugs
  or inconsistencies in behavior. The most important part of this
  project would be creating a script which \textbf{tests} this
  behavior, and making it a part of the standard Sage test suite.

\item Create an \emph{automatic patch-testing system} to monitor and
  report on the correctness of patches posted to the Sage bug
  tracker. Several Sage developers have recently created a script to
  automatically merge and test patches. This project would consist of
  creating a daemon to run on a large server (such as
  \url{http://sage.math.washington.edu}) which will monitor the Sage bug
  tracker, and when new patches are posted, merge and test them, then
  report the results back to the bug tracker. This is currently done
  manually by Sage developers as part of the code review
  process. Automating this process would free up a huge amount of
  developer time, since they would no longer need to do this
  themselves, and it's a task that's easily automated.  Three weeks
  fulltime. One week to create the daemon program, one week to cleanly
  integrate it with trac (the software behind Sage's bug tracker), and
  one week to monitor and adjust its behavior to be functional without
  making the server unusable.

\item Improve the Cython \emph{Python-to-C compiler}: There are
  numerous proposals on the Cython wiki
  \url{http://wiki.cython.org/enhancements} for possible projects.  In
  particular, we would love to see continued improvement in Cython's
  support for wrapping existing C/C++/Fortran libraries, since Cython
  is becoming increasingly important not only for the Sage project,
  but also for both NumPy and SciPy, which are the key tools for
  scientified computing using Python.

\end{enumerate}

\subsubsection{Key People} [[List of names]]


\subsection{Sage Days: Commutative and Noncommutative Algebra}

\subsubsection{Background}
[[background about commutative and noncommutative algebra capabilities and development
in sage]]


At a Sage Days workshop on commutative and noncommutative algebra, we
would attack the following problems:

\begin{enumerate}

\item Implement {\em modules over multivariate polynomial rings}.
  This would be relatively straightforward to do by building on the
  functionality already offered by Singular.

\item Create an optimized Cython implementation of {\em free algebras and
  their quotients}.

\item Implement computation with {\em modules over Dedekind domains} (via
  pseudobasis), as explained in detail in Henri Cohen's GTM book on
  explicit class field theory.


\item  Implement {\em arithmetic and ideal theory of quaternion algebras
  over number fields}, following the algorithms and strategy John
  Voight used for his Magma implementation.  This assumes the project
  above for computing with Dedekind domains using pseudobasis has been
  completed.

\end{enumerate}


\subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Algebraic Curves}

\subsubsection{Background}
\begin{wrapfigure}{r}{0.3\textwidth}
\shadowbox{\includegraphics[width=0.3\textwidth]{algcurve.png}}\\
\mbox{}\,\,\,\,\,\,An Algebraic Curve
\end{wrapfigure}
[[background about algebraic curves capabilities and development in
sage

background about algebraic curves capabilities and development in
sage
background about algebraic curves capabilities and development in
sage
background about algebraic curves capabilities and development in
sage

background about algebraic curves capabilities and development in
sage
background about algebraic curves capabilities and development in
sage

background about algebraic curves capabilities and development in
sage
]]


\subsubsection{The Workshop}
At a Sage Days workshop on algebraic curves, we
would attack the following problems:

\begin{enumerate}

\item Implement Florian Hess's algorithms for {\em algebraic number theory
  in the context of function fields}.  This would include implementing
  computation of Riemann-Roch space basis computations for smooth
  projective curves.  

\item Document all existing functionality for {\em algebraic curves} in
  Sage, and fill in all the generic missing functionality.

\item Provide {\em resolution of singularities of algebraic curves} by
  wrapping functionality already available in Singular 
  (see \url{http://www.singular.uni-kl.de/Manual/3-0-4/sing_574.htm}).

\item Implement code for {\em computing with rational (genus 0)
    curves}, since Sage currently doesn't have any special code for
  them.  These are mostly ``easy,'' but there are a couple of
  important algorithms, which are mostly avialable in components
  included in Sage (as part of eclib and Denis Simon's PARI code). So this
  would mainly be a wrapping and documentation project.

\item Implement {\em 3-descent and 4-descent algorithms} for finding
  rational points on elliptic curves over $\mathbf{Q}$. There are no open
  source implementations of any of these algorithms, and they are
  central to finding rational points on elliptic curves.

\item Create {\em optimized implementations of all pairings} on elliptic
  curves over finite fields: Weil, Tate, EtaT, Etaq, Ate, ReducedAte,
  and Ateq.

\item Implement algorithms for computing with {\em elliptic curves over
  function fields}.  John Cremona remarks that ``Quite a bit of what
  Magma has came from my student David Roberts, whose thesis in 2007
  was about this. I have his code.''

\item Implement all the {\em standard models of genus 1 curves} (as
  defined by what Magma supports), and transitions between them.
  Also, implement Edwards (and other) coordinates for elliptic curves.

\item Optimize arithmetic on {\em Jacobians of hyperelliptic curves}.

\item Jacobians: Implement {\em 2-descent on Jacobians of hyperelliptic
  curves} over $\mathbf{Q}$.

\item Computation of {\em automorphism groups of smooth projective curves}
  of genus $\geq 1$.
\end{enumerate}

\subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Number Fields}
\subsubsection{Background}
[[background about number field capabilities and development in
sage]]

\subsubsection{The Workshop}
At a Sage Days workshop on number fields, we
would attack the following problems:
\begin{enumerate}
\item 
 Rewrite {\em number fields to use FLINT} for basic arithmetic
  (currently they use NTL for all basic arithmetic).  This would
  speed up basic arithmetic in number fields, but be a bit more difficult
  than rewriting $\mathbf{Q}[x]$. 

\item  Finish implementing {\em relative number field} in Sage. Currently
  Sage supports relative number fields, but many operations are not
  implemented, inconsistent, cumbersome, or {\em unnecessarily
    slow}. Bring support for relative number fields up to the same
  level as for absolute number fields.  This would take at least 1
  month fulltime work to do.  It is challenging because PARI does not
  provide support for general relative number fields.

\item  Sage has a large amount of code for working with number fields
  and orders.  However, there is very little functionality for
  {\em explicit class field theory}.  Fortunately, PARI does have such
  functionality, and with some work we could make a polished version
  of that functionality available from Sage.


\item Include a first rate number field sieve implementation in Sage.
  In particular, include {\tt msieve} in Sage.  {\tt msieve} is a
  complete public domain implementation of the {\em general number
    field sieve}.  See \url{http://www.boo.net/~jasonp/qs.html}.  It
  would likely take one week fulltime to sort out build issues, and
  one week to create, document, and test wrapper code.
\end{enumerate}

\subsection{Sage Days: Modular Forms}

\subsubsection{Background}
\begin{wrapfigure}{r}{0.3\textwidth}
\shadowbox{\includegraphics[width=0.3\textwidth]{modform.png}}\\
\end{wrapfigure}
[[background about modular forms capabilities and development in
sage]]


\subsubsection{The Workshop}
At a Sage Days workshop on modular forms, we
would attack the following problems:
\begin{enumerate}

\item  Implement all algorithms for {\em weight one modular
  forms}. See Tate's algorithm from Springer Lecture Notes 1585 and an
  algorithm of Kevin Buzzard.

\item  Implement algorithms for computing {\em Hilbert modular forms}.
  This project requires quaternion algebra arithmetic over real fields
  (see above).  The implementation would likely follow Lassina
  Dembele's papers.  It would take one month to become familiar
  with the theory, and another to implement a first useful
  version. This project can't start until quaternion algebras over
  real fields have been implemented.
\item Implement code for computing {\em Stark-Heegner points on
  elliptic curves via overconvergent modular symbols}. Henri Darmon
  and Robert Pollack have published Magma code for doing this. 
\end{enumerate}

\subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Group Theory}

\subsubsection{Background}
[[background about group theory capabilities and development in sage]]

[[insert a picture of a Cayley graph]]

\subsubsection{The Workshop}
At a Sage Days workshop on group theory, we would attack the following
problems: 

\begin{enumerate}

\item Create a {\em C-library interface to GAP}.  The PI spent 1 week
  fulltime during Summer 2009 and created a proof of concept of this
  library interface, which proved that this project is do-able, and
  that it would directly result in up to 2000 times speedups over the
  current Sage/GAP pipe-based interface.  
  1 month to implement the GAP C library interface, and 1 month to
  switch Sage over to use it instead of the pipe interface.  Sage uses
  the pipe interface right now for most group theory, and switching
  over and optimizing the results will uncover many issues, and also
  require rewriting some of the Sage library.  It will also make it
  reasonable to use GAP for basic arithmetic in many interesting new
  cases (e.g., Lie Algebras).

\item Once there is C-library interface to GAP, sponsor a Sage Days
  workshop to {\em expose to Sage as much as possible of GAP's
    functionality}, including characters of finite groups, Lie
  algebras, etc.
 This would be a good topic for a Sage Days
  workshop, since it is fairly easy to implement a wide range of
  things in parallel.  It would also be a good way to improve
  interaction between the Sage and GAP projects, since it is likely
  several GAP developers would attend.
\end{enumerate}

\subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Algebraic Topology and Homological Algebra}

\subsubsection{Background}

We can do Steenrod algebra calculations (at both $p=2$ and odd
primes), and we can do simplicial homology.  We can do group
cohomology (via the optional spkg by Simon King and David Green).  We
have free modules over commutative rings. 

At a Sage Days workshop on algebraic topology and homological algebra,
we would attack the following problems:


\begin{enumerate}

\item We will improve simplicial homology: we should be able to
  compute the ring structure for cohomology, and we should be able to
  keep track of the generators.  We should add an interface to CHomP,
  which computes cubical homology.  We should add some capabilities to
  compute with formal group laws (homotopy theorists only care about
  1-dimensional formal group laws, but we don't need to limit
  ourselves), and the related computations with the spectrum BP.  We
  should implement differential graded algebras.

\item (There are a lot of other ideas on the Sage wiki page for
  algebraic topology (http://wiki.sagemath.org/topology), and we could
  throw some of them in.  Some of them get pretty far from my own
  research, so I don't know much about them.  We would really want
  someone who is interested in adding these things, so that we have
  motivation for doing so.)

\item For graded connected algebras, we should implement Bob Bruner's
algorithm, or develop an interface between his C programs and Sage.
Christian Nassau has done some related work, but it is focused on the
Steenrod algebra, not on general graded connected algebras.

\item For group algebras, we should see if parts of the group cohomology
spkg should be made standard, and possibly extended to other algebras.

\item In general, we should implement free modules, projective
  modules, and injective modules over arbitrary rings, and we should
  implement resolutions and derived functors.  Where possible, we
  should implement methods of computing resolutions (as in the case of
  graded connected algebra and group algebra).  We should implement
  some interesting noncommutative rings over which we can compute
  examples.  (Singular might help here.)  There is a package (for
  maxima, I think) called "affine" that does some related things, and
  we should get a copy and see if we can incorporate it.


\end{enumerate}


\subsubsection{Key People} John Palmieri, Bruner and Nassau.  King and
Green.  Some other group theorists?

%\subsection{Sage Days: Symbolic and Algebraic Statistics}
%[[background about how much Sage has for statistics already]]

%[[algebraic statistics is a major hot topic... computational?  by symbolic, I mean capabilities
%like  in Mathematics as opposed to R or matlab -- see the mathematica webpage]]
% \subsubsection{The Workshop}
% At a Sage Days workshop on statics, we would attack the
% following problems:


% At a Sage Days workshop on algebraic topology, we would attack the
% following problems:

% [[grab some ideas from sage days 15]]

% \begin{enumerate}

% \item
% Implement native {\em statistics} functionality in Sage,
%   beginning with a class for holding data with descriptions, methods
%   for subselection, transformation and assignments, and then more
%   classes with data/object interactions that wrap or use {\tt
%     scipy.stats} and {\tt rpy}.
% \end{enumerate}
% \subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Sage for Engineers, Physicists, and Scientists}
 
\subsubsection{Background}
Most Engineers use Matlab and they don't know remember what a Ring and
a Field are.  They would not find the normal Sage Tutorial attractive
because of the use those terms. However, Sage contains powerful
packages that Engineers, Physicist, and Scientists would find very
attractive if they were aware that Sage contains:

\begin{itemize}
\item  Most numerical packages they want (Numpy, Scipy, FFT ect).
\item 2D and 3D plotting packages some with the same interface as Matlab
\item Symbolic Algebra for both Calculus and Linear Algebra
\item Python as basis
\item Cython, a built in C compiler, which gives them "C" speeds for numerical calculations
\item  Image processing
\item Python access to html information (the financial package is an example).
\item Access to TCP/IP through Python, which could also be used to interact with experimental systems
\item Statistic and random variable functions for most distributions used in Engineering.
\item numerical differential equations solvers
\item Latex for displaying Mathematics expressions
\item signal processing packages
\item Sage is free
\end{itemize}

In industry, most Engineers use Matlab and they are by far its largest
user.  One of the objectives of Sage is to be an alternative to
Matlab, so we need a tutorial, and literature attractive to them.  In
recent years many Physics and Engineering departments now use Python
for class programming.  MIT moved from using Scheme to Python three or
four years ago, as one example. Also, in the past year, many
Silicon Valley companies are now using Python.  Sage seems like it is
the next logical step for them since it comes prepackaged with all the
items listed above.
 
\subsubsection{The Workshop}
One of the objectives of the Sage days would be to produce a series of
videos, worksheets, and tutorials aimed at being user friendly to
Engineers, Physicists, and Scientists. This would give a quick
introduction to the tools they use and leave out all the wonderful
mathematics they normally don't use.
 
A suggested list of talks (all only including symbolic and real
numbers with a engineering bent for problems) is:
 
\begin{itemize}
\item Sage Overview (quick run through all the gee whiz stuff).
\item Graphics and Images in Sage (2D, 3D, implicit plot, Matlab like interface).
\item  Symbolic Calculus
\item  Linear algebra (Show Symbolic and numerical examples i.e. eigenvectors, eigenvalues, matrix inversion, ect).
\item  Numerical Analysis (Numpy, numerical solutions to differential equations)
\item Cython (Programming including numpy examples).
\item  Statistics
\item Use of Interact and how to set up TCP/IP servers and clients.
\item  Use of Latex and html in Sage.
\item  Signal Processing in Sage
\end{itemize}

This list would not be that much different from previous Sage days, it
would just be targeted at a different audience.

\subsubsection{Key People} Josh Kantor, Michael Madison, all Enthought employees,
Fernando Perez, Jarod Milliman, Prabhu Ramakrishnan

\subsection{Sage Days: Numerical Computation}
\subsubsection{Background}

Sage includes many core components that support numerical and
scientific computation, including ATLAS (NSF-funded?) \url{atlas}
which is a high-performance numerical linear algebra package, Scipy
and Numpy \url{numpyscipyurls} which is a huge Python/Fortran library
that provides similar functionality to MATLAB, GSL \url{gslurl} which
is a C library for numerical computation, R \url{Rurl} which is
primarily a statistics package but provides substantial numerical
capabilities, and CVXOPT \url{cvxopturl} which provides numerical
convex optimization functionality and sparse matrix linear algebra.

The Sage distribution is also the basis for the FEMHUB \url{femhuburl}
project, which is an easy-to-use state-of-the-art open source
distribution of code for numerically solving partial differential
equations using finite element methods [[I think!]].  The director of
FEMHUB project is [[some connection with this proposal, either co-PI
or ...]].

\subsubsection{The Workshop}
At a Sage Days workshop on numerical computation, we would attack the
following problems:

\begin{enumerate}

\item Improve support in Sage for numerically solving differential
  equations and visualizing the solutions.  This would mainly involve
  creating wrapper code and documentation with many examples so that
  the solver capabilities provided by Scipy work efficiently with
  native Sage objects (e.g., symbolic expressions).  It would also
  involve writing code so that solutions (and families of solutions)
  can be efficiently plotted in 2 and 3 dimensions. 

\item Sage has high precision interval and fixed precision floating
  point arithmetic is built on top of Paul Zimmerman's rigorously
  justified MPFR library (\url{mpfrurl}).  Sage thus currently has the
  capability to do numerical linear algebra using real and complex
  interval arithmetic and with fixed arbitrary precision real or
  complex floating point numbers.  However, the implementations of the
  underlying algorithms for these fields is naive and generic in most
  cases. In consultation with experts in numerical analysis (e.g.,
  Clint Whaley--director of the ATLAS project--who has attended a
  recent Sage Days workshop), we propose to implement numerically
  stable efficient algorithms for linear system solving, singular
  value decomposition, LU, QR and Cholesky decomposition, and matrix
  inversion for generic dense matrices, sparse matrices, and matrices
  with extra structure.



\end{enumerate}

\subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Numerical Solution to Partial Differential Equations}
\subsubsection{Background}
The general idea is that it would be a gathering of people interested
in the finite element method and related things, like a symbolic
derivation of that using sympy/sage, making sure the mesh, solution,
etc., works nice both on the desktop and in the notebook, interfacing
lots of opensource FEM software like libmesh, sfepy, as well as
graphics output like mayavi, VTK, etc.

\subsubsection{The Workshop}

\begin{enumerate}

\item Write PDE and boundary conditions in the notebook, and create
  weak formulations automatically using sympy/sage. For more
  complicated PDE systems or for PDE in other than Cartesian
  coordinates, this would take a huge burden off the user.

\item Design a suitable model/protocol for passing the weak
  formulations to all codes in FEMhub.

\item Define geometries interactively via Java applets and send them
  to mesh generators. Visualise and edit the resulting meshes in the
  notebook.

\item We can plot the solutions and meshes from python already (using
  either mayavi or mpl), but this needs improvements, e.g. to be able
  to plot streamlines, change plotting parameters easily, etc. We have
  elaborated visualization in opengl and glut in C++, but
  unfortunately this is not usable in the notebook, and also it is not
  reliable across platforms.

\item Interface lots of open source FEM software like dune, fipy,
  hermes, phaml, libmesh, sfepy, etc. Currently, of those only fipy,
  hermes, and sfepy are in FEMhub. To design a unified interface and
  allow for interoperability is one of our major tasks.
 
\item Improve graphics output in the notebook (mayavi, VTK, ...) Both
  Mayavi and VTK are in FEMhub, but unfortunately they do not build on
  Mac nor Windows. The problems have been kind of sorted out on Mac
  already, now some manpower is needed to switch preferably both Sage
  and FEMhub to a python framework build and then fix the
  configuration of VTK. We have no idea yet what has to be done on
  Windows to make it compile.

\item The web notebook should be made login free as soon as
  possible. We have attempted to do this recently, but we found the
  core of the notebook quite complicated and we were not efficient at
  all, so we stopped this effort.  Unfortunately we do not have the
  manpower and expertise to fix the core of the notebook, but we think
  that it should be revised. We are going to invest a substantial
  amount of work into the notebook in the future. It might be useful
  to coordinate our efforts eventually.

\end{enumerate}

\subsubsection{Key People} Pavel Solin (Univ. of Nevada), Ondrej Certik
(Univ. of Nevada)

\subsection{Sage Days: Combinatorics and Optimization}
\subsubsection{Background} 

[[background about how much we have done with optimization and
combinatorics in sage already]]

\subsubsection{The Workshop}
At a Sage Days workshop on optimization, we would attack the
following problems:

\begin{enumerate}

\item Implement a {\em C++ interface to MiniSat} and include MiniSat
  in Sage.  Also implement a general DIMAC conjunctive normal form
  (CNF) SAT-solver interface.  (Victor Miller is extremely supportive
  of this project.)     Though MiniSat is small,
  Stein wrote a proof-of-concept wrapper, and it is clear it will take
  substantial work to really do this right.

\item Implement {\em finite planes and incidence geometry}.  Sage's
  capabilities are still pretty primitive. Dan Gordon remarks that
  ``[Sage...] has a basic functionality, and takes a database of Witt
  designs and Hadamard matrices from GAP, but Magma also has a
  database of difference sets, and many more operations; equivalence
  testing, invariants, resolutions, ... Most of this wouldn't be too
  difficult to replicate, and I've thought about doing some myself,
  particularly difference sets.''
\end{enumerate}

\subsubsection{Key People} [[List of names]]

\subsection{Sage Days: Symbolic Computation}

{\em Symbolic computation} is the collection of exact methods used to
perform basic tasks in engineering, physics, etc., which includes
applications such as symbolic integration and solving differential and
difference equations.  We divide the relevant topics into three areas:
\begin{itemize}
\item {\em Differential / difference algebra:} for indefinite
  integration/summation and differential/difference solvers
\item {\em Transforms and definite integration:} Mostly table lookup and
  pattern matching based approaches to evaluating transforming
  integrals/special functions
\item {\em Fundamental algorithms:} Basic computer algebra methods
  required to implement the algorithms above efficiently.  These
  include multivariate polynomial factorization, sparse multivariate
  polynomial interpolation (Erich Kaltofen, Wen Shin Lee), and exact
  linear algebra over multivariate polynomial rings.
\end{itemize}


\subsubsection{A Workshop on Difference/Differential Algebra}
[[Here are William Sit's comments about computational differential
algebra/Sage/Axiom from sage-devel:

\url{http://www.mail-archive.com/sage-support@googlegroups.com/msg13097.html}

Bronstein's \verb|Sum^it| library provides implementations of some of the
fundamental algorithms we should try to get in Sage:

\url{http://www-sop.inria.fr/cafe/Manuel.Bronstein/sumit/sumit.html}
]]

[[We can contact Michel Singer and
ask for help adding mathematical content below. 
AFAIK, other names I wrote below, van Hoeij and Abramov work with Maple.]]

Burcin Erocal has implemented special classes of difference fields,
called Pi-Sigma fields (by Michael Karr), as a part of his summation
code. He's planning to implement generic difference/differential
rings/fields and operators in the near future.

A theoretical framework for investigating solutions of
differential/difference equations is provided by
differential/difference algebra.  At the moment, Sage doesn't have any
facilities for working with differential/difference
fields/rings/ideals, etc.  An implementation of the basic structures
required here would pave the way to a proper implementation of the
Risch and Karr algorithms for indefinite integration and summation
respectively, as well as providing a basis for research in Galois
theory of differential and difference equations, which forms the
foundation for algorithms to deal with higher order equations.

 The goals of a workshop in this area would be:
\begin{enumerate}
\item Provide support for working with differential/difference
  rings/fields and their operator domains. Singular let's us do this
  for polynomial rings.  In order to handle denominators in the user
  interface, one could use Pynac, and pass the harder problems, such as
  computing normal forms w.r.t. an ideal to Singular after clearing
  denominators.

\item Implement the Risch-Norman (parallel integration) algorithm \cite{[B2007]}

 \item Implement recent algorithms by Abramov, van Hoeij, Hendriks-Singer to find
  Liouvillian solutions of difference/differential equations
\cite{[B2007]} \url{http://dx.doi.org/10.1016/j.jsc.2007.04.003}
\end{enumerate}

\subsubsection{Key People} 
Michael Singer, Mark van Hoeij, Sergei Abramov, Burcin Erocal


\subsubsection{A Workshop on Integral Transforms and Definite Integration}

Important cases of definite integration in computer algebra systems are
handled through applying some integral transforms (such as the Mellin
transform) to convert the integral to a contour integral which can
also be expressed as a well known special function (hypergeometric, or
Meijer-G), then using properties of this special function to arrive at
an evaluation.  While these methods have been implemented, and used in
practice by closed source systems such as Mathematica and Maple,
literature on how to correctly apply these methods to get practical
results is still scarce.  Sage has an efficient framework based on the
symbolic computation library GiNaC to represent these functions, and
perform pattern matching operations. This provides the basic building
block to implement the required transforms (both integral and
hypergeometric).

Goals for a workshop:
\begin{enumerate}
 \item Implement a construct for hypergeometric functions
\item Recognition of hypergeometric functions, and conversion to
  a standard representation (pFq)
\item Build lookup tables for well known transforms, including hypergeometric.
and integral (Mellin, Hilbert, Laplace, etc.). 
\end{enumerate}

References: See \url{http://wiki.sagemath.org/symbolics}, 
\url{http://www.mat.univie.ac.at/~kratt/hyp_hypq/hyp.html},
\url{http://www-igm.univ-mlv.fr/~gauthier/HYPERG.html}.

\subsubsection{Key People} 
Burcin Erocal, 
Peter Paule, Victor Moll, Victor Adamchik (see \url{http://www-2.cs.cmu.edu/~adamchik/}).

\subsection{Sage Days: Coding Theory}
\subsubsection{Background}

\subsubsection{The Workshop}

\begin{enumerate}
\item a fast minimum\_distance for an arbitrary non-binary code (minimum distance of
linear binary codes can be computed very quickly thanks to code by
Robert Miller)

\item a function to compute a basis for the Riemann-Roch space of a
reasonably general curve
at a reasonably general divisor. This is needed to implement AG codes.)

\item implementation of the "weight function" machinery (this is an alternate
way to compute certain AG-type codes, avoiding the Riemann-Roch space
machinery; see the survey papers by Hoeholdt on AG codes...)

\item decoding algorithms

\item covering codes and covering radius algorithms (more generally,
porting over Guava
functions to Sage)

\end{enumerate}

\subsubsection{Key People} [[List of names]]


\subsection{Sage Days: Linear Algebra}

\subsubsection{Background}
Many problems in mathematics can be expressed with the language of vectors and linear transformations (matrices).  Thus many areas of Sage rely on high-performace routines for solving equations, creating canonical bases, inverting matrices, in addition to computing determinants and eigenvalues.  Areas relevant to other proposed workshops include coding theory, optimization, numerical computation.  There are efficient routines for many of these computations, over a variety of rings and fields.  Despite the maturity of Sage's support for linear algebra, there is more work to do:  new routines to add, specialized versions of existing routines to implement (over different rings), speed improvements to existing routines and organizing commands to improve ease-of-use.  Improvements in the linear algebra routines will strengthen Sage throughout.

\subsubsection{The Workshop}
At a Sage Days workshop on linear algebra, we would attack the following problems:
\begin{enumerate}
\item \emph{Add and improve matrix decompositions} such as LU, Cholesky, Jordan.  Some of these could be improved, others could be expanded to more rings or fields, and others would be new.

\item \emph{Create specialized routines} for existing commands over specific fields or rings. Some linear algebra routines have generic implementations, which could be made much faster in some situations if they exploit knowlege or libraries for specific rings or fields (such as the rationals or integers).

\item Where \emph{specialized libraries} can provide the fastest possible routines, provide an interface from within Sage.

\item Where \emph{Cython code} can provide faster routines, remove dependence on specialized libraries.

\item \emph{Widen support for left- and right- variants} of various commands.  In other words, better support the two views of a matrix:  a collection of row vectors, or a collection of column vectors.  Currently Sage has a bias towards rows (vectors on left of a matrix) which some users find unnatural.

\item \emph{Improve support for numpy data types}.  numpy is a popular Python package for computations with mult-dimensional arrays.  Currently it is awkward to move between numpy's data representations and Sage's.

\item There are about 90 open linear algebra tickets to mine for more ideas\dots

\end{enumerate}

\subsubsection{Key People}  Rob Beezer, Jason Grout (?), [[other people]]

%\subsection{Sage Bug Days}
%\subsubsection{Background}
%[[Describe how the first bug days went.  Explain that the second bug days is
%planned for late January, funded by a COMPMATH NSF grant.]]
%\subsubsection{The Workshop}
%At a Sage Bug Days, we would do the following.
%\begin{enumerate}
%\item We had one ``Bug Days'' workshop in San Diego, during
%  which the participants fixed over 200 venerable bugs in Sage (over
%  1/3 of all known bugs), and did a triage of all bugs.  Another {\em Bug
%  Days workshop} would be a great way to substantially improve the
%  quality of Sage, and fix many longstanding issues.
%\end{enumerate}

% \subsubsection{Key People} [[List of names]]



```