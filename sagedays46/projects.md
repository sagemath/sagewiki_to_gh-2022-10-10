

# Sage Days 46: Hawaii -- computational number theory, etc. -- PROJECTS


## 2013-02-26: your missions

* Simon: Modular Degrees 
* David Roe: Review of old number theory tickets 
* Victoria: Jacobi Theta 
* Aly: Shimura corr 
* Ling: Shimura corr 
* Jason Grout: scalable robust Sage Cell Server 
* Volker: KVM snapshotting 
* Keith: KVM stuff 
* William Stein: scalable robust Sage Cell Server 
* Mirela and Jennifer: p-adic Heights 
* Vivek: UI testing/web stuff/scalable robust sage cell server -- javascript applet for entering matrices (?) 

## p-adic Heights

People: William Stein, Jennifer Balakrishsnan, Mirela Ciperiani 

* Write paper 
* Get code into Sage, or at least make it easily available as a Python package on github (say). 

## Modular Degrees at non-minimal levels

People: William Stein, Simon Spicer, Aly Deines 

* Add functions to Sage for computing a generalization of the modular degree at levels that are a multiple of the conductor.  Compute data.   
Trac ticket: 14189 


## p-Adics

People: David Roe 

   * Templating the p-adics, etc.  Another patch bomb.   Finish this! 
Trac Ticket: 12555 

   * Trac Ticket 12561 is about factoring polynomials over p-adics.  Improve and get this into Sage. 

## Computations related to a possible Shimura correspondence for non-congruence modular forms

People: Ling Long, Alyson Deines 

Also, some stuff related to truncated hypergeometric series.  


## Single Cell Server

People: Jason Grout, William Stein 

<a href="http://sagecell.sagemath.org">http://sagecell.sagemath.org</a> 

* Make the single cell server use stunnel for ssl support.  Benefits: this makes websockets more reliable, and of course makes the server more secure. 
* Make the single cell server highly available, i.e., deployed on multiple machines in multiple locations, with no single point of failure.  Currently, this is VERY hard because of the use of SQLite. 

## Salvus: Worksheet Views

People: William Stein, Jason Grout 

* Worksheets in Salvus have numerous "views" -- JSON, LaTeX, PDF, print, XML, etc. -- do a polished implementation of all of these.  This is a 100% frontend <a href="/CoffeeScript">CoffeeScript</a> development project.  The basic skeleton is completely in place. 

## Sage.math cluster

People: William Stein, Keith Clawsen, Volker Braun, Jason Grout 

   * KVM -- Address some specific needs of the combinat group on combinat.math.washington.edu.  (See William for details.) 
   * KVM -- Move the single cell server into a virtual machine. 
   * KVM -- Figure out how to do live snap-shotting of virtual machine's RAM for infinite computations: 
         * <a href="https://github.com/vbraun/ImmortalSage">https://github.com/vbraun/ImmortalSage</a> 
   * Hardware -- make a plan for disk, power supply (and other?) upgrades.  

## The Patch Referee Award

People: William Stein, Keith Clawson 

   * Design and implement a weekly award to the person who referees the most trac stuff, for some arbitrary definition.  Keith and William have done some work on this. Things to decide: 
            * definition of "most" -- this is social -- what do you think. 
            * the prize itself: money (e.g., amazon.com gift certificate) or something else? 
            * How to implement: use trac postgresql, etc. 

## Salvus UI Testing and Design

People: William Stein 

No significant thought has gone into the user interface of Salvus -- it's been all about implementing functionality, with basically no thought about where buttons are located, whether or not there are menus, how things are named, colored, and laid out, etc.  For this project, you would simply try out salvus -- there are NO INSTRUCTIONS YET -- and sketch on paper how you think the user interface could be better laid out.    Salvus mainly uses <a href="http://twitter.github.com/bootstrap/">http://twitter.github.com/bootstrap/</a>, so keep the widgets, colors, etc., available there in mind.  This requires only a web browser, paper, and pencil.    

         * Make some paper sketches of how *you* would lay out the UI.  
         * What should be in the help/tutorial for Salvus?  What questions would you want answered? 
         * What are you top priority things to be user-configurable?  Color schemes?  Key to evaluate code (shift-enter)? 
Note: Basically all development has so far been done Google Chrome under Linux.  


## Salvus: New Implementations of things that are in Sagenb

People: William Stein, Jason Grout 

* INTERACT: William has re-implemented from scratch the @interact functionality from Sage, with many new powerful features.  Try this out, test for backwards compatibility, help with documenting: write a tutorial.  Etc.  
* CELL PERCENT MODES (%blah): William has re-implemented this as well; same remarks as above.  Jason Grout has thought a lot about what is here.   There is no documentation yet.  
- 

* Dynamic implementation by Jason Grout. 
* Plotting Widget 
* Input widgets in codemirror3. 

## Computing Jacobi theta series

People: Victoria de Quehen 

* Victoria has some code that works to clean up and document. 
* Add some related functions. 

## Rescue old number theory tickets

People: David Roe 

* Find number theory tickets with code and try to get them fixed/reviewed.  See <a href="/sagedays46/projects/TicketStatus">this page</a>. 

## Factoring Cryptographic Size Numbers in Sage

People: Kartik 

   * Investigate current status of the tickets 
   * Write or revive a wrapper for various NFS-type programs. 