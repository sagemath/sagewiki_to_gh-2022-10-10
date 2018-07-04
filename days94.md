= Sage days 94 -- Sage development days =

Sage days 94 took place in Zaragoza (Spain), from Thursday
28 June 2018 to Wednesday 04 July 2018, as a satellite activity
of the 16th meeting of the Spanish computer algebra network
([[https://eventos.unizar.es/15634|XVI EACA]]).

They featured a series of short courses on subjects related to Sage
development. The main target audience was young researchers who want
to take the step from writing code for their own use to contributing
their code to the Sage codebase.

== Collaborative pad ==

We used [[https://annuel.framapad.org/p/sagedays94|this pad]]
to take notes during the workshop.

For tickets worked on during Sage days 94, we used the keyword "days94":

  * [[https://trac.sagemath.org/query?keywords=~days94&group=status&col=id&col=summary&col=status&order=priority|days94 tickets by status]]
  * [[https://trac.sagemath.org/query?order=id&desc=1&keywords=~days94|days94 tickets by ticket number]]

== Mini-course speakers and contributed talks  ==

Topics to cover

  * The Sage development workflow (Trac, Git, doctests...)
  * The coercion model
  * Parents and elements, and their implementation
  * The category framework
  * Cython
  * Using external C/C++ libraries
  * Communication with external packages using pexpect

Mini-course speakers

  * Samuel Lelièvre
  * Travis Scrimshaw
  * Jeroen Demeyer
  * Thierry Monteil

Besides mini-courses on those subjects, there was some space for short talks
contributed by the participants (which could be quite informal); interested
participants could just contact the organizers to offer such a talk.

Proposed talks included:

  * Rebecca Miller: Applying and Participating in Google Summer of Code
  * Pablo Angulo: !PyTorch, a machine learning framework, and Pyro,
  a universal probabilistic programming language on top of !PyTorch
  (subtitle: do they fit in Sage?)
  * Vít Tuček: How Sage is helping me with my research
  * Sebastian Oehms: Cubic braid groups
  * Peleg Michaeli: Symbolic discrete random variables
  * Thierry Monteil: The various representations of real and complex numbers
  * Mckenzie West: Solving the S-unit equation in Sage

== Program  ==

==== Thursday 28 June 2018 ====

  * 10:00-11:00 Registration
  * 11:00-12:00 '''The Sage development workflow''' (Samuel)
  * 12:00-13:00 '''Basics of git''': init, add, commit, status (Samuel, Thierry)
  * 13:30-15:00 Lunch break
  * 15:00-16:30 '''Basics of git''': clone, remote, push, pull, branch,
  checkout (Samuel, Thierry)
  * 16:30-17:30 Trac bureaucracy (account, ssh-keygen, git-trac, develop
  (Samuel, Thierry)
  * 15:00-16:00 Coding sprint
  * 16:00-16:30 Coffee break
  * 16:30-18:30 Coding sprint

==== Friday 29 June 2018 ====

  * 09:00 - 11:00 '''Categories''' (Travis) -
  [[https://drive.google.com/open?id=1TDd6Ph2RG2WBOA09z8hR0x-v62TOWsJb|ipynb]],
  [[attachment:categories_Zaragoza_Days94.ipynb]]
  * 11:00 - 11:30 Coffee break
  * 11:30 - 13:00 '''Parents, elements, coercion, for the user''' (Thierry) -
  [[https://tmpsage.metelu.net/days94/parent_element_coercion_user.ipynb|ipynb]]
  * 13:00 - 15:00 Lunch break
  * 15:00 - 16:00 '''The Sage development workflow''' (practice)
  * 16:00 - 16:30 Coffee break
  * 16:30 - 17:00 Peleg Michaeli: Symbolic discrete random variables
  * 17:00 - 19:00 Coding sprints

==== Saturday 30 June 2018 ====

  * 10:00 - 11:30 '''The category framework in Sage''' (practice)
  * 11:30 - 12:00 Coffee break
  * 12:00 - 13:30 '''The coercion model''' (practice)

==== Sunday 01 July 2018 ====

  * Excursion

==== Monday 02 July 2018 ====

  * 09:00 - 11:00 '''Categories, parents, coercion''' (Travis) -
  [[attachment:parent_examples_travis.sage|Example parent .sage file]]
  * 11:00 - 11:30 Coffee break
  * 11:30 - 13:00 '''Cython''' (Jeroen) -
  [[http://sage.ugent.be/www/jdemeyer/Cython.ipynb|ipynb]]
  * 13:00 - 15:00 Lunch break
  * 15:00 - 16:00 '''Parents and elements''' (practice)
  * 16:00 - 16:30 Coffee break
  * 16:30 - 17:00 Vít Tuček: How Sage is helping me with my research - [[attachment:tucek.pdf]]
  * 17:00 - 19:00 Coding sprint

==== Tuesday 03 July 2018 ====

  * 09:00 - 11:00 '''Third-party components'''
  * 11:00 - 11:30 Coffee break
  * 11:30 - 13:00 Sebastian Oehms: Cubic braid groups - [[https://cocalc.com/share/a3c9835337b41b0c1c7808ac5d793f5dbbef7064/CubicBraidGroup/?viewer=share|shared folder on CoCalc]]
  * 13:00 - 15:00 Lunch break
  * 15:00 - 15:30 Rebecca Miller: Applying and Participating in Google Summer of Code - [[http://lifebynumber.org/sagemath-gsoc-info|Sage GSOC info]]
  * 15:30 - 16:00 Mckenzie West: Solving the S-unit equation in Sage - [[attachment:MWest_Presentation.pdf|slides]]
  * 16:00 - 16:30 Demo: run a [[patchbot]]! (Thierry)
  * 16:30 - 18:30 Coding sprint

==== Wednesday 04 July 2018 ====

  * 09:00 - 10:00 Final report and wrap-up
  * 10:30 - [[https://eventos.unizar.es/15634|EACA talks]]

== Organizers ==

  * Miguel Marco
  * Enrique Artal
  * Adrien Boussicault

== Participants ==

  * Akshar Nair
  * Antonio Rojas
  * [[https://biancasmath.wordpress.com/|Bianca Thompson]]
  * Elisa Palezzato
  * Enrique Artal
  * Francisco Castro
  * Friedrich Wiemer
  * Jeroen Demeyer
  * Luis Felipe Tabera
  * Mckenzie West
  * Miguel Marco
  * Pablo Angulo
  * Peleg Michaeli
  * [[http://www.lifebynumber.org/|Rebecca Lauren Miller]]
  * [[slelievre|Samuel Lelièvre]]
  * Sebastian Oehms
  * Simón Isaza
  * Thierry Monteil
  * Tomer Bauer
  * Vít Tuček

== Development ==

Add here the things you plan to work on during the week:

  * (Thierry) Fix oeis internet doctest issues [[https://trac.sagemath.org/ticket/25471|#25471]]
  * Try to progress in the inclusion of train-tracks in Sage [[https://trac.sagemath.org/ticket/20154|#20154]]
  * Polynomial division [[https://trac.sagemath.org/ticket/17638|#17638]]
  * Sage packaging
  * Crypto module
  * Linear algebra
  * !CoCoa  integration?
    * package cocoalib [[https://trac.sagemath.org/ticket/25707|#25707]]
  * #8558
  * Ticket [[https://trac.sagemath.org/ticket/25745|#25745]]

Please tag any tickets you work on during this week with the
[[https://trac.sagemath.org/query?keywords=~days94&group=status&col=id&col=summary&col=status&order=priority|days94 keyword]].
This makes it easy to list all tickets worked on during this week.

== Instructions for participants ==

Given the focus on Sage development, we recommend participants come with
their own laptop, including a Sage installation that is well suited for
development (don't worry if you have trouble installing, we can help with
installation during the workshop, but it would save time if it is done
in advance). Also, please ask in advance for an account
for [[https://trac.sagemath.org/|Sage's Trac server]].
 
== Lodging ==

Several apartments were booked in
[[https://www.apartamentoslossitios.com|Apartamentos Los Sitios]].
They are located in the city centre. The reception is open until 22:30.

== Location ==

Talks took place in the main campus of the Universidad de Zaragoza,
in the mathematics building. It is about 25 minutes by walk from the
apartments (maybe 15 minutes by public transport).

You can see the train station, the apartments and the event location in
[[https://drive.google.com/open?id=1jEMgFXLy7lM-Fenxs8MxKOUnwIklZdkf&usp=sharing|this map]].

== Financial support ==

The school was partly funded by the [[https://opendreamkit.org|OpenDreamKit]]
project. The LaBRI (University of Bordeaux) and the CNRS co-organized the
project via the !OpenDreamKit project. We expect to be able to cover
the travel and lodging expenses of most participants and speakers.

== Contact ==

If you are interested in participating, or have any questions,
please send an email to `mmarco <at> unizar <dot> es`

== Excursion ==

Here is a picture from the visit to
[[https://zaragoza.es/ciudad/turismo/en/que-visitar/detalle_Monumento?id=7|Palacio de la Aljaferia]]
on Sunday morning. 

{{attachment:SageDays94.jpg}}
