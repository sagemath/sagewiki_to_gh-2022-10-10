Preparation of the Partner University Fund application

Last year, we applied with Anne Schilling for a PUF grant around Sage-Combinat:

       https://face-foundation.org/partner-university-fund/

The application failed, but the organizers warmly recommended to apply
again this year. This is a three years grant that can fund travel,
short to long term accommodation, meeting expenses to encourage
exchanges between France and the USA, especially for grad students and
postdocs, and possibly some hardware. The application deadline is
December 15th, with the grant starting around March/April.

Here is the current draft of project, as a call for
suggestions. Please highlight your edits and comments in bold!

{{{
1 / PROJECT


TITLE OF THE PROJECT:

*-Combinat: boosting open source research-driven mathematical software for algebraic combinatorics


US INSTITUTION:

UC Davis

FRENCH INSTITUTION:

Faculté d'Orsay, Université Paris-Sud

Level(s)*:   Master               PhD               Postdoctoral               Research


Subject Area(s)*:
*Projects may include several subject areas

 Mathematics, IT and applications       XXX



4.3 / OTHER GRANT(S) REQUESTED OR ALREADY OBTAINED FOR THIS PROJECT

The *-Combinat platform was adopted for the computational aspects of
two NSF Focused Research Groups:

 - "Affine Schubert Calculus: Combinatorial, geometric, physical, and
   computational aspects" led by Jennifer Morse, Anne Schilling, and
   Mark Shimozono (2007-2010)

 - "Combinatorics of crystals: geometric, physical, and computational
   applications" led by Cristian Lenart, Anne Schilling, Mark Shimozono,
   and Julianna Tymoczko (2010-2013, submitted).

These many-faceted international projects involve and tie together
various problems from combinatorics, geometry, representation theory,
physics, and computation. Many investigations in these areas are
largely fueled by extensive computational experimentation. The robust
implementation of algorithms derived from the projects leads to the
development of new libraries for computer algebra systems. The open
source dissemination of this new software not only advances the
research program but also has an outreach impact on the mathematics,
physics, and computer science communities.

As part of the first NSF project, Nicolas M. Thiéry spent the academic
year 2007-2008 at UC Davis and spent again 6 months there in Spring
2009.

Anne Schilling was invited through the Kastler foundation to the
University Marne-la-Vallee in November 2006 (hosted by Jean-Christophe
Novelli) and to Universite Orsay, Paris-Sud in November 2008 (hosted by
Nicolas M. Thiéry).

*-Combinat is also the software underlying the French Non thematic ANR
project "blanc" ANR-06-BLAN-0380 which involves, among others, Florent
Hivert, Jean-Christophe Novelli, and Franco Saliola.

Combinatorial Hopf algebras, operads and props:

Combinatorial Hopf algebras are Hopf algebras whose bases are indexed
by combinatorial objects. They can be seen as generalizations of the
Hopf algebra of symmetric functions. The latter plays a fundamental
role in numerous theories such as group representations (as characters
of finite and Lie groups, spherical functions of complex groups, real
and p-adic), algebraic topology (cobordism rings), algebraic geometry
(Schubert calculus) and mathematical physics (integrable system,
vertex operators).
In the last couple of years, several such Hopf algebras appeared in seemingly
unrelated domains. They appear naturally in operads theory since each operad
verifying some simple conditions gives rise to a Hopf algebra. They also
appear in combinatorics when one tries to lift certain computations on polynomials 
to a non-commutative level to get combinatorial interpretations of multiplicities. 
Moreover, since the work of Connes and Kreimer on renormalization, they appear 
regularly in mathematical physics.
The goal of this ANR project is to not only provide the theoretical foundation of
combinatorial Hopf algebras but also to find new algorithms needed for
computer exploration during research, and which can be used for
applications in physics (computation of perturbation series to a high
order).



5 / PROJECT DESCRIPTION AND RATIONALE

(TEXT BOXES BELOW ARE EXPANDABLE. HOWEVER PLEASE REMAIN AS CONCISE AS POSSIBLE)

5.1 / Objectives of the partnership

Algebraic combinatorics is a field of mathematics which is
interdisciplinary by nature and has deep connections with many other
areas, and in particular computer science and theoretical physics.
Due to the concrete and constructive approach, computer exploration
has been playing an increasing role as a guide for research ever since
Marcel-Paul Schützenberger introduced it in 50's.

The involved computations vary a lot, requiring a wide range of tools
as well as, more often than not, specific development by the
researchers. Given the increasing scale and level of complexity, it
has become essential to share the development efforts and capitalize
on those in a well organized body of code.

This is the purpose of the *-Combinat project, which was founded in
2000 by Florent Hivert and Nicolas M. Thiéry; it has now reached
maturity, and has become a major tool in the field with 30+
researchers involved worldwide. This project is by nature research
driven and already led to 50+ publications.

In 2000, there was no viable open-source mathematical platform, and
the project started as the package MuPAD-Combinat
(http://mupad-combinat.sf.net) for the computer algebra system MuPAD
(http://www.mupad.de). Meanwhile, Sage appeared
(http://www.sagemath.org/), a completely open source general purpose
mathematical software (similar to Maple, MuPAD, Mathematica, and up to
some point matlab) based on the popular python programming language.
Sage is gaining strong momentum in the math community, and we decided
in June 2008 to migrate our project under the name Sage-Combinat (see
http://wiki.sagemath.org/combinat).  This move by itself attracted
many new developers, and half of the code has readily been
ported. However there still is a massive amount of work left, which
must be carried out swiftly in order to support continuous use by the
community for research. At the same time, care needs to be taken in
laying out strong foundations for the future, and new features are
continuously needed.

The purpose of the PUF project is to provide short to mid-term funding
to boost the international development of Sage-Combinat around the
bipole France-America during this critical period. The key is
communication and coordination; therefore the primary needs are
mobility (in particular of graduate students and postdocs),
organization of regular workshops, and hardware for collaborative
development tools.

5.2 / History of the partnership (if applicable)

Anne Schilling joined the *-Combinat development team after meeting
with Nicolas Thiéry in the international conference FPSAC in July
2006. Shortly after, Anne Schilling was invited for one month in
Marne-la-Vallée, where she worked with Jean-Christophe Novelli on
problems related to symmetric functions and started the discussion
about implementation details for a crystal library in *-Combinat with
Nicolas Thiéry.

Later on, *-Combinat was chosen as research platform for a three year
(2007-2010) NSF Focused Research Group under the lead of Anne
Schilling and others; see
http://garsia.math.yorku.ca/dokuwiki/doku.php?id=start.  This project
financed the visit of Nicolas M. Thiéry in Davis in 2007-2008 and in
Spring 2009. This visit fueled an active research collaboration
between UC Davis, Orsay, the University of Marne-la-Vallée and of
Rouen. It was also the occasion to build an active software
development collaboration, in particular with the University of
Washington and Stanford University. The decision to migrate *-Combinat
to Sage was taken during this period at the Mathematical Sciences
Research Institute in Berkeley.


5.3 / Departments/units involved

Math department, University of California at Davis, USA

Math department, University of Washington in Seattle, USA

Math department, University of Pennsylvania, USA

Math department, University of Minnesota, USA

Math department, Stanford University, USA

Laboratoire de Mathématiques d'Orsay, Université Paris Sud, France

Département d'informatique, Université de Rouen, France

Institut Gaspard Monge, Université de Marne-la-Vallée, France

Laboratoire Bordelais de Recherche en Informatique, Université Bordeaux 1, France


5.4 / Description of activites, including levels, timetable, and milestones

Here are some of the key areas that we want to improve in Sage-Combinat:

 - Symmetric functions: this is the original flagship of
   Sage-Combinat; the current implementation is feature reach, but
   heavy refactoring is needed for further.

 - Enumerative combinatorics: Sage-Combinat contains more than one
   hundred predefined enumerated sets (partitions, permutations,
   ...). Deep refactoring and infrastructure work (combinatorial
   factories, bijections) is crucial for further extensions.

 - (affine) root systems, Coxeter and Weyl groups, Hecke algebras,
   generalization to pseudo-reflection groups.

 - Crystals, Lie algebras and their characters

 - Combinatorial Species

 - Posets

 - Infrastructure for combinatorial Hopf and Kac algebras, with
   noncommutative symmetric functions, ...

 - Representation theory of semigroups and finite dimensional algebras.

For most of them, we have or will have soon a specific development
plan (design, algorithmic, personnel). For example, the upcoming Sage
days 20 at CIRM, in February 2009 will include sessions about root
systems, Hecke algebras, and semi groups, with specialists of those
fields on board (Andrew Mathas, author of Specht, Meinholf Geck,
coauthor of the Chevie package for GAP, and Jean-Éric Pin, author of
the SemiGroups package).

As per *-Combinat's tradition, all the development work is done with a
combination of a long term vision and of short term goals which are
strongly tied to research needs. Hence, even though all the topics
above will undoubtedly be needed at some point by the participants, it
would be impossible, and in fact prejudicial, to set specific
timelines.

The main purpose of this PUF project is to obtain flexible funding for
short to long term visits across the Atlantic. There are two typical
scenarios there: in the first one, two or more researchers (student,
postdoc, or faculty) are working on distinct research projects which
require the same computational tool. A short visit or very focused
workshop (3-8 people) will help them coordinate to setup the design
and foundations. By nature such workshops cannot be planned long in
advance; however experience gathered over the previous years calls for
about two of them every year on each side of the Atlantic.

In the second scenario, researchers gather to work together on a
common research project which requires software development. This
includes for example long visits of Tom Denton to Orsay (Spring 2010
and 2011), as part of his PhD (representation theory of crystals and
monoids) coadvised by Schilling and Thiéry.  Postdoc positions are
also well suited for this, in particular since there is an
exceptionally large pool of excellent candidates for postdocs in
Orsay; this includes Jason Bandlow (symmetric functions), Brant Jones
(crystals and Hecke algebras), Robert Miller (graphs), Steve Pon
(affine Stanley symmetric functions), and Qiang Wang (posets, root
systems). Reciprocally, Nicolas Borie (root systems, Hecke algebras,
invariants) will be available in 2010-2011 for a postdoc in Davis. All
of them are regular contributors to Sage, and have expressed great
interest in participating in this project.

Parallel to this, regular workshops gathering the whole community will
be organized, including a yearly Sage-Combinat satellite workshops to
FPSAC, the primary international conference in algebraic
combinatorics.  Those workshops focus on coding sessions in an extreme
programming setup, and introducing new users and developers to the
system. They also are the occasion to set and advertise important
milestones in the development. The previous such workshop was held in
July 2009 at RISC in Austria
(http://www.risc.uni-linz.ac.at/about/conferences/fpsac2009/), and
gathered 30 researchers. The upcoming ones are:

 - FPSAC'10: San Francisco, USA, 2010
 - FPSAC'11: Reykjavik, Iceland, 2011
 - FPSAC'12: Nagoya, Japon, 2012
 - FPSAC'13: Paris, France, 2013

The collaborative nature of the project requires advanced software
development tools (ticket server, distributed version control), as
well as heavy computational resources (compilation, regression
testing, time or memory demanding calculations). So far, we have been
using a server courtesy of the Sage team at the University of
Washington (combinat.sagemath.org). Scaling further will require its
replacement by a modern machine, which the Sage team agreed to host as
part of the Sage computation farm (which includes four GNU/Linux
servers with 24 cores and 128Gb of RAM). Unused resources will be made
available to the Sage-Combinat and Sage community at large. The Sage
team is committed to the ongoing administration of this server so that
it will continue to be a resource for the Sage-Combinat community well
after the end of this project (see the attached letter by William
Stein).


Budget rationale:

The main lines of the PUF-funded part of the budget follows the
activities listed above. This include one postdoc to France in Year 1
($60000), one post doc to the US in Year 2 ($45000), half a postdoc to
France in Year 3 ($40000), the purchase of a Sage-Combinat server
($20000), regular funding for Sage-Combinat workshops and meetings,
software development laptops for the long term visitors.  It would
have been desirable to purchase the server right at the start of the
project, but the exceptional situation for postdocs (due to the
current state of the job market in the US) convinced us to hire in
priority a postdoc to France.


Most of the cofunding consists of the salaries of the main
participants N. M. Thiéry (1/2), F. Hivert (1/2), Nicolas Borie (1/2),
Anne Schilling (...), TODO: other people in Davis proportionally to
their involvement in the project, as well as the associated
overhead. We did not include in the budget some other major sources of
cofunding that are not yet secured. For example, the planned budget of
the NSF-FRG project "Combinatorics of crystals: geometric, physical,
and computational applications" which was submitted in September 2009,
includes cofunding of Sage-Combinat workshops and small meetings,
laptops for software development, postdocs involved in the development
of Sage-Combinat, etc. We also expect cofunding for Tom Denton's stay
in France from the American embassy and from the "Île de France"
Région. Finally, Sage-Combinat will be used in a variety of research
projects, which will fund personnel to participate to Sage-Combinat's
development and workshops. We did not include either the contribution
\emph{in kind} of the University of Seattle through the hosting and
administration of the Sage-Combinat server, which is extremely
valuable yet hard to estimate.


5.5 / Description of how the project will be sustained after the grant period

A major policy of *-Combinat is that its core developers have
permanent positions. In general, all the code is written by
researchers for their own research; therefore this activity is an
integral part of their research work. At the same time the code is
made visible and useable to others through the open-source
environment. This development model has proved its pertinence and
validity over the eight years of MuPAD-Combinat development, and by
the time PUF will be over Sage-Combinat will have reached its cruise
speed. Further development will then occur as part of many standard
research projects.

5.6 / If exchanges are INVOLVED, housing and other arrangements


5.7 / Originality, innovativeness of the project

There is a long tradition of software packages for algebraic
combinatorics, and to name but a few:

 - SF, posets, coxeter/weyl (J. Stembridge, University of Michigan)
 - Symmetrica (University of Bayreuth)
 - ACE, mu-EC (University of Marne-la-Vallée)
 - combstruct, gfun, ... (INRIA)

Each of those packages is developed by a small university team, if not
a single person, to tackle (very efficiently!) a specific problem
(symmetric functions, decomposable objects, generating series, ...).

The originality of *-Combinat lies in the following simultaneous focus:

 - Offer a wide variety of interoperable and extensible tools,
   integrated in a general purpose mathematical software, as needed
   for daily computer exploration in algebraic combinatorics

 - Be developed by a community of researchers spread around the world
   and across institutions

Reaching this scale is a true challenge, as there is a simultaneous
need for mathematical and algorithmic expertise and for strong
computer science experience, in particular concerning the design and
the development model. For example, *-Combinat puts great emphasis in
high level programing techniques (object orientation and polymorphism,
iterators, functional programming) to obtain concise, expressive, and
easy to maintain code.

The migration to Sage is the occasion to reach yet another scale, with
a wider community and a long desired interoperability with tools from
other areas of mathematics (e.g. fast sparse exact linear algebra,
group theory, ...). This migration also makes *-Combinat into the
first large scale top-to-bottom open source package for algebraic
combinatorics.


6 / OUTCOMES OF THE PROJECT

6.1 / Expected outcomes of this project: Joint and dual degrees, educational initiatives, PUBLICATIONS; COMMUNICATIONS; symposiums

 - Coadvised PhD (and possible dual degree) for Tom Denton (Orsay and
   UC Davis). In general, all the mobility will be very beneficial to
   the students and postdocs.

 - In keeping with the *-Combinat tradition, all the software
   development is associated to mathematical research and leads to a
   continuous stream of joint research publications.

 - All the code produced by the Sage-Combinat community is released as
   open source and integrated into Sage. This will give indirectly a
   substantial push to the Sage project which has an enormous
   potential for research and teaching at all university levels, as
   well as industrial applications.

 - Yearly large Sage-Combinat workshop, and regular smaller meetings.


6.2 / Regional perspectives: Existing or PLANNED PARTICIPATION in European/ North American programs; names and partners

6.3 / Other international perspectives

The NSF-FRG projects are international cooperative research ventures,
with core group members located in Canada, the United States, Chile,
and France, and interdisciplinary, involving mathematicians,
physicists, and computer scientists.

6.4 / Present or considered Industrial Perspectives

MuPAD-Combinat has been used for statistical software testing, but was
put aside recently due to licensing issue. The migration to an open
source platform will solve this, and open the door to further
applications.


6.5 / Monitoring of the partnership (suggested internal steps/procedures)

All the code is shared via a public mercurial patch queue server
(http://combinat.sagemath.org/patches), and is immediately available
as open source. Stable patches are integrated into Sage after a formal
review process, and can be monitored via the Sage trac server
(http://trac.sagemath.org/).

The overall development progress and the induced publications will be
tracked on the Sage-Combinat Wiki
(http://wiki.sagemath.org/combinat).


7 / ADDITIONAL INFORMATION (for joint research projects only)
Additional information can be uploaded together with the application

7.1 / TEAMS’ PRESENTATIONS


U.S : NAMES AND SHORT BIOS

University of California at Davis:

Anne Schilling *
University of California at Davis, Professor 2006-current
University of California at Davis, Associate Professor 2004-2006
University of California at Davis, Assistant Professor 2000-2004
Massachusetts Institute of Technology, CLE Moore Instructor 1999-2001
University of Amsterdam, postdoc 1997-1999

Brant C. Jones *
University of California at Davis, VIGRE Assistant Professor, 2007-present
University of Washington, PhD, 2002-2007
Synygy Inc. (Chester, PA), Senior Software Developer, 2002
PricewaterhouseCoopers (Fort Lee, NJ), Computer Systems Consultant, 1997-2001
Bard College, B.A. in Mathematics, 1993-1997

Andrew S. Berget *
University of California, Davis. VIGRE Postdoctoral Fellow (2009-)
University of Minnesota, PhD (2004-2009)

Wang Qiang *
University of California at Davis, graduate student 2004-2010
San Jose State University, mathematics student 2002-2004
Software Engineer 1994-2001
Dalian University of Technology, China, B.E. in Software Engineering 1990-1994

Steve Pon *
University of California at Davis, PhD, 2005-2010
University of California at San Diego, B.A. mathematics 2004

Tom Denton *
University of California at Davis, graduate student 2006-current
University of Oregon, mathematics student 2003-2006


University of Washington in Seattle:

Sara Billey *
University of Washington in Seattle, associate professor, 2003-present
Massachusetts Instituted of Technology, assistant/associate professor, 1998-2003
Massachusetts Instituted of Technology, postdoc, 1994-1998
University of California at San-Diego, PhD, 1994

William Stein *
Founder and head of Sage
UW, Assoc. Professor (with tenure), 2006-present,
UCSD, Assoc. Professor (with tenure), 2005-2006
Harvard University, Benjamin Peirce Assistant Professor, 2001-2005
Harvard University, NSF Postdoc, 2000-2001
UC Berkeley, 1995-2000

Andrew Crites
University of Washington, graduate teaching assistant, 2005-current

Mike Hansen
Translator of 30k lines of MuPAD-Combinat code to Sage
University of Washington, graduate student, 2008-2009

Robert L. Miller *
University of Washington, PhD, 2005-present
Syracuse University, 2001-2005


University of Pennsylvania:

Jason Bandlow *
University of Pennsylvania, lecturer, 2008-2011
University of California at Davis, NSF postdoc, 2007-2008
University of California at San-Diego, PhD, 2007


University of Minnesota:

Vic Reiner *
University of Minnesota, professor, 2001–present
University of Minnesota, associate professor, 1997–2001
University of Minnesota, assistant professor, 1993–1997
University of Minnesota, Dunham Jackson assistant professor, 1990–1993
Massachusetts Institute of Technology, Ph.D. in Mathematics 1986–1990

Stanford University:

Daniel Bump *
Professor of Mathematics, Stanford 1995-present
Associate Professor, Stanford 1990-1995
Assistant Professor, Stanford 1986-1990
Member, Institute for Advanced Study (Princeton) 1985-1986
Lecturer, The University of Texas (Austin) 1983-1985
PhD 1982 The University of Chicago


France : NAMES AND SHORT BIOS

Université Paris Sud:

Nicolas M. Thiéry *
Habilitation à diriger des recherches, December 2008
University of California at Davis, researcher,  2007-2008 and Spring 2009
Université Paris Sud, maître de conférences, 2004-current
IDEALX, Senior software developer, spring 2004
Université Lyon I, maître de conférences, 2001-2004
Colorado School of Mines, Postdoc, 1999-2000
Université Lyon I, PhD, 1996-1999
École Normale Supérieure (Paris), 1992-1996

Nicolas Borie *
Université Paris Sud, graduate student 2008-

Université de Rouen:

Florent Hivert *
Cofounder of *-Combinat
Professor, Université de Rouen, 2005-present
Habilitation à diriger des recherches, December 2004
Independent University of Moscou, Russia, chargé de recherches CNRS, 2003-2004
Université de Marne-la-Vallée, maître de conférences, 1999-2005
Université de Marne-la-Vallée, PhD, 1996-1999
École Normale Supérieure (Paris), 1991-1995


Université de Marne-la-Vallée:

Jean-Christophe Novelli *
Université de Marne-la-Vallée, professeur, 2007-present
Independent University of Moscou, Russia, détaché du CNRS, 2002-2003
Université de Marne-la-Vallée, chargé de recherche CNRS, 1999-2007
Habilitation à diriger des recherches, September 2001,
Université Paris VI, PhD, 1995-1999
École Normale Supérieure (Paris), 1993-1997

Adrien Boussicault*
Université de Marne-la-Vallée, PhD, 2005-2009

Marc Sage*
Université de Marne-la-Vallée, graduate student, 2007-current
École Normale Supérieure 2004-2008

Pierre Loic Meliot*
Université de Marne-la-Vallée, graduate student, 2007-current
École Normale Supérieure 2004-2008

Université Bordeaux 1:

Valentin Feray
Université Bordeaux 1, chargé de recherche CNRS, 2009-current
Université de Marne-la-Vallée, PhD, 2006-2009
École Normale Supérieure 2003-2007



7.2 / EQUIPMENT AVAILABLE FOR THE PROJECT

us:

Sage computational farm at Seattle (sagemath.org), which includes four
GNU/Linux servers with 24 cores and 128Gb of RAM.

france:

N/a

7.3 /Significant publications relative to the project

us:

 - Florent Hivert, Anne Schilling, and Nicolas M. Thiéry.
   Hecke group algebras as degenerate affine Hecke algebras.
   Journal of Combinatorial Theory, Series A 116 (2009) 844--863 
   http://arxiv.org/abs/0804.3781

 - Jason Bandlow, Anne Schilling, and Nicolas M. Thiéry.
   On the uniqueness of promotion operators on tensor products of type a crystals.
   Algebraic Combinatorics, to appear ( arXiv:0806.3131 [math.CO] ) 
   http://arxiv.org/abs/0806.3131

 - Anne Schilling
   Combinatorial structure of Kirillov-Reshetikhin crystals of type D_n(1), B_n(1), A_{2n-1}(2),
   J. Algebra 319 (2008) 2938-2962,
   http://arxiv.org/abs/0704.2046
 
  - Brant Jones and Anne Schilling
    Affine structures and a tableau model for E_6 crystals
    preprint arXiv:0909.2442 [math.CO], submitted.

FRANCE:

 - Florent Hivert and Nicolas M. Thiéry
   MuPAD-Combinat, an open-source package for research in algebraic combinatorics.
   Sém. Lothar. Combin.,51 :Art. B51z, 70 pp. (electronic), 2004.
   http://igd.univ-lyon1.fr/~slc/wpapers/s51thiery.html

 - Anne Schilling and Jean-Christophe Novelli
   The forgotten monoid
   RIMS Kokyuroku Bessatsu B8 (2008) 71-83
   http://arxiv.org/abs/0706.2996

 - Tom Denton, Florent Hivert, Anne Schilling, Nicolas M. Thiéry
   The representation theory of J-trivial monoids.
   in preparation
}}}
