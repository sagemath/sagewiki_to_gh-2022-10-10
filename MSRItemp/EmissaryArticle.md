%
% Please add \usepackage[utf8x]{inputenc} to latex preamble so that accents show ok
%
THANKS TO BARRY MAZUR FOR WRITING THE WONDERFUL OPENING PARAGRAPHS TO GIVE OUR ARTICLE
SOME STRUCTURE.

(formats okay when placed in a
latex article, so ignore the fact that it doesn't look good on the screen)


\centerline{\bf What is Arithmetic Statistics?}
 \vskip20pt

Number Theory has its share of conjecture and heuristics that thrive on---if
not depend on---the accumulation of aggregates of  instances, aggregates of
numerical data.  

\vskip20pt To see that {\it numerical data related to numbers themselves} is
also at the very heart of the pleasure of number theory, and is a major reason
for the very {\it theory} itself, consider this letter of Gauss to one of his
students  (the {\it italics} are ours): \vskip20pt \begin{quote} Even before I
had begun my more detailed investigations into higher arithmetic, one of my
first projects was to turn my attention to the decreasing frequency of primes,
to which end {\it I counted the primes in several chiliads} and recorded the
results on the attached white pages. I soon recognized that behind all of its
fluctuations, this frequency is on the average inversely proportional to the
logarithm, so that the number of primes below a given bound $n$ is
approximately equal to
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
 Often, in modern number theory, to actually sample a sufficient quantity of
data that might allow you to guess even approximate qualitative behavior of the
issue you are studying, you may have to go out to very high numbers. For
example, there are basic questions about elliptic curves (e.g., what is the
frequency of those possessing two independent rational points of infinite
order) where if you only look at curves of conductor $< 10^8$, you might be
tempted to make guesses that are not only wrong, but qualitatively wrong.
 
   \vskip20pt Our program {\it Arithmetic Statistics} then stands for those
aspects of number theory---be it theory or computation---that connect closely
with concrete (important) {\it numerical data related to numbers themselves}.
\vskip15pt Many people in our program are engaged  in the theoretical side of
our subject, and many in the computational side.   Much ``theoretical" modern
number theory bears on, and sometimes has vital need of  large scale computing
projects and  large data-bases. And both the computational and theoretical
facets connect to some of the  famous heuristics in our subject:  {\it
Cohen-Lenstra} heuristics  (average expected size of various finite abelian
groups that appear in our subject; and {\it Random matrix} heuristics.


% Fundamental  issues include the statistics regarding zeroes of $L$-functions; arithmetic questions about elliptic curves---average size of Mordell-Weil ranks, and Selmer ranks; upper bounds on trigonometric sums; etc. And we have people in our program who are at the center of this activity.


\vskip10pt
The computational and theoretical facets of our subject form one interlocking unity. %Our program bridges these facets: people working in each of them will have ample opportunity to interact with people working in the other mode. 

\vskip10pt
  Here are a few examples of recent work that have been themes of our program: 
 \vskip10pt 
  \begin{itemize} \item  Manjul Bhargava together with his students and
co-authors have been developing extremely precise methods for counting
appropriate orbits of certain arithmetic groups acting on integral points on
certain lattices. This approach follows  and significantly refines the
classical Methods in the Geometry of Numbers (as had pursued by Gauss,
Minkowski, Siegel, and others).  A major application of this work of Bhargava
and co-authors is to establish counts of important ingredients of the
arithmetic of elliptic curves. Among their applications is the result of
Bhargava-Shankar that the average rank of the Mordell-Weil group of elliptic
curves over ${\bf Q}$---when they are ordered in any of the standard ways---is
$<1.5$. 
  
  This result is related to their study of the average {\it size} of the
$2$-Selmer rank of elliptic curves (again over ${\bf Q}$ ---and when they are
ordered in any of the standard ways). They show that the average size  is {\it
three}{\footnote{Of course no $2$-Selmer group can have such a size: these
$2$-Selmer groups are then all either above  or below  average.}}  For any
prime number $p$ the {\it reduced $p$-Selmer rank  of an elliptic curve over a
number field}{\footnote{ This is the dimension of the so-called $p$-Selmer
group minus the rank of rational $p$-torsion of the elliptic curve over the
number field.}} has this important property: it is  finite (!), computable (!)
(at least in principle), and  is an upper bound for the rank of the
Mordell-Weil group of the elliptic curve over the number field.  If the
Shafarevich-Tate conjecture holds, then for all but finitely many primes $p$,
the  reduced $p$-Selmer rank would be equal to that Mordell-Weil rank.  So it
is natural, as in the results of Bhargava and co-authors alluded to above, to
expect that the statistics of $p$-Selmer ranks  (e.g., even when restricted to
$p=2$) contribute to our understanding of Mordell-Weil ranks.  In the course of
our program we have been learning the most recent advances in this direction
($3$-Selmer, $5$-Selmer).
  \vskip10pt  
  \item The heuristics predicting ``average sizes" of quite a few important
arithmetic objects have also been the focus of our program. We are fortunate to
have both Henri Cohen and Hendrik Lenstra among us. They are  the
co-originators of the {\it Cohen-Lenstra heuristics}  that guides conjectures
regarding average sizes of ideal class groups and other important invariants in
number theory. The latest development in the formidable toolbox of heuristics
is due to Bjorn Poonen and Eric Rains and has a somewhat different slant; it
gives one precise guesses for the probabilities of reduced $p$-Selmer ranks for
elliptic curves  over a given number field  (when these curves are  ordered in
the usual way).  This too has been one of the focusses of our program.  A few
years ago, Peter Swinnerton-Dyer, extending earlier results of Heath-Brown,
studied the probabilities of reduced $2$-Selmer ranks of families of elliptic
curves that are quadratic twists of some very specific types of elliptic curves
over ${\bf Q}$. One grand (and enticing) feature of Swinnerton-Dyer's study is
that the probabilities arise  as if they were the product of a specific Markov
process; another curious feature---a drawback, perhaps---is that the statistics
are dependent upon ordering the elliptic curves in the twist family  {\it not
in the standard way} but in terms of the number of primes dividing the
discriminant.  All the issues that are brought up by this work are focusses of
current research in our program. Specifically, Dan Kane's work in the program
is towards relating such Swinnerton-Dyer statistics dependent upon different
orderings of the collection of elliptic curves being sampled, while Karl Rubin,
Zev Klagsbrun, and Barry Mazur are developing an approach (which has a `Markov
Process feel') to unconditionally prove the expected statistics for reduced
$2$-Selmer ranks over an arbitrary number field for all quadratic twists
families of many elliptic curves  (the elliptic curves in any of these families
are ordered in a certain not entirely unnatural, but again non-standard, way).
In separate work, Jonathan Hanke is collaborating with Bhargava and Shankar to
obtain the asymptotics for the 2-part of the class group of n-monogenic orders 
in cubic fields.

\vskip10pt \item Dirichlet L-functions are the simplest generalizations of the
Riemann zeta-function. They were invented by Dirichlet  and have been used to
prove an asymptotic formula for the number of primes up to a quantity $X$ in a
given arithmetic progression modulo $q$. Like the Riemann zeta-function each
Dirichlet L-function can be expressed as Dirichlet series (the Riemann
zeta-function has Dirichlet series coefficients $1,1,1,\dots$ and the first
Dirichlet L-function has coefficients that repeat mod 3:
$1,-1,0,1,-1,0,\dots$), has a functional equation and Euler product, and is
conjectured to have its zeros on the 1/2-line; the latter assertion is
sometimes called the Generalized Riemann Hypothesis. It can be proven that each
individual Dirichlet L-function has at least 40\% of its zeros on the 1/2-line.
Conrey, Iwaniec, and Soundararajan have  now shown that when all of the zeros
of these Dirichlet L-functions are taken together at least 55\% of these zeros
are on the 1/2-line.  To be specific, take a large number $Q$ and consider all
of the L-functions associated with a primitive character modulo $q$ where $q\le
Q$. Now consider all of the zeros of all of these L-functions which are located
in the rectangle of complex numbers with real parts between 0 and 1 and
imaginary parts between 0 and $\log Q$. CIS can prove that at least 55\% of the
zeros in this rectangle have real parts equal to 1/2.

The technique used by CIS is something they call the `asymptotic large
sieve.' This is a technique  which can be used to give an asymptotic formula
for a quantity that would have previously been estimated by the {\it large
sieve inequality.} The latter  has been a staple of number theorists for more
than 4 decades now. One spectacular application of the large sieve inequality
is to prove the Bombieri-Vinogradov theorem which asserts that when counting
primes up to $X$ in arithmetic progressions with moduli up to $Q$ then the
error terms behave, on average, as well as could be expected, that is, as well
as could be proved assuming the Generalized Riemann Hypothesis. Not
surprisingly, the Bombieri-Vinogradov theorem is a much celebrated result.
Indeed, Enrico Bombieri won the Fields medal in 1974 for this work.  A few
years ago Goldston, Pintz, and Yildirim used the BV theorem to prove their
much celebrated  theorem that the smallest gaps between consecutive prime
numbers are an order of magnitude smaller than the average gaps. Now, with
their asymptotic version of the large sieve, CIS have studied zeros on the
1/2-line, not only of Dirichlet L-functions, but of other families as well:
twists of a fixed L-function of degree 2 by Dirichlet characters (at least 36\%
of their zeros are on the 1/2-line) and twists of degree 3 L-functions (at
least one-half of one percent of their zeros are on the 1/2-line). In addition,
CIS have been able to confirm a prediction from Random Matrix Theory about the
sixth moment of Dirichlet L-functions at the point 1/2, averaged over
characters with moduli up to $Q$. They prove a formula which includes all of
the main terms and has an error term which is a power of $Q$ smaller than the
main terms The main terms are expressed in terms of simple factors multiplied
by a ninth degree polynomial in $\log Q$. The leading coefficient of the
polynomial is 42 and the lower terms are given explicitly in terms of
complicated arithemetic and geometric factors. The  theorem {\bf exactly}
matches the predictions arising from Random Matrix Theory, and provides
excellent confirmation of the RMT models for $L$-functions. 

    Besides the three researchers just discussed, we are very fortunate to have
as participants some of the pioneers who are developing probabilistic models for 
$L$-functions, including Roger Heath-Brown, David Farmer, Jon Keating, 
Francesco Mezzadri, Michael Rubinstein, Peter Sarnak, and Nina Snaith.

    \item Several of our rsearchers are examining statistics for
curves over finite fields. The zeros of the zeta function are the inverses of
the eigenvalues of the Frobenius endomorphism. The work of Katz and Sarnak
indicates that when $g$ is fixed and $q$ tends to infinity, the normalized
zeros are distributed like the eigenvalues of matrices in a group of random
matrices determined by the monodromy group of the moduli space of $C$. But the
related question of studying statistics as $q$ remains fixed and the genus $g$
grows to infinity is still largely unknown, though recent progress has been
made in computing the distribution of the trace of the Frobenius endomorphism
for various families by Kurberg-Rudnick, Bucur-David-Feigon-Lal\'in and
Bucur-Kedlaya.

The broader question of computing the global distribution of the
zeros in the $g$ limit remains. This is a non-trivial modeling job, since the
global obstruction imposes an infinite, but discrete, set of conditions that
the matrix model should satisfy. Such a model needs to exhibit both discrete
and continuous features in order to capture the global phenomenon. Bucur and
Feigon, together with their collaborators, David and Lal\'in will be working in
this direction while at MSRI.

    \item Computation and experimentation have been playing a large role in our
program. For example, postdocs Jonathan Bober and Ghaith Hiary have been
implementing Hiary's world's fastest algorithms for the Riemann zeta function,
computing zeros of $\zeta(s)$ with $\Im{s}$ near $10^{36}$.
Michael Rubinstein is developing general purpose algorithms for computing $L$-functions
and is also gathering extensive numerical evidence in favour of the Generalized Riemann
Hypothesis. William Stein has been tabulating elliptic curves over
$Q(\sqrt(5))$, and verifying the Birch and Swinnerton-Dyer conjecture.
Nathan Ryan, Nils Skoruppa, and Gonzalo Tornaría, in collaboration
with Martin Raum (RRST), have been studying methods for computing with Siegel
modular forms which have degree 4 $L$-functions associated to them.
Duc Khiem Huynh is attempting to develop probabilistic models for these $L$-functions
with the goal of testing the predictions using data provided by (RRST).
Nils Skoruppa works on a new algorithm for computing modular forms of half
integral weight directly from the periods of the associated modular forms of
integral weight. This will make it possible to tabulate half integral modular
forms of very high level without the need of computing complete (and then very
high dimensional) spaces as is required by the currently known algorithms.
David Farmer, Stefan Lemurell, and Sally Koutsoliotas are
developing methods for finding Maass forms for higher rank groups and testing
conjectures regarding their Fourier coefficients and associated $L$-functions.
Jonathan Hanke is working with Gonzalo Tornaría, and also collaborator Will Jagy, 
on classifying regular and spinor regular ternary quadratic forms,
improving the the modular symbols code in SAGE to make it more suitable for computations 
proving finiteness theorems, and making tables of quadratic forms in 3 and 4 variables 
(over Q and some small number fields) together with Robert Miller.
Cremona....

    In the study of elliptic curves over totally real number fields like
$Q(\sqrt 5)$ (recent work of William Stein) one is naturally led to Hilbert
modular forms. Work of Shimura and recently of Ikeda in Japan indicates that
there is a similar connection between modular forms of half integral weight and
modular forms of integral weight over number fields as it is well-known for
$Q$. However, as it is known from the theory over $Q$ it has several advantages
to replace in such a theory the modular froms of half integral weight by Jacobi
forms. The Fourier coefficients of these Jacobi forms correspond (in the theory
over $Q$) to the central value in the critical strip of the twisted $L$-series
of the associated Hilbert modular forms or elliptic curve over $Q$. Skoruppa
and his student Hatice Boylan are preparing a longer article to set up such a
theory over arbitrary number fields too based on results of Boylan's thesis. In
particular, they want, in joint work with Fredrik Str\"omberg, to compute
sufficiently many examples of Jacobi forms over $Q(\sqrt 5)$ which should
complement the computations of William Stein on elliptic curves over $Q(\sqrt
5)$.

In the case of Siegel modular forms a conjecture of
Böcherer---originaly stated in the case of the forms for the full
symplectic group---relates sums of Fourier coefficients of a form to
the central values of its twisted spinor L-series, generalizing the
formulas for the coefficients of Jacobi forms (over Q) mentioned
above. Similar formulas for the case of paramodular forms are being
investigated by Nathan Ryan and Gonzalo Tornaría. This case is of
particular interest due to the so-called Paramodular Conjecture which
proposes a bridge to geometry by relating spinor L-series attached to
paramodular forms with Hasse-Weil L-functions attached to rational
abelian surfaces (analogue to the Modularity Theorem of Wiles et al).
Ryan and Tornaría are trying to find algorithms to compute Fourier
coefficients of these paramodular forms in a large scale. This would
not only provide more evidence for both the Paramodular Conjecture and
the paramodular extension of Böcherer Conjecture, but would also allow
a large scale computation of central values of twists for degree 4
L-series, useful for testing and refining Random Matrix heuristics for
degree 4 L-series.


    \item $\dots$
\end{itemize}

Learning seminars, whereby our participants meet weekly to teach each other and
discuss material relevant to our research, form an important part of our
program. The Bhargava-Shankar group has been meeting to learn material related
to the work of Bhargava and Shankar on ranks of elliptic curves. The explicit
formula group is studying the problem of ranks from an analytic perspective.
The low lying zeros seminar has been looking at papers related to the
distribution of zeros in families of $L$-functions. Quadratic twists of
elliptic curves meets to discuss the problem of ranks of elliptic curves in
fmailies of quadratic twists. Earlier, a group was meeting to study the
Cohen-Lenstra heuristics and its extension to Tate-Shafarevich groups by
Christophe Delaunay. Lastly, a few researchers are holding a seminar to study
paramodular forms.

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
increase the number of women in their faculty. With participants covering
the spectrum from undergraduates to those with a long career behind them,
the discussion was lively and productive.

These two days then lead into the main Introductory workshop for the
Arithmetic Statistics program, which most of the Connections participants
stayed on to enjoy.

Three other workshops form a part of our program. Our introductory workshop
was held from January 31-February 4 and featured talks to help define the
direction of our program. Talks were given, in order of appearance, by: Henri
Cohen, Karl Rubin, Manjul Bhargava, Michael Rubinstein, Nina Snaith, Melanie
Wood, Brian Conrey, Andrew Sutherland, Jordan Ellenberg, David Farmer, John
Voight, Henryk Iwaniec, Akshay Venkatesh, John Cremona, Bjorn Poonen, William
Stein, Kannan Soundararajan, Chantal David, and Frank Thorne.

Several of the partipants in our program are also involved in a large scale
NSF funded collborative Focused Research Group project to develop methods
for computing with $L$-functions and associated automorphic forms, as well as
verify many of the important conjectures in this area. In order to help diffuse
the large mount of data being generated by the project, an archive with a
user friendly front end for browsing and searching the data is being developed,
and a workshop involving 15 participants was held at the MSRI, Feb 21-25,
to continue developing the archive.

The last workshop for our program will be held April 11-15 on the theme
of `Arithmetic Statistics' and it will highlight some of the work being carried out
at the MSRI during our program. In order to give participants more opportunity to interact
and collaborate fewer talks are being planned.



{\bf Profile: Melanie Wood and Manjul Bhargava}

THIS NEEDS TO BE WRITTEN
