= Global Virtual Sage Days 112.358 =

An online event on open-source mathematical software !SageMath
with the users and developers around the globe

The fully virtual event will take place '''June 1-3, 2022''', during the 50 hours when it is June 2, 2022 in [[https://en.wikipedia.org/wiki/List_of_UTC_time_offsets|some timezone in the world]]: 

 * '''Beginning: Wednesday, June 1, 2022, 10:00:00 (morning) GMT''',

   .... which is June 2, 2022, 00:00 Kiribati time (UTC+14),

 * '''End: Friday, June 3, 2022, 11:59:59 (noon) GMT''', 

   .... which is June 2, 2022, 23:59:59 Baker Island time (UTC-12),

The schedule will be released soon.

[[https://wiki.sagemath.org/Workshops|Sage Days]] are gatherings of people interested in !SageMath, from newcomers to contributors. Sage Days have been organized as local, regional, or international in-person meetings by a wide range of people around the globe.  Because of the ongoing global health crisis, Sage Days 112.358 ([[https://groups.google.com/g/sage-devel/c/WYnrwDjLhUw/m/oOwLAunwAAAJ]|why this number?]]) will be a fully virtual event following the model of [[days109|Sage Days 109]] and [[days110|Sage Days 110]]

<<TableOfContents>>

== About SageMath ==

[[https://www.sagemath.org/|SageMath]], or Sage for short, is a mature, comprehensive, free (open-source) mathematics software system based on Python, licensed under the GNU General Public License, that integrates computer algebra facilities and general computational packages. 

Sage, first released in 2005, in over a decade of incubation in the  [[https://github.com/sagemath/sage/tree/develop/build/pkgs|SageMath distribution, comprising 293 software packages]], has grown its own [[https://github.com/sagemath/sage/tree/develop/src/sage|library of 1000 Cython and over 4400 Python modules]], ranging from `sage.algebras.*` over `sage.geometry.*` to `sage.tensor.*`, with a total of over 2.2 million lines of code.  

== How to register and participate ==

 * '''Registration''': Post a message with your name and affiliation in our [[https://sagemath.zulipchat.com/#narrow/stream/321245-sd112.2E358/topic/Registration|zulip #sd112.358 Registration topic]].

 * Join our [[https://sagemath.zulipchat.com/#narrow/stream/321245-sd112.2E358|zulip #sd112.358]] messaging stream. This stream will contain all of the information regarding the talks and events for Sage Days 112.358.

 * '''Video conferencing''': We will primarily be using Zoom and [[https://bigbluebutton.org/|BigBlueButton]] (BBB; see [[https://en.wikipedia.org/wiki/BigBlueButton|Wikipedia page]]; [[https://bigbluebutton.org/open-source-license/|license]]) (with BBB servers at Orsay and/or other French institutions). However, other software such as Google Meet can also be used.

   * Details, how to access: will be announced on the Zulip stream.

== Schedule, videos, and talk slides ==

The schedule, title, abstracts, videos, and supplementary materials of the talks will be found on [[https://researchseminars.org/seminar/SageDays112358|researchseminars.org]].

=== Session 1: Introduction ===

Wednesday June 1, 14:45–15:45 UTC

 * '''Blaec Bejarano, Harald Schilly, Hal Snyder, William Stein (SageMath, Inc.): Ways to Use Sage in [[https://cocalc.com/|CoCalc]])'''. We will give a demo of many different ways to use SageMath from within the collaborative computing platform CoCalc.com. These include Jupyter notebooks, the command line, editing .sage files, SageTex (as part of LaTeX), Sage worksheets, RMarkdown, and whiteboards.

=== Session 2: Fresh Numerics from Upstream ===

Wednesday June 1, 16:00–18:45 UTC

 * '''[[https://stevendiamond.me/|Steven Diamond]]: CVXPY'''. CVXPY is a domain-specific language for convex optimization embedded in Python. It allows the user to express convex optimization problems in a natural syntax that follows the math, rather than in the restrictive standard form required by solvers. CVXPY has been used in hundreds of research projects and by Fortune 500 companies. In this talk, we will show how easy it is to formulate and solve optimization problems with CVXPY through example applications in finance and renewable energy. We will also highlight exciting recent work building on CVXPY.

 * '''[[https://www.maths.ed.ac.uk/school-of-mathematics/people/a-z?person=47|Julian Hall]]: HiGHS: The world's best open-source linear optimization software - coming to !SageMath!''' HiGHS is open-source linear optimization software developed by Hall and Edinburgh PhD students over the past six years. It solves large-scale sparse linear programming (LP) problems (using simplex and interior point methods), mixed-integer programming (MIP) problems and quadratic programming (QP) problems. Its overall performance on Mittelmann's benchmarks places it clearly ahead of any other open-source linear optimization software. This talk will introduce some of the techniques underpinning HiGHS, the environment in which it can be used, and its performance. In the world of software interfaces, HiGHS provides the LP and MIP solvers in the !SciPy system, and is the open-source solver of choice in the popular modern Julia-based modelling and optimization system JuMP. The prospects for its integration into !SageMath will be discussed.

 * '''[[https://github.com/ninamiolane|Nina Miolane]]: Geomstats - a Python package for differential geometry in statistics and machine learning.''' We introduce Geomstats, an open-source Python package for computations and statistics on nonlinear manifolds that appear in machine learning applications, such as: hyperbolic spaces, spaces of symmetric positive definite matrices, Lie groups of transformations, and many more. We provide object-oriented and extensively unit-tested implementations. Manifolds come equipped with families of Riemannian metrics with associated exponential and logarithmic maps, geodesics, and parallel transport. Statistics and learning algorithms provide methods for estimation, clustering, and dimension reduction on manifolds. All associated operations provide support for different execution backends --- namely !NumPy, Autograd, !PyTorch, and !TensorFlow. This talk presents the package, compares it with related libraries, and provides relevant examples. We show that Geomstats provides reliable building blocks to both foster research in differential geometry and statistics and democratize the use of (Riemannian) geometry in statistics and machine learning. The source code is freely available under the MIT license at https://github.com/geomstats/geomstats.

=== Session 3: Sage Modularization and Packaging Summit ===

   * '''[[https://github.com/mkoeppe/|Matthias Köppe]]: The way to a fully modularized Sage library 10.0.''' In May 2020, I proposed to modularize the Sage library by means of PEP 420 implicit namespace packages. I will give an overview of the status of this project 2 years and [[https://trac.sagemath.org/ticket/29705|200 Trac tickets]] later, and give a roadmap to the completion of the project as the proposed milestone goal for Sage 10.0.

   * '''Sage user packages: Packaging, continuous testing, and integration in the Sage distribution'''
     * Discussion and hands-on activity (bring your packages!)
     * Organizer: [[https://www.labri.fr/perso/vdelecro/|Vincent Delecroix]], Matthias Köppe
     * References: https://trac.sagemath.org/ticket/31164, https://github.com/fredstro/hilbertmodgroup/issues/5
   * '''Downstream packaging forum'''
     * [[https://trac.sagemath.org/ticket/31016|Downstream patch upstreaming]]



== More Activities and Speakers ==

 * [[https://github.com/oscarbenjamin|Oscar Benjamin]] ([[https://www.sympy.org/en/index.html|SymPy]])

 * '''[[https://dr-how.github.io/|Hao Chen]]: Why I turned to Mathematica (sorry) to plot minimal surfaces'''. I will introduce the general procedure to plot minimal surfaces from Weierstrass data.  For this purpose, I will present two examples from recent works: One is a deformation of the Gyroid, the other is related to vortices in 2D fluids.  As a former Sage user, I had to turn to Mathematica for this task because of the heavy use of special functions and numeric integrals.  In the future, I would like to see an open-source implementation of the procedure with a performance comparable to Mathematica.

 * [[https://github.com/tobiasdiez|Tobias Diez]] (tentative; [[https://trac.sagemath.org/wiki/ReleaseTours/sage-9.6#Newdevelopertools|New developer tools for Sage]])


 * '''[[https://github.com/fredrik-johansson|Fredrik Johansson]]: FLINT: Fast Library for Number Theory.''' FLINT is a C library used in Sage and several other projects to provide fast arithmetic in various rings as well as efficient implementations of number theoretic functions. This talk will give an overview of FLINT and some descendants projects (Antic, Arb, Calcium), present recent work, and discuss ongoing and future development.

 * [[https://github.com/nafur|Gereon Kremer]] ([[https://github.com/cvc5/cvc5|cvc5]], SMT)

 * '''[[https://tiantianliu.cn|Tiantian Liu]] ([[https://taichi.graphics/|Taichi graphics]]): A hands-on tutorial of the Taichi Programming Language.''' In this talk, we will deliver a hands-on tutorial on Taichi programming language -- a new programming language designed for performance-aware computer graphics developers. Taichi was designed with productivity and portability in mind: Taichi programmers code in a Python-like syntax, and then the Taichi compiler emits high-performance executable kernels on CPUs (e.g., x64, ARM64) and GPUs (e.g., CUDA, Apple Metal, and OpenGL). We will systematically cover the Taichi concepts such as its basic syntax, defining data structures, writing high-performance Taichi kernels, differentiable programming, and debugging etc. We will also talk about programming tools to improve the reusability of Taichi programs. We hope Taichi and this 45-minute presentation can reduce the engineering burden on both beginner coders, as well as experienced practitioners in high-performance software development.

 * [[https://github.com/asmeurer|Aaron Meurer]] ([[https://www.sympy.org/en/index.html|SymPy]])


 * [[https://math.as.uky.edu/users/yzh392/|Yuan Zhou]] (solid angles of polyhedral cones)

 * '''Meeting of Sage users in Korea'''
   * Sage users in Korea will get together and chat over installing, using, and developing Sage.
   * Schedule: 3 hours beginning Thursday, June 2, 2022, 06:00:00 GMT 
               which is June 2, 2022, 3 PM Korea Standard Time (UTC+9)
   * For the purpose of the meeting, the primary language will be Korean. Don't be embarrassed upon entry.
   * Zoom invitation link: https://us06web.zoom.us/j/9401552754?pwd=SjFFWXVUZnNjM0xwY3FYVG5DVGtFZz09 
   * Organizer: [[https://github.com/kwankyu|Kwankyu Lee]]


 * '''Sage Thursdays in Bordeaux'''
   * Schedule: 2 hours beginning Thursday, June 2, 2022, 08:00:00 GMT
               which is June 2, 2022, 10 am to 12 noon Central European Summer Time (UTC+2)
   * [[http://www.slabbe.org/|Sébastien Labbé]] will present the new [[https://trac.sagemath.org/wiki/ReleaseTours/sage-9.6#GraphicswithTikZ|TikzPicture]] functionality in Sage 9.6
   * The presentation will be followed by coding sprints starting by a "tour de table" where everyone announce their objective for the session.

 * '''What is ... in Sage?'''
   * Short presentations: What is this animal? Is it dangerous? Can it eat my computer? How much space does it take?
   * Matthias Köppe: What is [[https://tox.wiki/en/latest/index.html|tox]] and how [[https://doc.sagemath.org/html/en/developer/tools.html#tox|does]] Sage [[https://doc.sagemath.org/html/en/developer/packaging_sage_library.html#testing-distribution-packages|use]] [[https://doc.sagemath.org/html/en/developer/portability_testing.html#automatic-docker-based-build-testing-using-tox|it]]?
   * ...


 * '''Sage Teaching Forum'''
   * '''Ingo Dahn: Teaching with !SageMath - a German Higher Education Perspective.''' !SageMath - and similar systems - are currently used for teaching at German universities just by a few pioneers. The talk explains the particular reasons for this situation and analyzes, which properties of the !SageMath ecosystem, with !SageMath, !SageCell, !CoCalc and Docker-!CoCalc, facilitate a further uptake. The Virtual Campus of the German Land Rhineland-Palatine (VCRP) is determined to support the use of the potential of digital media for the improvement of teaching and learning at the public universities of the land. In particular, some !SageMath-based services are provided to support the work of the aforementioned pioneers, to learn from their experiences and to lower the barriers for other staff members for realizing !SageMath’s potential for innovative STEM teaching. These services, some of which are available as Open Educational Resources, will be described in the talk. Finally, some improvements for !SageMath are suggested that would further ease its use for teaching. Contact: dahn@vcrp.de
   * Open discussion

 * '''Landscape of symbolic equation solver interfaces, symbolic assumption facilities'''
   * Discussion

 * '''Reports from GSoC 2021 projects'''
   * '''[[https://davidayotte.github.io/| David Ayotte]]: Implementation of the Graded Ring of Quasimodular Forms.''' The goal of this talk is to explain how quasimodular forms were implemented into SageMath. We will first give a brief review of the theory of (quasi)modular forms and we will explain how the implementation works. Next a quick demo will be showcased. Lastly, further developments to the code will be discussed. )
   * [[https://www.maths.ed.ac.uk/~s1504632/|Linden Disney-Hogg]] (Abel-Jacobi map on the Riemann surface)
   * [[https://www-users.cse.umn.edu/~karnx018/|Trevor Karn]] (G-invariants of the Orlik-Solomon and Orlik-Terao algebras)

 * '''Award Ceremony: Annual Spies SageMath Development Prize'''
   * The award committee

 * '''Onboarding session for new !SageMath developers'''
   * How to make the step from using Sage to contributing to Sage.

 * '''Coding sprints'''
   * add proposals here

 * more TBA

== Organizers ==

 * [[https://www.math.ucdavis.edu/~mkoeppe/|Matthias Köppe]] (UC Davis)

 * [[https://www.etsmtl.ca/en/research/maitres-enseignement/jplabbe/|Jean-Philippe Labbé]] (ÉTS, Montréal)

 * [[https://math.as.uky.edu/users/yzh392|Yuan Zhou]] (University of Kentucky)

You can also join the [[https://sagemath.zulipchat.com/#narrow/stream/321245-sd112.2E358|Zulip #sd112.358 stream]] to contact the organization team.
