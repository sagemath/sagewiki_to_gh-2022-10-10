

# Sage Days 64: Algebraic Combinatorics


## General Information

The goal of these Sage Days is to bring together developers in algebraic combinatorics, Lie theory, and representation theory to discuss needed features and develop code. People who have coded in <a class="http" href="http://www.sagemath.org">Sage</a> and would like to get help getting their code integrated into Sage are also welcome to join. Any level of Sage experience is welcome, however there will not be basic (python) programming tutorials. We encourage people who wish to participate to have an understanding of basic python (there are <a class="http" href="http://www.sagemath.org/doc/thematic_tutorials/tutorial-programming-python.html">numerous tutorials</a> available online and books available if you want to learn) and basic object-oriented programming (OOP for short). A longer list of <a class="http" href="http://thales.math.uqam.ca/~saliola/sage/tutorials/">Sage tutorials</a> are available online as well. 

We would like to point out that a combinatorics related workshop will be held at AIM the following week for people who would like to combine the two, see <a class="http" href="http://aimath.org/workshops/upcoming/dynalgcomb/">AIM workshop</a>. 


### When & Where

March 17-20, 2015 at <a class="http" href="http://www.ucdavis.edu">UC Davis</a>. 


### Registration

Registration is now closed due to space limitations and funding decisions have been made. If you have questions about registration, e-mail either Anne (anne at math.ucdavis.edu) or Travis (tscrim at ucdavis.edu). 


### Lodging

We have the following "official" conference hotels. To get the specified room rates, when making the reservation mention that you are with "Sage Days". You need to book your room before February 3, 2015 to get the special rates. 

* <a class="http" href="http://www.aggieinn.com/">Aggie Inn</a> (530)-756-0352 Conference rate of $114 - 134 a night. 
* <a class="http" href="http://book.bestwestern.com/bestwestern/US/CA/Davis-hotels/BEST-WESTERN-University-Lodge/Hotel-Overview.do?propertyCode=05363">Best Western University Lodge</a> $95 a night. 
There is also the following recommendation: 

* <a class="http" href="http://www.econolodge.com/bestrate/davis-california-hotels?source=pmfgoell&amp;brand-code=EL&amp;pmf=google&amp;k_clickid=9c601c88-20c4-4417-a9f9-72d8b7e24fa2&amp;chain=E">Econolodge</a> (make sure you pick the one in Davis) 
If you are receiving funding, please contact Matt Silver (mtsilver at math.ucdavis.edu) to reserve a room. 


### Transportation

The nearest airport is Sacramento International (SAC), and are multiple ways to get to UC Davis. There is <a class="http" href="http://www.yolobus.com/news/airportservice.php">bus route 42</a>. There is also an <a class="https" href="https://www.davisairporter.com/index2.html">airport shuttle</a>. 

The two other nearby major airports are San Francisco International (SFO) and Oakland International (OAK). From both airports, a combination of <a class="http" href="http://www.bart.gov">BART</a> and <a class="http" href="http://www.amtrak.com/home">Amtrak</a> can be used to get to UC Davis. In particular, there is the <a class="http" href="http://www.capitolcorridor.org/">Capital Corridor</a> line at either the Oakland Coliseum or Richmond BART stations. 

See also: <a href="https://www.math.ucdavis.edu/about/directions/">https://www.math.ucdavis.edu/about/directions/</a> 


## Schedule

