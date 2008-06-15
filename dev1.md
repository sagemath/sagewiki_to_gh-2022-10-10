## page was renamed from days8.5
= Sage Developer Days 1 (aka Sage Days 8.5) =

=== DATES: June 13-20, 2008 ===
=== LOCATION: Seattle, Washington -- Mechanical Engineering 238 ===


[http://groups.google.com/group/sage-dev1 Mailing List]

=== Campus Wifi ===

{{{
  login: event0143
  password: EomD=YorS=AudK
}}}

=== Groups: Cython, Exact Linear Algebra, Parallel Computation, and Porting Sage to Microsoft Windows ===

 * [:/cython: The Cython Group]
 * [:/linalg: The Exact Linear Algebra Group]
 * [:/dsage: The Parallel Computation Group]
 * [:/windows: The Porting Sage to Windows Group]
 * [:/modforms: The Modular Forms Group]
 * [:/coercion: The Coercion Group]
 * [:/other: Other]

=== Schedule ===

|| Friday, June 13 || 10am opening remarks by William Stein (attachment:stein-intro.pdf, attachment:stein-intro.sws) ||
||Friday, June 13||11am talk by Dan Gindikin  -- Joy of Pex  || 4pm status reports ||
||Saturday, June 14||  11am talk by Robert Dodier -- The Maxima Project || 4pm status reports || 7pm party at Glenn Tarbox's house ||
||Sunday, June 15|| 11am talk by Glenn Tarbox -- Twisted || 7pm status reports||
||Monday, June 16|| 11am talk by Rob Beezer -- Linear Algebra Book || [:/hike: Hiking]/Tourism afternoon ??||
||Tuesday, June 17|| 11am talk by Arne Storjohann -- Exact Linear Algebra|| 5pm status reports || 7-9pm Demo of cool tools like IDE's etc for Sage development ||
||Wednesday, June 18|| 11am talk by Michael Abshoff -- Sage Development || 5pm status reports ||
||Thursday, June 19|| 11am talk by Mike Hansen -- Combinatorics || 5pm status reports ||
||Friday, June 20|| 11am talk by Martin Albrecht -- Linear Algebra over GF(2) || 1pm-3pm final wrap session ||



=== Outings ===
 
 * Party
 * Camping
 * Tourism afternoon


=== Colloquium Talks ===
 * Dan Gindikin (June 13, 11am) -- The Joy of Pex  (Quote: "We wanted a less vigorous coredump experience.")
 * Robert Dodier (June 14, 11am) -- Maxima
 * Glenn Tarbox (June 15, 11am) -- What is Twisted?
 * Rob Beezer (June 16, 11am): Developing an open source undergraduate linear algebra book
 * Arne Storjohann (June 17, 11am) -- Exact Linear Algebra
 * Michael Abshoff (June 18, 11am) -- The Sage development process
 * Mike Hansen (June 19, 11am) -- Combinatorics
 * Martin Albrecht (June 20, 11am) -- From the L1 Cache to Algebraic Cryptanalysis: Linear Algebra over GF(2)

=== T-shirt ===
 * [:/shirt: T shirt]

=== ORGANIZERS: Robert Bradshaw, William Stein and Tom Boothby ===
=== DATES: June 13-20, 2008 ===
=== LOCATION: Seattle, Washington -- Mechanical Engineering 238 ===

The goal of this "developer coding week" will be to write a huge amount of high quality code.  All talks will be squarely aimed at developers and be directly related to coding projects.  All participants will assumed to be experienced programmers. The main topics will be: Cython, Exact Linear Algebra, Parallel Computation, and Porting Sage to Windows.   However, like with all of Sage development, participants are encouraged to work on whatever they feel will be the ''most productive'' way for them to spend their time.

Anybody can participate, but funding will be aimed primarily at people who have demonstrated a substantial ability to contribute to the Sage project.  (This is not a general Sage statement -- it's just for this workshop.)

== Participants List ==
People with dates listed have confirmed attendance during those dates.

EUROPEAN:

 * Michael Abshoff (June 7-27) -- Windows port, exact linear algebra
 * Martin Albrecht (June 12-21) -- exact linear algebra (GF(2) LUP)
 * Stephan Behnel (canceled)  -- Cython
 * Burcin Erocal (June 13-20) -- exact linear algebra, Cython
 * David Kohel (June 12-20) 
 * Dag Sverre Seljebotn (June 12-23) -- Cython
 * Ralf-Philipp Weinmann (June 12-21)

CANADIAN:

 * Nick Alexander (June 13-20) -- exact linear algebra, modular forms
 * Arne Storjohann -- exact linear algebra

AMERICAN:

 * Gregory Bard (June 13-20) -- exact linear algebra (GF(2) LUP)
 * Iftikhar Burhanuddin (June 13-20) -- || computation
 * Craig Citro (June 13-20) -- cython and exact linear algebra
 * Robert Dodier (June 13-15)
 * --(Nathan Dunfield (tentative; probably will attend))--
 * Gary Furnish (June 6-August) -- Windows port, Symbolics, Cython
 * Dan Gindikin (pnylab.com; Princeton) -- Cython
 * Chris Gorecki -- Windows port
 * Mike Hansen (June 13-20)
 * David Harvey (probably will not attend)
 * Greg Landweber (June 13-17) -- maybe an os x native Sage app?
 * David Roe (June 13-20)

LOCAL:

 * Rob Beezer (from Univ of Puget Sound) -- will give an '''education-oriented''' colloquium talk on his free open source linear algebra book
 * Tom Boothby (June 13-20) -- Cython implementation of F4 (requires fast sparse linear algebra)
 * Robert Bradshaw
 * Timothy Clemans -- Sage Notebook & DSage web interface
 * Josh Kantor
 * Emily Kirkman
 * Robert Miller (June 13-20)
 * Bobby Moretti (?)
 * Clement Pernet (June 13-20) -- exact linear algebra
 * Yi Qiang -- (June 16-20) Distributed Sage
 * Dan Shumow (unclear)
 * William Stein (June 13-20) -- everything, but especially exact linear algebra
 * Glenn Tarbox -- Dsage evolution and Twisted
 * Carl Witty (June 13-20) -- either my proposed randgen framework (random number seed management for Sage) or cylindrical algebraic decomposition (either wrapping qepcad or writing my own implementation).
 * Chris Swierczewski -- Quantitative finance

== Main Topics ==
 * '''''Cython '''''-- something much deeper than usual, and not necessarily so Sage related.  Cython is one of the "killer apps" of Sage:
  * expand range of Cython developers (i.e., Robert tells us how to work on Cython).
  * increase documentation
  * future development directions
  * PEX
  * pickling

 * '''''MS Windows '''''-- figure out how to do a full native port of Sage to Windows. Seattle would be a good place for this theme, and I'm working on getting some Microsoft funding to support doing a port.
  * visiting Microsoft and meeting the clients
  * finish the cygwin part
  * teach everyone how to use MSVC

 * '''''Parallel computation in Sage''''' -- DSage, Ipython1, Threads again; sort of like the MSRI conference last year but much more focused on Sage and actual implementations.
 * '''''Exact linear algebra''''' -- perfect to capitalize on Clement Pernet being around, and the positive momentum behind Linbox, IML, etc.  There would be a number of talks on all the basic tricks of exact linear algebra, systematic benchmarking, with the goal being to "beat Magma" at a range of exact linear algebra problems.

== Hotel information ==

I have already pre-paid for a bunch of rooms at the Collegiana, so many of you can stay there:
[:/roommates: Roommate list]
{{{
    The Collegiana Inn
    4311 - 12th Ave. NE
    Seattle, WA 98105
    (206) 732-3200
}}}

Back during SD2, William recommend the Seattle University Travelodge:

   http://www.seattleuniversityhotel.com/index.html

They have free wifi, are very conveniently located.   Their rates are also reasonable.  The College Inn (http://www.collegeinnseattle.com/) is also a good choice.

There are some other options here:
  http://www.washington.edu/univrel/visitors/accommodations.html

NOTE: UW's commencement is June 14th, so many hotels are already booked solid for the weekend and/or unusually expensive for the 13th and 14th.  
