

# Sage Days 112 Online, February-March 2021

<a class="http" href="http://sagemath.org">Sage</a> is an open source software for mathematics. This is the webpage for the Sage workshop for <a class="https" href="https://www.irif.fr/~codys/Accueil">ANR CODYS</a>. The aim is to: 

* introduce Sage to people in the ANR 
* implement Loick Lhote's code to compute spectrum of transfer operators on continued fraction algorithms. 
* help people to implement their own projects 
The workshop will take place on two Thusrday mornings to be determined replacing the weekly sage seminar <a class="https" href="https://wiki.sagemath.org/thursdaysbdx">thursdaysbdx</a>. 

Please fill up the <a class="https" href="https://cloud.irif.fr/apps/polls/s/TbGvvG3ASKmTafFH">poll</a>. 


## Material

   * Daudet-Flajolet-Vallée algorithm on Gauss map <a class="https" href="https://wiki.sagemath.org/days112?action=AttachFile&amp;do=get&amp;target=Gauss+spectrum.ipynb">notebook</a>. 
   * Pollicott algorithm for Lyapunov exponents of random matrix products <a class="https" href="https://wiki.sagemath.org/days112?action=AttachFile&amp;do=get&amp;target=Pollicott%27s+algorithm.ipynb">notebook</a>. 

## Projects

The following projects have been discussed during the <a class="https" href="https://www.irif.fr/~codys/Decembre20">last ANR meeting</a> in December. 

* Implement computation of spectra for transfer operators associated to : 
      1. Gauss map 
      1. Jacobi-Perron 
      1. Ostrowski 
      1. Triangle map 
      1. ... 
* Check Alkauskas theorem. 
* Fast approximation of top Lyapunov exponent (Pollicott paper <a class="https" href="https://link.springer.com/article/10.1007/s00222-010-0246-y">Maximal Lyapunov exponents for random matrix products</a> via periodic orbits and determinant formula) 
      * See whether it can be extended to simplicial systems... several problems 
            * use canonical measure instead of Bernoulli measure 
            * non-negative matrices instead of positive 
* Proven enclosure using ball arithmetic and remainder estimates 
      * spectrum of transfer operators 
      * top Lyapunov exponent 
      * resonances of zeta function (eg <a href="https://arxiv.org/abs/2002.03334">https://arxiv.org/abs/2002.03334</a>) 
      * Hausdorff dimensions (eg the recent <a href="https://arxiv.org/abs/2012.07083">https://arxiv.org/abs/2012.07083</a>) 
Here are the project that where mentionned during the first meeting 

         * "Certify" (or at least check) invariant measures with <a href="/SageMath">SageMath</a> [Valerie] 
         * First Lyapunov exponent using Pollicott <a href="https://doi.org/10.1007/s00222-010-0246-y">https://doi.org/10.1007/s00222-010-0246-y</a> 
         * Faster algorithm to compute only the k first eigenvalues (instead of the whole spectrum) 
         * Iterative methods for the computation of the k first eigenvalues and eignfunctions of the spectrum (the (n+1) x (n+1) matrix is obtained from the (n) x (n) matrix by adding one row and one column)... one issue is already to obtain the accuracy at n-th step. 
         * Higher dimensional Daudet-Flajolet-Vallée (for example Brun in dimension 2, Jacobi-Perron) : Loïck : I can try to apply the method to Brun Algorithm...) 

## Organizer

* <a class="https" href="https://fougeron.perso.math.cnrs.fr/">Charles Fougeron</a> 

## Participants

* <a class="https" href="https://www.irif.fr/~berthe/">Valérie Berthé</a> 
* <a class="http" href="http://www.labri.fr/perso/vdelecro/">Vincent Delecroix</a> 
* <a class="https" href="https://fougeron.perso.math.cnrs.fr/">Charles Fougeron</a> 
* <a class="https" href="https://webusers.imj-prg.fr/~pierre-antoine.guiheneuf/">Pierre-Antoine Guihéneuf</a> 
* <a class="http" href="http://www.slabbe.org/">Sébatien Labbé</a> 
* <a class="https" href="https://lapointemelodie.github.io/">Mélodie Lapointe</a> 
* <a class="https" href="https://lhote.users.greyc.fr/web/">Loick Lhote</a> 
* Reza Mohammadpour 
* <a class="https" href="https://www.irif.fr/~steiner/">Wolfgang Steiner</a> 

## Support

This workshop is supported by ANR CODYS. 


## Other events to (maybe) avoid

Février 

* 1 au 5 : JCB 
      * <a href="https://jcb2021.labri.fr/">https://jcb2021.labri.fr/</a> 
Mars 

* 1 au 5 : JNCF 
      * <a href="https://sourcesup.renater.fr/www/orga-jncf/cours-2021.html">https://sourcesup.renater.fr/www/orga-jncf/cours-2021.html</a> 
* 15 au 19 : Aléa 
         * <a href="http://gt-alea.math.cnrs.fr/alea2021/">http://gt-alea.math.cnrs.fr/alea2021/</a> 
* 23 au 26 : Journées nationales du GdR IM 
      * <a href="https://www.gdr-im.fr/event/journees-nationales-du-gdr-im-2020/">https://www.gdr-im.fr/event/journees-nationales-du-gdr-im-2020/</a> 