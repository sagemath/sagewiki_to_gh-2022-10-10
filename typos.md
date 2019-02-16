This page lists some typos in the !SageMath repository.

They can serve to create beginner tickets, especially during tutorials on !SageMath development.

||<#FFFF66>A good way to search for typos is to use: git grep "some_word" src/sage||

Please add a ticket number if you create one.

  * Typo: "expericenced" for "experienced"
    * where: https://doc.sagemath.org/html/en/installation/
    * ticket: 

  * Typo: the test introduced in ticket 15669 erroneously points to 15699
    * ticket:

  * Frenchism: in many places, "representant" is used instead of "representative"
    * hint: use `sage: search_src("representant")`
    * ticket:

  * Tripled letter "mmm" for "mm"
    * `algebras/yokonuma_hecke_algebra.py:373:        # Commmute g1 and t2, then multiply t1 and t2`
    * `symbolic/expression.pyx:10286:          - 'noexpand' (convert to commmon denominator and add)`
    * ticket: 

  * Tripled letter "sss" for "ss"
      * `combinat/chas/wqsym.py:2141:            (not necesssarily order-preserving or order-reversing),`
      * beware, some are on purpose, including:
        * `combinat/designs/database.py:784:    for i,classs in enumerate(equiv):`
        * `combinat/designs/database.py:785:        for S in classs:`
      * ticket: #27294

  * Tripled letter "ddd" for "dd"
      * `modular/modform_hecketriangle/hecke_triangle_group_element.py:2870:        - ``K`` -- A field to which we want the (correct) embeddding.`
      * `modular/modform_hecketriangle/hecke_triangle_groups.py:735:        - ``K`` -- A field to which we want the (correct) embeddding.`
      * ticket: #27294

  * Typo "rowss" for "rows"
    * `misc/table.py:285:        Two tables are equal if and only if their data rowss and`
    * ticket: 

  * Frenchism: "substract" for "subtract"
    * use `search_src` to find 4 occurrences
    * ticket: 

  * Frenchism: "Gougle" for "Google"

Need more typos? Search for frequent typos such as moprhism, mophism, morpism, homorphism, tulpe, descriprion, ...

If typos run out and there is a need for a tutorial on Sage development, email Samuel.
