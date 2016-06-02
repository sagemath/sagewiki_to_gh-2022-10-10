= Sage Days 74: Differential geometry and topology =

[[http://www.sagemath.org|Sage]] Days 74 will take place on May 30 - June 2, 2016 at the [[https://www.obspm.fr/-cias-.html?lang=en|Workshop Center (CIAS)]] of Observatoire de Paris, located in Meudon, near Paris, France.

== Registration ==

Registration is free and now open. Contact Eric (eric.gourgoulhon@obspm.fr) and Travis (tscrimsh@umn.edu) to register.

== Schedule ==

The morning sessions will take place in '''Salle de Conférences du Château''' (CIAS building) and the afternoon sessions will be held in various rooms of CIAS.

|||||| '''Monday 30 May''' ||
|| 9:30 - 10:30 || Volker Braun || [[attachment:VolkerBraun-Introduction.ipynb|''An introduction to SageMath'']] ||
|| 10:30 - 11:00 |||| coffee break ||
|| 11:00 - 12:00 || Marc Culler || [[attachment:SnapPyPart1.pdf|''SnapPy (Part 1)'']] ||
|| 12:00 - 13:00 || Nathan Dunfield || [[attachment:SnapPyPart2.ipynb|''SnapPy (Part 2)'']] ||
|| 13:00 - 14:00 |||| lunch at the Observatory cafeteria||
|| 14:00 - 15:00 |||| Organization of working groups ||
|| 15:00 - 16:00 |||| working groups / coding sprints ||
|| 16:00 - 16:30 |||| coffee break ||
|| 16:30 - ...   |||| working groups / coding sprints ||
|||||| '''Tuesday 31 May''' ||
|| 10:00 - 11:00 |||| coffee break ||
|| 11:00 - 12:00 || Nicolas Thiéry || [[attachment:2016-05-31-CategoriesInSage.pdf|''Infrastructure for generic code in SageMath: categories, axioms, constructions'']]<<BR>> [[attachment:2016-05-31-CategoriesInSage.ipynb|examples [ipynb]]] ||
|| 12:00 - 13:00 || Marcin Kostur || ''3D visualization'' ||
|| 13:00 - 14:00 |||| lunch at the Observatory cafeteria||
|| 14:00 - 15:00 || Volker Braun || [[attachment:VolkerBraun-Toric-Geometry.ipynb|''Toric geometry'']] ||
|| 15:00 - 16:00 |||| working groups / coding sprints ||
|| 16:00 - 16:30 |||| coffee break ||
|| 16:30 - 17:00 |||| progress reports ||
|| 17:00 - ...   |||| working groups / coding sprints ||
|||||| '''Wednesday 1 June''' ||
|| 9:30 - 10:30 || John Palmieri || [[attachment:palmieri-sagedays74.pdf|''Simplicial sets'' (PDF)]], [[attachment:palmieri-sd74.ipynb|Jupyter notebook]] <<BR>> [[http://trac.sagemath.org/ticket/20745|trac #20745]] ||
|| 10:30 - 11:00 |||| coffee break ||
|| 11:00 - 12:00 || Mark Bell || ''Flipper and Sage'' <<BR>> + [[attachment:sage_gotchas.pdf|''Sage gotchas'']] ||
|| 12:00 - 13:00 || Frédéric Vincent <<BR>> & Thibaut Paumard || ''Gyoto code and geodesics'' [[attachment:Gyoto_F_Vincent.pdf|(part 1)]] [[attachment:Gyoto_T_Paumard.pdf|(part 2)]]||
|| 13:00 - 14:00 |||| lunch at the Observatory cafeteria||
|| 14:00 - 16:00 |||| working groups / coding sprints ||
|| 16:00 - 16:30 |||| coffee break ||
|| 16:30 - 17:00 |||| progress reports ||
|| 17:00 - 18:30   |||| working groups / coding sprints ||
|| 18:30  |||| social dinner ||
|||||| '''Thursday 2 June''' ||
|| 9:30 - 10:30 || Jeremy Martin || ''Simplifical complexes (and Sage, of course!)'' <<BR>> ''from a combinatorialist's point of view'' [[attachment:J_Martin_SageDays74.pdf|[slides]]] ||
|| 10:30 - 11:00 |||| coffee break ||
|| 11:00 - 12:00 || Patrick Hooper || ''!FlatSurf and translation surfaces in Sage (Part 1)'' ||
|| 12:00 - 13:00 || Vincent Delecroix || ''!FlatSurf and translation surfaces in Sage (Part 2)'' ||
|| 13:00 - 14:00 |||| lunch at the Observatory cafeteria||
|| 14:00 - 15:00 |||| progress reports ||
|| 15:00 - 16:00 |||| working groups / coding sprints ||
|| 16:00 - 16:30 |||| coffee break ||
|| 16:30 - 17:00 |||| progress reports ||
|| 17:00 - ...   |||| working groups / coding sprints ||


== Projects ==

Here is a list of possible projects. Feel free to add your own to the list.

 * [[http://sagemanifolds.obspm.fr/|SageManifolds]] inclusion into Sage (cf. [[http://trac.sagemath.org/ticket/18528|#18528]]) (Travis, Eric)
 * [[http://trac.sagemath.org/ticket/14901|Lie algebras #14901]] and implement their relationship with manifolds. (Travis)
 * CW/Cube complexes by generalizing the manifold classes. (Travis)
 * Computation of geodesics on pseudo-Riemannian manifolds. (Eric)
 * Include the `sage.geometry.riemannian_manifolds` (i.e. parametrized surfaces) into the more general framework of !SageManifolds (Claudia, Eric)
 * Experiment plotting possibilities with OpenGL (nice stuff from !SnapPy!) and more... for rendering in browser there is the [[https://en.wikipedia.org/wiki/WebGL|WebGL]] javascript library that is supported by most browsers.
 * Improve persistent homology. (Travis, John)
 * Simplicial sets. (Co)simplicial objects in various categories. (John)
 * Incorporation of [[https://www-fourier.ujf-grenoble.fr/~sergerar/Kenzo/ |Kenzo]]? (see [[https://github.com/gheber/kenzo|Repackaged in a sane way Kenzo]])
 * Improve/Implement knot theory in Sage (cf. [[http://trac.sagemath.org/ticket/17030|#17030]] [[http://trac.sagemath.org/ticket/20509|#20509]])... and link it with Snappy? (Travis, Miguel, Eric?, Nathan?)
 * Implement more (co)homology theories (e.g., De Rham cohomology).
 * Implement methods for computing homotopy groups.
 * Tropical curves/geometry.
 * Implement Lie groups and related geometric objects such as Schubert cells.
 * Implement geometric crystals.
 * Implement hyperbolic space for dimensions > 2.
 * Implement common metric spaces; for example, L^p^ spaces.
 * Combine/standardize features of the hyperbolic plane with [[http://sagemanifolds.obspm.fr/|SageManifolds]].
 * Sage development workflow (cf. https://wiki.sagemath.org/CodeSharingWorkflow)
 * Improve/upgrade CHomP and its interface (cf. [[http://trac.sagemath.org/ticket/15202|#15202]]) (Travis, John, Volker?)
 * Clean up simplicial complex code (some easy cleanups like allowing the `_enlarged` cache to persist in `add_face`, also generally examine the code) (Travis, John)
 * From Nathan's talk: Make !SnapPy a Sage package ([[http://trac.sagemath.org/ticket/20739|#20739]]), Sage attach and Tkinter ([[http://trac.sagemath.org/ticket/15152|#15152]]), Modernize !CyPari (see [[http://trac.sagemath.org/ticket/20238|#20238]]), Modularization of some parts of SageMath kernel for use in stand-alone Snappy.
 * Relative simplicial complexes. (Jeremy)
 * Exchanging information between 2D and 3D manifolds. (Vincent)
 * From Mark Bell's talk: confusing documentation of the .n method ([[http://trac.sagemath.org/ticket/13055|#13055]]), accurate numerical approximation, pushout for different number fields ([[http://trac.sagemath.org/ticket/20746|#20746]]), the bitwise ~ incompatible between Python and Sage integers

There is also the [[https://cloud.sagemath.com/|SageMathCloud]] project page available for collaborations:

https://cloud.sagemath.com/projects/bc98ddf4-68da-49db-8986-90c80b24daa3/files/

Some of the work done within Sage

    [[http://trac.sagemath.org/query?keywords=~sd74&or&keywords=~days74&col=id&col=summary&col=keywords&col=status&col=owner&col=type&col=priority&order=status|List of tickets written and/or reviewed during these Sage days]]

== Details ==

=== Lodging ===

We recommend to book a room in some hotel in Paris, in Montparnasse area (14th arrondissement).
In particular, we recommend the 

 * [[http://www.hotel-du-maine.fr/en/|Hôtel du Maine]] (**) (109 euros/night, including breakfast)

Other hotels are 

 * [[http://www.hotel-denfert.com/|Hôtel Denfert Montparnasse]] (**) (approx. 110 euros/night, including breakfast) 
 * [[http://www.hotel-ariane.fr/English.phtml|Hôtel Ariane Montparnasse]] (***) (approx. 130 euros/night, including breakfast)
 * [[http://hotelduparcparis.com/en/|Hôtel du Parc]] (***) (approx. 170 euros/night, including breakfast)

If you prefer to stay in Meudon, at a walking distance (25 min) from the Workshop Center (CIAS), see

 * [[http://www.ibis.com/fr/hotel-6277-ibis-budget-meudon/index.shtml|Hôtel Ibis Budget Meudon]] (**) (approx. 80 euros/night, including breakfast)

For a larger choice, see this [[http://lesia.obspm.fr/List-of-some-convenient-hotels.html|list of convenient hotels]] from LESIA/Observatoire de Paris. 

'''NB: since May/June is a high touristic season in Paris, it is recommended to book a room as soon as possible!'''

=== Transportation ===

Meudon is located at 10 min by train from [[http://www.gares-sncf.com/fr/gare/frpmo/paris-montparnasse|Montparnasse station]] in Paris. All hotels listed above are located at a walking distance from Montparnasse station. 
A system of car shuttle will be organized from Meudon station to the Workshop Center (CIAS).

If you plan instead to come by your own, please follow these [[https://www.obspm.fr/acces-au-site-de-meudon.html?lang=en|access instructions]] (click on the map to enlarge it; the CIAS is located in BAT. 9).


=== Funding ===

European participants receiving some [[http://opendreamkit.org/|OpenDreamKit]] funding for conferences/workshops are expected to use it to cover their expenses.

=== Support ===

 * [[http://www.obspm.fr/|Observatoire de Paris]]: [[https://www.obspm.fr/-cias-.html?lang=en|CIAS]] and Federative Action ''[[http://gphys.obspm.fr/|Gravitation et physique fondamentale (GPhys)]]''
 * Horizon 2020 European Research Infrastructure project ''[[http://opendreamkit.org/|OpenDreamKit]]''
 * ANR Project ''[[http://pageperso.univ-brest.fr/~jnicolas/ANRAARG/ANR_AARG.html|Analyse Asymptotique en Relativité Générale]]''

=== Speakers ===

 * Mark Bell (University of Illinois, Urbana-Champaign)
 * Volker Braun (Berlin)
 * Marc Culler (University of Illinois, Chicago)
 * Vincent Delecroix (University of Bordeaux)
 * Nathan Dunfield (University of Illinois, Urbana-Champaign)
 * Patrick Hooper (City College of New York)
 * Marcin Kostur (University of Silesia, Katowice)
 * Jeremy L. Martin (University of Kansas, Lawrence)
 * John Palmieri (University of Washington, Seattle)
 * Thibaut Paumard (Observatoire de Paris)
 * Nicolas Thiéry (University Paris Sud)
 * Frédéric Vincent (Observatoire de Paris, France)

=== Participants ===

 * Michal Bejger (N. Copernicus Astronomical Center, Warsaw, Poland)
 * Mark Bell (University of Illinois, Urbana-Champaign, USA)
 * Volker Braun (Berlin, Germany)
 * Léo Brunswic (University of Avignon, France)
 * Marc Culler (University of Illinois, Chicago, USA)
 * Vincent Delecroix (University of Bordeaux, France)
 * Jeroen Demeyer (Ghent University, Belgium / University Paris Sud, France)
 * Nathan Dunfield (University of Illinois, Urbana-Champaign, USA)
 * Anastasia Golubtsova (Bogoliubov Laboratory of Theoretical Physics, Dubna, Russia)
 * Eric Gourgoulhon (Observatoire de Paris, France)
 * Claudia Grabs (University of Potsdam, Germany)
 * Patrick Hooper (City College of New York, USA)
 * Marcin Kostur (University of Silesia, Katowice, Poland)
 * Ronja Kuhne (University of Warwick, UK)
 * Samuel Lelièvre (University Paris Sud, France)
 * Alba Malaga Sabogal (Aix-Marseille Université, France)
 * Marco Mancini (Observatoire de Paris, France)
 * Jeremy L. Martin (University of Kansas, Lawrence, USA)
 * Thomas Morzadec (University Paris Sud, France)
 * John Palmieri (University of Washington, Seattle, USA)
 * Thibaut Paumard (Observatoire de Paris, France)
 * Bonnie Saunders (University of Illinois, Chicago, USA)
 * Travis Scrimshaw (University of Minnesota, USA)
 * Nicolas Thiéry (University Paris Sud, France)
 * Artur Trzesiok (Poland)
 * Frédéric Vincent (Observatoire de Paris, France)

==== Remote: ====

 * Miguel Angel Marco Buzunariz (University of Zaragoza, Spain)

==== Group photo ====

{{attachment:group_photo_SD74.jpg}}

Credit: Sylvain Cnudde

=== Organizers ===

 * Eric Gourgoulhon (LUTH, Observatoire de Paris)
 * Nicole Letourneur (CIAS, Observatoire de Paris)
 * Marco Mancini (LUTH, Observatoire de Paris)
 * Benoît Pilorget (!OpenDreamKit)
 * Travis Scrimshaw (University of Minnesota)
