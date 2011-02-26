PLEASE CONTRIBUTE, i.e. EDIT OR ADD TO:

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
    \item Dirichlet L-functions are the simplest generalizations of the Riemann zeta-function. They were invented by Dirichlet  and have been used to
prove an asymptotic formula for the number of primes up to a quantity $X$ in a given arithmetic progression modulo $q$. Like the Riemann zeta-function each Dirichlet L-function can be expressed as Dirichlet series (the Riemann zeta-function has Dirichlet series coefficients $1,1,1,\dots$ and the first Dirichlet L-function has coefficients that repeat mod 3: $1,-1,0,1,-1,0,\dots$), has a functional equation and Euler product, and is conjectured to have its zeros on the 1/2-line; the latter assertion is sometimes called the Generalized Riemann Hypothesis. It can be proven that each individual Dirichlet L-function has at least 40\% of its zeros on the 1/2-line.
Conrey, Iwaniec, and Soundararajan have  now shown that when all of the zeros of these Dirichlet L-functions are taken together at least
55\% of these zeros  are on the 1/2-line.  To be specific, take a large number $Q$ and consider all of the L-functions
associated with a primitive character modulo $q$ where $q\le Q$. Now consider all of the zeros of all of these L-functions which are located in the rectangle of complex numbers with real parts between 0 and 1 and imaginary parts between 0 and $\log Q$.
CIS can prove that at least 55\% of the zeros in this rectangle have real parts equal to 1/2.

The technique used by CIS is something they call the ``asymptotic large sieve.'' This is a technique  which can be used to give an asymptotic formula for a quantity that would have previously been estimated by the {\it large sieve inequality.} The latter  has been
 a staple of number theorists for more than 4 decades now. One spectacular application of the large sieve inequality is to prove the Bombieri-Vinogradov theorem which asserts that
when counting primes up to $X$ in arithmetic progressions with moduli up to $Q$ then the error terms behave, on average, as well as could be expected, that is, as well as could be proved assuming the Generalized Riemann Hypothesis. Not surprisingly, the Bombieri-Vinogradov theorem is a much celebrated result. Indeed, Enrico Bombieri won the Fields medal in 1974 for this work.  A few years ago Goldston, Pintz, and Yildirim used the BV theorem to prove their  much celebrated  theorem that the smallest gaps between consecutive prime numbers are an order of magnitude smaller than the average gaps.
Now, with their asymptotic version of the large sieve, CIS have studied zeros
on the 1/2-line, not only of Dirichlet L-functions, but of other families as well: twists of a fixed L-function of degree 2 by Dirichlet characters (at least 36\% of their zeros are on the 1/2-line) and twists of degree 3 L-functions (at least one-half of one percent of their zeros are on the 1/2-line). In addition, CIS have been able to confirm a prediction from Random Matrix Theory about the sixth moment of Dirichlet L-functions at the point 1/2, averaged over characters with moduli up to $Q$.
 They prove a formula which includes all of the main terms and has an error term which is a power of $Q$ smaller than the main terms The main terms are expressed in terms of simple factors multiplied by a ninth degree polynomial in $\log Q$. The leading coefficient of the polynomial is 42
 and the lower terms are given explicitly in terms of complicated arithemetic and geometric factors. The  theorem {\bf exactly} matches the predictions arising from Random Matrix Theory.  This is the best confirmation to date of the RMT models for $L$-functions. 
    \item Another interesting problem is that of computing statistics for curves over finite fields. The zeros of the zeta function are the inverses of the eigenvalues of the Frobenius endomorphism. The work of Katz and Sarnak indicates that when $g$ is fixed and $q$ tends to infinity, the normalized zeros are distributed like the eigenvalues of matrices in a group of random matrices determined by the monodromy group of the moduli space of $C$. But the related question of studying statistics as $q$ remains fixed and the genus $g$ grows to infinity is still largely unknown, though recent progress has been made in computing the distribution of the trace of the Frobenius endomorphism for various families by Kurberg-Rudnick, Bucur-David-Feigon-Lal\'in and Bucur-Kedlaya.
