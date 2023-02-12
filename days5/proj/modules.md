

# Tensor products, quotients, etc., of free modules

Comment from Mike:  I'm highly interested in this functionality as I need it for a lot of things.  It would be nice to be able to tensor over rings other than just the base ring. 

Soroosh's Wish List: Here is a list of things that I think it would be nice to have in Sage. I think some of them are in already. 

* kernel 
* cokernel 
* torsion: Given R-module M and an R-Ideal I, construct the submodule $M[I]=\{m \in M | xm=0 \mbox{ for all } x \in I\}$ 
* intersection: Given R-module M and two submodules $N_1$ and $N_2$, find the submodule $N_1 \cap N_2$ 
* sum: Given R-module M and two submodules $N_1$ and $N_2$, find the submodule $N_1+N_2$ 
* tensor product 
* hom module: Given R-modules $M_1$ and $M_2$, construct the module $Hom_R(M_1, M_2)$ 
* Change of ring: Given R-modules M and an R-algebra A, construct the A-module $M \otimes A$. 
* Annihilator 
* Rank: Calculate the rank of an R-module M. 
* direct sum 
* treating ideals as an R-modules. 
Comment from Justin: 

   * I'd like to have support for modules (lattices) over arbitrary rings, especially quaternion algebras.  I'd also like to create these things as subthings of existing structures (say, quaternion algebras).  I don't know whether the latter is really important or interesting, but it seems like a good idea on the surface. I think that the ``quotient module_ should be the head of the class hierarchy (below an abstract ``Module_ class perhaps).  Then a free module would be a module with no relations.  Related question: should the Module hierarchy have classes for a variety (as it were) of module types (free, tensor products, quotients, ...)?  Is it better just to differentiate by attributes on the base class? 
As of Monday, we have some code running.  It's barely a beginning.  How this fits into the class hierarchy is not yet clear.  Comments welcome (<a href="mailto:syazdani@gmail.com">syazdani@gmail.com</a>, <a href="mailto:justin@mac.com">justin@mac.com</a>). 
