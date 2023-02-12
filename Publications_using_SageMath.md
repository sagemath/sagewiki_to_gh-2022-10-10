

## Citing SageMath in Technical/Scholarly Publications

If you use SageMath in a book, paper, website, etc., please <a class="https" href="https://www.sagemath.org/contact.html">contact us</a> about details of the publication, e.g. where is it published, provide a link to your publication. Alternatively, send us a <a class="https" href="https://github.com/sagemath/publications/">pull request</a>. 

Please reference SageMath as follows: 


```txt
SageMath, the Sage Mathematics Software System (Version x.y.z),
   The Sage Developers, YYYY, https://www.sagemath.org.
```
where you should change `x.y.z` to the exact version number you used for your publication. Also change `YYYY` to the year that reflects the version of SageMath you used for the publication.  


### BibTex


```txt
@manual{sagemath,
  Key          = {SageMath},
  Author       = {{The Sage Developers}},
  Title        = {{S}ageMath, the {S}age {M}athematics {S}oftware {S}ystem ({V}ersion x.y.z)},
  note         = {{\tt https://www.sagemath.org}},
  Year         = {YYYY},
}
```

### AMSref


```txt
\bib{sagemath}{manual}{
      author={Developers, The~Sage},
       title={{S}agemath, the {S}age {M}athematics {S}oftware {S}ystem
  ({V}ersion x.y.z)},
        date={YYYY},
        note={{\tt https://www.sagemath.org}},
}
```
**DOIs** 

Include them as doi = {doi.org/...} 

* current: <a href="https://doi.org/10.5281/zenodo.593563">https://doi.org/10.5281/zenodo.593563</a> 
* Particular versions: 
* 6.6: <a href="https://doi.org/10.5281/zenodo.17093">https://doi.org/10.5281/zenodo.17093</a> 
* 6.7: <a href="https://doi.org/10.5281/zenodo.28513">https://doi.org/10.5281/zenodo.28513</a> 
* 6.8: <a href="https://doi.org/10.5281/zenodo.28514">https://doi.org/10.5281/zenodo.28514</a> 
* 7.6: <a href="https://doi.org/10.5281/zenodo.820864">https://doi.org/10.5281/zenodo.820864</a> 
* 9.1: <a href="https://doi.org/10.5281/zenodo.4066866">https://doi.org/10.5281/zenodo.4066866</a> 

### TeX


```txt
\newcommand{\etalchar}[1]{$^{#1}$}
\bibitem[S{\etalchar{+}}09]{sage}
\emph{{S}ageMath, the {S}age {M}athematics {S}oftware {S}ystem ({V}ersion
  x.y.z)}, The Sage Developers, YYYY, {\tt https://www.sagemath.org}.
```
Also, be sure to find out what components of <a href="/SageMath">SageMath</a>, e.g., NumPy, PARI, GAP, that your calculation uses, and properly attribute those systems (for example, ask on <a class="https" href="https://groups.google.com/forum/#!forum/sage-support">sage-support</a>). Also, you may use the `get_systems` method: 


```txt
sage: from sage.misc.citation import get_systems
sage: get_systems("integrate(cos(x^2), x)")
['MPFI', 'ginac', 'GMP', 'Maxima']
```
Similarly, consider finding out who wrote the SageMath code that you are using and acknowledge them explicitly as well. 


### EndNote (RIS file)

<a class="https" href="https://sagemath.org/files/sage.ris">sage.ris</a> 


## Books and Articles mentioning SageMath

Please see <a href="https://www.sagemath.org/library-publications.html">https://www.sagemath.org/library-publications.html</a> 
