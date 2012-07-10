== Jen's project ==

== Kristin's project ==
 
Recall that the Hilbert class polynomial has as its zeros j-invariants of elliptic curves with complex multiplication (CM). In the case of genus 2, Igusa class polynomials play the analogous role: their zeros are Igusa invariants of genus 2 curves whose Jacobians have CM by a quartic CM ﬁeld K. These Igusa invariants, in turn, require knowledge of the Siegel modular forms $\chi_{10}$ and $\chi_{12}$.

One computational difference between genus 1 and 2 is that the Hilbert class polynomial has coefficients in Z, whereas the Igusa class polynomials have coefficients in Q. The difficulty, then, in genus 2, is understanding how bad these denominators are, because recovering the coeﬃcients from approximations requires a bound on the denominators. (See, e.g., [2].  For some other details on the circle of ideas involved, see [3].)

In genus 3, the analogous computation requires us to properly understand $\chi_{18}$. This project will be about various things concerning $\chi_{18}$, with the eventual goal of getting some computational data for $\chi_{18}$ evaluated at CM points which we could study arithmetically and use to prove bounds on the primes which appear.

Here are some starting points:

0) Understand the definition of $\chi_{18}$, as in pp. 850 - 854 of [4].
(Lemma 10 defines $\chi_{18}$ as the product of the 36 even theta characteristics and Lemma 11 gives a geometric interpretation.)

1) Has $\chi_{18}$ been expressed in terms of Eisenstein series, as has been done for $\chi_{10}$ and $\chi_{12}$? See pp. 189-195 in [5].  In [1], evaluating Igusa functions via the Eisenstein series expansion is investigated, and explicit bounds are proved on the tail of the expansion.  Analogous bounds in the genus 3 case could also be helpful.

2)  Ritzenthaler used the 36 even theta characteristics definition to do some explicit computations of $\chi_{18}$ when the abelian variety is a power of an elliptic curve E with complex multiplication. Some details are in Section 4 of [7]. Compare this computation (timing-wise) to one that uses the Fourier expansion definition. Which one converges faster/is more efficient? Which one allows us to better control precision?

References:

[1] R. Broker and K. Lauter, Evaluating Igusa functions, preprint. (http://arxiv.org/pdf/1005.1234v2.pdf)

[2] E. Goren and K. Lauter, Class invariants for quartic CM fields. Annales Inst. Fourier 57, 2 (2007), p.457-480.

[3] H. Grundman, J. Johnson-Leung, K. Lauter, A. Salerno, B. Viray and E. Wittenborn, Igusa class polynomials, embeddings of quartic CM fields, and arithmetic intersection theory, WIN— Women in Numbers, Fields Inst. Comm., vol. 60, AMS, Providence, RI, 2011, pp. 35—60.

[4] J.-I. Igusa, Modular forms and projective invariants, Amer. J. Math. 89 (1967), 817-855.

[5] J.-I. Igusa, On Siegel modular forms of genus two, Amer. J. Math. 84 (1962), 175-200.

[6] J.-I. Igusa, On Siegel modular forms of genus two, II, Amer. J. Math. 86 (1964), 392-412.

[7] C. Ritzenthaler, Explicit computations of Serre's obstruction for genus-3 curves and application to optimal curves. LMS J. Comput. Math.13 (2010), 192-207 (http://arxiv.org/pdf/0901.2920v2).

== Michelle's project ==

A discrete dynamical system simply consists of a set $S$ with a self-map $\phi : S \to S$, thus allowing iteration.  A fundamental goal of dynamics is to classify the points of $S$ (for various choices of $S$ and various maps) according to the behavior of their forward orbit:
\[
\mathcal O_\phi (x) = \{ x, \phi(x), \phi^2(x), \phi^3(x), \ldots \}.
\]
(Here the exponent $n$ denotes $n$-fold composition, and we take $\phi^0(x) = x$.)
If the orbit is finite, the point is pre-periodic.  That is, for some integers $m > n \geq 0$ we have $\phi^m(x) = \phi^n(x)$.  If the orbit is infinite, the point is called wandering.

Of course, when the set $S$ is taken to be a finite field, all orbits are finite, hence all points are pre-periodic.  It is then natural to ask what the orbit structures might look like.  Consider a quadratic map of the form $\phi(x) = x^2 + c$ over a finite field $\mathbb F_q$.  Every point (other than $c$) should have two preimages.  Do you expect one large cycle using about half the points, with the other half feeding in to each of the points on the cycle?  Or do you expect several small cycles?  Or do you expect relatively few small cycles, with lots of points feeding in?  (In other words, what proportion of the points do you expect to be actually periodic --- meaning that $\phi^n(x) = x$ for some $n>0$ --- versus strictly pre-periodic?  And can you say anything about the expected sizes of the cycles?)



{\bf Readings:}  A short general introduction to dynamics can be found in Joe Silverman's lecture notes from the 2010 Arizona Winter School: 
\url{http://swc.math.arizona.edu/aws/2010/2010SilvermanNotes.pdf}.  A more thorough introduction can be found in Silverman's book \emph{The Arithmetic of Dynamical Systems}.

In her thesis (available here: \url{http://hdl.handle.net/1802/17020}), Madhu investigates the polynomial map $\phi(x) = x^m + c$.  She shows that,  under some hypotheses on $m$ and $c$, we have
\[
\lim_{p\to \infty} \frac{\#\left\{ \mathbb F_p \textup{ periodic points of } \phi \right\}}{p} = 0.
\]
In other words, we expect a small number of periodic points with long tails feeding in.  

Flynn and Garton (preprint here: \url{http://arxiv.org/abs/1108.4132}) tackle questions of the average number of connected components and average number of periodic points for dynamical systems over a finite field.  They prove that the average number of periodic points of a polynomial over $\mathbb F_q$ is bounded below by $\frac 5 6\sqrt q$, but their results are only strong when the degree $d$ of the polynomial is greater than $\sqrt q$.


Projects:
\begin{enumerate}
\item
Building on Madhu's thesis described above:
What about other types of maps?  (Non uni-critical?  Non polynomial?)  Does the result or something like it still hold?
\item
Also building on Madhu's thesis:
What if we look at a tower of finite fields instead?  Is it true under reasonable assumptions on $m$ and $c$ that 
\[
\lim_{n\to \infty} \frac{\#\left\{ \mathbb F_{p^n} \textup{ periodic points of } \phi \right\}}{p^n} = 0?
\]
\item
If we start with a polynomial $\phi(x) \in \mathbb Q[x]$, for all but finitely may primes $p$, we have the reduction $\phi_p \in \mathbb F_p[x]$ as a polynomial of the same degree.  Are there global polynomials so that the reduction has an unexpectedly large set of periodic points (and, of course,  what do we mean by ``unexpectedly large'')?
\end{enumerate}
