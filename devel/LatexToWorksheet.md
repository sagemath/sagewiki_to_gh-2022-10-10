= Converting Latex Documents to Sage Worksheets =

== Introduction ==

Latex documents can be translated to jsMath, the tool used to render mathematics in the Sage notebook.  This project is about automating the conversion process so that authors can easily use a single command to convert a book-length Latex document to a collection of Sage worksheets.  These could have embedded Sage input cells, possibly containing interacts, and the cross-referencing features of Latex would be preserved in the collection of Sage worksheets.<<BR>>
Rob Beezer, beezer@ups.edu, rbeezer on #sage-devel IRC

== Links ==

 * [[http://trac.sagemath.org/sage_trac/ticket/8105 | Trac Ticket 8105]]  Contains project snapshots, links to other tickets
 * Bitbucket repo coming

== Examples ==

To view a worksheet, click on the "worksheet" link, then in the resulting page find the big blue download box and use your browser's function to copy the link there.<<BR>>
Then open your notebook, click the "Upload" link near the upper-left and then paste in the link into the URL field (the second one).

 * Group Theory Primer (2010/01/28)<<BR>>
 Lots of simple Sage code, some simple mathematics, one interact (search for "@interact")<<BR>>
 Best working demo (though it lacks a title)<<BR>>
 [[attachment:sage-group-theory-primer.sws | Worksheet]] [[attachment:sage-group-theory-primer.sws | Source]]

 * Linked Worksheets (2010/01/30)<<BR>>
 A simple manufactured example of cross-worksheet linking.
  * Fire up Sage, then create a new, temporary notebook with the user "link"
  {{{
sage: from sagenb.notebook.notebook import Notebook
sage: nb = Notebook('/tmp/test.sagenb')
sage: nb.add_user('link', 'link', '', force=True)
sage: nb.save()
sage: exit
  }}}
  * At system command-line extract archive (below) to create the worksheets with numbers 0 and 1 in link's space.
  {{{
$ cd /tmp/test.sagenb/home
$ tar -xvf <path-to>/link-worksheets.tar.gz
  }}}
  * Fire up Sage to start a notebook session in the temporary notebook:
  {{{
sage: notebook(directory="/tmp/test.sagenb")
  }}}
  * You may need to create an admin password (do it).
  You may see the worksheets, but be logged in as admin.<<BR>>
  If needed, be certain to login as "link" with password "link."<<BR>>
  * Open worksheet 0, execute a cell or two, find link to worksheet 1.
  * Follow link to worksheet 1, execute some cells here too.
  * [[attachment:link-worksheets.tar.gz | Archive (described above)]] [[attachment:link-worksheets.py | Python generation script]]

 * Textbook Section Experiment (2010/01/30)<<BR>>
 This is a straight conversion of a math-heavy section from Beezer's linear algebra text.
  * The original tex4ht output is at [[http://linear.ups.edu/jsmath/0220/fcla-jsmath-2.20li35.html#x36-143000 | FCLA Section FS in jsMath]]
  which seems to render just fine for me.
  * Worksheet below is a straight conversion as in the Group Theory demo above, but has at least three problems:
    1. Graphic is not being picked up (easy to fix in parsing script).
    2. Some formatting (like matrix brackets) not rendering right.
    3. Links in theorems use {{{\text{@(a href="#definition.LNS")Definition LNS@(/a)}}}} construct which is broken in notebook, and is a mystery to me at the moment.
  * [[attachment:math-stress-test.sws | Worksheet]]
