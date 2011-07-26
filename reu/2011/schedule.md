Twitter Feed: http://twitter.com/?q=SageMathREU#!/SageMathREU        <-- Use username: SageMathREU

<<TableOfContents>>

= Week 1 =

== Monday, June 20 ==

  * Introductions: http://tinyurl.com/3m6fs8f

  * Tutorial about how to compute things about elliptic curves:  http://nt.sagenb.org/home/pub/45/

  * Cremona's online tables: http://www.warwick.ac.uk/~masgaj/ftp/data/
  
  * Cremona's book (see in particular Table 1): http://www.warwick.ac.uk/~masgaj/book/fulltext/

  * Assignment for today:  Compute as much as you can about [[http://groups.google.com/group/uwntreu2011/browse_thread/thread/6b9c5c3c990a44e7|the curves listed here]].

  * Results of assignment:
       * William: See http://nt.sagenb.org/home/pub/46/ and in particular the pdf link at the bottom.


== Tuesday, June 21 ==

  * 10am-12pm: Introduction to Sage in Communications B27.   [[http://tinyurl.com/3j83k48|Video]]
  * Presentation of assignments from June 20 (table up to norm conductor 124):
        * Rado Kirov: http://nt.sagenb.org/home/pub/47/
        * Ben Leveque: http://nt.sagenb.org/home/pub/50/
        * Andrew Ohana: http://nt.sagenb.org/home/pub/51/
        * Ashwath Rabindranath: http://nt.sagenb.org/home/pub/53/
        * Paul Sharaba: http://nt.sagenb.org/home/pub/56/
        * William Stein: http://nt.sagenb.org/home/pub/46/
  * Demos of things you've done using Sage (e.g., interacts, etc.):
        * Ben Leveque's Farey Graph: http://nt.sagenb.org/home/pub/52/
  * Get started with the Wiki a little: http://wiki.sagemath.org/reu/2011
  * Andrew Ohana and Aly Deines: canonical stuff [[attachment:ohana1.pdf]]
  * Mentioned: dumps, loads, save, load
  * nosqlite: http://code.google.com/p/nosqlite/ along with [[http://nt.sagenb.org/home/pub/55/|a worksheet that illustrates it]].
  * Antwerp IV -- old tables of elliptic curves: http://modular.math.washington.edu/Tables/antwerp/
  * Read [[http://www.ams.org/journals/bull/1995-32-04/S0273-0979-1995-00616-6/S0273-0979-1995-00616-6.pdf|Ribet's awesome paper 'Galois representations and modular forms']], in particular Sections 3 and 5.
  * Extensive data over Q(sqrt(5)) so far is [[http://wstein.org/Tables/hmf/sqrt5/|here as plain text files]].  This can be used instead of http://db.modform.org, and is easier to parse.

== Wednesday, June 22 ==
  * Rado's talk at 10am in Communications B27:   
           * Demo: http://sagenb.org/javascript/graph_editor2/index.html
           * Best HTML5 canvas tutorial:  https://developer.mozilla.org/en/canvas_tutorial
           * Graph editor source code: https://bitbucket.org/radokirov/js-graph-editor
  * 11:30am -- meet in the Sage lab
  * Aly Deines -- Global minimal models at 3:10pm. http://nt.sagenb.org/home/pub/62/
  * Get started with Mercurial a little: http://code.google.com/p/uw-nt-reu2011/
  * William's idea for determining whether there is a p-isogeny: http://nt.sagenb.org/home/pub/61/
  * Elkies tables that have isogeny examples: http://www.math.harvard.edu/~elkies/nature.html
  * William: Added [[http://code.google.com/p/uw-nt-reu2011/source/detail?r=c13b6e9fa71d1bdeadee1ceb2c738aa0cebf6456|initial template version of our goal paper]] to the repository. 
  * Here [[attachment:modifiedellipticcurvedatafile.txt]] is an initial table that adds |T|, signs, ord(disc), ord_(j), Tamagawa numbers, and Kodaira symbols to the data at http://wstein.org/Tables/hmf/sqrt5/finding_weierstrass_equations/matched.txt
  * Here is the paper from the 2010 REU: [[attachment:Prime_Isogenies_Over_Number_Fields.pdf|On the Irreducibility of Galois Representations Associated to Elliptic Curves]]
  * Ashwath: Here is some very preliminary code that confirms William's idea to check if a certain curve has odd prime isogenies using the reducibility of the characteristic polynomial of Frobenius at primes of good reduction: http://nt.sagenb.org/home/pub/63
  * The isogeny source code in Sage by Dan Shumow: http://nt.sagenb.org/src/schemes/elliptic_curves/ell_curve_isogeny.py
  * Documentation of Shumow's isogeny code: http://sagemath.org/doc/reference/sage/schemes/elliptic_curves/ell_curve_isogeny.html
  * Computing isogeny degrees and filling out the norm conductor 31 isogeny class: http://nt.sagenb.org/home/pub/65/
  * Project idea: For each aplist in http://wstein.org/Tables/hmf/sqrt5/ellcurve_aplists.txt find all possible isogeny degrees.  This would be extremely interesting!!   
  * Hilbert modular forms: http://code.google.com/p/purplesage/source/browse/#hg%2Fpsage%2Fmodform%2Fhilbert%2Fsqrt5%253Fstate%253Dclosed
 
== Thursday, June 23 ==
  * Official start meeting at 12pm at [[http://goo.gl/msJue|Pa$eo]] in Fremont. 4225 Fremont Ave N. 
  * Work afterwards in Sage lab starting 2pm. 
  * For each aplist in http://wstein.org/Tables/hmf/sqrt5/ellcurve_aplists.txt find all possible isogeny degrees.  [[attachment:isogeny_degrees.txt|Isogeny Degrees]] The worksheet is published here: http://nt.sagenb.org/home/pub/70
  * Ashwath, Ben, Andrew: We have re-written the prime isogeny code from yesterday, making it significantly faster: http://nt.sagenb.org/home/pub/69/
  * Note: Initial curve data file above ([[attachment:modifiedellipticcurvedatafile.txt]]) is updated to have 0s where the ord(j) list is empty so it is easier to parse
  * Paul has written the code for nosqlite to create a database for the elliptic curves. It is currently uploaded to the sage clusters, in the folder databases, labeled small_nosqlite.
  * Andrew: I made a short write-up on the ordering scheme that I was working on. It very briefly mentions the background used with specialized definitions. http://wstein.org/home/ohanar/sqrt5/element_ordering/element_ordering.pdf

== Friday, June 24 ==
  * 10am in the Sage lab for status reports and planning. 
  * Here's a table of isogenies. They were computed using just the ap values, and still include some really really big isogenies: [[attachment:IsogenyTable4.txt]] -- it corresponds to the curves in this table: [[attachment:matched.txt]]. This version does not have spaces in the isogenies column.
  * Computed some isogeny graphs for specific curves using division polynomials. Task: Find an algorithm to do the same.
  * Explicit isogeny finding worksheet: http://nt.sagenb.org/home/pub/71/
  * Here's a table of isogenies that includes the a-invariants for easy reference. [[attachment:IsogenyTable7.txt]]
  * Worksheet which uses William and Ashwath's code to check which isogeny degrees appearing in the table above are actually valid. http://nt.sagenb.org/home/pub/72/

= Week 2 =

== Monday, June 27 ==

  * Code for finding isogeny classes: http://nt.sagenb.org/home/pub/76/ Notice that it has a rating of 4.0!
  * 2:30 pm - Talk by Ashwath on computing prime isogenies of Elliptic Curves.
  * Progress on graphing isogeny classes: http://nt.sagenb.org/home/pub/79/

== Tuesday, June 28 ==

== Wednesday, June 29 ==

  * 2:10pm in Sieg Hall -- [[/20110629-greenberg|talk by Ralph Greenberg on Galois Representation]]
  * Created updated text file (Galois paired table) [[attachment:Paired_Table.txt]]
  * Elkies algorithm: [[/20110629-elkies|see here]]
  * Here's our isogeny class/adjacency matrix data for N up to 3205! [[attachment:isogeny_partial_output.txt]]

== Thursday, June 30 ==

  * here is an updated list of all possible valuables calculated so far, now with labels! [[attachment:updated_list.txt|Table]]

== Friday, July 1 ==

  * NOTE! ord(j) computed incorrectly if E.j_invariant = 0. Should be a quick fix to update the database. Here's a modified list for the *original* curves in matched.txt: [[attachment:modifiedjinv3.txt]]
  * Related: Here is a modified version of the table provided last Thursday: [[attachment:modifiedellipticcurvedatafile2.txt]]

= Week 3 =

== Monday, July 4 ==

  * Here is a table listing some new curves found by twisting the ones in our original list: [[attachment:new_curves_via_twist.txt]]. Still need to check if any in the table are isomorphic or isogenous to each other. There are not too many in the list, but it was created by twisting our known curves by x + ya, where x and y only vary between -5 and 5, so there is potential for more.

== Tuesday, July 5 ==

== Wednesday, July 6 ==

== Thursday, July 7 ==

  * Here is the updated list of unknown curves still needed to be found for norm up to 1000.

== Friday, July 8 ==

= Week 4 (William in Budapest this week) =

== Monday, July 11 ==

== Tuesday, July 12 ==

== Wednesday, July 13 ==

== Thursday, July 14 ==

== Friday, July 15 ==


= Week 5 =

== Monday, July 18 ==

  * Status report talks in [[http://washington.edu/maps/?PCAR|Paccar 190]].  3-5pm. 
{{{
  3:00 Ashwath: Heegner points
  3:20 Ari: Galois Cohomology
  3:40 Andrew: Cremona's tables (?)
  4:00 Paul: Database
  4:20 Ben: Families with torsion
  4:40 Jon: Curves with presumed torsion
  5:00 William: Status of our paper
}}}    

  * Notes on twisting and torsion families: [[attachment:TorsionFamilies.pdf]]

== Tuesday, July 19 ==

== Wednesday, July 20 ==

== Thursday, July 21 ==

  * (Correction)Finally, this is the updated list of unknown Elliptic Curves: [[attachment:Unmatched.txt]]

== Friday, July 22 ==

  * Here is a list of curves found thus far using ModJon: [[attachment:new_curves_found_via_modjon.txt]]
  * Here is a write-up about the Mod-Jon method:  [[attachment:FindingCurvesAPs_updated.pdf]]

= Week 6 =

== Monday, July 25 ==

== Tuesday, July 26 ==

  * Here is the new list of curves found thus far using ModJon: [[attachment:new_curves_found_via_modjon_version2.txt]]

== Wednesday, July 27 ==

== Thursday, July 28 ==

== Friday, July 29 ==


= Week 7 =

== Monday, August 1 ==

== Tuesday, August 2 ==

== Wednesday, August 3 ==

== Thursday, August 4 ==

== Friday, August 5 ==


= Week 8 =

== Monday, August 8 ==

== Tuesday, August 9 ==

== Wednesday, August 10 ==

== Thursday, August 11 ==

== Friday, August 12 ==
 