The broader question of computing the global distribution of the zeros in the $g$ limit remains. This is a non-trivial modeling job, since the global obstruction imposes an infinite, but discrete, set of conditions that the matrix model should satisfy. Such a model needs to exhibit both discrete and continuous features in order to capture the global phenomenon. Bucur and Feigon, together with their collaborators, David and Lal\'in will be working in this direction while at MSRI.

    \item Computation and experimentation have been playing a large role in our program. For example, postdocs Jonathan Bober and Ghaith Hiary have been implementing Hiary's world's fastest algorithms for the Riemann zeta function, computing zeros of $\zeta(s)$ with $\Im{s}$ near $10^{36}$. Andrew Booker and Michael Rubinstein are carrying out computations of zeros of more general $L$-functions, gathering extensive numerical evidence in favour of the Riemann Hypothesis. William Stein has been tabulating elliptic curves over $Q\(sqrt(5))$, and verifying the Birch and Swinnerton-Dyer conjecture. Nathan Ryan, Nils Skoruppa, Fredrik Str\"omberg, and Gonzalo Tornaria have been studying methods for computing with Siegel modular and paramodular forms which have degree 4 and 5 $L$-functions associated to them. Duc Khiem Huynh is attempting to develop probabilistic models for these $L$-functions with the goal of testing the predictions. Nils Skoruppa works on a new algorithm for computing modular forms of half integral weight directly from the periods of the associated modular forms of integral weight. This will make it possible to tabulate half integral modular forms of very high level without the need of computing complete (and then very high dimensional) spaces as is required by the currently known algorithms.
of these models. David Farmer, Stefan Lemurell, and Sally Koutsoliotas are developing methods for finding Maass forms for higher rank groups and testing conjectures regarding their Fourier coefficients and associated $L$-functions.
    \item In the study of elliptic curves over totally real number fields like $Q(\sqrt 5)$ (see recent work of William Stein) one is naturally led to Hilbert modular forms. Work of Shimura and recently of Ikeda in Japan indicates that there is a similar connection between modular forms of half integral weight and modular forms of integral weight over number fields as it is well-known for $Q$. However, as it is known from the theory over $Q$ it has several advantages to replace in such a theory the modular froms of half integral weight by Jacobi forms. The Fourier coefficients of these Jacobi forms correspond (in the theory over $Q$) to the central value in the critical strip of the twisted $L$-series of the associated Hilbert modular forms or elliptic curve over $Q$. Skoruppa and his student Hatice Boylan are preparing a longer article to set up such a theory over arbitrary number fields too based on results of Boylan's thesis. In particular, they want, in joint work with Fredrik Str\"omberg, to compute sufficiently many examples of Jacobi forms over $Q(sqrt 5)$ which should complement the computations of William Stein on elliptic curves over $Q(\sqrt 5)$.   


    \item $\dots$
\end{itemize}

The first workshop to take place as part of the Arithmetic Statistics
program was the 2-day Connections for Women event.  This targeted female
mathematicians in fields related to the program, but we were pleased to see
that all aspects of the workshop were well-attended by the program's
participants, which lead to a very even mix of male and female researchers.
The Connections for Women workshop was a very agreeable mixture of excellent
talks, a buzz of mathematical discussion and a chance to meet new people;
every math workshop should be like this! The audience enjoyed 6 superb talks
by leading women in the area, ranging from the number theory involved in
cryptography to several of the questions of counting (ranks, points on
curves, number fields) that are themes of the rest of the program.

The discussion session on pursuing a career in mathematics saw senior
mathematicians giving advice on how to apply for first jobs and postdoctoral
positions, some anecdotes about how dual-career couples have found posts in
the same institution, and strategies for departments keen to 
increase the number of women in their faculty.   With participants covering 
the spectrum from undergraduates to those with a long career behind them,
the discussion was lively and productive.

These two days then lead into the main Introductory workshop for the
Arithmetic Statistics program, which most of the Connections participants
stayed on to enjoy. 

BLURB ABOUT THE INTRODUCTORY WORKSHOP

BLURB ABOUT THE READING SEMINARS







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
