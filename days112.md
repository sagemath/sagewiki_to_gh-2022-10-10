= Sage Days 112 Online, February-March 2021 =

[[http://sagemath.org|Sage]] is an open source software for mathematics. This is the webpage for the Sage workshop for [[https://www.irif.fr/~codys/Accueil|ANR CODYS]]. The aim is to:

 * introduce Sage to people in the ANR

 * implement Loick Lhote's code to compute spectrum of transfer operators on continued fraction algorithms.

 * help people to implement their own projects

The workshop will take place on two Thusrday mornings to be determined replacing the weekly sage seminar [[https://wiki.sagemath.org/thursdaysbdx|thursdaysbdx]].

Please fill up the [[https://cloud.irif.fr/apps/polls/s/TbGvvG3ASKmTafFH|poll]].

== Schedule ==

Presentation of Daudet-Flajolet-Vallée algorithm on Gauss map [[https://wiki.sagemath.org/days112?action=AttachFile&do=get&target=Gauss+spectrum.ipynb|notebook]].


== Projects ==

The following projects have been discussed during the [[https://www.irif.fr/~codys/Decembre20|last ANR meeting]] in December.

 * Implement computation of spectra for transfer operators associated to :
   1. Gauss map
   2. Jacobi-Perron
   3. Ostrowski
   4. Triangle map
   5. ...

 * Check Alkauskas theorem.

 * Fast approximation of top Lyapunov exponent (Pollicott paper [[https://link.springer.com/article/10.1007/s00222-010-0246-y|Maximal Lyapunov exponents for random matrix products]] via periodic orbits and determinant formula)
   * See whether it can be extended to simplicial systems... several problems
     * use canonical measure instead of Bernoulli measure
     * non-negative matrices instead of positive

 * Proven enclosure using ball arithmetic and remainder estimates
   * spectrum of transfer operators
   * top Lyapunov exponent
   * resonances of zeta function (eg https://arxiv.org/abs/2002.03334)
   * Hausdorff dimensions (eg the recent https://arxiv.org/abs/2012.07083)

Here are the project that where mentionned during the first meeting

    * "Certify" (or at least check) invariant measures with SageMath [Valerie]

    * First Lyapunov exponent using Pollicott https://doi.org/10.1007/s00222-010-0246-y

    * Faster algorithm to compute only the k first eigenvalues (instead of the whole spectrum)

    * Iterative methods for the computation of the k first eigenvalues and eignfunctions of the spectrum (the (n+1) x (n+1) matrix is obtained from the (n) x (n) matrix by adding one row and one column)... one issue is already to obtain the accuracy at n-th step.

    * Higher dimensional Daudet-Flajolet-Vallée (for example Brun in dimension 2, Jacobi-Perron) : Loïck : I can try to apply the method to Brun Algorithm...)

== Organizer ==

 * [[https://fougeron.perso.math.cnrs.fr/|Charles Fougeron]]

== Participants ==

 * [[https://www.irif.fr/~berthe/| Valérie Berthé]]
 * [[http://www.labri.fr/perso/vdelecro/|Vincent Delecroix]]
 * [[https://fougeron.perso.math.cnrs.fr/|Charles Fougeron]]
 * [[https://webusers.imj-prg.fr/~pierre-antoine.guiheneuf/|Pierre-Antoine Guihéneuf]]
 * [[http://www.slabbe.org/ | Sébatien Labbé]]
 * [[https://lapointemelodie.github.io/ | Mélodie Lapointe]]
 * [[https://lhote.users.greyc.fr/web/| Loick Lhote]]
 * Reza Mohammadpour
 * [[https://www.irif.fr/~steiner/| Wolfgang Steiner]]



== Support ==

This workshop is supported by ANR CODYS.

== Other events to (maybe) avoid ==


Février

 * 1 au 5 : JCB
   https://jcb2021.labri.fr/

Mars

 * 1 au 5 : JNCF
   https://sourcesup.renater.fr/www/orga-jncf/cours-2021.html
 * 15 au 19 : Aléa
    http://gt-alea.math.cnrs.fr/alea2021/
 * 23 au 26 : Journées nationales du GdR IM
   https://www.gdr-im.fr/event/journees-nationales-du-gdr-im-2020/
