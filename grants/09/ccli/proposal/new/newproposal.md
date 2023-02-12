

```txt
%Some useful commands:
\renewcommand{\thefootnote}{\roman{footnote}}
\newcommand{\note}[1]{\footnote{#1}\marginpar[\flushright \fbox{\textbf{\thefootnote}}]{\fbox{\textbf{\thefootnote}} }}
% To make all notes ignored, uncomment the following command.
%\renewcommand{\note}[1]{}

% \newcommand{\marginnote}[1]{\marginpar[\flushright #1]{#1}}

% \usepackage[12hr]{datetime}
% \newdateformat{draftdate}{%
% \shortdayofweekname{\THEDAY}{\THEMONTH}{\THEYEAR}, %
% \THEDAY\ \shortmonthname[\THEMONTH] \THEYEAR}
% \draftdate
% \usepackage{eso-pic}
% \AddToShipoutPicture{\put(10,15){\small Draft: \today\ at \currenttime }}



\section{Project Description}

Our project will create, implement, and evaluate a sustainable model
for integrating computer algebra systems with traditional curricular
materials for the undergraduate classroom.  We will use open-source
tools such as Sage and open curricular materials to accomplish this.

We will accomplish our goal by modifying existing open source
materials and creating new curricular materials while continuing to
develop Sage to directly support its use in undergraduate education.
This project will leverage the inherent advantages of Sage as a free
open-source computer algebra system (CAS) together with a growing list
of open mathematics textbooks to deliver on the promise of CAS to
significantly improve undergraduate mathematics education.  We will
also implement this model in diverse classrooms and institutions,
refining and evaluating the model with an eye towards sustainability.
More specifically, to build and evaluate a model for integrating CAS
with traditional curricular materials in the classroom, we will:

\begin{itemize}
\item integrate Sage with existing mature textbooks and create other
  Sage-enhanced curricular materials, building a model and tools
  allowing others to easily do the same;

\item partner with diverse institutions to test and refine this model
  and materials in a wide variety of courses while providing support
  for teachers;

\item conduct formative and summative evaluation to determine the
  effectiveness of our model and materials and the impact on pedagogy
  and student learning.
\end{itemize}

\subsection{Imagine this}

A student is learning about row-reducing a matrix in a beginning
linear algebra course.  The electronic version of their textbook is an
online Sage\note{We avoided mentioning Sage specifically below.
  Should we not mention Sage yet (and just say later that Sage most
  naturally fits the model)?} worksheet they can view from anywhere in
the world.  Mathematical equations, in publication-quality formatting,
describe the procedure.  An interactive demonstration, embedded in the
text where an example normally would be, allows the student to step
through row-reducing a small nice matrix, generated on-the-fly.  A
second example lets the student choose the row operation to apply at
each step of the reduction.  In both cases, each operation is notated
and illustrated in color in the matrix.  Another example shows the
student how to use a built-in command to row-reduce a matrix.  With a single
click, the student creates an empty code cell under the example to
experiment with the command.

In class, the instructor does one simple example on the board.  Then
the instructor opens the online CAS and has the students guide the
choice of row operations at each step for several example matrices of
increasing complexity.  At the end of class, the instructor clicks a
button to publish the class work.  After class, students view the
worksheet as they review their notes.  They can also, with a click,
copy the worksheet into their notes, as well as annotate or change it.



The exercises include an interactive problem generator that creates
matrices of student-specified sizes and complexity for the student to
row-reduce.  There is a ``Solution'' button which generates a
step-by-step solution.  A group exercise asks students to
collaboratively write and test a short function to implement
row-reduction using row operations.  The student clicks a button to
open a new Sage worksheet and types in a few lines using Sage matrices
and commands from Python, the easy-to-use and industry-standard
language upon which Sage is built.  The student evaluates the code
with a single click.  Satisfied with their work, the student clicks
another button, publishing the worksheet to the rest of the group for
testing.  Later that evening, the student checks the worksheet and
sees that other students have tested the function, found a typo, and
fixed it.

An advanced exercise guides a student through investigating numerical
issues that arise in row reduction.  By changing one parameter within
a command, the matrices track numeric error bounds via interval
arithmetic, and the student discovers that numerical errors can be a
big issue for some matrices.

The next week, the instructor goes to
the online server and looks over all of the published worksheets for
the group projects.  The instructor annotates each worksheet online,
using an embedded word processor that supports mathematical
typesetting.

The instructor writes a quiz over row-reduction.  Inside of the
\LaTeX{} code, the instructor embeds a CAS command to make a simple
matrix that serves as the answer to a quiz problem.  The instructor
then uses the CAS (from within his \LaTeX{} document) to convert the
answer matrix to a matrix for a routine quiz problem that involves
only simple operations to row-reduce.  The question matrix is
automatically incorporated in the printed quiz, while a detailed
solution is automatically incorporated in the answer key.


\subsection{Previous approaches: Why Sage?}

Sage is the most natural computer algebra system to realize the vision
outlined above.  The open development model, the notebook and \LaTeX{}
interfaces, the underlying language and philosophy behind how Sage is
built, and the free nature all contribute toward this.

\begin{itemize}
\item Open development model - Like mathematics, the Sage model for
  development is driven by collaboration and openness\note{is this a
    controversial statement about mathematics?}.  Just as research
  topics drive the direction of pure mathematics, the curriculum and
  needs of the users directly drives the development.  As an example
  of how teaching has driven the development, one of the investigators
  on this grant needed a 3D vector field plotting function for his
  multivariable calculus class.  He wrote a quick version of such a
  function (easy to do in Sage), and posted it for his class to use.
  In a closed proprietary system, that's where things likely would
  have stopped.  However, encouraged by the open Sage model and
  friendly community that encourages contributions from users, he
  posted the function up on the Sage ticket tracking site (where all
  code contributions and bug reports are tracked).  A long-time Sage
  developer quickly suggested improvements which made the function
  much more efficient.  Later, when a critical part of Sage was being
  overhauled, another developer specifically changed the initial
  implementation so functions like the 3d vector field plot code would
  be easy to use and read.  A user somewhere in the world (a student
  somewhere??) suggested a nice enhancement and posted their
  modifications on the mailing list.  The investigator recently taught
  the same class again and needed the function again.  He incorporated
  the good ideas from the various sources into his function and posted
  a documented, efficient version of the function to the trac ticket
  and asked for review.  Another Sage developer realized that he also
  would need this function in the next few weeks, and reviewed the
  code immediately.  The function was incorporated into Sage and
  released with the next version the next week.  Now not just the
  original students benefit from the time, but the collaborative
  effort of at least 5 people from around the world directly led to a
  function that will serve all students and teachers using
  Sage.\note{Check all of these details.}

  Another example is the statistics functionality that (may?) be
  merged from the people in Europe that are using Sage to teach
  statistics??


\item Notebook and \LaTeX{} interfaces---we need to mention the
  \LaTeX{} interface, since that is how we are going to be doing the
  textbooks, and what makes it so easy to incorporate Sage into
  traditional materials.

\item The philosophy---here we mention the ``genius of Sage'' of
  building the car, plus we should mention that Python serves
  (literally) as the nuts-and-bolts of Sage, holding it all together,
  as well as the interface.


\item Free (and open-source)---mention the restrictive licensing and
  fees associated with commercial systems.  Also talk about how this
  lets us get into \emph{diverse} institutions.
\end{itemize}

Computer algebra systems (CAS) have held great
promise for education since their first appearance in the 1960s
(Reduce, Macsyma) and accelerated with the introduction of Maple in
the early 1980s and Mathematica in the late 1980s.  Currently, CAS are
widely found in the undergraduate classroom and a considerable amount
of mathematics educations research has focused on the use of CAS in
the learning of undergraduate mathematics (cite survey article by
K. Heid or a more recent article).  However, in many cases, computer
algebra systems have driven the curriculum (cite Calculus \&
Mathematica project) and the result has not been the broad
transformative effect on mathematics education that was envisioned.
The closed development process creates a high barrier for teachers and
students to alter or extend the software to meet curriculum needs.
For example, external extensions to proprietary systems, such as
libraries or packages, can extend proprietary systems, but must be
purchased, distributed, and installed by every end-user.  However an
open development process, such as the open-source model that Sage
follows, allows students and faculty to shape the core technology in a
timely fashion to support the transformation of teaching and learning
of mathematics on a broad scale.  Open source software, such as Sage,
allows the teaching and learning of mathematics to drive the
technology, rather than the technology driving the teaching and
learning.





The genius of Sage is the way it unifies over one hundred mature,
best-of-breed, open source packages, each excelling at specific types
of computations (e.g.\ MPIR for multi-precision integer and rational
arithmetic, or IML for integer matrix computations) or complete
libraries for specific areas of mathematics (e.g.\ GAP for group
theory, FLINT for number theory, R for statistics) into a single open
source system with a consistent interface (Mention SciPy, NumPy
instead of some these packages - what are the most recognizable?).
Sage is ``building the car, not reinventing the wheel.''  This
unification greatly simplifies the use of mathematical software for
both students and teachers.  Further, with an open-source license,
Sage removes substantial barriers to classroom use of computer algebra
systems such as purchase cost, restrictive licensing, expensive
hardware, and limited availability on mobile devices. MENTION PYTHON
HERE.\note{ An open source approach to software for educational
  use, such as the approach Sage developers have taken, has many
  natural advantages.  Sage has many impressive capabilities, a large
  number of which are a direct result of its adherence to the central
  philosophies of open source.  For example, consider the choice of
  the open source language Python, one of the most popular scripting
  languages today, to unify the various parts of Sage.  This choice
  then allows Sage to easily integrate the many impressive scientific
  packages written in Python.  But more importantly, Python becomes
  the programming language for users within Sage, rather than a
  one-off language more typical of proprietary systems.  A user with
  knowledge of Python is ready to be productive in Sage immediately,
  while a student new to programming receives a basic education in
  Python as a by-product of learning Sage --- a skill that is readily
  transferable to a wide variety of applications in mathematics,
  science and engineering.  }


Sage's notebook interface is perhaps its most impressive feature,
especially for use in education.  Much of the power of the Sage
notebook is a direct result of decisions to employ open software and
open standards in its design.  From within a standard web browser, a
user can create a ``worksheet'' and interactively edit and execute new
commands, with computations performed remotely on a server, and output
returned to the worksheet.  The interface makes it easy to view
graphical output, annotate a worksheet, receive help on commands,
browse the manuals, browse the source code, manage multiple
worksheets, publish completed worksheets, or share and collaborate on
worksheets.  The Sage project hosts a public Sage server at
\url{sagenb.org} which currently has over 20,000 accounts.  So right
now, anybody in the world with a network connection can productively
harness the full power of Sage --- even with minimal hardware or
mobile devices, such as an under-powered desktop, a laptop, netbook,
smartphone, or cell phone.  Wide-open notebook servers continue to
appear throughout the world [Hungary 2009/11/25,
http://sage.math.u-szeged.hu/], while many more run behind campus
firewalls for dedicated use.


Materials enhanced or created in our project will of course be
distributed with open licenses and made freely available as part of
Sage's website (XX visitors a month), or as part of Sage itself (over
6,000 downloads a month).  But more importantly, the process for
creating these materials will be made as easy as possible for authors,
and workshops will be organized to train new authors and further
refine the process of creating Sage-enhanced textbooks, guides and
demonstrations.



\section{Implementation}

One of our main goals is to provide a broad, positive influence on the teaching and learning of mathematics in the classroom with CAS-enhanced materials.
The implementation of Project Sage will consist of three coordinated efforts: (1) creating Sage-enhanced curricular materials, (2) providing the Sage infrastructure to support these materials, and (3) working with and providing classroom support for teachers using these materials in the classroom for the first time.

\subsection{Creating curricular materials}

\begin{itemize}
\item
Convert selected open source mathematics textbooks to Sage-enhanced electronic versions, modeling how incorporating live code and interactive demonstrations can bring the full power of a computer algebra systems to the student {\em from within the book}.
\begin{itemize}
    \item  [William] William's number theory book.
    \item  [Rob] Rob's Linear algebra textbook. Do this first because (a) already has some Sage, (b) already has been designed to include "computational notes," (c) linear algebra in Sage is fairly mature, (d) I'm most familiar with the source for this one. 

    \item  [Rob] Augment Tom's abstract algebra book, with Tom's assistance/involvement. I have a pile of stuff now on group theory, and ideas for new Sage functionality here. I expect to generate a lot for rings and fields Spring 2010 when I teach that material from Tom's book. 
   \item  [Rob] Add Sage hints/experiments to Bogart's combinatorics problem book. Despite a GFDL license the source is not posted, and my one request has seen no answer. So I don't know how much work it will be to "clean-up" the source, etc. A former student, now on the faculty at Seattle U may be interested in being involved with this (I'm not suggesting adding him to the grant). 
\end{itemize}

%
\item 
Create new subject-specific guides in traditional undergraduate subject areas to assist teachers with integrating the Sage into existing courses.
%
\item 
Create an organized and searchable library of interactive online demonstrations for classroom use
\end{itemize}


\subsubsection{Infrastructure for textbooks}

Describe the system for converting textbooks to Sage; everyone will be able to do it!

Many mathematicians and scientists use the \LaTeX{} language to create technical articles and books.  As a result, there is an impressive array of extensions to \LaTeX{}.  Sage also includes  extensive support for \LaTeX{}, through every mathematical object having a \LaTeX{} representation, and the use of jsMath to render mathematics beautifully in a Sage worksheet (within a standard web browser).  Furthermore, the Sage notebook interface allows a user to add new text, including \LaTeX{} code for mathematics.

This project proposes to convert open-source textbooks into folders of interactive Sage worksheets, or to create Sage-enhanced supplements for existing open-source textbooks.  A Sage worksheet is a combination of input and output cells, optionally with text (HTML) inbetween.  The tex4ht translator (an NSF funded project) can convert extremely complex \LaTeX{} into jsMath, which can be converted to the Sage worsheet format with extremely minimal modifications.  It is possible to insert Sage code into a \LaTeX{} source file, and have it migrate to the eventual Sage worksheet as an input cell.  A pilot project, a fourteen page primer on group theory designed to accompany Judson's abstract algebra text, clearly shows the feasibility of this process and clearly identifies the technical changes needed to make the process routine for an author.

The end result is a folder of Sage worksheets, each a mixture of text, high-quality typeset mathematics, Sage input cells and Sage interactive demonstrations.  

Also, the plan for bundling a collection of worksheets into a more high-level document (basically a packaged version of the Sphinx documentation).

\subsubsection{Converting specific textbooks}

A list of specific textbooks we will do.

Each of the textbooks below is licensed with a GNU Free Documentation Licenses (GFDL) or a Creative Commons License that allows anyone to distribute modified versions, typically only requiring attribution of the original author's work and the use of the same license.



\begin{itemize}
\item  \emph{A First Course in Linear Algebra}, Robert Beezer, \url{http://linear.pugetsound.edu/}. Second-year university level text, concentrating on understanding how to understand and formulate proofs.  Used at thirteen schools since Fall~2007.  Contains some Sage commands.
\item  \emph{Abstract Algebra: Theory and Applications}, Tom Judson, \url{http://abstract.ups.edu/}. Standard upper-division treatment of groups, rings, domains, fields, Galois Theory.  Published commercially in 1992, released as open source in 2007.  Used by seven schools in its first year available.  Supplement describes group theory in Sage.
\item  \emph{Combinatorics Through Guided Discovery}, Kenneth Bogart, \url{http://www.math.dartmouth.edu/news-resources/electronic/kpbogart/}. Problem book in combinatorics with roughly 400 problems designed to teach the subject.  NSF funded, released as open source.
\item  \emph{Elementary Number Theory: Primes, Congruences, and Secrets}, William Stein, \url{http://wstein.org/ent/}. Published by Springer-Verlag, will be available with open license in  Month~Year????.   Add capsule summary, Add extent of Sage usage (massive?)Open license consistent with paragraph above?
\item  \emph{Vector Calculus}, Michael Corral, \url{http://www.mecmath.net/}. Standard treatment of multivariate calculus: vector calculus, partial derivatives, multiple integrals, theorems of Green and Stokes.  Impressive graphics.
\item  \emph{Trigonometry}, Michael Corral, \url{http://mecmath.net/trig/}. An in-depth, comprehensive and unified treatment of the typical high-school topics.  Impressive graphics.
\item  \emph{Cryptography}, David Kohel, \url{http://echidna.maths.usyd.edu.au/~kohel/tch/Crypto/crypto.pdf}. Classical ciphers and their cryptanalysis, modern stream ciphers and public-key cryptography.  Significant appendices on Sage.
\item Could we add my Riemann Hypothesis book with Barry Mazur?   http://wstein.org/rh/  It's aimed at undergrads, but isn't a traditional textbook by any stretch.
\item \emph{Numerical Analysis}, Steven Pav, \url{http://scicomp.ucsd.edu/~spav/pub/numas.pdf} (course notes; small book length)
\item (A possibility:) http://www.math.duke.edu/education/calculustext/
\end{itemize}

\subsubsection{Other curricula material}

Other curricula material that we will convert; subject-specific tutorials, course notes, etc.

We propose to create subject specific tutorials to answer questions such as ``What are the Sage commands you need to know in order to do multivariate calculus?''  We propose to create a systematic and organized collection of subject specific tutorials and interacts to include with Sage.  Some work has been put forth in this (library of interacts, Georgia Sage Days Primers).  But there needs to be a lot more work and infrastructure in place to distribute these with Sage.  Maybe reference the Demonstrations project?

\begin{itemize}
\item

    [Jason and William] Iron out the infrastructure issues with Rob's book, and whatever writing we do on our own subject-specific tutorials.
          o Adapt notebook to collections of worksheets
                + Grouping worksheets (folders?)
                + Format for posting/moving (ie zipped, tar'ed) 
          o Cross-worksheet links
                + Must be portable, ie stable/functional after a move
                + Then needs support in tex4ht 
          o Define new Latex environments for...
                + Inline sage code
                + Live Sage code blocks (w/, w/out corresponding output)
                + Interacts
                + Coordinate this with Dan Drake's SageTeX 
          o Create a tex4ht mode to support above
                + Goal: run tex4ht on Latex souce, output is zipped-up worksheets
                + tex4ht now has a project page, Karl Berry is a TeX expert
                +

                  http://gna.org/projects/tex4ht/ 
          o Make a tex4ht spkg for others to use easily 


\item Subject-specific tutorials

    *

      Have a Sage EduDays (maybe at the very beginning of summer) where we invite several people to do projects over the summer to be class-tested after summer 2, before summer 3. 

    * Have another Sage EduDays where we invite some people back from the summer 2 EduDays to help teach a larger group about writing subject-specific curricula using Sage. In the classroom
    * Survey people about barriers to classroom use

* Sign up a few people to use Sage in the classroom. List a few names, and have a mechanism to advertise for more people. Give people a stipend to write a report of using Sage in a class for a semester. We will offer them technical support. 

\end{itemize}

\subsection{Sage in the Classroom}

The heart of Project Sage is getting Sage-enhanced materials in the
hands of teachers and students to assist them in the teaching and
learning of mathematics.  We will work with selected faculty at test
sites to provide support for using Sage in their classroom, for the
Sage-enhanced materials that we have created, and teach them how to
write their own materials.  We will recruit two cohorts for our test
sites with the first cohort beginning Summer 2011 and the second
beginning the following summer.  Several institutions have already
expressed interest.  [Note: We need to list some of these places or
even attach letters of support expressing interest.] The teachers at
our test sites will receive the following support.
\begin{itemize}

\item Teachers must commit to using Sage-enhanced materials in their
  classrooms for two years.

\item Teachers must write and test a Sage-enhanced model for the class
  that their are teaching.

\item Teachers must write and file a report at the end of each year of
  their two-year commitment.

\item After the first year, teachers must train and conduct
  departmental workshops on Sage and how to use Sage-enhanced
  materials in the classroom.  Teachers in the first cohort will also
  mentor teachers in the second cohort.

\end{itemize}
In return, Project Sage will offer the following support for our
teacher-participants.
\begin{itemize}

\item Teachers will receive a \$5000 per year stipend for
  participating in Project Sage.

\item Teachers will receive Sage support as well as support for Sage-
  enhanced materials and access to a Sage server.

\end{itemize}




\subsection{Sage infrastructure}

\begin{itemize}
\item 
Extend and improve Sage's capabilities in relevant subject areas to facilitate student learning and ease-of-use.
\item
Improve Sage's infrastructure in areas directly related to undergraduate education, such as teacher-student interaction, collaboration and organization of work, and the framework for quickly and easily building interactive demonstrations.

\end{itemize}

\begin{verbatim}
    * Target subject areas: linear algebra, undergraduate abstract algebra, discrete math, graphics, and calculus (then, as time permits, ODE, statistics?)
          o

            Full-scale use of nthiery's TestSuite system to make sure that things are consistent across object types with the same parent. (See, for example, http://trac.sagemath.org/sage_trac/ticket/6936)
          o Evaluate the intuitiveness and discoverability of the interfaces. Make sure the documentation in these areas is friendly to an undergraduate.
          o Go through a book in each of these areas and make sure that you can do exercises throughout the course with the available commands in an easy and intuitive fashion. 
    * Notebook features:
          o Ways for students and professors to organize their work (like tags on the the worksheets)
          o Ways for students and professors to interact with each other (e.g., submitting and grading assignments, collaborating, make comments on a worksheet, etc.)
                + A grading and annotating system for grading student worksheets. 
          o interactive javascript input widgets (hopefully we can do something with mathjax!)
          o flexible layout of interact controls and output 
    * Have a Sage Days for working on all of this sometime during the summer. 

    * Make any needed changes to the code/goals from Summer 1, based on feedback from classroom use during the intervening year, and ongoing feedback from people writing texts/tutorials in Summer 2.
    * Make it easy to set up a campus/personal sage server
          o Document the hardware requirements for various scenarios
          o Make the virtualbox image very polished, including graphical buttons to create and start/stop multiple servers (with full security options), backup notebook servers and restore notebook servers, upgrade Sage (maybe on only selected servers?), etc.
          o Carefully document any things that people need to understand about setting up the network for common scenarios.
          o

            Explore the option of a cloud instance (like an Amazon EC2 instance) that instructors could trivially start. See http://groups.google.com/group/sage-notebook/browse_frm/thread/620f9a40e5e9e488. 
          o Build the infrastructure for a library of curricula materials. This includes a library of interacts that you can browse/search, etc.
          o

            Have another Sage Days focused on these goals (separate from the EduDays focused on writing materials) 


    * Make any needed changes to the code/goals from Summer 1 and Summer 2, based on feedback from classroom use during the intervening year, and ongoing feedback from people writing texts/tutorials and starting campus Sage servers in Summer 3. My guess is that this will occupy most of the time spent in this area, as we will probably get lots and lots of feedback.
    * Have another Sage Days focused on these goals
    *

      Have a Sage Days for writing more CCLI grants or other education grants! Maybe a 
      Sage Days with the Moodle and WebWork people to talk about Sage integration 
      plans and grants for that. 
 
\end{verbatim}


\section{Evaluation}

The evaluation plan will measure the impact of Sage on undergraduate students, faculty, and the curriculum.  More specifically, the plan will include methodologies for measuring 
\begin{enumerate}

\item
the effectiveness of the project in developing Sage integrated curriculum materials such as Sage integrated with open source textbooks,

\item
the effectiveness of the use of Sage integrated  materials within the secondary and undergraduate classroom.

\end{enumerate}
The evaluation plan will also include a mechanism for tracking the implementation of Sage materials into the undergraduate and high school classroom by working with selected test sites.  We will create an online tracking system to ensure that timely and accurate qualitative and quantitative data are collected for all test sites, including demographic data and statistics as well as service obligations.

Experience with previous, similar projects guides the evaluation plan for this effort. [Note:  Add in the qualifications and experience of the evaluators.]  




\subsection{Formative Evaluation}

The formative component of the evaluation will focus on monitoring the quality of project activities, enabling the project to make mid-course corrections where needed and will address (1) the effectiveness of the project in developing Sage integrated materials. The summative component will focus on the impact of the project on the students and teachers at the test sites and will address (2) the effectiveness of the Sage-integrated materials in the undergraduate and high school classroom.  We plan to gather information on the contributions of the project to the field’s knowledge about future development of CAS integrated curricular materials.

The formative evaluation will be guided by the following questions:
\begin{enumerate}

\item
To what extent are Sage integrated materials and the support for these materials designed to the needs of the test sites.

\item
To what extent are the Sage integrated materials  transportable/scalable to other undergraduate and high school classrooms?

\end{enumerate}

The formative aspects of the evaluation will collect information on key aspects of the project to assess and provide feedback on the extent to which the project is designed and implemented to address important needs effectively. The key aspects of the project on which the evaluation will focus are: the  need for, and resources to support,  Sage enhanced materials in the classroom; and creation of materials that can be used more broadly in high school and university mathematics classrooms.  Classroom needs and resource commitments will be documented through teacher surveys and interviews.  The basis for selection of participating teachers and classrooms will be based on interest in the project and support from the teacher's institution.


\subsection{Summative Evaluation}

The summative evaluation will be guided by the following questions: 
\begin{enumerate}

\item
What is the impact of CAS integrated materials on teachers content knowledge, pedagogical content knowledge and classroom instructional practice?

\item
What is the impact of CAS integrated materials on in their own classrooms, campuses/districts on their students’ mathematics learning and participation in advanced-level mathematics courses?

\item
What is the ease of implementing CAS integrated materials on a wide scale basis?


\end{enumerate}

To measure these changes Dr.\ Judson will collaborate with the project director and other members of the project  and will consult with Marja-Liisa Hassi and Sandra Laursen of Ethnography \& Evaluation Research (E\&ER) at the  Center to Advance Research and Teaching in the Social Sciences (CARTSS) at the University of Colorado in the selection of appropriate instruments to  identify measures of for specific areas of the project.  Drs.\ Hassi and Laursen have extensive experience evaluating other large mathematics and science education projects (NSF Awards \# 0920126, \# 0723600 \# 0450088). [Note:  I am not sure that these are the appropriate projects that we should mention, but I am assuming that Marja-Liisa will rewrite this part of the proposal.] To insure alignment to project goals, measures for the classroom will not be selected until the Sage-enhanced materials have been developed. The measures will be administered to participants at appropriate intervals throughout the project period.

Drs.\  Hassi and Judson and the project PIs will conduct site visits to partner institutions to observe and document the use of Sage-enhanced materials as the project progresses. Additional data will be collected through periodic surveys of all participants, and interviews of a sample. All surveys and interviews will be prepared and conducted by Drs.\  Hassi and Judson. 

Drs.\  Hassi and Judson will collaborate with the appropriate institutions to collect demographic data on schools, teachers, and students within participating schools. They will analyze all data using appropriate statistical measures and will prepare one annual report per year documenting all evaluation activities and results and will provide formative evaluation feedback to the project PIs in presentations and correspondence timed to inform design decisions and mid-course corrections. 

\section{Dissemination}

We will broadly disseminate the results of Project Sage through a variety of forums.  The Project Sage curricular materials will be accessible on the Sage website, {\tt http://www.sagemath.org/}, where users can read documentation, make contributions to Sage, download Sage for free, and keep abreast of new developments in Sage.  Sage Days, series of conferences and workshops devoted to the development of Sage, are an ideal venue for dissemination.  To date there have been eighteen Sage Days conferences, and there is now time dedicated to using Sage in the classroom.  We are now plan to apply for special sessions and workshops on Sage in the classroom at the Joint Mathematics Meetings and MathFest, where we will be able to share the results of Project Sage with the undergraduate teaching community.  We will also publish articles about the impact of using CAS-integrated materials on the teaching and learning of undergraduate mathematics.  Drs.\ Beezer and Grout are part of a team delivering a workshop on how to use Sage in the classroom under the MAA's Professional Enhancement Program (PREP).  We plan to apply for future PREP workshops that will incorporate the results of Project Sage.

%

%\begin{verbatim}
%# Talk up the work that we're doing at Mathfest, Joint Meetings, and regional MAA meetings.
%# Set up a booth at the Joint meetings
%# Have a special session at Joint meetings
%# Advertise for the Sage Days and workshops in Summer 2
%# Minicourse on Sage at Joint meetings and/or mathfest 

%* Talk up the work that we're doing at Mathfest, Joint Meetings, and regional MAA meetings.
%    * Set up a booth at the Joint meetings
%    *

%      Advertise for the Sage Days and workshops in Summer 3; get people from Summer 2 to tell people to apply for the workshops in Summer 3 :) .
%    * Publish articles; in each of these, mention the workshops coming up in Summer 3
%          o

%            Publish an article in LOCI (http://mathdl.maa.org/mathDL/23/; they've wanted us to write an article for a while; this would probably be a second article).
%          o Publish an AMS editorial (or something) on open-source technology-enhanced textbooks, like William, et al., published a few years ago on open-source software. 
%    * Minicourse on Sage at Joint meetings and/or mathfest 

%# Talk up the work that we're doing at Mathfest, Joint Meetings, and regional MAA meetings.
%# Set up a booth at the Joint meetings
%# (try to get a) PREP workshop or workshop at Mathfest/Joint Meetings on writing technology-enhanced curricula materials.
%# Minicourse on Sage at Joint meetings and/or mathfest 
%\end{verbatim}

\section{Experience and results from prior NSF support}

Here we need to make the point that this is not an exploratory project
(i.e., type I).  Sage has been classroom-tested, NSF has given prior
support for developing class.  Rob has been using an open-source
textbook with sage examples. Tom is an open-source author.  Jason has
used Sage in several different courses and shaped Sage capabilities as
a result.  We are at the institutionalizing stage now.  Also mention
the MAA PREP grant as evidence of adoption and institutionalization.  William has had several NSF grants.


\section{Project Management/Governance Plan}
The Project Sage leadership team will consist of the project PI,
Co-PIs, Co-PI/Project Director, and selected faculty from the five
universities.

\medskip


{\bf Dr.\ William A. Stein}, Associate Professor of Mathematics at the University of Washington, is 

\medskip


{\bf Dr.\ Kiran S. Kedlaya}, Associate Professor of Mathematics at the  Massachusetts Institute of Technology, is 

\medskip


{\bf Dr.\ Jason Grout}, Assistant Professor of Mathematics at Drake University, is 


\medskip


{\bf Dr.\ Robert Beezer},  Professor of Mathematics at the University of Puget Sound, is 

\medskip

{\bf Dr.\ Thomas Judson}, Associate Professor of Mathematics at Stephen F. Austin Sate University, is an
active researcher in both mathematics and mathematics education. He is
the author of an open-source undergraduate abstract algebra textbook,
and will will work with Dr.\ Beezer to Sage-enhanced materials for
abstract algebra.  Dr.\ Judson has worked extensively with
undergraduate mathematics teachers and has mentored graduate students
in the teaching of mathematics. In addition to his teaching and
research accomplishments, Dr. Judson brings added experience in
working with diverse groups both in the U.S. and abroad.  As such, he
will work with Dr.\ Hassi to guide research and evaluation efforts for
Project Sage. With experience in working with undergraduate faculty
and graduate student mentoring, Dr. Judson will also provide insight
and assistance in the implementation of Sage-enhanced materials in the
undergraduate classroom. Project Sage efforts connected to research in
mathematics education will be under the direction of Dr. Judson.





\section{Future directions}






\newpage
\section{End of new grant}
End of where we are at.
\newpage

%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%

%

%\subsection{Textbooks and curricula in the computer age}

%

%\subsubsection{Previous approaches}

%(Mathematica and calculus)
%As the name implies, Calculus and Mathematica is a project from the early 1990's to teach calculus with the Mathematica program, using Mathematica notebooks as the primary text.  While this approach sounds similar to our proposal for textbooks, the difference is that Calculus and Mathematica was designed for students to work exclusively on exercises while sitting in a computer lab.  It was radically different for a traditional course, and the curriculm wwas driven by what Mathematica was capable of doing.  Today, this seems to be a worthwhile approach for distance learning, especially in small communities where a high school cannot provide calculus courses.

%Our approach is to instead integrate Sage into traditional texts, and create curricular materials to {\em support and enhance} the undergraduate mathematics curriculum appropriately, without letting the existence of the technology {\em dictate} the topics that are taught.

%
%Banchoff (Brown), etc.  Successful approaches exist, but they have not been widely adopted

%Cited previous research should back up the advantages and disadvantages below.

%We need to back up the idea that using CAS in teaching is effective (some reviewers may doubt it).

%\subsubsection{Advantages}

%higher test scores, etc.

%\begin{itemize}
%\item  inquiry-based learning
%\item  (can do examples too large to do by hand, concentrating on the concepts rather than arithmetic)
%With computational tools, modern mathematics has become a more experimental process, but with proof still as the ultimate standard.  For students, the ability to quickly compute examples larger than those traditionally possible by hand computations, leads to better understanding of the theory.  Long sequences of progressively larger examples also allows a teacher to easily introduce students to an experimental process of formulating conjectures.  Powerful computational liberate students from tedious calculations and allow them to concentrate on underlying concepts.
%\item  Demonstrated higher grades for lots of different kinds of students
%\end{itemize}

%
%\subsubsection{Disadvantages}

%costs, driven by technology, radical departure from traditional teaching\ldots{}

%
%\begin{itemize}
%\item (Deficiencies in software (like no algebra, vector fields, etc.))  Mathematics software with strong symbolic capabilities still ignore the inherent structure of mathematical objects.  For example, Mathematica returns the null space of a matrix as a list of basis vectors, whereas Sage returns a vector space, which acts just like a vector space through natural operations on this object.  (A similar Maple example? Vector fields?)
%\item  Software such as Matlab and Octave have a totally numerical foundation which is totally inappropriate (or sometimes incorrect) for teaching basic concepts with exact relationships to a student new to the topic.
%\item Despite providing educational and student pricing, purchase and renewal of commercial software can still be an expensive barrier to starting with a CAS, or staying current with the most recent version.  (State the obvious? Sage can be used over the Internet, or installed, upgraded at any time.)
%\item Licensing of commercial software ties a student to a physical location, or to a campus server, or with a student copy to a particular personal machine.  A Sage server can be accessed with any network connection, or a local copy can be installed on any number of machines.
%\item  Driven by technology more than by curriculum
%\item  Costs (lots of) money (so diverse institutions/high schools may have trouble affording it). Not just software, but also the style of having every class in the computer lab not every college campus can transition every class to a computer lab.  At many institutions, purchasing computer software especially mathematical softwareis a significant burden, and Sage has helped address this problem.
%\item  Radical departure in course style too radical for widespread adoption?
%\end{itemize}

%

%
%Our project will open the door to many other projects, including
%integration and collaboration with online homework systems such as
%WebCT and WebWork, course management systems such as Moodle, to
%further unify the use of computers in undergraduate mathematics education.

%

%

%
%SEE SCREENSHOT IN APPENDIX MATERIALS.

%
%WE ARE HERE
%==========================================================

%Their online textbook has been automatically converted to

%A teacher wants to demonstrate echelon form and provide tools for
%students to learn it.  They already have course notes in TeX (or have
%access to a open book in TeX)

%Project description
%Imagine this:
%Why Sage?
%Background and previous approaches
%Our implementation (exact steps, details)
%Evaluation
%Dissemination
%Conclusion/Future directions

%Project description
%Project vision/goals/outcomes
%results from prior nsf support
%implementation
%description on the roles of each person and their qualifications
%evaluation plan
%sustainability
%conclusion

%

%
%\section{Rest of old introduction}



```