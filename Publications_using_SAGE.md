== Technical/Scholarly Publications mentioning Sage ==
If you use Sage in a book, paper, website, etc., please email me at wstein@gmail.com and reference Sage as follows:

{{{
William Stein et al., Sage Mathematics Software (Version 3.4), 
   The Sage Development Team, 2009, http://www.sagemath.org/.
}}}

 . where you should change the version number and the year to reflect the version of Sage that you used for the publication. To reference Sage using Bibtex, use:
{{{
@manual{sage,
       Key = {Sage},
       Author = {W.\thinspace{}A. Stein and others},
       Organization = {The Sage~Development Team},
       Title = {{S}age {M}athematics {S}oftware ({V}ersion 3.3)},
       note= {{\tt http://www.sagemath.org}},
       Year = 2009}
}}}

To reference Sage using TeX, use:
{{{
\newcommand{\etalchar}[1]{$^{#1}$}
\bibitem[S{\etalchar{+}}09]{sage}
W.\thinspace{}A. Stein et~al., \emph{{S}age {M}athematics {S}oftware ({V}ersion
  3.3)}, The Sage~Development Team, 2009, {\tt http://www.sagemath.org}.
}}}
Also, be sure to find out what components of Sage, e.g., Numpy, PARI, GAP, that your calculation uses, and properly attribute those systems (for example, ask on sage-devel). Similarly, consider finding out who wrote the Sage code you're using and acknowledge them explicitly as well.



== Books and Articles mentioning Sage ==

Please see http://sagemath.org/library/publications.html
