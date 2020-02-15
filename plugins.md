= explanations on the patchbot plugins =

== commit_messages ==

Check for the existence of a commit message for every commit.

== coverage ==

Try to check that coverage did increase.

== non_ascii ==

Look for the presence of non-ascii characters in python and cython files.

This detects the presence of the encoding line at the top of files.

== doctest_continuation ==

Check that doctest continuation use the correct syntax, namely `....:`

== foreign_latex ==

Check that some bad latex code does not appear.

This means '\choose', '\over', '\atop', '\above', '\overwithdelims', '\atopwithdelims', '\abovewithdelims'.

== oldstyle_print ==

Check that print is using python 3 syntax. (TO BE REMOVED)

== python3_py ==

Look for some wrong patterns in python or rst files.

0) xrange

1) .iterkeys, .itervalues, .iteritems

2) basestring

3) __nonzero__

These are not allowed in python 3. (TO DE REMOVED)

== python3_pyx ==

Look for some wrong patterns in cython files.

0) "import six" and "from six import"

== python3 ==

== pyflakes ==

== pycodestyle ==

== blocks ==

== triple_colon ==

== trac_links ==

== startup_time ==

== startup_modules ==

== docbuild ==

== git_rev_list ==
