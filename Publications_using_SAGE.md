== Technical/Scholarly Publications Citing Sage ==

If you use Sage in a book, paper, website, etc., please email William Stein at wstein@gmail.com and reference Sage as follows:

{{{
William A. Stein et al. Sage Mathematics Software (Version 4.2.1),
   The Sage Development Team, 2009, http://www.sagemath.org.
}}}

where you should change the version number and the year to reflect the version of Sage that you used for the publication. To reference Sage using BibTeX, use:
{{{
@manual{sage,
  Key          = {Sage},
  Author       = {W.\thinspace{}A. Stein and others},
  Organization = {The Sage Development Team},
  Title        = {{S}age {M}athematics {S}oftware ({V}ersion 4.2.1)},
  note         = {{\tt http://www.sagemath.org}},
  Year         = {2009},
}
}}}

To reference Sage using TeX, use:

{{{
\newcommand{\etalchar}[1]{$^{#1}$}
\bibitem[S{\etalchar{+}}09]{sage}
W.\thinspace{}A. Stein et~al., \emph{{S}age {M}athematics {S}oftware ({V}ersion
  4.2.1)}, The Sage Development Team, 2009, {\tt http://www.sagemath.org}.
}}}

Also, be sure to find out what components of Sage, e.g., NumPy, PARI, GAP, that your calculation uses, and properly attribute those systems (for example, ask on sage-devel). Similarly, consider finding out who wrote the Sage code you're using and acknowledge them explicitly as well.


== Books and Articles mentioning Sage ==

Please see http://www.sagemath.org/library-publications.html
