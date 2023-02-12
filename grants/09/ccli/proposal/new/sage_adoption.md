

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



Mention something about the huge number of lightning talks or the scipy conferences, talking about applications of python in science.

```