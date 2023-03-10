

# Global Virtual Sage Days 112.358

An online event on open-source mathematical software  with the SageMath users and developers around the globe 

The fully virtual event will take place **June 1–3, 2022**, during the 50 hours when it is June 2, 2022 in <a class="https" href="https://en.wikipedia.org/wiki/List_of_UTC_time_offsets">some timezone in the world</a>:  

* **Beginning: Wednesday, June 1, 2022, 10:00 (morning) GMT**, 
      * ... which is June 2, 2022, 00:00 Kiribati time (UTC+14), 
* **End: Friday, June 3, 2022, 11:59 (noon) GMT**,  
      * ... which is June 2, 2022, 23:59 Baker Island time (UTC-12). 
<a class="https" href="https://wiki.sagemath.org/Workshops">Sage Days</a> are gatherings of people interested in SageMath, from newcomers to contributors. Sage Days have been organized as local, regional, or international in-person meetings by a wide range of people around the globe.  Because of the ongoing global health crisis, **Sage Days 112.358** (<a class="https" href="https://groups.google.com/g/sage-devel/c/WYnrwDjLhUw/m/oOwLAunwAAAJ]">why this number?</a>) will be a fully virtual event following the model of <a href="/days109">Sage Days 109</a> and <a href="/days110">Sage Days 110</a> 

[[_TOC_]] 


## About SageMath

<a class="https" href="https://www.sagemath.org/">SageMath</a>, or Sage for short, is a mature, comprehensive, free (open-source) mathematics software system based on Python, licensed under the GNU General Public License, that integrates computer algebra facilities and general computational packages.  

Sage, first released in 2005, in over a decade of incubation in the  <a class="https" href="https://github.com/sagemath/sage/tree/develop/build/pkgs">SageMath distribution, comprising 293 software packages</a>, has grown its own <a class="https" href="https://github.com/sagemath/sage/tree/develop/src/sage">library of 1000 Cython and over 4400 Python modules</a>, ranging from `sage.algebras.*` over `sage.geometry.*` to `sage.tensor.*`, with a total of over 2.2 million lines of code.   


## How to register and participate

* **Registration**: Post a message with your name and affiliation in our <a class="https" href="https://sagemath.zulipchat.com/#narrow/stream/321245-sd112.2E358/topic/Registration">zulip #sd112.358 Registration topic</a>. 
* Join our <a class="https" href="https://sagemath.zulipchat.com/#narrow/stream/321245-sd112.2E358">zulip #sd112.358</a> messaging stream. This stream will contain all of the information regarding the talks and events for Sage Days 112.358. 
* **Video conferencing**: We will primarily be using Zoom. 
      * Details, how to access: will be announced on the Zulip stream. 

## Schedule, videos, and talk slides

The detailed schedule, title, abstracts, videos, and supplementary materials of the talks are found on <a class="https" href="https://researchseminars.org/seminar/SageDays112358">researchseminars.org</a>. 


### Session 1: Introduction

Wednesday June 1, 14:45–15:45 UTC. Session chair: Jean-Philippe Labbé 

* **<a class="https" href="https://researchseminars.org/talk/SageDays112358/23/">Introduction to SageMath and the Global Virtual SageDays</a>** 
* **Blaec Bejarano, Harald Schilly, Hal Snyder, William Stein (SageMath, Inc.): <a class="https" href="https://researchseminars.org/talk/SageDays112358/5/">Ways to Use Sage in CoCalc</a>**. We will give a demo of many different ways to use SageMath from within the collaborative computing platform <a class="https" href="https://cocalc.com/">CoCalc.com</a>. These include Jupyter notebooks, the command line, editing .sage files, SageTeX (as part of LaTeX), Sage worksheets, RMarkdown, and whiteboards. 

### Session 2: Fresh Numerics from Upstream

Wednesday June 1, 16:00–18:45 UTC. Session chair: Matthias Köppe 

