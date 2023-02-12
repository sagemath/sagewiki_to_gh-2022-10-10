

# Sage Days 55: Arithmetic and Complex Dynamics


## November 7–November 10, 2013, Florida Institute of Technology, FL

This is a 4-day workshop that will include a combination of mathematical talks, Sage tutorials, and Sage development. The main goal is to promote and improve the dynamical systems functionality in Sage.  Some base functionality for dynamical systems has been implemented for Sage, beginning at ICERM in Spring 2012. There remains a significant amount of work to be done, ranging from reviewing patches, migrating stand-alone algorithms into Sage, implementing existing algorithms, and many more activities.  Users new to Sage and Sage development are welcome. 

See the <a class="http" href="http://wiki.sagemath.org/dynamics/ArithmeticAndComplex">wiki page</a> for information on the current status of Arithmetic and Complex Dynamics in Sage. 


### Registration

Registration is free. There is limited funding for travel and lodging. Please contact Ben Hutz at BHutz (at) FIT.edu to register. Please indicate if you will be requesting funding. 


### Schedule

The workshop will consist of tutorials and talks in the mornings and working groups in the afternoons. Conference activities will begin Thursday morning and conclude Sunday  afternoon. 


### Thursday, November 7 (building Quad 406)
9:00am-10:00am | Welcome and Sage installation help
10:00am-11:00am | Tutorial I: Adam Towsley: Installing Sage and Patches
11:00am-11:30am | Break
11:30am-12:30pm | Tutorial II: Hao Chen: Introduction to Sage and the Notebook
12:30pm-2:00pm | Lunch
2:00pm-3:00pm | Ben Hutz: The state of arith and compl dyn in Sage <a href="sagedaysACD/State_of_dynamics.pdf">slides</a> , <a href="sagedaysACD/state of dynamics.sws">sws</a> 
3:00pm-3:30pm | Break
3:30pm-4:30pm | Project selection
4:30pm-6:00pm | Project work time
6:00pm | Status updates


### Friday, November 8 (building Quad 406)
9:00am-10:00am | Tutorial III: Ben Hutz: Python introduction <a href="sagedaysACD/Python_intro.pdf">slides</a>
10:00am-11:00am | Tutorial IV: Ben Hutz:  Contributing to Sage <a href="sagedaysACD/Contributing_to_sage.pdf">slides</a>
11:00am-11:30am | Break
11:30am-12:30pm | Talk: David Krumm
12:30pm-2:00pm | Lunch
2:00pm-3:00pm | Tutorial V: Adam Towsley: Reviewing a patch
3:00pm-3:30pm | Break
3:30pm-6:00pm | Project work time
6:00pm | Status updates


### Saturday, November 9 (building Quad 405)

Coffee break at 11am and 3pm 
9:00am-10:00am | Talk: Vincent Delecroix - how to use C in Sage/Python
  |  <a href="sagedaysACD/cython_beamer.pdf">beamer</a> <a href="sagedaysACD/cython.zip">data</a> 
10:00am-12:30pm | Project work time
12:30pm | Status Updates
12:30pm-2:00pm | Lunch
2:00pm-3:00pm | Talk: Patrick Ingram
3:00pm-6:00pm | Project work time
6:00pm | Status updates


### Sunday, November 10 (building Quad 405)

Coffee break at 11am 
9:00am-10:00am | Talk: Holly Krieger - Arithmetic of forward orbits and recurrence <a href="sagedaysACD/dynamics_and_recurrence.pdf">beamer</a>
10:00am-12:30pm | Project work time
12:30pm | Final Status Updates


### Projects

