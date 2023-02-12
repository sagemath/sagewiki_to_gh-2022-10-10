

```txt
\section{Introduction}

% Begin Rob's intro
Sage is open source mathematics software designed as a viable alternative to proprietary computer algebra systems.  Our project leverages the inherent advantages of Sage as open source software together with a growing list of open source mathematics textbooks to further lower the barriers preventing students from benefiting from the powerful mathematical insights afforded by computational tools, thus delivering on the promise of computer algebra systems to significantly improve secondary and undergraduate mathematics education.  We will accomplish our goal by creating new curricular materials and modifying existing open source materials  while continuing to develop Sage to directly support its use in undergraduate  and secondary school education.  More specifically, we will:
%
\begin{itemize}
%
\item
Convert selected open source mathematics textbooks to Sage-enhanced electronic versions to model how incorporating live code and interactive demonstrations can bring the full power of a computer algebra systems to the student {\em from within the book}.
%
\item 
Create new subject-specific guides in traditional undergraduate subject areas to assist teachers with integrating the use of Sage into existing courses.
%
\item 
Create and modify interactive demonstrations for classroom use, organized in a way that makes them easy to locate, and with quality standards (ongoing test suites) that provide instructors the confidence to use these demonstrations in the classroom.
%
\item 
Extend and improve Sage's capabilities in certain subject areas to improve ease-of-use by students and in the classroom.
%
\item
Improve Sage's infrastructure in areas directly related to undergraduate and secondary school education, such as existing mechanisms for collaboration and sharing of computational experiments, and the framework for quickly and easily building interactive demonstrations.
%
\item
Work with and provide support for selected faculty to create a model of how to bring Sage into any undergraduate and secondary school classroom.  At least one such classroom shall come from a high needs area (does this have to be a high school or can it be a community college).
\item 
Other major, major thrusts of our work?
%
\end{itemize}

\subsection{Why Sage?}

Computer algebra systems (CAS) have held great promise for education since their first appearance in the 1960s (Reduce, Macsyma) and accelerated with the introduction of Maple in the early 1980s and Mathematica in the late 1980s.  Currently, CAS are widely found in the undergraduate classroom and a considerable amount of mathematics educations research has focused on the use of CAS in the learning of undergraduate mathematics (cite survey article by K. Heid or a more recent article).   However, in many cases the technology has driven the curriculum (cite Calculus \& Mathematica project) and the result has not been the transformative effect on mathematics education that was envisioned.  There is inherent conflict of interest in the promotion and licensing of proprietary systems, since commercial software views students as future customers and curricular materials are often oriented towards certain industries.

An open source approach to software for educational use, such as the approach Sage developers have taken, has many natural advantages.  Sage has many impressive capabilities, a large number of which are a direct result of its adherence to the central philosophies of open source.  For example, consider the choice of the open source language Python, one of the most popular scripting languages today, to unify the various parts of Sage.  This choice then allows Sage to easily integrate the many impressive scientific packages written in Python.  But more importantly, Python becomes the programming language for users within Sage, rather than a one-off language more typical of proprietary systems.  A user with knowledge of Python is ready to be productive in Sage immediately, while a student new to programming receives a basic education in Python as a by-product of learning Sage --- a skill that is readily transferable to a wide variety of applications in mathematics, science and engineering.

The genius of Sage is the way it unifies over one hundred mature, best-of-breed, open source packages for specific types of computations (e.g.\ MPIR for multi-precision integer and rational arithmetic, or IML for integer matrix computations) or complete libraries for specific areas of mathematics (e.g.\ GAP for group theory, FLINT for number theory, R for statistics) into a single open source system with a consistent interface (Mention SciPy, NumPy instead of some these packages - what are the most recognizable?).  Sage is ``building the car, not reinventing the wheel.''  This unification greatly simplifies the use of mathematical software for both students and teachers.  Further, with an open-source license, Sage removes substantial barriers to classroom use of computer algebra systems such as purchase cost, restrictive licensing, expensive hardware, and limited availability on mobile devices.

Sage's notebook interface is perhaps its most impressive feature, especially for use in education.  Much of the power of the Sage notebook is a direct result of decisions to employ open software and open standards in its design.  From within a standard web browser, a user can create a ``worksheet'' and interactively edit and execute new commands, with computations performed remotely on a server, and output returned to the worksheet.  The interface makes it easy to view graphical output, annotate a worksheet, receive help on commands, browse the manuals, browse the source code, manage multiple worksheets, publish completed worksheets, or share and collaborate on worksheets.  The Sage project hosts a public Sage server at \url{sagenb.org} which currently has over 20,000 accounts.  So right now, anybody in the world with a network connection can productively harness the full power of Sage --- even with minimal hardware or mobile devices, such as an under-powered desktop, a laptop, netbook, smartphone, or cell phone.  Wide-open notebook servers continue to appear throughout the world [Hungary 2009/11/25, http://sage.math.u-szeged.hu/], while many more run behind campus firewalls for dedicated use.

Materials enhanced or created in our project will of course be distributed with open licenses and made freely available as part of Sage's website (XX visitors a month), or as part of Sage itself (over 6,000 downloads a month).  But more importantly, the process for creating these materials will be made as easy as possible for authors, and workshops will be organized to train new authors and further refine the process of creating Sage-enhanced textbooks, guides and demonstrations.

The question this project addresses is: can an open-source program for mathematics, integrated into traditional curricular materials, make it easier for students and faculty to realize the promise of symbolic and exact computations to better learn and understand the main topics of undergraduate mathematics?  Our experience with other systems, and our recent work with Sage, lead us to believe the answer is ``yes.''  We will study this question, both through evaluations of the specific activities and projects proposed here, and as a more general research question about mathematics education.
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
\item  (can do examples too large to do by hand, concentrating on the concepts rather than arithmetic)
With computational tools, modern mathematics has become a more experimental process, but with proof still as the ultimate standard.  For students, the ability to quickly compute examples larger than those traditionally possible by hand computations, leads to better understanding of the theory.  Long sequences of progressively larger examples also allows a teacher to easily introduce students to an experimental process of formulating conjectures.  Powerful computational liberate students from tedious calculations and allow them to concentrate on underlying concepts.
\item  Demonstrated higher grades for lots of different kinds of students
\end{itemize}


\subsubsection{Disadvantages}

costs, driven by technology, radical departure from traditional teaching\ldots{}


\begin{itemize}
\item (Deficiencies in software (like no algebra, vector fields, etc.))  Mathematics software with strong symbolic capabilities still ignore the inherent structure of mathematical objects.  For example, Mathematica returns the null space of a matrix as a list of basis vectors, whereas Sage returns a vector space, which acts just like a vector space through natural operations on this object.  (A similar Maple example? Vector fields?)
\item  Software such as Matlab and Octave have a totally numerical foundation which is totally inappropriate (or sometimes incorrect) for teaching basic concepts with exact relationships to a student new to the topic.
\item Despite providing educational and student pricing, purchase and renewal of commercial software can still be an expensive barrier to starting with a CAS, or staying current with the most recent version.  (State the obvious? Sage can be used over the Internet, or installed, upgraded at any time.)
\item Licensing of commercial software ties a student to a physical location, or to a campus server, or with a student copy to a particular personal machine.  A Sage server can be accessed with any network connection, or a local copy can be installed on any number of machines.
\item  Driven by technology more than by curriculum
\item  Costs (lots of) money (so diverse institutions/high schools may have trouble affording it). Not just software, but also the style of having every class in the computer lab not every college campus can transition every class to a computer lab.  At many institutions, purchasing computer software especially mathematical softwareis a significant burden, and Sage has helped address this problem.
\item  Radical departure in course style too radical for widespread adoption?
\end{itemize}



```