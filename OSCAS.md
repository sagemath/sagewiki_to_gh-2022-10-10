This page will survey open source computer algebra systems (OSCAS's).


A ''computer algebra system'' (CAS) is a mathematical software package capable of symbolic manipulation. 
The commercial CAS industry is big business. Few people know more about the CAS industry than
{{{Darren McIntyre}}}, VP of Worldwide Sales at Maplesoft. He estimates the worldwide yearly expenditures on computer algebra (buying licenses, employee salaries, and so on) is at least $ 600 million. Clients include not just students and universities, but diverse industries who often find that a CAS is a convenient programming environment to model industrial problems.


== The terrain ==

|| Axiom   || open source    || http://wiki.axiom-developer.org ||
|| CADABRA  || GPL  || http://www.aei.mpg.de/~peekas/cadabra/ ||
|| DoCon   || open source    || http://www.haskell.org/docon ||
|| GAP     || GPL   || http://www.gap-system.org ||
|| GIAC  || GPL  || http://www-fourier.ujf-grenoble.fr/~parisse/giac.html ||
|| GINAC  || GPL   ||  http://www.ginac.de ||
|| GTYBALT || GPL || http://wwwthep.physik.uni-mainz.de/~stefanw/gtybalt/ ||
|| JScience || BSD || http://www.jscience.org/ ||
|| LiDIA || "open source" || http://www.cdc.informatik.tu-darmstadt.de/TI/LiDIA/ ||
|| Macaulay2  ||  GPL ||  http://www.math.uiuc.edu/Macaulay2/ ||
|| Magnus  ||   GPL   ||   http://sourceforge.net/projects/magnus/ ||
|| MAS  || "open source"  || http://alice.fmi.uni-passau.de/mas.html ||
|| Mathomatic  ||  LGPL  || http://mathomatic.orgserve.de/math/ ||
|| Maxima  ||   GPL   || http://maxima.sourceforge.net ||
|| NTL   ||  GPL    || http://www.shoup.net/ntl/ ||
|| Pari    || GPL    || http://pari.math.u-bordeaux.fr ||
|| SAGE  ||  GPL  || http://sage.scipy.org ||
|| Scilab  ||  "open source"  || http://www.scilab.org ||
|| Singular  ||  GPL  || http://www.singular.uni-kl.de ||
|| Symmetrica  ||  public domain  || http://www.mathe2.uni-bayreuth.de/axel/symneu_engl.html ||
|| Yacas   ||   GPL     || http://yacas.sourceforge.net ||

I have left out CAFE (Computer Algebra and Functional Equations), 
a group writing a collection of CAS libraries 
(see  [http://www-sop.inria.fr/cafe/main-e.html CAFE]).
They appear to be written in Aldor and Maple by (the late)
Manuel Bronstein. I cannot determine the license (if any) 
they are released under. I am also unsure if the 
"open source" licenses of LiDIA, MAS, and Scilab are compatible with the
above-mentioned open source definition.
Several of these are under very active development and some of these
are essentially dead. Two other sources of information are
the Computer algebra handbook [[#references GKW]] and the internet sites
[[#references CA]].

In any case, we see from this table that there are a lot of 
open source computer algebra systems out there.
Some of these are special purpose (such as Symmetrica) and others are
general purpose (such as Axiom).
We shall start this series by surveying Maxima, a general purpose
CAS.

 * = [Maxima] =

Maxima is perhaps the most popular general purpose open source CAS.
It's latest release (as of November 2006) is 5.10.

== History ==

The Maxima homepage and the Maxima FAQ (this information
is basically due to Stavros Macrakis) explains some history.

Maxima is a descendant of Macsyma, the legendary computer algebra system 
developed in the late 1960s at the Massachusetts Institute of Technology. 
Symbolics licensed Macsyma from M.I.T. and registered ``Macsyma" as a 
trademark at some point (presumably with M.I.T.'s permission).
When Macsyma source ceased to be freely available, pressure was put 
on M.I.T. (mostly by Richard Fateman) to transfer the code which had been 
developed largely with Department of Energy (DOE) funding to the DOE, 
which then released it to others under certain conditions.
That codebase was called DOE Macsyma. 

The Maxima branch of Macsyma was maintained by William Schelter from 1982 
until he passed away in 2001. In 1998 he obtained permission to release 
the source code under the GNU General Public License (GPL). 
Since his passing a group of users and developers has formed to bring 
Maxima to a wider audience.

Pages 8-9 of the Maxima book [[#references Max]] has a more detailed history.
More Macsyma history can be found in [[#references GKW]].

= Basics =

 * ''website'': [http://maxima.sourceforge.net/]
 * ''wiki'': [http://maxima.sourceforge.net/wiki/]
 * ''Documentation'': [http://maxima.sourceforge.net/docs/manual/en/maxima.html Online reference manual] (also available in pdf). This has been translated into Spanish and Portuguese. Maxima ''tutorials'' are available in English, Spanish, Portuguese, German, and Italian from the website. There are also slightly older Maxima documents in French. There is also an excellent Calculus textbook which uses Macsyma extensively [#references BI-G].
 * ''Interfaces'': Command line.
 * ''front-end GUIs'': xmaxima, wxmaxima (cross platform), TeXmacs (cross platform), Imaxima, Kayali, Symaxx.
 * ''web interfaces'': There are several lists on the page: [http://maxima.sourceforge.net/relatedprojects.shtml]
 * ''Availability'':
''Source code'':
Maxima is written in Common Lisp and can be made to compile using either Clisp, GCL, CMUCL, SBCL, or OpenMCL. It has been compiled on Linux, Windows, Mac OSX, and FreeBSD machines. See the [http://maxima.sourceforge.net/wiki/index.php/Maxima%20ports Maxima ports page].
 * ''Binary executables'': Maxima is available as a binary for linux and windows (cygwin not required).
 * ''Support'': Where can you get help? There is an active email list: [http://maxima.sourceforge.net/maximalist.html]. This list is also used by developers as well.
 * ''License:'' GPL. However, Maxima's graphics uses {{{GNUplot}}}, which is not GPL'd.
\end{itemize}

= Active developers =

At the present day the major contributors seem to be Robert Dodier, 
Barton Willis, Raymond Toy, Stavros Macrakis (especially generating 
bug reports and bug fixes), Mario Rodriguez Riotorto (docs and share packages,
especially), Vadim Zhytnikov (especially packaging the Windows build),
and David Billinghurst (differential equations).
There are also people working
on various projects closely or not-so-closely related -- e.g. Andrej Vodopivec
(WxMaxima), Camm Maguire (GCL). 

= Capabilities =

The main Maxima webpage explains the basic capabilities:

Maxima is a system for the manipulation of 
symbolic and numerical expressions, including differentiation, 
integration, Taylor series, Laplace transforms, 
ordinary differential equations, systems of linear equations, 
polynomials, and sets, lists, vectors, matrices, and tensors. 
Maxima yields high precision numeric results by using exact 
fractions, arbitrary precision integers, and arbitrarily 
precision floating point numbers. 
Maxima can plot functions and data in two and three dimensions.
Maxima also has several special-purpose packages,
such as for tensor calculus and summation identities.

\subsection{Thanks}

I have borrowed/compiled material from the Maxima website
and emails with Robert Dodier, who I thank for his very generous help.

Of course, only I am responsible for any mistakes. If you have 
corrections or comments, please email me at the address below.



[[Anchor(references)]]
= References =
 * [CA] [http://en.wikipedia.org/wiki/List_of_computer_algebra_systems]

[http://en.wikipedia.org/wiki/Comparison_of_computer_algebra_systems]

[http://wiki.axiom-developer.org/RosettaStone]

 * [GKW] J. Grabmeier, E. Kaltofen, V. Weispfenning, ''Computer algebra handbook'', Springer, 2003.

 * [Mc] D. McIntyre, private communication, 11-2006.

 * [Max] Paulo Ney de Souza, Richard J. Fateman, Joel Moses, Cliff Yapp, ''The Maxima Book,''
19th September 2004. Available online at:
[Maxima book http://maxima.sourceforge.net/docs/maximabook/maximabook-19-Sept-2004.pdf]

[BI-G] A. Ben-Israel, R. Gilbert, ''Computer-supported calculus,'' Springer-Verlag, 2002.
