PLEASE CONTRIBUTE, i.e. EDIT OR ADD TO:

MAZUR WROTE SOMETHING VERY NICE (below), so please add your paragraphs about what you are working on in relation
to the program to the bottom of the itemize):


\centerline{\bf What is Arithmetic Statistics?}
 \vskip20pt

Number Theory has its share of conjecture and heuristics that thrive on---if not depend on---the accumulation of aggregates of  instances, aggregates of numerical data.  

\vskip20pt
To see that {\it numerical data related to numbers themselves} is also at the very heart of the pleasure of number theory, and is a major reason for the very {\it theory} itself, consider this letter of Gauss to one of his students  (the {\it italics} are ours):
 \vskip20pt
\begin{quote} Even before I had begun my more detailed
investigations into higher arithmetic, one of my first projects was to turn my attention
to the decreasing frequency of primes, to which end {\it I counted the primes in
several chiliads} and recorded the results on the attached white pages. I soon recognized
that behind all of its fluctuations, this frequency is on the average inversely
proportional to the logarithm, so that the number of primes below a given bound $n$ is approximately equal to
$$\int dn/
\log(n),$$ 
where the logarithm is understood to be hyperbolic. Later on, when I became acquainted
with the list in Vega?s tables (1796) going up to $400031$, I extended my
computation further, confirming that estimate. {\it In 1811, the appearance of Chernau?s
cribrum gave me much pleasure and I have frequently (since I lack the patience
for a continuous count) spent an idle quarter of an hour to count another chiliad
here and there$\dots$}\end{quote} \vskip20pt

 %One aspect of number theory (and probably any branch of mathematics) is the way that {\it computation} (i.e., close observation of a significant mass of the phenomena under study) weaves in and out with {\it theory}.
  \vskip20pt
 Often, in modern number theory, to actually sample a sufficient quantity of data that might allow you to guess even approximate qualitative behavior of the issue you are studying, you may have to go out to very high numbers. For example, there are basic questions about elliptic curves (e.g., what is the frequency of those possessing two independent rational points of infinite order) where if you only look at curves of conductor $< 10^8$, you might be tempted to make guesses that are not only wrong, but qualitatively wrong.
 
   \vskip20pt
Our program {\it Arithmetic Statistics} then stands for those aspects of number theory---be it theory or computation---that connect closely with concrete (important) {\it numerical data related to numbers themselves}. 
\vskip15pt
Many people in our program are engaged  in the theoretical side of our subject, and many in the computational side.   Much ``theoretical" modern number theory bears on, and sometimes has vital need of  large scale computing projects and  large data-bases. And both the computational and theoretical facets connect to some of the  famous heuristics in our subject:  {\it Cohen-Lenstra} heuristics  (average expected size of various finite abelian groups that appear in our subject; and {\it Random matrix} heuristics.


% Fundamental  issues include the statistics regarding zeroes of $L$-functions; arithmetic questions about elliptic curves---average size of Mordell-Weil ranks, and Selmer ranks; upper bounds on trigonometric sums; etc. And we have people in our program who are at the center of this activity.


\vskip10pt
The computational and theoretical facets of our subject form one interlocking unity. %Our program bridges these facets: people working in each of them will have ample opportunity to interact with people working in the other mode. 

