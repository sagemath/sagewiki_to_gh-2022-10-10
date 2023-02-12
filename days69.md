

# Sage Days 69: Women in Sage 6 (September 4-9, 2015)


## Saturday (Sept 5)

* 9:00 a.m. getting started on trac 
* 10:30 a.m. projects 
* 5:00 p.m. status reports  

## Sunday (Sept 6)

* 9:00 a.m. review a patch example 
* 10:00 a.m. project work 
* 5:00 p.m. workshop dinner 

## Monday (Sept 7)

* 10:00 a.m. project work 
* 5:00 p.m. status reports 

## Tuesday (Sept 8)

* 10:00 a.m. project work 
* 5:00 p.m. status reports 

## Wednesday (Sept 9)

* 10:00 a.m. departure 

## Projects:

* Writing/fixing documentation: fixing typos  
         * git command should be git -command 
         * git trac review : In <a href="http://doc.sagemath.org/html/en/developer/git_trac.html#reviewing">http://doc.sagemath.org/html/en/developer/git_trac.html#reviewing</a> , "git trac review 12345 downloads the branch from the ticket and shows you what is being added" is not exactly what it does. 
         * The deprecation explication in Developer's guide is unclear. Especially, the deprecation should be made more clear for when you move a file. <a href="http://doc.sagemath.org/html/en/developer/coding_in_python.html#deprecation">http://doc.sagemath.org/html/en/developer/coding_in_python.html#deprecation</a> 
         * The way to install Sage for developers is wrong : "You can use your local installation of Sage, or (to start without Sage) download it from github which is a public read-only mirror (=faster) of our internal git repository". I think we had difficulties developing because we tried to use our local installation (with the tar file) instead of the git one. <a href="http://doc.sagemath.org/html/en/developer/walk_through.html#obtaining-the-sage-source-code">http://doc.sagemath.org/html/en/developer/walk_through.html#obtaining-the-sage-source-code</a> 
* Reviewing patches 
* ABC project (Lily, Kristin, Aly, Jen, Jen) 
* Modular forms project (Jackie, Aly, Lubjana) 
* Combinatorics patches (Emily, Nadia, Stéphanie, Mélodie) 
      * Finish fully packed loop class <a href="http://trac.sagemath.org/ticket/18003">http://trac.sagemath.org/ticket/18003</a> 
      * Create a snake graph class (using part of the code written for on <a href="http://trac.sagemath.org/ticket/16310">http://trac.sagemath.org/ticket/16310</a>) 
               * <a href="http://trac.sagemath.org/ticket/19160">http://trac.sagemath.org/ticket/19160</a> 
      * Words : Lyndon and Christoffel words. See <a href="http://trac.sagemath.org/ticket/19150">http://trac.sagemath.org/ticket/19150</a>, <a href="http://trac.sagemath.org/ticket/19154">http://trac.sagemath.org/ticket/19154</a>, <a href="http://trac.sagemath.org/ticket/19155">http://trac.sagemath.org/ticket/19155</a>, <a href="http://trac.sagemath.org/ticket/19159">http://trac.sagemath.org/ticket/19159</a> and more patches coming soon 
      * Review patches : <a href="http://trac.sagemath.org/ticket/19008">http://trac.sagemath.org/ticket/19008</a> (about graphs), <a href="http://trac.sagemath.org/ticket/19161">http://trac.sagemath.org/ticket/19161</a> (about posets) 
* Recurrences for hypergeometric sums - Sister Celine's algorithm code (Karen) 
      * <a href="https://www.math.upenn.edu/~wilf/AeqB.html">https://www.math.upenn.edu/~wilf/AeqB.html</a> 
      * <a href="http://mathworld.wolfram.com/SisterCelinesMethod.html">http://mathworld.wolfram.com/SisterCelinesMethod.html</a> 
* Analytic rank for elliptic curve L-functions (Michelle) 
* Reducing models of hyperelliptic curves (Lubjana) 
* Newton's method bug (Amy) 
   * No more bug. 
* Updating old Sage worksheets to public SMC worksheets (Amy) 
* Discrete Gaussian sampler bug (Kristin, Amy) 
         * <a href="http://trac.sagemath.org/ticket/17764">http://trac.sagemath.org/ticket/17764</a> 
         * <a href="http://trac.sagemath.org/ticket/19138">http://trac.sagemath.org/ticket/19138</a> 
* Sturm sequences/ Weil polynomials (Alina) - patch in FLINT 
* Power sums of roots of polynomials (Alina) - implement it in Sage (goal: beat pari) 

## Participant Tickets

* <a href="http://trac.sagemath.org/ticket/19145">http://trac.sagemath.org/ticket/19145</a> 
* <a href="http://trac.sagemath.org/ticket/19154">http://trac.sagemath.org/ticket/19154</a> (needs review) 

## Easy Trac Tickets

* To Review 
   * <a href="http://trac.sagemath.org/ticket/14164">http://trac.sagemath.org/ticket/14164</a> 
   * <a href="http://trac.sagemath.org/ticket/11699">http://trac.sagemath.org/ticket/11699</a> 
   * <a href="http://trac.sagemath.org/ticket/11968">http://trac.sagemath.org/ticket/11968</a> 
   * <a href="http://trac.sagemath.org/ticket/17299">http://trac.sagemath.org/ticket/17299</a> 
   * <a href="http://trac.sagemath.org/ticket/17701">http://trac.sagemath.org/ticket/17701</a> 
* Updates in Documentation 
   * <a href="http://trac.sagemath.org/ticket/5728">http://trac.sagemath.org/ticket/5728</a> 
   * <a href="http://trac.sagemath.org/ticket/6769">http://trac.sagemath.org/ticket/6769</a> 
   * <a href="http://trac.sagemath.org/ticket/4204">http://trac.sagemath.org/ticket/4204</a> 
   * <a href="http://trac.sagemath.org/ticket/7586">http://trac.sagemath.org/ticket/7586</a> 
* Things that people at SD69 have a personal interest in seeing work :) 
   * <a href="http://trac.sagemath.org/ticket/7114">http://trac.sagemath.org/ticket/7114</a> (Amy) 
   * <a href="http://trac.sagemath.org/ticket/8559">http://trac.sagemath.org/ticket/8559</a> (Amy - might be easy) 
   * <a href="http://trac.sagemath.org/ticket/14756">http://trac.sagemath.org/ticket/14756</a> (Lubjana) 
Organizers: Jennifer Balakrishnan, Alyson Deines 

Participants: 

* Jen Berg 
* Lubjana Beshaj 
* Alina Bucur 
* Amy Feaver 
* Emily Gunawan 
* Lily Khadjavi 
* Karen Kohl 
* Michelle Kovesi 
* Kristin Lauter 
* Nadia Lafrenière 
* Jackie Lang 
* Mélodie Lapointe 
* Stéphanie Schanck 