== Technical/Scholarly Publications Citing Sage ==

If you use Sage in a book, paper, website, etc., please [[http://www.sagemath.org/contact.html | contact us]] about details of the publication, e.g. where is it published, provide a link to your publication. Alternatively, send us a [[ https://github.com/sagemath/publications/ | pull request ]].

Please reference Sage as follows:

{{{
SageMath, the Sage Mathematics Software System (Version x.y.z),
   The Sage Developers, YYYY, http://www.sagemath.org.
}}}

where you should change `x.y.z` to the exact version number you used for your publication. Also change `YYYY` to the year that reflects the version of Sage you used for the publication. 

=== BibTex ===

{{{
@manual{sage,
  Key          = {SageMath},
  Author       = {The Sage Developers},
  Title        = {{S}ageMath, the {S}age {M}athematics {S}oftware {S}ystem ({V}ersion x.y.z)},
  note         = {{\tt http://www.sagemath.org}},
  Year         = {YYYY},
}
}}}

'''DOIs'''

Include them as doi = {dx.doi.org/...}

 * 6.6: http://dx.doi.org/10.5281/zenodo.17093
 * 6.7: http://dx.doi.org/10.5281/zenodo.28513
 * 6.8: http://dx.doi.org/10.5281/zenodo.28514

=== TeX ===

{{{
\newcommand{\etalchar}[1]{$^{#1}$}
\bibitem[S{\etalchar{+}}09]{sage}
\emph{{S}age {M}athematics {S}oftware ({V}ersion
  x.y.z)}, The Sage Developers, YYYY, {\tt http://www.sagemath.org}.
}}}

Also, be sure to find out what components of Sage, e.g., !NumPy, PARI, GAP, that your calculation uses, and properly attribute those systems (for example, ask on sage-devel). Also, you may use the {{{get_systems}}} method:

{{{
sage: from sage.misc.citation import get_systems
sage: get_systems("integrate(cos(x^2), x)")
['MPFI', 'ginac', 'GMP', 'Maxima']
}}}

Similarly, consider finding out who wrote the Sage code you're using and acknowledge them explicitly as well.


=== EndNote (RIS file) ===

[[http://sagemath.org/files/sage.ris|sage.ris]]

== Books and Articles mentioning Sage ==

Please see http://www.sagemath.org/library-publications.html
