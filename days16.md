## page was renamed from days15
= Sage Days 16: Barcelona, Spain -- Computational Number Theory =

Wireless
{{{
Login: xsf.convidat
Password: KidAut0RaceS
}}}

Sage Days 16 will take place on June 22--27, 2009, the week after [[http://www.imub.ub.es/mega09/|MEGA 2009]]. The event will be organised by the CRM (http://www.crm.cat) and the OSRM of the UPC (http://www-fme.upc.edu/osrm/), and will take place at the FME, in the campus of the UPC, in Barcelona.

 * [[http://www.uam.es/enrique.gonzalez.jimenez/sagedays16/| Official webpage]] (note: schedule below is more up-to-date)

== Projects ==
 * [[/projects|Project page]]

  
== Mailing lists ==
 * Participants list (open): http://groups.google.com/group/sagedays16
 * Organizers list (closed): http://groups.google.com/group/sagedays16-org

== Schedule ==

All video is [[http://wstein.org/edu/2009/sd16/|here]].   I made this video by re-encoding HD video to "iPhone" video using Handbrake.  Each video file is at most 200mb, and will play fine with [[http://www.videolan.org/vlc/|VLC]] (and on the iPhone, of course). 

||||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Sunday, June 21||
|| 19:00 ||<-2> '''Meet informally in the lobby of the Resedentia''' ||
|| 21:00 ||<-2> '''From the Resedentia, go to dinner''' ||
||||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Monday, June 22||
||||||[[http://www.crm.cat/Conferences/0809/ThematicDays/SageDay/index.htm|CRM Thematic Day on Mathematics and Computation]]||
|| 9:00 ||<-2> '''Meet with Jordi Quer at the [[http://www.resa.es/eng/residencias/torre_girona|Residencia lobby]], take the train together to CRM''' ||
||<|2> 10:30-11:30 ||<|2> William&nbsp;Stein || [[http://wstein.org/talks/20090622-sagedays16-thematic/|'''Sage: Unifying Mathematical Software''']], [[http://wstein.org/edu/2009/sd16/00021-stein-unifying_open_source_math_software-part1.m4v|video part 1]], [[http://wstein.org/edu/2009/sd16/00022-stein-unifying_open_source_math_software-part2.m4v|video part 2]]||
|| This will be an overview talk about Sage, which explains the history and motivation for the project, demos some key features of Sage, and discusses where we are going next. It will be accessible to people in all research areas and assumes no prior experience with Sage. ||
|| 11:30-12:00 || Coffee&nbsp;Break || ||
||<|2> 12:00-13:00 ||<|2> Henri&nbsp;Cohen || [[attachment:barcelona_cohen.pdf|'''Experimental methods in number theory and analysis''']] [[http://wstein.org/edu/2009/sd16/00023-cohen-experimental_methods-part1.m4v|video part 1]], [[http://wstein.org/edu/2009/sd16/00024-cohen-experimental_methods-part2.m4v|video part 2]] ||
|| In this talk, I would like to give a number of examples of numerical experiments coming from number theory and analysis, mention the tools used to perform them, and show how they sometimes can lead to interesting and deep conjectures. ||
||<|2> 14:30-15:30 ||<|2> Àngel&nbsp;Jorba || [[attachment:transpes.pdf|'''Developing tailored software for specific problems''']]   [[http://wstein.org/edu/2009/sd16/00025-jorba-tailored_software-part1.m4v|video part 1]], [[http://wstein.org/edu/2009/sd16/00026-jorba-tailored_software-part2.m4v|video part 2]]||
|| We will discuss the advantages and inconveniences of developing software (in a general purpose language like C) for concrete problems. I will also mention the results of a pool done by the Spanish project "i-Math" on the use of computational resources of the mathematical research groups in Spain. ||
|| 15:30-16:00 || Coffee&nbsp;Break || ||
|| 16:00-17:00 || Round&nbsp;Table [[http://wstein.org/edu/2009/sd16/00028-panel_discussion-part1.m4v|video part 1]], [[http://wstein.org/edu/2009/sd16/00029-panel_discussion-part2.m4v|video part 2]]|| ||
||||||FME||
|| 18:45 || Leave from Residencia to UPC || ||
|| 19:00-- || Coding&nbsp;Sprint Organization at UPC [[http://wstein.org/edu/2009/sd16/00031-introductions_by_conference_participants.m4v|video introductions]]|| ||
||||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Tuesday, June 23||
||||||FME||
||<|2> 10:30-11:30 ||<|2> Jordi&nbsp;Guàrdia || [[attachment:guardia.pdf|'''New ideas for computing integral bases''']] ||
|| The determination of the ring of integers of a number field is one of the main tasks of computational algebraic number theory. The use of higher Newton polygons provides a new insight into the problem, leading to a fast method to compute integral bases, discriminants and prime ideal factorization in number fields. ||
|| 11:30-12:00 || Coffee&nbsp;Break ||||
||<|2> 12:00-13:00 ||<|2> William&nbsp;Stein || [[http://wstein.org/talks/20090623-elliptic_curves/|'''How to use Sage to compute with Elliptic Curves''']] ||
|| I will explain how to use Sage to define elliptic curves over various fields, do arithmetic on them, and compute standard invariants. Then I'll talk about elliptic curves over finite fields, and how to count points and compute the group structure. Next, I'll talk about elliptic curves over number fields and Sage's implementation of Tate's algorithm. Finally, I'll discuss computing the invariants in the BSD conjecture for elliptic curves over QQ. ||
|| 13:00-14:30 || Lunch || ||
||<|2> 14:30-15:30 ||<|2> Clément&nbsp;Pernet & Majid&nbsp;Khonji || '''Computing exactly with unsafe resources: fault tolerant exact linear algebra and cloud computing''' ||
|| In several ways, challenges in computational mathematics (including computational number theory, graph theory, cryptanalysis, ...) involve large linear algebra computations over Z or Q. Distributed, peer-to-peer or Cloud computing represents nowadays the best perspectives to access large and cheap computing power, but based on unreliable resources. Fault tolerant techniques are therefore developed in order to increase the confidence in the computations, or even to certify it. In the case of exact computations, the algebraic properties of the problems are well suited for the development of algorithm based fault tolerant protocols. In particular, the Chinese Remaindering Algorithm, offering an embarrassingly easy parallelization, can be adapted to work as an error correcting code and tolerate errors. We will present and demonstrate these algorithms and protocols in the case of a distributed computation of the determinant of a matrix over Z. ||
||<|2> 15:30-16:30 ||<|2> Martin&nbsp;Albrecht || '''How to get started developing Sage''' ||
|| In this talk, we will try to highlight a few interesting and relevant bits and pieces for getting into Sage development. We will give an overview of how Sage is structured and step through the Sage development process. The talk is meant to be fairly interactive with people asking questions etc. ||
|| Free&nbsp;evening || Sant Joan festivity ||||
||||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Wednesday, June 24||
||||||FME||
||<|2> 13:00-14:00 ||<|2> William&nbsp;Stein || '''Modular forms and modular abelian varieties in Sage''' ||
|| I will survey the capabilities in Sage for computing dimensions of modular forms spaces, congruence subgroups, modular symbols, modular forms, Brandt modules, overconvergent modular forms, half-integral weight forms, and modular abelian varieties. I will discuss both what is in Sage, and what is missing. ||
||<|2> 14:30-15:30 ||<|2> Christian&nbsp;Eder || '''Faugere's F5 Algorithm: variants and implementation issues''' ||
|| In this talk we shortly recall main properties of Gröbner bases used for their computations. After an introduction on Faugere's F5 Algorithm we examine its points of inefficiency, especially the reduction process, and present the variant F5C improving these. The benefits of this improvement are explained and represented in detail. Moreover some hints implementing F5's data structures are given and the positive effects of F5C on these are shown. In the end we give some insight into the implementation of F5's reduction process in an F4-ish manner, i.e. using symbolic preprocessing. ||
|| 16:00-- || Coding&nbsp;Sprint || ||
||||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Thursday, June 25||
||||||FME||
||<|2> 10:30-11:30 ||<|2> David&nbsp;Loeffler || '''P-adic modular forms in Sage''' ||
|| I will give a quick introduction to p-adic modular forms, which are a generalisation of classical modular forms. I will first give a quick introduction to the theory, and then describe a few algorithms that can be used to compute them, and give an example of one of these which has been implemented in Sage since 3.4.1. Finally I will talk a little about some issues in inexact p-adic linear algebra that come up in the process. ||
|| 11:30-12:00 || Coffee Break || ||
||<|2> 12:00-13:00 ||<|2> David&nbsp;Kohel || '''ECHIDNA: Open source Magma extensions for Sage''' ||
|| I will present the open source GPL repository of Magma code:<<BR>>Elliptic Curves and Higher Dimensional Analogues<<BR>>(http://echidna.maths.usyd.edu.au/kohel/alg/), <<BR>> with associated databases, and its use as an extension to Sage. This repository includes updates to the original packages for quaternion algebras, Brandt modules and generalization of my code for genera of lattices (as a quadratic modules package). As new features, it includes p-adic point counting via canonical lifts for elliptic curves (AGM-X_0(N)), extensions to the Igusa invariants and Mestre's algorithm (to small characteristic) in genus 2, arithmetic of CM fields and CM constructions for curves of genus 2, invariants of genus 3 curves (Dixmier-Ohno and Shioda's hyperelliptic invariants), and numerous other features (e.g. working in generic Picard groups, singular cubic curves and generalized Jacobians of singular hyperelliptics, etc.). The majority of the algorithms are completely new to Magma, and represent algorithms developed over more than a decade (with students and collaborators). The Sage developer community is invited to contribute, document, and improve ECHIDNA, and port features directly to Sage. ||
|| 13:00-14:30 || Lunch ||||
||<|2> 14:30-15:30 ||<|2> Robert&nbsp;Miller || '''Fast compiled graphs in Sage''' ||
|| There will be a demonstration and advertisement of new developments in graph theory in Sage. In particular, compiled Sage graphs have finally reached the same level of functionality as NetworkX graphs, the slower Python implementation. ||
|| 16:00-- || Coding Sprint ||||
||||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Friday, June 26||
||||||FME||
||<|2> 10:30-11:30 ||<|2> Gonzalo&nbsp;Tornaria || '''TBA''' ||
|| TBA ||
|| 11:30-12:00 || Coffee Break || ||
||<|2> 12:00-13:00 ||<|2> Emmanuel&nbsp;Thomé || '''Multiplication of binary polynomials''' ||
|| Multiplying binary polynomials is an elementary operation which occurs as a basic primitive in several contexts, from computer algebra to coding theory and cryptography. We study here a variety of algorithms for this operation, with the intent of obtaining satisfactory speeds for a wide range of possible degrees. We look into "low level" aspects related to microprocessor-specific optimizations, and higher level algorithms such as of course the Karatsuba and Toom-Cook approaches, but also two different FFT algorithms. Several improvements are presented. We provide comparisons of the timings obtained with those of the NTL library. The software presented can, as of NTL 5.5, be hooked into NTL as an add-on. ||
|| 13:00-14:30 || Lunch || ||
||<|2> 14:30-15:30 ||<|2> Maite&nbsp;Aranes || '''Manin symbols over number fields''' ||
|| I will discuss results about cusps and Manin symbols over a number field K, which should be useful in the computation of spaces of cusp forms for GL(2, K) via modular symbols. I will also present ongoing work on implementations of both of these in Sage. ||
|| 16:00-- ||Coding Sprint ||||
||||||<tablestyle="width: 80%" style="background-color: #E0E0FF;">Saturday, June 26||
||||||FME||
|| 10:30-- || Coding Sprint wrapup ||||


== Organizers ==

 * [[MichaelAbshoff|Michael Abshoff]], [[http://www.informatik.uni-bremen.de/~malb/|Martin Albrecht]], [[http://www.warwick.ac.uk/~masgaj/|John Cremona]], [[http://www-ma2.upc.es/~quer/|Jordi Quer]], [[http://wstein.org|William Stein]], [[http://www.uam.es/personal_pdi/ciencias/engonz/|Enrique González-Jiménez]], [[http://polit.upc.es/~puig/indexen.html|Joaquim Puig]], [[http://www.cmat.edu.uy/~tornaria/|Gonzalo Tornaría]], [[http://rlmiller.org/|Robert Miller]].

== Participants ==
  1. Michael Abshoff, Technische Universität Dortmund
  1. Martin Albrecht, University of London (Room C-010 at Residencia)
  1. Maite Aranes, University of Warwick
  1. Tomasz Buchert, Adam Mickiewicz University
  1. Michal Bulant, Masaryk University
  1. Gabriel Cardona, Universitat de les Illes Balears
  1. Wouter Castryck, Leuven
  1. Henri Cohen, Bordeaux
  1. Francesc Creixell, UPC
  1. Christian Eder, TU Kaiserslautern
  1. Burcin Erocal, RISC, JKU - Linz
  1. Julio Fernández, UPC
  1. Imma Gálvez, UAB
  1. Enrique González-Jimenez, Universidad Autónoma de Madrid
  1. Josep González, UPC
  1. Jordi Guàrdia, UPC
  1. Xavier Guitart, UPC
  1. Amir Hashemi, Isfahan University of Technology (Iran)
  1. Nikolas Karalis, National Technical University of Athens 
  1. Hamish Ivey-Law, Sydney-Marseille
  1. David Kohel, Institut de Mathématiques de Luminy
  1. Joan Carles Lario, UPC
  1. Offray Vladimir Luna Cárdenas, Javeriana (Colombia)
  1. David Loeffler, University of Cambridge
  1. Robert Miller, University of Washington (Room C-010 at Residencia) 
  1. Antonio Molina, Addlink Software Científico
  1. Enric Nart, UAB
  1. Sebastian Pancratz, University of Oxford
  1. Clement Pernet
  1. Joaquim Puig, UPC
  1. Jordi Quer, UPC
  1. Anna Río, UPC
  1. Víctor Rotger, UPC
  1. Bjarke Roune, University of Aarhus
  1. Utpal Sarkar, HP (+UPC)
  1. Diana Savin, Ovidius University (Romania)
  1. Rainer Schulze-Pillot, Universitaet des Saarlandes
  1. Mehmet Sengun, University of Duisburg-Essen
  1. Jaap Spies, Holland
  1. William Stein, University of Washington   (Room C-113 at Residencia)
  1. Emmanuel Thome, INRIA Lorraine
  1. Andrew Tonks, London Metropolitan University
  1. Gonzalo Tornaría, Universidad de la República (Uruguay)
  1. Eulàlia Tramuns, UPC
  1. Montrserrat Vela, UPC
  1. Preston Wake, !McMaster
  1. Christian Wuthrich, University of Nottingham
  1. Brian Wyman, Univ of Michigan
