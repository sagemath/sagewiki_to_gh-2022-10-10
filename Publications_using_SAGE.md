== Technical/Scholarly Publications Citing Sage ==

If you use Sage in a book, paper, website, etc., please [[http://www.sagemath.org/contact.html | contact us]] about details of the publication, e.g. where is it published, provide a link to your publication. Please reference Sage as follows:

{{{
William A. Stein et al. Sage Mathematics Software (Version x.y.z),
   The Sage Development Team, YYYY, http://www.sagemath.org.
}}}

where you should change `x.y.z` to the exact version number you used for your publication. Also change `YYYY` to the year that reflects the version of Sage you used for the publication. To reference Sage using BibTeX, use:

{{{
@manual{sage,
  Key          = {Sage},
  Author       = {W.\thinspace{}A. Stein and others},
  Organization = {The Sage Development Team},
  Title        = {{S}age {M}athematics {S}oftware ({V}ersion x.y.z)},
  note         = {{\tt http://www.sagemath.org}},
  Year         = {YYYY},
}
}}}

To reference Sage using TeX, use:

{{{
\newcommand{\etalchar}[1]{$^{#1}$}
\bibitem[S{\etalchar{+}}09]{sage}
W.\thinspace{}A. Stein et~al., \emph{{S}age {M}athematics {S}oftware ({V}ersion
  x.y.z)}, The Sage Development Team, YYYY, {\tt http://www.sagemath.org}.
}}}

Also, be sure to find out what components of Sage, e.g., !NumPy, PARI, GAP, that your calculation uses, and properly attribute those systems (for example, ask on sage-devel). Similarly, consider finding out who wrote the Sage code you're using and acknowledge them explicitly as well.


== Books and Articles mentioning Sage ==

Please see http://www.sagemath.org/library-publications.html