\vskip10pt
  Here are a few examples of recent work that have been themes of our program: 
 \vskip10pt 
  \begin{itemize} \item  Manjul Bhargava together with his students and co-authors have been developing extremely precise methods for counting appropriate orbits of certain arithmetic groups acting on integral points on certain lattices. This approach follows  and significantly refines the classical Methods in the Geometry of Numbers (as had pursued by Gauss, Minkowski, Siegel, and others).  A major application of this work of Bhargava and co-authors is to establish counts of important ingredients of the arithmetic of elliptic curves. Among their applications is the result of Bhargava-Shankar that the average rank of the Mordell-Weil group of elliptic curves over ${\bf Q}$---when they are ordered in any of the standard ways---is $<1.5$. 
  
  This result is related to their study of the average {\it size} of the  $2$-Selmer rank of elliptic curves (again over ${\bf Q}$ ---and when they are ordered in any of the standard ways). They show that the average size  is {\it three}{\footnote{Of course no $2$-Selmer group can have such a size: these $2$-Selmer groups are then all either above  or below  average.}}  For any prime number $p$ the {\it reduced $p$-Selmer rank  of an elliptic curve over a number field}{\footnote{ This is the dimension of the so-called $p$-Selmer group minus the rank of rational $p$-torsion of the elliptic curve over the number field.}} has this important property: it is  finite (!), computable (!) (at least in principle), and  is an upper bound for the rank of the  Mordell-Weil group of the elliptic curve over the number field.  If the Shafarevich-Tate conjecture holds, then for all but finitely many primes $p$, the  reduced $p$-Selmer rank would be equal to that Mordell-Weil rank.  So it is natural, as in the results of Bhargava and co-authors alluded to above, to expect that the statistics of $p$-Selmer ranks  (e.g., even when restricted to $p=2$) contribute to our understanding of Mordell-Weil ranks.  In the course of our program we have been learning the most recent advances in this direction  ($3$-Selmer, $5$-Selmer). 
  
  Also $\dots$
  \vskip10pt  
  \item The heuristics predicting ``average sizes" of quite a few important arithmetic objects have also been the focus of our program. We are fortunate to have both Henri Cohen and Hendrik Lenstra among us. They are  the co-originators of the {\it Cohen-Lenstra heuristics}  that guides conjectures regarding average sizes of ideal class groups and other important invariants in number theory. The latest development in the formidable toolbox of heuristics is due to Bjorn Poonen and Eric Rains and has a somewhat different slant; it gives one precise guesses for the probabilities of reduced $p$-Selmer ranks for  elliptic curves  over a given number field  (when these curves are  ordered in the usual way).  This too has been one of the focusses of our program.  A few years ago, Peter Swinnerton-Dyer, extending earlier results of Heath-Brown, studied the probabilities of reduced $2$-Selmer ranks of families of elliptic curves that are quadratic twists of some very specific types of elliptic curves over ${\bf Q}$. One grand (and enticing) feature of Swinnerton-Dyer's study is that the probabilities arise  as if they were the product of a specific Markov process; another curious feature---a drawback, perhaps---is that the statistics are dependent upon ordering the elliptic curves in the twist family  {\it not in the standard way} but in terms of the number of primes dividing the discriminant.  All the issues that are brought up by this work are focusses of current research in our program. Specifically, Dan Kane's work in the program is towards relating such Swinnerton-Dyer statistics dependent upon different orderings of the collection of elliptic curves being sampled, while Karl Rubin, Zev Klagsbrun, and Barry Mazur are developing an approach (which has a ``Markov Process feel") to unconditionally prove the expected statistics for reduced $2$-Selmer ranks over an arbitrary number field for all quadratic twists families of many elliptic curves  (the elliptic curves in any of these families are ordered in a certain not entirely unnatural, but again non-standard, way). \vskip10pt
    \item PARAGRAPH ON COMPUTATION
    \item PARAGRAPH ON ANALYTIC SIDE (MOMENTS, ZEROS, etc)
    \item $\dots$\vskip10pt
    \item $\dots$

\end{itemize}



==================================================================================
OLDER MATERIAL. PERHAPS MERGE SOME OF IT WITH THE ABOVE.

$L$-functions  (attached to modular forms and/or to algebraic varieties and
algebraic number fields) are prominent in quite a wide range of number
theoretic issues, and our recent growth of understanding of the analytic
properties of $L$-functions has already lead to profound applications regarding
( among other things) the statistics related to arithmetic problems.  Much of
this exciting development involves a coming-together of {\it arithmetic
algebraic geometry}, of  {\it automorphic forms and representation theory}, of
{\it analytic number theory} and of  {\it  statistics} (such as  the
statistical heuristics obtained from the contemporary work regarding Random
Matrices).

The semester long program at the MSRI on Arithmetic Statistics emphasizes
the statistical aspects of $L$-functions, modular forms, and associated
arithmetic and algebraic objects from several different
perspectives- theoretical, algorithmic, and experimental.

