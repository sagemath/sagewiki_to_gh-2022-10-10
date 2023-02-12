

## Sage Days 7 coding sprints

Back to the <a href="/days7">main conference page</a>. 

* <a href="/days7/sprints/linalg">Linear Algebra -- Hermite Normal Form</a> 
            * 
            * Implement a Hermite Normal Form over ZZ that is faster than anything else in the world (e.g., Magma). Also, implement quotients of free modules over ZZ. 
            * 
            * Completely re-implement abelian groups. From scratch. 
            * 
      * Clement Pernet (chair) 
      * Craig Citro (Jordan & Rational forms) 
      * William Stein(<a href="/days7/p-adics">discussion page</a>) 
      * Nicolas Thiery (relating to combinatorics) 
      * Franco Saliola 
      * Gregg Musiker -- Smith normal form with rational function entries (think symbolic) 
      * Justin Walker 
* Canonical labeling for things other than graphs. 
      * Robert Miller (chair) 
      * Nicolas Thiery 
      * Pete Jipsen 
      * Stephen Hartke 
* Edge labeled graph isomorphism <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1304">DONE</a> 
      * Robert Miller 
* Crystals / Graph Visualization 
            * 
            * 11AM Thursday 
            * 
      * Mike Hansen 
      * Justin Walker 
      * Dan Bump 
      * Nicolas Thiery 
      * Anne Schilling (chair) 
      * Kiran Kedlaya 
      * Tom Boothby 
* Xin's partial fraction algorithm 
      * Mike Hansen 
      * Gregg Musiker (chair) 
      * Jason Bandlow 
      * Nicolas Thiery 
      * Alyson Deines 
      * Alex Ghitza 
* Guessing generating functions (like gfun, maple, ...) 
      * Nicolas Thiery (chair) 
      * Mike Hansen 
      * Alex Ghitza 
* Graph Databases 
      * Emily Kirkman (chair) 
      * Jason Grout 
      * Pete Jipsen 
* Other Databases 
      * Pete Jipsen 
      * Robert Miller (chair) 
      * Emily Kirkman 
      * Andrey Novoseltsev (leaves Thurs) 
      * Mike Abshoff 
* Embedding Graphs on Surfaces (see talk Weds!!) 
            * 
            * dinner Weds 
            * 
      * <a class="http" href="http://sage.math.washington.edu/home/ekirkman/embeddings_improvements.hg">Current Bundle</a> 
      * Emily Kirkman (chair) 
      * Tom Boothby 
      * Robert Miller 
* Documentation  
      * David Roe (p-adics) 
      * Mike Hansen 
      * Mike Abshoff (packaging, workflow) 
      * Craig Citro 
      * Robert Bradshaw 
      * Nick Alexander 
      * Jake Mitchell 
      * Alyson Deines 
      * Alex Ghitza 
      * William Stein 
* Lattices and embeddings 
      * Stephanie Vance (chair) (until Thursday) 
      * Craig Citro (number-field related) 
      * David Roe 
      * Mike Hansen 
      * Nicolas Thiery 
      * Alex Ghitza 
* Modules indexed by Combinatorial classes   
            * 
            * (Thurs lunch?) 
            * 
      * Nicolas Thiery (chair) 
      * David Roe 
      * Mike Hansen 
      * Dan Bump 
* Debian Packaging (<a href="/days7/DebianPackagingSprint">details & progress</a>) 
      * Mike Abshoff 
      * Tim Abbott (chair) 
      * Franco Saliola  
* Referee David Roe's patch (<a href="/days7/p-adics">discussion page</a>) 
      * Robert Bradshaw (chair) 
      * Kiran Kedlaya 
      * Jen Balakrishnan 
      * David Roe 
      * Craig Citro 
* 3D graphics for polytopes and profiling 
      * Andrey Novoseltsev (chair) 
      * William Stein 
      * Robert Bradshaw 
* Profiling, making cython -a easier to use (?) 
      * Robert Bradshaw 
      * Craig Citro 
      * Andrey Novoseltsev 
      * William Stein 
