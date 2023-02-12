

# Sage Days 78 --- June 29 to July 1st, 2016, Vancouver

_**Sage Days on Combinatorics**_ 

_**Vancouver, BC Canada**_ 

[[_TOC_]] 

These Sage Days are organized as a satellite event of the <a class="https" href="https://sites.google.com/site/fpsac2016">FPSAC</a> combinatorics conference. The main mathematical topic will be **combinatorics**. Everyone is welcome from Sage newcomers to advanced developers: there will be plenty of introductory talks and also time for code sprints. **It is the perfect occasion to learn Sage!** 

This is co-organized by <a class="https" href="https://www.pims.math.ca/">Pims</a> and <a class="http" href="http://opendreamkit.org/">OpenDreamKit</a>. 

Organizers: <a class="mailto" href="mailto:viviane.pons@lri.fr">Viviane Pons</a> and <a class="mailto" href="mailto:jcourtie@sfu.ca">Julien Courtiel</a>.  


## Dates and Venue

Date: 3 days **From June 29 to July 1st, 2016** 

Venue: University of British Columbia, Vancouver 


## Registration

Please send the following form to <a class="mailto" href="mailto:viviane.pons@lri.fr">Viviane Pons</a>. 

Name: 

Institution: 

Date of arrival: 

Date of departure: 

Do you wish to give a talk or present a tutorial?* 

_* A talk can be on anything related to mathematical development (it does not have to be Sage) If you have some Sage experience, please consider giving a tutorial._ 


## Financial Aid

A limited number of financial aids will be be distributed in priority to students and postdocs to cover mostly local costs. Please apply before **April 30** by filling out this extra form and sending it to <a class="mailto" href="mailto:viviane.pons@lri.fr">Viviane Pons</a>. 

Current status (student, postdoc, etc.) : 

Estimation of budget for the whole event (travel, lodging): 

Do you also participate to the FPSAC conference? 

Do you have other sources of funding for this event (FPSAC aid, local funding)? 


## Program

This is a tentative program which is subject to evolutions depending on the requests and needs of the participants. 

All talks are being held in **Earth Science Building** room 2012. <a class="http" href="http://www.maps.ubc.ca/PROD/index_detail.php?locat1=225">A map of the campus can be found here</a>. 
       |  Wednesday 06/29  |  Thursday 06/30  |  Friday 07/01 
 9:30  |  _Presentation of Sage_  
Viviane Pons  |  _Open Problems in Combinatorial Representation Theory_*  
Mike Zabrocki   |  _How to contribute to Sage?_  
Kevin Dilks  
 10:30  |  Coffee break |||
 11:00  |   _Tutorial: introduction to Python and Sage_  
Aram Dermenjian  |  _Knot theory in Sage_  
Amit Jamadagni  | _Short presentation on <a class="http" href="http://opendreamkit.org/">OpenDreamKit</a>_  
  
 _CODE SPRINTS_ 
 12:00  |  Install party  |   |  
 12:30  |  Lunch Break |||
 14:00  |  _Intro to research-based coding in Sage_  
Jessica Striker  |  _Crystals in Sage_  
Travis Scrimshaw  |  _Short projects presentation_   
 Matt Erbst   
  
 _CODE SPRINTS_ 
 15:00  |  Coffee break |||
 15:30  |  _Tutorial: Creating a Sage class for a combinatorial object_  
<a class="http" href="http://rawgit.com/egunawan/permutation/master/start_tutorial.html">follow along</a> Emily Gunawan  |  _The moving sofa problem_   
Dan Romik (15 minutes)  
   
  |  _CODE SPRINTS_ 
 16:30  |    |  _CODE SPRINTS_  |  _CODE SPRINTS_ 
 17:00  |  _Introduction to code sprints_**  |  Status report  |  Status report 

<a class="https" href="https://cloud.sagemath.com/projects/78ab9ed6-f958-4f9e-9c71-bcd84f7cb06c/files/">All talks and tutorials on SMC</a> 

* **Open Problems in Combinatorial Representation Theory** by Mike Zabrocki 

Symmetric functions are a tool for understanding the decomposition of $S_n$/$Gl_n$ representations into irreducible subspaces.  The definitions that arise are well known computations and operations in linear algebra (inverting matrices, conjugation, Gram-Schmit orthogonalization, LU decomposition, etc.), but these computations are very slow compared to manipulations of combinatorial objects. 