* improve documentation of normalize_coordinates() (~~<a class="http" href="http://trac.sagemath.org/ticket/15377">#15377</a>~~, closed: sage-5.13.beta3) - Ben Hutz   
* <a href="/MacCaulay">MacCaulay</a> Resultant (<a class="http" href="http://trac.sagemath.org/ticket/15382">#15382</a>) - Soli Vishkautsan, Hao Chen 
* Krumm-Doyle Small Points Algorithm - needs review <a class="http" href="http://trac.sagemath.org/ticket/15389">#15389</a> - David Krumm, John Doyle 
* Bruin-Molnar Algorithm into a patch ~~<a class="http" href="http://trac.sagemath.org/ticket/15392">#15392</a>~~ closed: sage-5.13.rc0- Brian Stout, Ben Hutz 
* Global height for integer fix (~~<a class="http" href="http://trac.sagemath.org/ticket/15373">#15373</a>~~ closed: sage-5.13.beta3 and Projective Point global_height remove special case for ZZ ~~<a class="http" href="http://trac.sagemath.org/ticket/15376">#15376</a>~~ closed : sage-5.13.beta4 - Paul Fili 
* FMV Algorithm into a patch (<a class="http" href="http://trac.sagemath.org/ticket/15393">#15393</a>) - Bianca Thompson, Ben Hutz, Joao Faria 
* Review ~~<a class="http" href="http://trac.sagemath.org/ticket/14219">#14219</a>~~ closed: sage-5.13.beta4 - Adam Towsley, Vincent Delecroix, Ben Hutz 
* Eigenvalues (see <a class="http" href="http://trac.sagemath.org/ticket/14990">#14990</a> and <a class="http" href="http://trac.sagemath.org/ticket/15390">#15390</a>) for an implementation of the algebraic closure of finite field) - Vincent Delecroix , Ben Hutz 
* <a href="/PostCriticallyFiniteMorphisms">PostCriticallyFiniteMorphisms</a> - Holly Krieger, Adam Towsley, Vincent Delecroix, Ben Hutz, Patrick Ingram 
* Lattes map from an Elliptic Curve (<a class="http" href="http://trac.sagemath.org/ticket/15394">#15394</a>)- Patrick Ingram 
* Composition of Morphisms (<a class="http" href="http://trac.sagemath.org/ticket/15378">#15378</a>) - Vincent Delecroix, Donald Richardson, Soli Vishkautsan 
* Bug fix: log of NaN in <a href="/RealField">RealField</a> and <a href="/ComplexField">ComplexField</a> results in infinite loop. We have posted a fix here: ~~<a class="http" href="http://trac.sagemath.org/ticket/15388">#15388</a>~~ (closed: sage-5.13.beta3) - Paul Fili, Adam Towsley 
* Enabled canonical height for maps of `\PP^N` over number fields. Here is an early draft worksheet: <a href="sagedaysACD/Canonical height for number fields.sws">sws</a>, for `N>1` it requires the macaulay_resultant patch from above. - Adam Towsley, Paul Fili 
* Implement .an_element() for <a href="/ProjectiveSpace">ProjectiveSpace</a> (it currently makes the <a href="/TestSuite">TestSuite</a> fai): <a class="http" href="http://trac.sagemath.org/ticket/15396">Ticket #15396</a> (needs review) - Ben Hutz 

### Location

Florida Institute of Technology, Melbourne, FL. 


### Participants

* Hao Chen - University of Washington 
* Joao de Faria - Florida Institute of Technology 
* Vincent Delecroix - Univ. Paris VII, France 
* John Doyle - University of Georgia 
* Paul Fili - Oklahoma State University 
* Benjamin Hutz - Florida Institute of Technology 
* Patrik Ingram - Colorado State University 
* Holly Krieger - Massachusetts Institute of Technology 
* David Krumm - Claremont <a href="/McKenna">McKenna</a> College 
* Donald Richardson - Florida Institute of Technology 
* Brian Stout - US Naval Academy 
* Bianca Thompson - University of Hawaii 
* Adam Towsley - CUNY Graduate Center 
* Soli Vishkautsan - Ben-Gurion University, Israel 

#### Organizers

* Benjamin Hutz, Department of Mathematical Sciences, Florida Institute of Technology 
* Adam Towsley, Ph.D. Program in Mathematics, CUNY Graduate Center 

### Lodging

Housing will be provided close to campus at the Hilton Melbourne Rialto Place for invited participants. The hotel provides breakfast and transportation to and from the airport and campus. 


### Last Updated

8/14/2013 