* Interfacing a C/C++ library to Sage via Cython 
            * 
            * <a href="days7/sprints/cython_demo.patch">Hello world example of a new Cython extension of Sage</a> 
            * 
      * Mike Hansen 
      * Stephen Hartke 
      * Robert Bradshaw 
      * David Roe 
      * Clement Pernet 
      * William Stein 
      * Jason Grout 
      * Robert Miller 
      * Andrey Novoseltsev 
      * Tom Boothby 
      * Nicolas Thiery 
      * Craig Citro 
      * Emily Kirkman 
      * Tim Abbott 
* How close is Sage to ready to use as a tool for a grad/undergrad combinatorics course? (Weds) 10AM Thursday (<a href="/days7/sprints/teaching">discussion page</a>) 
               * 
               * Make a quick reference card a la Jipsen 
               * 
      * Iftikhar Burhanuddin (chair) 
      * Nicolas Thiery 
      * Jason Bandlow 
      * Jake Mitchell 
      * Stephen Hartke 
      * Alex Ghitza 
      * Jason Grout 
* Tableaux package cleanup (we should start.) 
            * 
            * Weds night 
            * 
      * Jason Bandlow 
      * Gregg Musiker 
      * Mike Hansen 
      * Francois Descouens 
      * Nicolas Thiery 
* <a href="/CombinatorialClass">CombinatorialClass</a> LEGO 
            * 
            * Fri/Sat 
            * 
      * Nicolas Thiery 
      * Franco Saliola 
      * Andrey Novoseltsev 
      * Mike Hansen 
      * Jason Bandlow 
      * Jake Mitchell 
* John Stembridge's POSETS package 
      * Franco Saliola 
      * Pete Jipsen 
      * Mike Hansen 
      * David Roe 
* <a href="/days7/sprints/testing">Sage testing system (parallel testings, regression testing, removing extra "sage.:", etc)</a> 
      * Nick Alexander 
      * Mike Hansen 
      * Mike Abshoff 
      * Robert Miller 
      * Tim Abbott 
      * Nick Alexander is working on some system independent patches that will make it easier to integrate with nose, etc.  See him before doing major work. 
      * William Stein Nick Alexander posted a small document at <a href="http://trac.sagemath.org/sage_trac/ticket/2099">http://trac.sagemath.org/sage_trac/ticket/2099</a> explaining how the Sage testing architecture currently works. Nick Alexander is working on using parallel make to run doctests in parallel. 
* Hierarchy of Hopf algebras, tensor products 
            * 
            * dinner Weds 
            * 
      * Mike Hansen 
      * Robert Miller 
      * Nicolas Thiery 
      * David Roe 
      * Robert Bradshaw 
      * William Stein 
* Hierarchy for combinatorial classes (several) 
      * Nicolas Thiery 
      * Mike Hansen 
      * Jason Bandlow 
      * Robert Miller 
      * Jason Grout 
* Symmetrica build issues (discussed, changes will be made to symmetrica.spkg past SD7) 
      * Mike Abshoff 
      * Mike Hansen 
* coercion -- work on leftovers from SD6 <a href="/days7/coercion">days7/coercion</a> 
            * 
            * tutorial -- Fri night 
            * 
      * David Roe 
      * Robert Bradshaw 
      * Nicolas Thiery 
      * Tim Abbott 
      * Jason Grout 
      * Robert Miller 
      * Craig Citro 
* "Which SPKG am I?" Thurs, fight starts at 8PM 
* Coleman integration 
            * 
            * thurs evening 
            * 
      * Kiran Kedlaya 
      * Robert Bradshaw 
      * Jen Balakrishnan 
      * David Roe 
* more cpdef 
      * Robert Miller 
      * Robert Bradshaw 
      * Tim Abbott 
      * Craig Citro 
* 2D pretty printing for combinatorial stuff (tableaux, etc) 
      * Mike Hansen 
      * Nicolas Thiery 
* Implement a basic Manipulate command 
            * 
            * Thurs afternoon 
            * 
      * Jason Grout 
      * William Stein 
      * Tom Boothby 