* **<a class="https" href="https://stevendiamond.me/">Steven Diamond</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/6/">CVXPY</a>**. CVXPY is a domain-specific language for convex optimization embedded in Python. It allows the user to express convex optimization problems in a natural syntax that follows the math, rather than in the restrictive standard form required by solvers. CVXPY has been used in hundreds of research projects and by Fortune 500 companies. In this talk, we will show how easy it is to formulate and solve optimization problems with CVXPY through example applications in finance and renewable energy. We will also highlight exciting recent work building on CVXPY. 
* **<a class="https" href="https://www.maths.ed.ac.uk/school-of-mathematics/people/a-z?person=47">Julian Hall</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/7/">HiGHS: The world's best open-source linear optimization software—coming to SageMath!</a>** HiGHS is open-source linear optimization software developed by Hall and Edinburgh PhD students over the past six years. It solves large-scale sparse linear programming (LP) problems (using simplex and interior point methods), mixed-integer programming (MIP) problems and quadratic programming (QP) problems. Its overall performance on Mittelmann's benchmarks places it clearly ahead of any other open-source linear optimization software. This talk will introduce some of the techniques underpinning HiGHS, the environment in which it can be used, and its performance. In the world of software interfaces, HiGHS provides the LP and MIP solvers in the SciPy system, and is the open-source solver of choice in the popular modern Julia-based modelling and optimization system JuMP. The prospects for its integration into SageMath will be discussed. 
* **<a class="https" href="https://github.com/ninamiolane">Nina Miolane</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/8/">Geomstats—a Python package for differential geometry in statistics and machine learning</a>.** We introduce Geomstats, an open-source Python package for computations and statistics on nonlinear manifolds that appear in machine learning applications, such as: hyperbolic spaces, spaces of symmetric positive definite matrices, Lie groups of transformations, and many more. We provide object-oriented and extensively unit-tested implementations. Manifolds come equipped with families of Riemannian metrics with associated exponential and logarithmic maps, geodesics, and parallel transport. Statistics and learning algorithms provide methods for estimation, clustering, and dimension reduction on manifolds. All associated operations provide support for different execution backends—namely NumPy, Autograd, PyTorch, and TensorFlow. This talk presents the package, compares it with related libraries, and provides relevant examples. We show that Geomstats provides reliable building blocks to both foster research in differential geometry and statistics and democratize the use of (Riemannian) geometry in statistics and machine learning. The source code is freely available under the MIT license at <a href="https://github.com/geomstats/geomstats">https://github.com/geomstats/geomstats</a>. 

### Session 3: Sage Modularization and Packaging Summit

Wednesday June 1, 19:00–23:59 UTC 

      * **<a class="https" href="https://researchseminars.org/talk/SageDays112358/16/">Sage user packages: Packaging, continuous testing, and integration in the Sage distribution</a>** 
            * Discussion and hands-on activity (bring your packages!) 
            * Organizers: <a class="https" href="https://www.labri.fr/perso/vdelecro/">Vincent Delecroix</a>, Jonathan Kliem, Matthias Köppe 
            * References: <a href="https://trac.sagemath.org/ticket/31164">https://trac.sagemath.org/ticket/31164</a>, <a href="https://github.com/fredstro/hilbertmodgroup/issues/5">https://github.com/fredstro/hilbertmodgroup/issues/5</a> 
      * **<a class="https" href="https://github.com/mkoeppe/">Matthias Köppe</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/17/">The way to a fully modularized Sage library 10.0</a>.** In May 2020, I proposed to modularize the Sage library by means of PEP 420 implicit namespace packages. I will give an overview of the status of this project 2 years and <a class="https" href="https://trac.sagemath.org/ticket/29705">200 Trac tickets</a> later, and give a roadmap to the completion of the project as the proposed milestone goal for Sage 10.0. 
      * **Ticket review session** 
      * **Downstream packaging forum** 
            * <a class="https" href="https://trac.sagemath.org/ticket/31016">Downstream patch upstreaming</a> 

### Session 4: Visualization and Local Connections

Thursday June 2, 06:00–12:00 UTC. Session chairs: Jean-Philippe Labbé; local organizers  

* **<a class="https" href="https://researchseminars.org/talk/SageDays112358/3/">Meeting of Sage users in Korea</a>** 
      * Sage users in Korea will get together and chat over installing, using, and developing Sage. 
      * Schedule: **2** hours beginning Thursday, June 2, 2022, 06:00 UTC  
                                          * which is June 2, 2022, 3 PM Korea Standard Time (UTC+9) 
      * For the purpose of the meeting, the primary language will be Korean. Don't be embarrassed upon entry. 
      * Zoom invitation link: <a href="https://us06web.zoom.us/j/9401552754?pwd=SjFFWXVUZnNjM0xwY3FYVG5DVGtFZz09">https://us06web.zoom.us/j/9401552754?pwd=SjFFWXVUZnNjM0xwY3FYVG5DVGtFZz09</a>  
      * Organizer: <a class="https" href="https://github.com/kwankyu">Kwankyu Lee</a> 