The program brings together experts on modular forms, analytic number
theory, arithmetic and algebraic geometry, mathematical physics, and
computational number theory to investigate several difficult problems in number
theory from the point of view of understanding their limiting behaviour.

Several factors make this an appropriate time for a program devoted to
statistical questions in number theory.

In recent years, progress has been made on the
problem of obtaining the asymptotic number, $N_{K,n}(X)$, of extensions
of a fixed number field $K$
of given degree $n$ and discriminant $\leq X$. The case of $K={\mathbb Q}$ and $n=3$
is a classical result of Heilbronn and Davenport.
Bhargava has made significant
progress on this problem, obtaining the asympotics, for $\mathbb Q$ and
$n=4,5$.  This work makes use of the theory
of the classification of prehomogenous vector spaces.

Very recently, Bhargava and Shankar have managed to apply the methods used
for number fields to study the asymptotic distribution of ranks of elliptic
curves of a number field. ELABORATE..., AND CONNECT UP
WITH THE PREDICTIONS FROM RMT, AND SAY SOMETHING ABOUT ADJUSTING
DELAUNAY's COHEN-LENSTRA HEURISTICS FOR QUADRATIC TWISTS.

The Sato-Tate conjecture for the case of a modular form associated to an
elliptic curve over ${\mathbb Q}$ with somewhere multiplicative reduction was
recently proven by Clozel, Harris, Shepherd-Barron, and Taylor. We would like
to consider more specific questions such as the rate of convergence to the
Sato-Tate distribution.

The Katz and Sarnak philosophy on the spectral nature of $L$-functions,
specifically through function field analogues and connections to the classical
compact groups, has opened up the world of $L$-functions to detailed
probabilistic modeling. This has yielded tremendous success in providing
detailed models for the statistics of the zeros and values of $L$-functions,
but much work remains to be done, for example, to incorporate subtle arithmetic
information into these models. For instance, to understand the distribution of
ranks of elliptic curves, statistics of the Tate-Shafarevich groups and their
interaction with regulators must be studied and incorporated.

We also wish to understand the lower order terms and uniform asymptotics in
these statistics so as to be able to make precise predictions, for example,
regarding the maximum size of the Riemann zeta function.

During our program we are also extending work to cover higher degree
$L$-functions. While the theory of degree 1 and 2 $L$-functions has reached a
more mature form, much more attention is needed in higher degree.
Furthermore, many crucial and central conjectures have received scant, if any,
testing in the case of higher degree, and limited testing in the case of
degrees 1 and 2. For example, the models for the moments of $L$-functions have not yet been
applied or tested for degree three or higher $L$-functions.

Higher degree $L$-functions arise in many natural ways.  Sometimes they arise from operations performed on lower degree $L$-functions (e.g., symmetric squares) and sometimes they arise from objects that are, in a sense, more complicated.  For example Siegel modular and paramodular forms have natural degree 4 and degree 5 $L$-functions.  In order to study these $L$-functions numerically, one needs to be able to compute their Dirichlet series coefficients; in order to compute their Dirichlet series coefficients, one needs to be able to compute data about the underlying modular form.  A group of us will be developing and implementing algorithms to compute these modular forms and their associated $L$-functions.  The computation of Siegel modular forms, for example, is much hard that computing modular forms on ${\rm SL}(2,\mathbb{Z})$ and is much more {\it ad hoc}.

One might want to evaluate a higher degree $L$-function in order to, for example, compute the first few zeros on the critical line or central values of quadratic twists of $L$-functions.  Doing such an evaluation is typically limited by the number of Dirichlet series coefficients, a number which, for Siegel modular forms, at least, is usually pretty small.  So, another group of us is going to be investigating methods to evaluate $L$-functions optimally. 

Central values of twists of $L$-functions is a question that has been well studied for degree 2 $L$-functions and is mostly untouched for higher degree $L$-functions.  A project being carried out by our group is to compute a great number of twists of degree 4 $L$-functions to verify interesting conjectures that arise from Random Matrix Theory and others that arise as generalizations of results for the modular forms associated to lower degree $L$-functions.





{\bf Profile: Melanie Wood and Manjul Bhargava}

THIS NEEDS TO BE WRITTEN
