= explanations on the patchbot plugins =

== commit_messages ==

Check for the existence of a commit message for every commit.

== coverage ==

Try to check that coverage did increase.

== non_ascii ==

Look for the presence of non-ascii characters in python and cython files.

This detects the presence of the encoding line at the top of files.

== doctest_continuation ==

Check that doctest continuation use the correct syntax, namely {{{....:}}}

== foreign_latex ==

Check that some bad latex code does not appear.

This means {{{\choose, \over, \atop, \above, \overwithdelims, \atopwithdelims, \abovewithdelims}}}.

All these commands are obsolete in latex.

== oldstyle_print ==

Check that print is using python 3 syntax. (TO BE REMOVED)

== python3_py ==

Look for some wrong patterns in python or rst files.

0) {{{xrange}}}

1) {{{.iterkeys, .itervalues, .iteritems}}}

2) {{{basestring}}}

3) {{{__nonzero__}}}

These are not allowed in python 3. (TO BE REMOVED)

== python3_pyx ==

Look for some wrong patterns in cython files.

0) {{{import six}}} and {{{from six import}}}

== python3 ==

Check that some python3 incompatible code does not appear. (TO BE REMOVED)

2) {{{ifilter, imap, izip}}}

3) {{{raise statements}}}

4) {{{cmp}}} (use {{{richcmp}}} for comparison)

6) {{{<>}}} (the correct syntax is {{{!=}}})

7) {{{<type '[a-z]*'>}}}

8) {{{next}}}

9) {{{__metaclass__}}}

10) {{{except Exception, var}}}

11) {{{apply}}}

12) {{{sagenb}}} (the legacy notebook is deprecated)

== pyflakes ==

Run `pyflakes` on the modified `.py` files.

This typically reports about unused variables or imports.

Sometimes it gives false-positive warnings.

== pycodestyle ==

Run `pycodestyle` on the modified `.py` files.

Currently, the selected options are {{{W605, E401, E701, E702}}}.

See [[http://pycodestyle.pycqa.org/en/latest/intro.html#error-codes|pycodestyle documentation]] for more information.

== blocks ==

Perform various check, mainly about blocks in the documentation.

1) correct syntax is {{{.. SEEALSO::}}}

2) {{{TESTS}}} and {{{EXAMPLES}}} should be plural, and {{{NOTE}}} singular

3) no {{{::}}} after {{{INPUT}}} and {{{OUTPUT}}} blocks, only a single colon

4) no {{{::}}} after {{{REFERENCE}}} blocks, only a single colon
    
5) no {{{ :}}} at the end of lines, as the colon should not be preceded by a space
    
6) no {{{Returns}}} at the start of lines, but {{{Return}}} for the first line (short summary) or {{{This returns}}} otherwise

== triple_colon ==

Look for the presence of triple colons {{{:::}}} or {{{: ::}}}.

== trac_links ==

Look for the presence of badly formatted trac roles {{{:trac:}}}.

The correct syntax is {{{:trac:`23456`}}}

== startup_time ==

Try to decide if the startup time is getting worse.

This performs a statistical analysis, which is not always pertinent.

== startup_modules ==

Count modules imported at startup, and compare to stored data to see if this has increased.

== docbuild ==

Build the html documentation.

== docbuild_pdf ==

Build the pdf documentation.

This is not activated by default on the patchbot clients.

== git_rev_list ==

The aim of this plugin is not clear.