* **<a class="https" href="https://tiantianliu.cn">Tiantian Liu</a> (<a class="https" href="https://taichi.graphics/">Taichi graphics</a>): <a class="https" href="https://researchseminars.org/talk/SageDays112358/18/">A hands-on tutorial of the Taichi Programming Language</a>.** In this talk, we will deliver a hands-on tutorial on Taichi programming language -- a new programming language designed for performance-aware computer graphics developers. Taichi was designed with productivity and portability in mind: Taichi programmers code in a Python-like syntax, and then the Taichi compiler emits high-performance executable kernels on CPUs (e.g., x64, ARM64) and GPUs (e.g., CUDA, Apple Metal, and OpenGL). We will systematically cover the Taichi concepts such as its basic syntax, defining data structures, writing high-performance Taichi kernels, differentiable programming, and debugging etc. We will also talk about programming tools to improve the reusability of Taichi programs. We hope Taichi and this 45-minute presentation can reduce the engineering burden on both beginner coders, as well as experienced practitioners in high-performance software development. 
* **<a class="https" href="https://researchseminars.org/talk/SageDays112358/4/">Sage Thursdays in Bordeaux</a>** 
      * Schedule: 2 hours beginning Thursday, June 2, 2022, 08:00 UTC 
                                          * which is June 2, 2022, 10 am to 12 noon Central European Summer Time (UTC+2) 
      * <a class="http" href="http://www.slabbe.org/">Sébastien Labbé</a> will present the new <a class="https" href="https://trac.sagemath.org/wiki/ReleaseTours/sage-9.6#GraphicswithTikZ">TikzPicture</a> functionality in Sage 9.6: <a class="https" href="https://nbviewer.org/url/www.slabbe.org/Sage/2022-06-02-tikzpicture-demo.ipynb">Jupyter notebook TikzPicture module demo</a>. 
      * The presentation will be followed by coding sprints starting by a "tour de table" where everyone announce their objective for the session. 
* **<a class="https" href="https://dr-how.github.io/">Hao Chen</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/19/">Why I turned to Mathematica (sorry) to plot minimal surfaces</a>**. I will introduce the general procedure to plot minimal surfaces from Weierstrass data.  For this purpose, I will present two examples from recent works: One is a deformation of the Gyroid, the other is related to vortices in 2D fluids.  As a former Sage user, I had to turn to Mathematica for this task because of the heavy use of special functions and numeric integrals.  In the future, I would like to see an open-source implementation of the procedure with a performance comparable to Mathematica. 

### Session 5: SageMath Developer Community and Google Summer of Code

Thursday June 2, 14:45–18:00 UTC. Session chair: Yuan Zhou 

* Canceled: <a class="https" href="https://github.com/tobiasdiez">Tobias Diez</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/25/">New developer tools for Sage</a>. I give an overview and demonstration of some recently introduced developer tools: Github Action Workflows complementing the existing Sagebot test infrastructure, and Gitpod serving as a (remote) developer environment for ticket reviews and as a main development infrastructure. 
* **<a class="https" href="https://researchseminars.org/talk/SageDays112358/20/">Award Ceremony: Annual Spies SageMath Development Prize</a>** 
      * The prize committee: William Stein, Eric Gourgoulhon, John Cremona, Karl-Dieter Crisman, Samuel Lelièvre 
* **Onboarding session for new SageMath developers** 
      * How to make the step from using Sage to contributing to Sage. 
      * **What is ... in Sage?**: Short presentations 
                     * Matthias Köppe: What is <a class="https" href="https://tox.wiki/en/latest/index.html">tox</a> and how <a class="https" href="https://doc.sagemath.org/html/en/developer/tools.html#tox">does</a> Sage <a class="https" href="https://doc.sagemath.org/html/en/developer/packaging_sage_library.html#testing-distribution-packages">use</a> <a class="https" href="https://doc.sagemath.org/html/en/developer/portability_testing.html#automatic-docker-based-build-testing-using-tox">it</a>? 
* **Reports from GSoC 2021 projects** 
      * **<a class="https" href="https://www.maths.ed.ac.uk/~s1504632/">Linden Disney-Hogg</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/9/">Rigorous integration and the Abel--Jacobi map</a>.** The Abel–Jacobi map is an important construction in algebraic geometry, including its application to the theory of integrable systems. I will give an overview of a recent implementation of the map in Sage, including some work on improving the integration required, highlighting current uses and future extensions. 
      * **<a class="https" href="https://davidayotte.github.io/">David Ayotte</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/10/">Implementation of the Graded Ring of Quasimodular Forms</a>.** The goal of this talk is to explain how quasimodular forms were implemented into <a href="/SageMath">SageMath</a>. We will first give a brief review of the theory of (quasi)modular forms and we will explain how the implementation works. Next a quick demo will be showcased. Lastly, further developments to the code will be discussed. ) 
      * **<a class="https" href="https://www-users.cse.umn.edu/~karnx018/">Trevor Karn</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/11/">G-invariants of the Orlik–Solomon and Orlik–Terao algebras</a>** In this talk I will give examples and a description of how we implemented G-invariants of a finite group G in Sage. Specific examples will include the Orlik-Solomon algebra of a matroid which was the motivating example for the project. 
