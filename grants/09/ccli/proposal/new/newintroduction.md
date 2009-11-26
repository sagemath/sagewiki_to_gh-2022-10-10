{{{

\section{Introduction}

% Begin Rob's intro
Sage is open source mathematics software designed to become a viable alternative to proprietary computer algebra systems.  The genius of Sage is the way it unifies over one hundred mature, best-of-breed, open source packages for specific types of computations (e.g.\ MPIR for multi-precision integer and rational arithmetic, or IML for integer matrix computations) or complete libraries for specific areas of mathematics (e.g.\ GAP for group theory, FLINT for number theory, R for statistics) into a single open source system with a consistent interface.  Sage is ``building the car, not reinventing the wheel.''  This unification greatly simplifies the use of mathematical software for both students and teachers.  Further, with an open-source license, Sage removes substantial barriers to classroom use of computer algebra systems such as purchase cost, restrictive licensing, expensive hardware, and limited availability on mobile devices.

This project will leverage the inherent advantages of Sage as open source software and further lower the barriers preventing students from benefiting from the powerful mathematical insights afforded by computational tools, thus delivering on the promise of computer algebra systems to significantly improve undergraduate mathematics education.  This will be accomplished by the modification and creation of curricular materials, along with continued development of Sage in associated ways that directly support its use in undergraduate education.  More specifically, we will:
%
\begin{itemize}
%
\item Convert selected open source mathematics textbooks to Sage-enhanced electronic versions, incorporating live code, interactive demonstrations and the full power of Sage, all available to the reader {\em from within the book}.
%
\item Create new subject-specific guides in traditional undergraduate subject areas to assist teachers with integrating the use of Sage into existing courses.
%
\item Create and modify interactive demonstrations for classroom use, organized in a way that makes them easy to locate, and with quality standards (ongoing test suites) that provide instructors the confidence to use them in class.
%
\item Extend and improve Sage's capabilities in certain subject areas to improve ease-of-use by students and in the classroom.
%
\item Improve Sage's infrastructure in areas directly related to undergraduate education, such as existing mechanisms for collaboration and sharing of computational experiments, and the framework for quickly and easily building interactive demonstrations.
%
\item Other major, major thrusts of our work?
%
\end{itemize}

Computer algebra systems have held great promise for education since their appearance in the 1960's (Reduce, Macsyma) and accelerated with the introduction of Maple in the early 1980's and Mathematica in the late 1980's.  [Ed: one sentence documentation of general effectiveness of CAS, with a citation.]  However, in many cases the technology has driven the curriculum (cite Calculus \& Mathematica project) and the result has not been the transformative effect on mathematics education that was envisioned.  There is an inherent conflict of interest in the promotion and licensing of proprietary systems, since commercial software views students as future customers and curricular materials are often oriented towards certain industries.

We believe an open source approach to software for educational use has many natural advantages.  Sage has many impressive capabilities, many of these a direct result of its adherence to the central philosophies of open source.  For example, consider the choice of the open source language Python, one of the most popular scripting languages today, to unify the various parts of Sage.  This choice then allows Sage to easily integrate the many impressive scientific packages written in Python.  But more importantly, Python becomes the programming language for users within Sage, rather than a one-off language more typical of proprietary systems.  A user with knowledge of Python is ready to be productive in Sage immediately, while a student new to programming receives a basic education in Python as a by-product of learning Sage --- a skill that is readily transferable to a wide variety of applications in mathematics, science and engineering.

Sage's notebook interface is perhaps its most impressive feature, especially for use in education.  Much of the power of the Sage notebook is a direct result of decisions to employ open software and open standards in its design.  From within a standard web browser, a user can create a ``worksheet'' and interactively edit and execute new commands, with computations performed remotely on a server, and output returned to the worksheet.  The interface makes it easy to view graphical output, annotate a worksheet, receive help on commands, browse the manuals, browse the source code, manage multiple worksheets, publish completed worksheets, or share and collaborate on worksheets.  The Sage project hosts a public Sage server at \url{sagenb.org} which currently has over 20,000 accounts.  So right now, anybody in the world with a network connection can productively harness the full power of Sage --- even with minimal hardware or mobile devices, such as an under-powered desktop, a laptop, netbook, smartphone, or cell phone.  Wide-open notebook servers continue to appear throughout the world [Hungary 2009/11/25, http://sage.math.u-szeged.hu/], while many more run behind campus firewalls for dedicated use.

Materials enhanced or created will of course be distributed with open licenses and made freely available as part of Sage's website, or as part of Sage itself (over 6,000 downloads a month).  But more importantly, the process for creating these materials will be made as easy as possible for authors, and workshops will be organized to train new authors and further refine the process of creating Sage-enhanced textbooks, guides and demonstrations.

So the question this project asks is: can an open-source program for mathematics, integrated into traditional curricular materials, make it easier for students and faculty to realize the promise of symbolic and exact computations to better learn and understand the main topics of undergradute mathematics?  Our experience with other systems, and our recent work with Sage, lead us to believe the answer is ``yes.''  We will study this question, both through evaluations of the specific activities and projects proposed here, and as a more general research question about mathematics education.
% End Rob's intro


\subsection{Textbooks and curricula in the computer age}



\subsubsection{Previous approaches}

(Mathematica and calculus)
As the name implies, Calculus and Mathematica is a project from the early 1990's to teach calculus with the Mathematica program, using Mathematica notebooks as the primary text.  While this approach sounds similar to our proposal for textbooks, the difference is that Calculus and Mathematica was designed for students to work exclusively on exercises while sitting in a computer lab.  It was radically different for a traditional course, and the curriculm wwas driven by what Mathematica was capable of doing.  Today, this seems to be a worthwhile approach for distance learning, especially in small communities where a high school cannot provide calculus courses.

Our approach is to instead integrate Sage into traditional texts, and create curricular materials to {\em support and enhance} the undergraduate mathematics curriculum appropriately, without letting the existence of the technology {\em dictate} the topics that are taught.


Banchoff (Brown), etc.  Successful approaches exist, but they have not been widely adopted

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