All talks and coffee breaks will be in <a class="http" href="http://campusmap.ucdavis.edu/">Mathematical Sciences Building (MSB)</a> 1147. Coding sprints will take place in MSB 1147, MSB 3240, MSB 3236, MSB 3106 (after 3pm on Wednesday). 
 Tuesday 3/17 |||
 9:30 AM  |  Coffee break ||
 10 - 11 AM  |  Nicolas Thiéry  |  Introduction to Sage Development I 
 11 - 12 AM  |  Franco Saliola  |  Introduction to Sage Development II 
 12 - 12:30 PM  |  Introductions and discussions of projects ||
 12:30 - 1:30 PM  |  Lunch ||
 3:30 PM  |  Coffee break ||
 Wednesday 3/18 |||
 9:30 AM  |  Coffee break ||
 10 - 11 AM  |  Vivien Ripoll & Jean-Philippe Labbé  |  Computing and displaying infinite root systems 
 11 - 12 AM  |  Mark Shimozono  |  Implementation of double affine Hecke algebra in Sage 
 12 - 1:30 PM  |  Lunch ||
 1:30-2:15pm |  Eric Gourgoulhon  |  Introduction to SageManifolds (<a class="http" href="http://sagemanifolds.obspm.fr/doc/sagemanifolds-days64.pdf">slides</a>, <a class="http" href="http://sagemanifolds.obspm.fr/examples/html/SM_sphere_S2_days64.html">example worksheet</a>) 
 3:30 PM  |  Coffee break ||
 Thursday 3/19 |||
 9:30 AM  |  Coffee break ||
 10 - 11 AM  |  Nathan Williams  |  Sage Days $dim(V_{\rho}(A_3))$ 
 11 - 12pm  |  Nicolas Thiéry  |  Writing a parent and a category in Sage: <a href="days64/WritingAParentAndACategoryDemo.ipynb">Jupyter notebook</a> <a href="days64/WritingAParentAndACategoryDemo.pdf">pdf</a> 
 12 - 1 PM  |  Lunch ||
 3:30 PM  |  Coffee break ||
 Friday 3/20 |||
 9:30 AM  |  Coffee break ||
 10 AM  |  Everyone  |  <a class="http" href="http://en.wikipedia.org/wiki/Show_and_tell_(education)">Visualization Show & Tell</a> 
        |            |  <a class="http" href="http://wiki.sagemath.org/combinat/CoolPictures">Cool Pictures in combinatorics</a> (add more!)
        |            |  <a class="http" href="http://sagemanifolds.obspm.fr/gallery.html">Cool Pictures produced with SageManifolds</a>
 12 - 1 PM  |  Lunch ||
 3:30 PM  |  Coffee break ||

All other time will be devoted to coding sprints. 


## Projects

If you have any projects that you'd want to work on, please add them. If you want to work on any project listed, just add your name. 