* **<a class="https" href="https://researchseminars.org/talk/SageDays112358/21/">GSoC panel</a>** 

### Session 6: Symbolic System Symposium

Thursday June 2, 18:00–23:59 UTC. Session chair: Matthias Köppe 

* **<a class="https" href="https://math.as.uky.edu/users/yzh392/">Yuan Zhou</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/22/">Solid angles of polyhedral cones via decompositions and power series</a>.** We study the solid angle measure of a polyhedral cone. This is well understood in dimensions two and three. For higher dimensions, the measure can be computed via a multivariable hypergeometric series, as long as certain positive-definiteness condition is satisfied. We present two decomposition methods of full-dimensional simplicial cones into finite families of cones satisfying the positive-definite criterion. We present the <a href="/SageMath">SageMath</a> implementation of the proposed solid angle computations. This is a joint work with Allison Fitisone. 
* **<a class="https" href="https://github.com/fredrik-johansson">Fredrik Johansson</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/12/">FLINT: Fast Library for Number Theory</a>.** FLINT is a C library used in Sage and several other projects to provide fast arithmetic in various rings as well as efficient implementations of number theoretic functions. This talk will give an overview of FLINT and some descendants projects (Antic, Arb, Calcium), present recent work, and discuss ongoing and future development. 
* **<a class="https" href="https://github.com/asmeurer">Aaron Meurer</a>, <a class="https" href="https://github.com/oscarbenjamin">Oscar Benjamin</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/13/">SymPy</a>.** This talk will go over the <a class="https" href="https://www.sympy.org/en/index.html">SymPy</a> library, some of the recent developments, and plans for the future. 
* **<a class="https" href="https://github.com/nafur">Gereon Kremer</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/14/">Satisfiability Modulo Theories for Arithmetic Problems</a>.** Satisfiability Modulo Theories (SMT) solving has grown to be a very successful solving paradigm, powering software and hardware verification, symbolic execution, test-case generation, synthesis, planning, scheduling and optimization tasks. One of the theories in SMT solving is nonlinear real arithmetic which opens immediate connections to the computer algebra community that has long known this theory as the theory of the reals. This talk presents approaches for this theory that are used in the SMT community and discusses some existing and possible future collaboration between the SMT and computer algebra communities. 
* **Discussion: <a class="https" href="https://researchseminars.org/talk/SageDays112358/15/">Landscape of symbolic equation solver interfaces, symbolic assumption facilities</a>** 

### Session 7: Sage Teaching Forum

Friday June 3, 11:00–11:59 UTC. Session chair: Jean-Philippe Labbé 

      * **<a class="https" href="https://dahn-research.eu/">Ingo Dahn</a>: <a class="https" href="https://researchseminars.org/talk/SageDays112358/2/">Teaching with SageMath—a German Higher Education Perspective</a>.** SageMath—and similar systems—are currently used for teaching at German universities just by a few pioneers. The talk explains the particular reasons for this situation and analyzes, which properties of the SageMath ecosystem, with SageMath, SageCell, CoCalc and Docker-CoCalc, facilitate a further uptake. The Virtual Campus of the German Land Rhineland-Palatine (VCRP) is determined to support the use of the potential of digital media for the improvement of teaching and learning at the public universities of the land. In particular, some SageMath-based services are provided to support the work of the aforementioned pioneers, to learn from their experiences and to lower the barriers for other staff members for realizing SageMath’s potential for innovative STEM teaching. These services, some of which are available as Open Educational Resources, will be described in the talk. Finally, some improvements for SageMath are suggested that would further ease its use for teaching. Contact: <a href="mailto:dahn@vcrp.de">dahn@vcrp.de</a> 
      * Open discussion 

## Organizers

* <a class="https" href="https://www.math.ucdavis.edu/~mkoeppe/">Matthias Köppe</a> (UC Davis) 
* <a class="https" href="https://www.etsmtl.ca/en/research/maitres-enseignement/jplabbe/">Jean-Philippe Labbé</a> (ÉTS, Montréal) 
* <a class="https" href="https://math.as.uky.edu/users/yzh392">Yuan Zhou</a> (University of Kentucky) 
You can also join the <a class="https" href="https://sagemath.zulipchat.com/#narrow/stream/321245-sd112.2E358">Zulip #sd112.358 stream</a> to contact the organization team. 
