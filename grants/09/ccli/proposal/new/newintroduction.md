{{{

\section{Introduction}

% Begin Rob's intro
Sage is the open-source mathematics software designed as an alternative to proprietary computer algebra systems.  Its open-source design allows it to incorporate over one hundred mature packages that are best-of-breed for specific types of computations [Ed: think MPIR, FLINT] or specific areas of mathematics [Ed: think GAP, PARI, Singular].  The choice of Python as Sage's programming language makes it easy for developers to unify new Sage routines and the capabilities of other packages into an aesthetically consistent system and allows users to similarly mix many capabilities easily into a single sequence of commands.  Finally, the notebook interface provides an extremely intuitive way to harness all of the power of Sage, requiring little more than a standard web browser.

Our project begins with the natural advantage of easy and free access to Sage, and then leverages the notebook interface to integrate the computational power of Sage directly into traditional curricular materials across the undergraduate mathematics curriculum.  Computer algebra systems have held great promise for education since their appearance in the 1960's (Reduce, Macsyma) and accelerated with the introduction of Maple in the early 1980's and Mathematica in the late 1980's.  [Ed: one sentence documentation of general effectiveness of CAS, with a citation.]  However, in many cases the technology has driven the curriculum (cite Calculus \& Mathematica project) and the result has not been the transformative effect on mathematics education that was envisioned.

A major activity of our proposal is to convert existing [mature] open-source mathematics textbooks into the format of a Sage worksheet, which can then be read in the Sage notebook.  It will then be possible to include Sage code and demonstrations directly into the book with the result that they are runnable and editable {\em as the student reads the book}.  So a student might read a Sage worksheet that is the section of their linear algebra textbook on row-reducing a matrix, where the conversion to a worksheet will have preserved all of the mathematical typesetting of the textbook and the notebook interface will faithfully render it.  That could be followed by an interactive Sage demonstration where clicking a button single-steps through row-reducing a random (nice) matrix.  Next could be the relevant Sage code for creating a matrix and row-reducing it, with the invitation to edit the code and try other matrices.  Perhaps the student would be invited to code the algorithm for row-reduction in Python, {\em right there in their book}, checking their results against Sage's results, and saving the exercise as a permanent part of their copy of the book, annotated with a discussion of the most significant aspects of their implementation.  Exercises in this section might include a generator that uses Sage to create random matrices that are particularly amenable to row-operations, either by hand or by Sage.

The licensing terms for Sage (the GNU Public License, GPL) give it an inherent freedom, but it is also free, as in no-cost.  This removes the first barrier to using such a system with a course.  It is also then possible to set up a Sage server without regard to the hassles of licensing terms or restrictions on access.  The Sage project itself, with hardware donated by Sun Microsystems, makes just such a server available worldwide, providing Sage to over xx,000 users [Ed: exact numbers of sagenb.org accounts goes here] and many campuses have started their own servers (include list from sage-edu query somewhere in proposal as perhaps an appendix?).  Then the only program a student or teacher needs is a familiar web-browser.  The notebook interface handles communication with the server, passing textual output and graphics back to the notebook.  Since the computations are performed on the server, the notebook can run on minimal hardware such as older desktop machines, laptops, netbooks, and even cell phones [Ed: include "such as iPhone, Android phones"?].  The notebook by itself is an amazing project, with impressive capabilities for editing code, viewing graphic 3D output and annotating results.  Built-in tools for collaboration make it easy to publish and share one's work.

We propose to further lower the barriers to integrating a CAS into the undergraduate mathematics curriculm by enhancing traditional materials and creating new ones, all meant to provide teachers with a more gradual path towards incorporating a CAS into the curriculum:
\begin{itemize}
\item Textbooks as Sage worksheets, with live Sage code and demonstrations.
\item Subject-specific guides, with topics organized in a traditional order, for faculty who choose to use a traditional textbook.
\item High-quality, vetted, demonstrations for in-class use.
\end{itemize}
Further, experience has shown that using Sage in the classroom suggests improvements and additions to the command set which make Sage even more useful.  This is an inherent strength of most any open-source project --- it is easy for users to suggest improvements, and in many cases these users are able to contribute the necessary changes.  With frequent new releases available for download, these changes are made available rapidly.  So as these new materials are prepared and disseminated, there will be natural opportunities to make further improvements motivated by classroom use.  Similarly, there are improvements in Sage as a system which can greatly enhance its appeal for use in classes, such as mechanisms for collecting and returning homework submitted as worksheets.

Materials enhanced or created will of course be distributed with open licenses and made freely available as part of Sage's website.  But more importantly, the process for creating these materials will be made as easy as possible for authors, and workshops will be organized to train new authors and further refine the process of creating Sage-enhanced textbooks, guides and demonstrations.

So the question this project asks is: can an open-source program for mathematics, integrated into traditional curricular materials, make it easier for students and faculty to realize the promise of symbolic and exact computations to better learn and understand the main topics of undergradute mathematics?  Our experience with other systems, and our recent work with Sage, lead us to believe the answer is ``yes.''  We will study this question, both through evaluations of the specific activities and projects proposed here, and as a more general research question about mathematics education.
% End Rob's intro


\subsection{Textbooks and curricula in the computer age}



\subsubsection{Previous approaches}

Mathematica and calculus, Banchoff (Brown), etc.  Successful approaches exist, but they have not been widely adopted

Cited previous research should back up the advantages and disadvantages below.

We need to back up the idea that using CAS in teaching is effective (some reviewers may doubt it).

\subsubsection{Advantages}

higher test scores, etc.

\begin{itemize}
\item  inquiry-based learning
\item  can do examples too large to do by hand, concentrating on the concepts rather than arithmetic
\item  Demonstrated higher grades for lots of different kinds of students
\end{itemize}


\subsubsection{Disadvantages}

costs, driven by technology, radical departure from traditional teaching\ldots{}


\begin{itemize}
\item  Deficiencies in software (like no algebra, vector fields, etc.) 
\item  Driven by technology more than by curriculum
\item  Costs (lots of) money (so diverse institutions/high schools may have trouble affording it). Not just software, but also the style of having every class in the computer labnot every college campus can transition every class to a computer lab.  At many institutions, purchasing computer softwareespecially mathematical softwareis a significant burden, and Sage has helped address this problem.
\item  Radical departure in course styletoo radical for widespread adoption?
\end{itemize}



}}}