* Extended affine Weyl groups (<a class="http" href="http://trac.sagemath.org/ticket/15375">#15375</a>) - Dan Bump, Anne Schilling, Mark Shimozono, Nicolas Thiéry, Mee Seong Im 
* Lie algebras (<a class="http" href="http://trac.sagemath.org/ticket/14901">#14901</a>) - Travis Scrimshaw, Mee Seong Im, Darij Grinberg, Daniel Bump 
* Root (and Weight) multiplicities of Kac-Moody algebras - Kyu-Hwan Lee, Ben Salisbury, Jonathan Judge, Daniel Bump 
* Hyperbolic Cartan types (<a class="http" href="http://trac.sagemath.org/ticket/15974">#15974</a>) - Travis Scrimshaw 
      * Related with limit roots in hyperbolic types (<a class="http" href="http://trac.sagemath.org/ticket/16087">#16087</a>) 
      * Might also be useful: <a href="http://trac.sagemath.org/ticket/15703">http://trac.sagemath.org/ticket/15703</a> 
* Infinite root systems of Coxeter groups, and visualization (<a class="http" href="http://trac.sagemath.org/ticket/16087">#16087</a> and <a class="http" href="http://trac.sagemath.org/ticket/15703">#15703</a>) - Jean-Philippe Labbe and Vivien Ripoll 
* Lie groups (in connection with SageManifolds <a class="http" href="http://trac.sagemath.org/ticket/14865">#14865</a>) - Eric Gourgoulhon, Travis Scrimshaw, Mee Seong Im 
* Generalized toggle groups (<a class="http" href="http://trac.sagemath.org/ticket/17978">#17978</a>) and homomesy - Jessica Striker, Emily Gunawan 
* Snake graph formula for curves on cluster algebra triangulations (<a class="http" href="http://trac.sagemath.org/ticket/16310">#16310</a>) - Emily Gunawan 
* Implement categories and general framework for representations - Travis Scrimshaw, Mee Seong Im, Nicolas Thiéry, Franco Saliola, Aladin Virmaux 
* Alternating sign matrices (implement fully packed loops, map to link pattern, fix corner sum matrix (<a class="http" href="http://trac.sagemath.org/ticket/17977">#17977</a>) - Jessica Striker, Emily Gunawan 
* Crystal morphisms, subcrystals, and virtual crystals (<a class="http" href="http://trac.sagemath.org/ticket/15463">#15463</a>) - Travis Scrimshaw, Anne Schilling, Daniel Bump 
* Refactoring (skew) tableau(x) classes - Darij Grinberg, Travis Scrimshaw (<a class="http" href="http://trac.sagemath.org/ticket/17983">#17983</a>) 
* Work on <a class="http" href="http://trac.sagemath.org/ticket/17979">#17979</a> to do something about IntegerListsLex and the associated Partitions / Compositions bugs <a class="http" href="http://trac.sagemath.org/ticket/17548">#17548</a>, <a class="http" href="http://trac.sagemath.org/ticket/17956">#17956</a>, <a class="http" href="http://trac.sagemath.org/ticket/17920">#17920</a> - Bryan Gillespie, Anne Schilling, Nicolas Thiery 
* Finalize the following stack of tickets: 
      * <a class="http" href="http://trac.sagemath.org/ticket/11111">#11111</a> (better support for finite dimensional modules and algebras, ...) 
      * <a class="http" href="http://trac.sagemath.org/ticket/8678">#8678</a> (module morphisms), 
      * <a class="http" href="http://trac.sagemath.org/ticket/17160">#17160</a> (category for finitely generated magmas/.../groups), 
      * <a class="http" href="http://trac.sagemath.org/ticket/16925">#16925</a> (symmetric group algebras) Nicolas Thiéry, Travis Scrimshaw, Darij Grinberg, Franco Saliola, Aladin Virmaux. 
* Work toward integrating <a class="http" href="http://trac.sagemath.org/ticket/16659">#16659</a> (decomposition of finite dimensional associative algebras) -    Nicolas Thiéry, Franco Saliola, Aladin Virmaux 
* Quiver Hecke and related algebras (basic algebraic structure) - Travis Scrimshaw, Peter Tingley, Mee Seong Im, Kyu-Hwan Lee, Ben Salisbury, Jonathan Axtell, Sandi Xhumari, Tze-Chun Ou, Jonathan Judge 

## Speakers

* Vivien Ripoll (Universitaet Wien) 
* Franco Saliola (UQAM) 
* Mark Shimozono (Virginia Tech) 
* Nicolas Thiéry (LRI, Universite Paris Sud) 
* Nathan Williams (LaCIM) 

## Participants

* P. Akhilesh (Harish-Chandra Research Institute, Allahabad, India) 
* Jonathan Axtell (Iowa State University) 
* Robert Bassett (UC Davis) 
* Michał Bejger (N. Copernicus Astronomical Center)  
* Dan Bump (Stanford) 
* James Campbell (Cardiff School of Mathematics) 
* Federico Castillo (UC Davis) 
* Tom Denton (Youtube) 
* Kevin Dilks (University of Minnesota) 
* Brendon Dutra (UC Davis) 
* Matt Erbst (Software Engineer) 
* Bryan Gillespie (UC Berkeley) 
* Darij Grinberg (MIT) 
* Eric Gourgoulhon (Observatoire de Paris) 
* Emily Gunawan (University of Minnesota) 
* Mee Seong Im (University of Illinois -- Urbana-Champaign) 
* Jonathan Judge (University of Connecticut) 
* Jan Keitel (Max-Planck-Institut für Physik) 
* Vince Knight (Cardiff School of Mathematics) 
* Jean-Philippe Labbe (Jerusalem) 
* Hyeonmi Lee (Hanyang University/UC Davis) 
* Kyu-Hwan Lee (University of Connecticut) 
* Maria Monks Gillespie (UC Berkeley) 
* Tze-Chun Ou (University of Connecticut) 
* Chris Patton (UC Davis) 
* Oliver Pechenik (University of Illinois -- Urbana-Champaign) 
* Jim Propp (UMass Lowell) 
* Vivien Ripoll (Universitaet Wien) 
* Tom Roby (University of Connecticut) 
* Franco Saliola (UQAM) 
* Ben Salisbury (Central Michigan University) 
* Dmitry Shemetov (UC Davis) 
* Mark Shimozono (Virginia Tech) 
* Jessica Striker (North Dakota State University) 
* Joshua Swanson (University of Washington) 
* Marko Thiel (Universitaet Wien) 
* Nicolas Thiéry (LRI, Universite Paris Sud) 
* Peter Tingley (Loyola) 
* Bolor Turmunkh (University of Illinois - Urbana-Champaign) 
* Aladin Virmaux (LRI, Universite Paris Sud) 
* Nathan Williams (LaCIM) 
* Sandi Xhumari (University of Connecticut) 

## Organizers

* Dan Bump (Stanford) 
* Anne Schilling (UC Davis) 
* Travis Scrimshaw (UC Davis) 

## Group photo

<a href="days64/sage-days.jpg">sage-days.jpg</a> 

<a href="days64/Group-Photo-1.JPG">Group-Photo-1.JPG</a> 
