

# Sage-Enhanced Interactive Textbooks


```txt
\section{Sage-Enhanced Interactive Textbooks}

\subsection{Creating Sage Notebooks from \LaTeX\ or Sphinx sources}

Many mathematicians and scientists use the \LaTeX\ language to create technical articles and books.  As a result, there is an impressive array of extensions to \LaTeX.  Sage also includes  extensive support for \LaTeX, through every mathematical object having a \LaTeX\ representation, and the use of jsMath to render mathematics beautifully in a Sage worksheet (within a standard web browser).  Furthermore, the Sage notebook interface allows a user to add new text, including \LaTeX\ code for mathematics.

This project proposes to convert open-source textbooks into folders of interactive Sage worksheets, or to create Sage-enhanced supplements for existing open-source textbooks.  A Sage worksheet is a combination of input and output cells, optionally with text (HTML) inbetween.  The tex4ht translator (an NSF funded project) can convert extremely complex \LaTeX\ into jsMath, which can be converted to the Sage worsheet format with extremely minimal modifications.  It is possible to insert Sage code into a \LaTeX\ source file, and have it migrate to the eventual Sage worksheet as an input cell.  A pilot project, a fourteen page primer on group theory designed to accompany Judson's abstract algebra text, clearly shows the feasibility of this process and clearly identifies the technical changes needed to make the process routine for an author.

The end result is a folder of Sage worksheets, each a mixture of text, high-quality typeset mathematics, Sage input cells and Sage interactive demonstrations.  Imagine a calculus lesson on Taylor polynomials as a Sage worksheet in a folder that comprises a calculus textbook.  Sage input cells would instruct the reader on the relevant Sage syntax, and provide the reader the opportunity to edit the input to experiment with different functions and different degree polynomials.  An included interactive Sage demonstration could use a slider to control the degree of the polynomial, and an input box would allow the student to specify an input where the function and the poynomial could be compared numerically.  On each change to the two inputs the demonstration would automatically respond with a new plot of the function and the polynomial, indicating visually the location of the input value on the two curves, along with the two numerical values at the input, plus the numerical difference between the values.  By opening up the mini-word-processor built into Sage, a student can annotate a copy of their text alongside the demonstration, recording their observations or questions, using \LaTeX\ code to create the mathematical expressions accurately in their notes.

[[Also, the plan for bundling a collection of worksheets into a more high-level document (basically a packaged version of the Sphinx documentation).]]

\subsection{Candidate Open-Source Textbooks for Conversion or Supplements}

Each of the textbooks below is licensed with a GNU Free Documentation Licenses (GFDL) or a Creative Commons License that allows anyone to distribute modified versions, typically only requiring attribution of the original author's work and the use of the same license.

\begin{enumerate}

\item {\sl A First Course in Linear Algebra}, Robert Beezer, \url{http://linear.pugetsound.edu/}.\\
Second-year university level text, concentrating on understanding how to understand and formulate proofs.  Used at thirteen schools since Fall~2007.  Contains some Sage commands.

\item {\sl Abstract Algebra: Theory and Applications}, Tom Judson, \url{http://abstract.ups.edu/}.\\
Standard upper-division treatment of groups, rings, domains, fields, Galois Theory.  Published commercially in 1992, released as open source in 2007.  Used by seven schools in its first year available.  Supplement describes group theory in Sage.

\item {\sl Combinatorics Through Guided Discovery}, Kenneth Bogart, \url{http://www.math.dartmouth.edu/news-resources/electronic/kpbogart/}.\\
Problem book in combinatorics with roughly 400 problems designed to teach the subject.  NSF funded, released as open source.

\item {\sl Elementary Number Theory: Primes, Congruences, and Secrets}, William Stein, \url{http://wstein.org/ent/}.\\
Published by Springer-Verlag, will be available with open license in [[Month~Year????]].  [[Add capsule summary]]  [[Add extent of Sage usage (massive?)]]  [[Open license consistent with paragraph above?]]

\item {\sl Vector Calculus}, Michael Corral, \url{http://www.mecmath.net/}.\\
Standard treatment of multivariate calculus: vector calculus, partial derivatives, multiple integrals, theorems of Green and Stokes.  Impressive graphics.

\item {\sl Trigonometry}, Michael Corral, \url{http://mecmath.net/trig/}.\\
An in-depth, comprehensive and unified treatment of the typical high-school topics.  Impressive graphics.

\item {\sl Cryptography}, David Kohel, \url{http://echidna.maths.usyd.edu.au/~kohel/tch/Crypto/crypto.pdf}.\\
Classical ciphers and their cryptanalysis, modern stream ciphers and public-key cryptography.  Significant appendices on Sage.

\end{enumerate}

\subsection{Translation to Sage of Mathematica, Matlab, and Maple code for existing books}

[[RAB: This will be "by hand"?  Don't imagine it can be automated?]]

\subsection{Building a Textbook Community}

Several successful conversions or supplements will demonstrate the range of possibilities and allow the necessary experience to design an automated conversion and production system.  This will allow other authors to easily parlay just a working knowledge of \LaTeX\ to the ability to create folders of interactive Sage enhanced worksheets.  Workshops and grants can help and encourage other authors to learn the technical skills, and the possibilities afforded by this new approach, while creating or converting their own textbooks or supplements.

This could be accomplished through
\begin{itemize}
\item A workshop sponsored by AIM.
\item A SageDays devoted to textbook conversion and supplement creation.
\item A mini-course at the Joint Meetings or MathFest.
\item Mini-grants for people to convert textbooks and course notes to Sage
\item Mini-grants for people to write course materials for Sage, such as interactive demonstrations (``interacts'').
\end{itemize}

\subsection{Summer Workshops}

[[RAB: could this be merged with the above list?]]

Summer workshops for each year after the first for faculty to write curriculum materials using Sage, i.e., Sage EduDays :)

    * Regional workshops--there are a lot of smaller schools in Iowa, for example. It might be viable to invite people from smaller schools in the area. Also, there are lots of faculty in universities in the Southeast U.S. from schools with large minority populations that were exposed to Sage at AIM; maybe a regional conference there would be a big hit.

    *      National workshops (via AIM, if appropriate?)--invite people from all over


```