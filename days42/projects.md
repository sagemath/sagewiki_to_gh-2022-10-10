== Jen's project ==

(People: Aly & Hester: Check out my patch! [[http://trac.sagemath.org/sage_trac/ticket/13266#no1]])

The paramodular groups are subgroups of GSp(4) which are good analogues of the congruence subgroups underlying the new and old-form theory for GL(2).  They have been studied for a long time for the connection to abelian surfaces with polarizations of type (1,N), but are not as prevalent in the literature on Siegel modular forms as the Siegel congruence subgroup.  Interest in these subgroups has increased in the past years in part due to a precise analog of the Taniyama-Shimura conjecture for abelian surfaces by Brumer and Kramer known as the paramodular conjecture.

In this project, we will build onto the SiegelModularForms_class which is described in the paper by Raum, Ryan, Skoruppa and Tornari.   One project is to implement a method to compute the two Hecke operators for the paramodular group at any level on the Fourier expansion of a paramodular form.  There is an explicit description of these Hecke operators in the book by Roberts and Schmidt.

Another project would be to compute a set of examples of non-prime level of paramodular forms from the table of Hilbert modular forms over Q(\sqrt(5)) (http://arxiv.org/abs/1202.6612) and their associated abelian surfaces by computing the Weil restriction of the elliptic curves and the automorphic induction of the modular forms as described in J-L. and Roberts (http://www.sciencedirect.com/science/article/pii/S0022314X11002332).

References:
See these two papers: [[attachment:1205.6255.pdf]], [[attachment:leungroberts_jntfinal.pdf]].  The one by Brooks and I has a quick description of the paramodular group and the Hecke operators in the introduction.  The second paper describes the SiegelModularForms_class and gives some examples of how it has been used for various Siegel modular forms.  I have been talking to the authors, and there may be some issues of the class playing nicely with the current version of sage.  There is an explicit description of the action of the Hecke operators (there are two at every level) on the Fourier expansion of a paramodular form.  This is given in the book by Roberts and Schmidt.

Siegel modular forms of degree two attached to Hilbert modular forms by J.-L. and Roberts
There are a few minor changes from the arXiv version, but not affecting the referenced sections.

Local Newforms for GSp(4) by Roberts and Schmidt.  It is LNM 1918.

Explicit computations of Siegel modular forms of degree two by Raum, Ryan, Skoruppa and Tornari

Other reading: 
Paramodular Abelian Varieties of Odd Conductor by Brumer and Kramer 
This is the paper where they formulate the paramodular conjecture.
Paramodular Cusp Forms by Poor and Yuen
Computation of examples of paramodular forms of prime level.



== Kristin's project ==

(People: Jen B., Sarah, Christelle, Sorina)

Recall that the Hilbert class polynomial has as its zeros j-invariants of elliptic curves with complex multiplication (CM). In the case of genus 2, Igusa class polynomials play the analogous role: their zeros are Igusa invariants of genus 2 curves whose Jacobians have CM by a quartic CM ﬁeld K. These Igusa invariants, in turn, require knowledge of the Siegel modular forms $\chi_{10}$ and $\chi_{12}$.

One computational difference between genus 1 and 2 is that the Hilbert class polynomial has coefficients in Z, whereas the Igusa class polynomials have coefficients in Q. The difficulty, then, in genus 2, is understanding how bad these denominators are, because recovering the coeﬃcients from approximations requires a bound on the denominators. (See, e.g., [2].  For some other details on the circle of ideas involved, see [3].)

In genus 3, the analogous computation requires us to properly understand $\chi_{18}$. This project will be about various things concerning $\chi_{18}$, with the eventual goal of getting some computational data for $\chi_{18}$ evaluated at CM points which we could study arithmetically and use to prove bounds on the primes which appear.


Tasks:

0. Translate pari code theta functions

1. Write 3-dim theta functions in Sage

2. Find formulas for Fourier coefficients of dimension 3 Eisenstein series

3. Describe CM points in dim 3, check code


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

(People: Anna, Adriana, Stephanie, Lola, Alina, Holly, Bianca T.)

[[attachment:ManesProject.pdf]]

Some possible projects:

 * Take a map defined over $\mathbb{Q}$. If I have a periodic point mod infinitely many primes, does it come from a rational point? (It would be nice to have some examples.)

 * Towers of finite fields. Find the proportion of strictly periodic points. Eg. $x^2 + c$ over $\mathbb{F}_{3^n}$. Could also look at $x^2 + c$ over $\mathbb{F}_{5^n}$. What is different about $3$ vs. $5$? Almost certainly, if we can say something about $x^2 + c$, we can say something about $x^m + c$. (Adriana, Holly, Lola, Bianca)

 * Generalizing the Flynn-Garton Paper for the average number of periodic points for a quadratic map modulo primes. Saying something about quadratic maps (mod $p$) would be interesting. (Anna, Stephanie) 

 * Look at the Sage code on ProjSpace (https://wfs.gc.cuny.edu/BHutz/www/ProjSpace.html) and see if we can extend some of the programs. Eg. We need cycle_structure to work (mod p) and we need fast iterates.


Michelle's old code for towers of finite fields:

def iter_set(list, m, c):
   T = []
   for x in list:
       T.append(x^m + c)
   return Set(T)

def per_pts(list, m, c):
   S = Set(list)
   T = iter_set(S, m, c)
   while S != T:
       S = T
       T = iter_set(S, m, c)
   return S

for c in (0..2):
    for d in (2..11):
        print("m = ", m, "c = ", c)
        for n in (1..10):
            F.<a> = GF(3^n)
            print(len(per_pts(F, m, c))/3^n.n())
        print("***************************")

 *[[http://trac.sagemath.org/sage_trac/ticket/13130|Link to Ben Hutz's patch for ProjSpace ]]

Adriana, Lola, and Bianca's code for "square-and-multiply"-type (fast?) iteration algorithm:

These functions take a polynomial and an integer n and uses a "square-and-multiply" algorithm to find the n-th iterate of f. You have to initialize a polynomial ring first. "iteratelist" outputs the vector with the "squares".

def iteratelist(f, n):
    v = []
    s = n.bits()
    F = f
    for n in range(len(s)):
        if Integer(s[n]) == 1:
            v.append(F)
        if n != len(s) - 1:
            F = F(F)
    return v

def iterate(f, n):
    v = iteratelist(f, n)
    g = v[0]
    for n in range(1, len(v)):
        g = v[n](v[n - 1])
    return g

This function evaluates the iterate at a particular point. The benefits of this type of algorithm are much clearer when one uses a finite field, as with the usual fast powering algorithms.

def iterate2(f, n, a):
    w = iterate(f, n)
    return w(a)

Adriana and Lola's Sage worksheet for the fast iteration function:

[[attachment:FastIteration.sws]]
