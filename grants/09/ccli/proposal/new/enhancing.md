

# Enhancing Sage for specific courses


```txt
\section{Enhancing Sage for specific courses}



In this section we describe Sage development projects that will
enhance the effectiveness of Sage in the classroom.  This involves
one-time work to unify the systax for those functions that are commonly
used in a particular course.  During this project we will make these
changes for linear algebra, abstract algebra,
calculus, differential equations, number theory, and combinatorics.
(say a bit more about how this will benefit all subsequent use of Sage in the classroom)


Also, we emphasize that undergraduates will contribute directly to
these projects, and this has a double impact, since we are bringing
as many students in as possible to do development {\em while} we
are carrying out our project, instead of waiting until the end.


\subsubsection{Linear Algebra}
Go through linear algebra; make interfaces consistent (left/right dichotomy, matrix decomposition syntax) and implement anything else an undergrad course in linear algebra would need

RAB: I have a list of syntax fixups I noted when I built the linear algebra quick reference.  The quickref has been translated to Korean, should that be a nice example of the worldwide reach of Sage.

Finally fix echelon/hermite form over ZZ/QQ


\subsubsection{Abstract Algebra}


\begin{itemize}
\item  additions to ``named'' groups, to round out list of all small groups
\item  quotient groups as actual sets of cosets
\item  all subgroups, all normal subgroups (normal may be implemented already)
\item  groups defined by presentations (wrap GAP support?)
\item  perhaps massive optimizations with libGAP, which greatly decreases latency (by a factor of 2000).
\item  RAB: I'll teach rings, fields, etc with Sage in the spring for the first time.  I'm assuming irreducible polynomials over QQ and field extensions (towers) are well-implemented?  Galois groups too?  I'll try to look this over.
\end{itemize}

\subsubsection{Graph Theory}


\begin{itemize}
\item  Rob Miller's fast C graph backends
\item  the linear programming patches and code that depends on them
\item  traveling salesman problem
\end{itemize}

\subsubsection{plotting}


\begin{itemize}
\item  Make 2d graphics have transformations
\item  Expose matplotlib better
\item  improve matplotlib (for example, see how great the mma contour plot function is)
\item  html5 canvas backend for matplotlib
\item  uniform color interface
\item  explore options for interactive 3d plotting again
\item  uniform mesh and region-plotting interfaces
\end{itemize}

\subsubsection{Calculus}


\begin{itemize}
\item  differentiation notation
\item  clean up symbolics
\item  make a maxima library and switch to using the library interface
\item  get rid of maxima asking questions during integration
\end{itemize}

\subsubsection{Number theory}

\subsubsection{Differential Equations}


\subsection{Notebook development, allowing easy grading and organizing, etc. (``Student-focused work'', even being done by students!)}



The Sage notebook is an AJAX application, like Gmail or Google Maps.
It provides an interactive web-based worksheet in which one can enter
arbitrary Sage commands, see beautifully typeset output, create 2-D
and 3-D graphics, publish worksheets, and collaborate with other
users.

screenshot

``Professors at dozens of universities around the world are getting
excited about how they can leverage the Sage notebook in their
teaching.

``With some colleagues in our University (Lyon, France) we have built a
project around Sage for undergraduate students\ldots{} {\em And the University has
decided to support this project.} Good news.

``Now we will be facing the problem to build a Sage configuration which
will work for say 200 students at the same time (students will use the
notebook), and prepare professors for Sage teaching. There are `some'
technical problems to solve\ldots{}'' (T. Dumont, the Sage mailing list.)


Stein has been working fulltime during Fall 2009 funded by University of
Washington on vastly improving the robustness and scalability of the notebook.
This works is coming at the right time, because use of the Sage notebook
is growing rapidly.  Using hardware purchased using an NSF SCREMS
grant (DMS-\ldots{}), Stein created a free public Sage notebook server at
\url{http://sagenb.org}.

(check this) Typically, in Fall 2009, we have seen several hundred new accounts created on the public Sage server every day.

Several specific goals for notebook development include:



\begin{itemize}
\item  Improve the notebook so that it will robustly handle up to 1000 simultaneous users when running on a single high-end server, as demonstrated by a robust automated test suite
\item  Implement management tools so administrators can manage the notebook load and better balance resources
\item  Create easy-to-use research tools for educators, so they can understand how their students use Sage
\end{itemize}


\subsection{Making Sage more classroom-ready}


\subsection{Making Sage servers easy to set up and administer}


Create a nice Virtual Box Sage notebook server appliance with a
graphical interface, two virtual machines that provides a rock solid
secure Sage notebook server setup.  Users will be able to very easily
install this appliance on Windows, Linux, OS X, and Solaris (x86)
servers.  The management interface will provide clear and easy
documentation about setting up this server, creating new notebook
servers for specific classes or instructors, starting and stopping
notebook servers, seeing resource usage, adding users and
authentication frameworks (such as LDAP), and upgrading Sage with
minimal user downtime.

We intend to provide support to get Sage to be used on several new
campuses (this helps fulfill the ``project is institutionalized'' goal
of type II proposals).  We will create a new mailing list for server
administration issues, and in addition to the help we provide would
like to hire a knowledgeable employee for a certain number of hours
per day to answer support questions.

In summary, we propose to provide high-quality enterprise level
software infrastructure and support to educators.  What we propose is
far from free or easy  it is in fact expensive.  But if NSF bears
the cost of a few hundred thousand dollars now, then literally
millions of students will benefit with no cost to them.  This is an
excellent investment by NSF.



\subsection{Growing (an already started!) community (``sustainability'')}




\subsubsection{Infrastructure and community already in place}

Mention sage days, workshops, joint sessions, vibrant mailing list,
chat, lots of talks around the world, etc. Maybe mention a growing
enthusiasm in education and Sage, but most activities center on the
research side, which is why we need this grant.

3 pages!

The is *critical* to spend lots of time thinking and planning about. Most people don't, and it makes a huge impact on whether their grant gets funded.

In relationship to broader impact, include a plan about your dissemination plan. 
Specifically, where are you going to go, what are you talking about, 
why they'll accept you, so:



\begin{itemize}
\item  put website into math dl
\item  PREP proposals
\item  workshops to help authors retrofit open source textbooks with Sage, or help open textbook authors initiate new books, with the goal being similar interactive Sage-enhanced textbooks
\item  workshop proposals that may be included in the budget.
\item  Get seven people that commit to using sage as we go along and are paid honorariums to write tutorials telling how to integrate Sage into their courses. 
\end{itemize}
```