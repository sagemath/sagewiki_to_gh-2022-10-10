

# Making Sage Classroom Ready


```txt
\section{Making Sage Classroom Ready}

In this section we describe Sage development projects that will
make the Sage library of functionality fully ready for classroom use
for undergraduate courses in linear algebra, abstract algebra,
calculus, differential equations, number theory, and combinatorics.

Also, we emphasize that undergraduates will contribute directly to
these projects, and this has a double impact, since we are bringing
as many students in as possible to do development {\em while} we
are carrying out our project, instead of waiting until the end.

\subsection{Linear Algebra}
Go through linear algebra; make interfaces consistent (left/right dichotomy, matrix decomposition syntax) and implement anything else an undergrad course in linear algebra would need

[[RAB: I have a list of syntax fixups I noted when I built the linear algebra quick reference.  The quickref has been translated to Korean, should that be a nice example of the worldwide reach of Sage.]]

Finally fix echelon/hermite form over ZZ/QQ

\subsection{Abstract Algebra}

  \begin{itemize}
  \item additions to ``named'' groups, to round out list of all small groups
  \item quotient groups as actual sets of cosets
  \item all subgroups, all normal subgroups (normal may be implemented already)
  \item groups defined by presentations (wrap GAP support?)
  \item perhaps new things are possible with libGAP?
  \item[\ ] [[RAB: I'll teach rings, fields, etc with Sage in the spring for the first time.  I'm assuming irreducible polynomials over QQ and field extensions (towers) are well-implemented?  Galois groups too?  I'll try to look this over.]]
  \end{itemize}

\subsection{Graph Theory and Combinatorics}

Robert Miller's fast C graph backends.

[[RAB: there are some obvious (but computationally difficult) things missing.  Like traveling salesman problem (which is technically graph optimization).  I can look for more.]]

\subsection{2d and 3d Plotting}

Make 2d graphics have transformations (i.e., rotate, translate, etc.)

Expose matplotlib better, so we don't have to just duplicate everything that matplotlib has.

\subsection{Calculus}
Polish any issues in calculus (e.g., see recent sage-devel posts about differentation)

[[RAB:  Can we conceivably propose to remove the Maxima queries like ``Is $x^2-4>0$?''  Or does this mean recreating the whole symbolic integration suite?  This is a blocker for my heavy use in Calc II.]]

\subsection{Number Theory}


\subsection{Differential Equations}

[[RAB:  Other than calculus and linear algebra, I would guess this is the next high-enrollment candidate where Sage can have a big impact.  Lots of engineering and physics majors in this one.  There is also no good open textbook for this course that I am aware of.]]

 
```