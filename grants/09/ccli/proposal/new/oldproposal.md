

```txt
\section{How sage allows for wide adoption while maintaining the benefits of previous approaches}

Sage is a cohesive system that includes nearly one hundred pieces of
open-source mathematics software.  Creating this distribution has
required the combined work of over two hundred developers, including faculty, industry
professionals and students at the graduate, undergraduate, and high school level.

William Stein started the Sage project at Harvard in 2005.  Now there are over 200 Sage developers.  In late 2009, there were well over 5,000 downloads of Sage and over 75,000 visits to the \url{http://sagemath.org} website.  The free \url{http://sagenb.org} online Sage server has about 18,000 accounts from faculty, students, the general public all over the world.

The goal of the Sage project is to create viable easy-to-use free open
source mathematical software to support both education and research in
mathematics, engineering and the sciences.  Success would have a
genuinely transformational impact on the mathematical sciences,
broadly impacting people involved with mathematics at all levels.  It
would have the potential to have a profound impact on how mathematics
is taught and done for decades to come.

Sage can be used to study general and advanced, pure and applied
mathematics. This includes a huge range of mathematics, including
algebra, calculus, elementary to very advanced number theory,
cryptography, numerical computation, commutative algebra, group
theory, combinatorics, graph theory, exact linear algebra and much
more.  Sage combines and integrates numerous open-source software 
packages seamlessly into a common experience. It
is well suited for education, studying and research.  The notebook interface to
Sage runs in a web-browser.  Inside a
Sage notebook, you can create embedded graphics, beautifully typeset
mathematical expressions, add and delete input, and share your work
across the network.  A command-line interface is available for yet 
another style of interaction with the program.

\marginpar{Do we need to say something about prior support and other applications we are making this year?}


\subsection{Student driven interface}

The Sage notebook interface has attracted many student developers.  It originated at UCLA (is this right??, more detail, Boothby, who else?).  Intense development continues today, most recently a major upgrade was designed and constructed Fall~2009.  As an example of student involvement, this recent upgrade relied on significant contributions from Tim Dumol, a high school student in the Phillipines.  With so much student input to its design, the resulting interface is one very familiar to today's student.  It is an AJAX/Web-2.0/cloud-computing (pick a buzzword) style application, taking advantage of numerous Javascript libraries to turn a web browser into a powerful application, similar to GMail or Google Wave (better comparisons?).  This makes it possible for thne notebook to be platform-independent and run well on minimal hardware like netbooks and smartphones.  Presumably it would run unchanged (and with impressive performance) in Google's upcoming Chrome OS.  (Is this a place to talk about similar projects like CodeNode, Code Mirror, Python SPD, etc?)

\subsection{Technology independent}

Sage's fundamental adherence to open software and open standards, combined with a modular approach, makes it highly independent of specific choices of hardware and operating systems (need to mention Windows support here as project goal?).  The software compiles and runs on a wide variety of hardware and software (many flavors of Linux, say top 3,4,5 distros, Mac, Sun, 32-bit/64-bit, Atom chip for netbooks).  (Mention commercial systems that have dropped Sun support?)  High standards for code review and demanding test suites ensure that Sage installs easily in such a wide variety of situations.  Indeed many users install all of Sage as a way to guarantee that a single desired open source package will install on their system.  At ahigher level, a modular approach to combining mathematical packages means that as new, faster or more capable packages appear, it is relatively easy for Sage to transition to these new packages with no obvious negative changes to the typical user.  (Example: Did mpmath replace something?)

\subsection{Features and how we are addressing the disadvantages}

\begin{itemize}
\item  Mathematical deficiences.  Sage has a solid foundation of mathematical objects based on category theory.  For example, when asking for the nullspace of a matrix, you actually get back a vector space object.  You can then do things like intersect that vector space with another vector space, ask if a vector is in the vector space, look at the homomorphisms from the vector space into other objects, etc.  [[category theory = sounds scary, abstract, and like "Axiom"?   instead could we just say that our core design builds on a more modern (i.e. last 60 years -- bourbaki) views of mathematical objects instead of ignoring them.    it's striking that mathematics in the world of maple and mathematica is really 19th century, whereas sage is 20th century.  We could acknowledge Magma and Scratchpad/Axiom and MuPAD.]]
\item  Costs  Sage is freely available, and people are encouraged to make copies and share Sage with other people.  There are multiple public Sage servers, on which anyone can register an account and use Sage, including \url{http://sagenb.org}, run by William Stein, and supported by the NSF (SCREMS grant DMS-).
\item  In addition to not costing any money, the Sage source code is freely available and people are encouraged to look at it and improve it, if they wish.
\item  Sage uses the mainstream Python programming language.  This language is one of the most popular programming languages, and has been used in industry in key applications (e.g., Google, Star Wars, the hubble telescope, etc.).  Many universities are shifting beginning programming courses to using python.  Python is lauded for being a very easy-to-learn, powerful language.  Many students have exposure to python before using Sage (meaning that the learning barrier is drastically reduced), and the python skills that are developed in learning Sage are then applicable in areas far beyond mathematics or their course work.  Since python is an industry standard, there is a huge amount of existing code readily available to students for non-mathematical tasks that come up when analyzing data and exploring mathematical ideas.  For example,  \ldots.
[[Also see the TIOBE rankings of popularity which make Python the number 2 or 3 interpreted language: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html]]
\end{itemize}



Mention something about the huge number of lightning talks or the scipy conferences, talking about applications of python in science.\section{The Vision}


\subsection{Vignettes}

Vigenttes from the point of view of students (in class and out of class),
instructor (wanting to add something small to a course or wanting to go big time,
or teaching a more advanced course, oradapting existing material, or\ldots{}.?

Ideas:
\begin{itemize}

\item (To replace the Taylor polynomial example below.  Too long?)
  Imagine the section of a linear algebra textbook teaching row
  operations and the procedure for bringing a matrix to reduced
  row-echelon form.  An interactive demonstration in the text would
  generate a small matrix requiring fairly simple row operations and a
  ``next'' button would step through the row-reducing procedure.
  After each step, the original matrix and the modified matrix could
  be displayed with the affected entries color-coded and text would
  describe the row operation employed (using properly formatted
  mathematical symbols).  Once a student was comfortable with the
  procedure, inputs could allow the student to bypass the simplistic
  ``next'' button and decide at each step exactly which row operation
  to use.  Once comfortable with the method, a short code stanza would
  illustrate how to use Sage's command to convert a matrix to its
  echelon form.  As live Sage code, the student could edit this to
  examine many other examples.

  In the exercises, a student could be asked to demonstrate their
  knowledge of the procedure by writing an actual Python procedure to
  row-reduce a Sage matrix over the rational numbers.  It would be a
  simple matter of clicking just below the problem to open up a Sage
  input cell to enter the code, and a click on the evaluate link to
  test executing it.  The student could concentrate on the mechanics
  of the procedure since a Sage matrix type with rational entries
  would avoid the choice of a data structure, while Sage's exact
  arithmetic for rational numbers would avoid numerical problems like
  overflow and rounding.  A problem generator in the exercises could
  generate a seemingly infinite supply of ``random'' matrices for
  row-reduction, with varying sizes and varying complexity (as
  controlled by the student), yet perhaps with fairly ``easy'' row
  operations.  More applied exercises could lead to nontrivial systems
  of equations that could be simply solved in two lines by
  constructing the right augmented matrix and then calling Sage's
  command for row-reduction.

It is important to realize that everything just described can be created and executed using only Sage and is available to the student in their text.  No Java applets are needed for the interactive demonstration or problem generator, no compiler or programming environment is needed for the programming exercise.  The seemingly random problems would be generated by a Sage command (which is an example of code we would add to Sage to support these types of educational applications).  Everything happens in the electronic copy of the book, in a standard web browser, and what the student creates can remain there as a permanent part of their copy of the book.



\item Taylor polynomials -- (But we aren't converting a calculus textbook! Should we use an example
from a textbook we are actually converting?) -- Imagine a calculus lesson on Taylor polynomials as a Sage worksheet in a folder that comprises a calculus textbook.  Sage input cells would instruct the reader on the relevant Sage syntax, and provide the reader the opportunity to edit the input to experiment with different functions and different degree polynomials.  An included interactive Sage demonstration could use a slider to control the degree of the polynomial, and an input box would allow the student to specify an input where the function and the poynomial could be compared numerically.  On each change to the two inputs the demonstration would automatically respond with a new plot of the function and the polynomial, indicating visually the location of the input value on the two curves, along with the two numerical values at the input, plus the numerical difference between the values.  By opening up the mini-word-processor built into Sage, a student can annotate a copy of their text alongside the demonstration, recording their observations or questions, using \LaTeX{} code to create the mathematical expressions accurately in their notes.
\item High school teacher accessing an interact from within Sage for their classroom -- Some sort of vignette talking about high school is important because
CCLI emphasizes preparing K-12 teachers. If we show we are empowering
K-12 teachers, that is a great thing we should point out. Make sure
to say because we are free, high schools have an extra incentive to
use it.
\item Students collaborating, working from home and school together, maybe in an advanced undergraduate course -- Maybe on an algebra project that requires stuff in Sage that only
Sage and Magma have.
\item Teacher converting notes or modifying the textbook (maybe at a small liberal arts school)
\end{itemize}

\subsection{Implementation of proven methods}


\subsection{Measurable outcomes}

list of specific, measurable outcomes




\begin{itemize}
\item  A system for easily producing online textbooks with live Sage examples from standard Latex source files
\item  Online textbooks with live Sage examples covering a variety of undergraduate subjects, including linear algebra, abstract algebra, and number theory
\item  A number of smaller tutorials and course notes for specific topics, such as calculus, discrete math, differential equations, etc.
\item  Classroom-ready Sage Appliance Virtual machine, so instructors can easily set up a class or campus Sage server
\item  Translated versions of various appendices of books that contain code for commercial math software systems.
\item  Improvement of Sage for undergraduate classroom instruction
\end{itemize}



\subsection{Textbooks and other curricula material (Before the classroom)}


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
\item  \em{A First Course in Linear Algebra}, Robert Beezer, \url{http://linear.pugetsound.edu/}. Second-year university level text, concentrating on understanding how to understand and formulate proofs.  Used at thirteen schools since Fall~2007.  Contains some Sage commands.
\item  \em{Abstract Algebra: Theory and Applications}, Tom Judson, \url{http://abstract.ups.edu/}. Standard upper-division treatment of groups, rings, domains, fields, Galois Theory.  Published commercially in 1992, released as open source in 2007.  Used by seven schools in its first year available.  Supplement describes group theory in Sage.
\item  \em{Combinatorics Through Guided Discovery}, Kenneth Bogart, \url{http://www.math.dartmouth.edu/news-resources/electronic/kpbogart/}. Problem book in combinatorics with roughly 400 problems designed to teach the subject.  NSF funded, released as open source.
\item  \em{Elementary Number Theory: Primes, Congruences, and Secrets}, William Stein, \url{http://wstein.org/ent/}. Published by Springer-Verlag, will be available with open license in  Month~Year????.   Add capsule summary, Add extent of Sage usage (massive?)Open license consistent with paragraph above?
\item  \em{Vector Calculus}, Michael Corral, \url{http://www.mecmath.net/}. Standard treatment of multivariate calculus: vector calculus, partial derivatives, multiple integrals, theorems of Green and Stokes.  Impressive graphics.
\item  \em{Trigonometry}, Michael Corral, \url{http://mecmath.net/trig/}. An in-depth, comprehensive and unified treatment of the typical high-school topics.  Impressive graphics.
\item  \em{Cryptography}, David Kohel, \url{http://echidna.maths.usyd.edu.au/~kohel/tch/Crypto/crypto.pdf}. Classical ciphers and their cryptanalysis, modern stream ciphers and public-key cryptography.  Significant appendices on Sage.
\item Could we add my Riemann Hypothesis book with Barry Mazur?   http://wstein.org/rh/  It's aimed at undergrads, but isn't a traditional textbook by any stretch.
\item \em{Numerical Analysis}, Steven Pav, \url{http://scicomp.ucsd.edu/~spav/pub/numas.pdf} (course notes; small book length)
\item (A possibility:) http://www.math.duke.edu/education/calculustext/
\end{itemize}

\subsubsection{Other curricula material}

Other curricula material that we will convert; subject-specific tutorials, course notes, etc.

We propose to create subject specific tutorials to answer questions such as ``What are the Sage commands you need to know in order to do multivariate calculus?''  We propose to create a systematic and organized collection of subject specific tutorials and interacts to include with Sage.  Some work has been put forth in this (library of interacts, Georgia Sage Days Primers).  But there needs to be a lot more work and infrastructure in place to distribute these with Sage.  Maybe reference the Demonstrations project?



\subsubsection{Faculty workshops for converting and developing new ``learning materials and strategies''}

We will get lots of people to convert stuff and teach with Sage.


\subsection{Using Sage in the classroom - ``Developing faculty expertise''}

Mini-grants for faculty to write curriculum materials (textbooks/course notes/tutorials/interacts) using Sage. Maybe a few thousand dollars each? A summer salary, or a one-course buyout for a semester?

Several successful conversions or supplements will demonstrate the range of possibilities and allow the necessary experience to design an automated conversion and production system.  This will allow other authors to easily parlay just a working knowledge of \LaTeX{} to the ability to create folders of interactive Sage enhanced worksheets.  Workshops and grants can help and encourage other authors to learn the technical skills, and the possibilities afforded by this new approach, while creating or converting their own textbooks or supplements.

This could be accomplished through



\begin{itemize}
\item  A workshop sponsored by AIM.
\item  A SageDays devoted to textbook conversion and supplement creation.
\item  A mini-course at the Joint Meetings or MathFest.
\item  Mini-grants for people to convert textbooks and course notes to Sage
\item  Mini-grants for people to write course materials for Sage, such as interactive demonstrations (``interacts'').
\end{itemize}

\subsubsection{Classroom trial program (formative evaluation) (feedback from faculty //and// students)}



\subsection{Research on how faculty adopt this aproach}\section{Dissemination}


\subsection{Ease of adoption}


\subsection{Archive of refereed modules(?)}

(I'm not sure if this paragraph should go above or here.  for now, it's in two places.)

We propose to create subject specific tutorials to answer questions such as ``What are the Sage commands you need to know in order to do multivariate calculus?''  We propose to create a systematic and organized collection of subject specific tutorials and interacts to include with Sage.  Some work has been put forth in this (library of interacts, Georgia Sage Days Primers).  But there needs to be a lot more work and infrastructure in place to distribute these with Sage.  Maybe reference the Demonstrations project?



\subsection{AIM open source textbook initiative}


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