I'll choose 5 (time permitting) of what I consider some motivating open problems in symmetric functions/combinatorial representation theory.  This is a taste of what are just beyond the limits of algebraic combinatorics now. 

1. k-Schur functions and their structure coefficients 
1. diagonal harmonics, Garsia-Haiman modules, Macdonald symmetric functions, operator $\nabla$ 
1. restriction of irreducible modules from $Gl_n$ to $S_n$ as permutation matricies 
1. plethysm and inner plethysm structure coefficients 
1. Kronecker product structure coefficients 
Sage does all of these computations well, usually as a mix of linear algebra and combinatorics.  The algebra of symmetric functions encodes many common combinatorial objects in the coefficients: partitions, tableaux, subsets, words, integer matrices, lattice paths, Dyck paths, parking functions, set partitions, etc. and these objects are used as building blocks to describe combinatorial decompositions. 

** **Introduction to code sprints** 

A _code sprint_ is a get-together of people around a particular software development project. During Sage days, code sprints are the occasion for everyone to get to work on a Sage project whether it is to go through the tutorials, to start exploring the part of Sage related to their research, or to get together with other participants to work on a needed feature. Sage days bring together Sage newbies along with more advanced developers: it is the perfect occasion for everyone to meet, share, learn, and code together! Every evening, we will have _status report_ so that everyone can share their progress on the different projects. 


## Projects


### Install development version of Sage

Viviane, Robin, Matt, Ahmed, Bennet, Adrian 

--> most people got it to work but some progress need to be made on a quick access to a development environment especially for windows user. 


### Grothendieck polynomials

Travis, Viviane 

--> Discussed the current implementation and a plan to get it reviews soonish 


### Plane partitions

Vivien, Jessica, Tomack, Jang Soo, Kevin, Matt, Sean, Corey 

--> worked on implementing plane partitions: got the class, the latex, the asci art. Next step: put the code on the ticket. 


### Plot methods for set partitions via chord diagrams

Julien, Emily, Robin, Vivien 

--> The ticket is there and should go soon in "needs review" 


### Lie algebras

Travis, Amit, Dan, Aram 


### Simplicial complexes

Bennet 


### Polyominos

Adrien 


### Review tickets

Viviane, Emily, Mike 


### Rook placement

Sean, Bennet 

--> working on an implementation 


## Participants

* Eviatar Bach (UBC) 
* Matthew Barrow (Powerex) 
* Adrien Boussicault (Université de Bordeaux) 
* Julien Courtiel (UBC) 
* Kevin Dilks (North Dakota State University) 
* Aram Dermenjian (UQAM) 
* Clément Dervieux (Paris Diderot -- Ecole polytechnique) 
* Matt Erbst 
* Katie Gedeon (University of Oregon) 
* Tomack Gilmore (Universität Wien) 
* Bennet Goeckner (University of Kansas) 
* Sean Griffin (University of Washington) 
* Emily Gunawan (University of Minnesota) 
* Amit Jamadagni (Birla Institute of Technology and Science) 
* Jang Soo Kim (Sungkyunkwan University) 
* Patxi Laborde-Zubieta (Université de Bordeaux) 
* Seung Jin Lee (Korea Institute for Advanced Study) 
* Amir Maleki (UBC) 
* Viviane Pons (Université Paris Sud) 
* Vivien Ripoll (Universität Wien) 
* Dan Romik (UC Davis) 
* Travis Scrimshaw (University of Minnesota) 
* Adrian She (UBC) 
* Robin Sulzgruber (Universität Wien)  
* Jessica Striker (North Dakota State University) 
* Marko Thiel (University of Zurich) 
* Foster Tom (UBC) 
* Ahmed Umer Ashraf (University of West Ontario) 
* Steph van Willigenburg (UBC) 
* Corey Vorland (North Dakota State University) 
* Mike Zabrocki (York university) 

## Lodging and other practical information

Low cost accommodation is available near UBC at: <a class="http" href="http://www.ubcconferences.com/accommodations/">http://www.ubcconferences.com/accommodations/</a>. 

The <a class="https" href="https://sites.google.com/site/fpsac2016">FPSAC</a> conference will be held in downtown Vancouver, a 30 minutes bus ride from UBC. You can check the <a class="https" href="https://sites.google.com/site/fpsac2016/local-information">FPSAC venue page</a> for more information and suggestion on affordable accommodation downtown. 
