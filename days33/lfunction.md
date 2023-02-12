

# L-series

[[_TOC_]] 


### Project Leader

William 


### Group Members

William, Cassie, Amy, Lola 


### Getting Going on Development on *your* laptop (not *.sagenb.org)

1. Download this file: <a href="http://sage.math.washington.edu/home/wstein/days/33/eulerprod.py">http://sage.math.washington.edu/home/wstein/days/33/eulerprod.py</a> 
1. Type in the notebook: `attach /exact/path/to/eulerprod.py` 
1. Note that elliptic curves over Q(sqrt(5)) won't work if you don't have psage installed.  

### Project Description

For L-series lovers:  Getting the doctest coverage to 100% on this might be a good project: 

   * <a href="http://code.google.com/p/purplesage/source/browse/psage/lseries/eulerprod.py">http://code.google.com/p/purplesage/source/browse/psage/lseries/eulerprod.py</a> 
See <a class="http" href="http://nt.sagenb.org/home/pub/144/">this worksheet for an example</a>. 

That may discover "issues" (bugs), which I would likely have to fix, but would also be fun because one gets to come up with lots of creative examples of L-series all over the place.   Also, the top of that file has a todo list for new features to implement -- most would be bad projects, but one which would be good would be to make it so the Lseries object can use Lcalc (Rubinstein's program) to compute L-series instead of Dokchitser.  This would be a good project, because it would mainly involve thinking about the annoying mathematics involved in going between normalizing L-series with the center of the critical strip at 1/2 versus not doing that.  Also, it is all pure Python, so easier to get going. 

Anyway, I'd say 1 could be a good project for people who know the basics of L-series, but want to get a much more concrete feel for them.  In fact, instead of just trying to get coverage to 100%, writing a *tutorial* for computing with L-series using that package would be really nice.   E.g., one could walk through how to find missing information, create new L-series classes, etc. 


### Specific Concrete Projects

            * Move eulerprod.py into Sage itself.  This would at least involve: 
                           1. Clean up the imports at the top of the file. 
                           1. Do something with: "from psage.ellcurve.lseries.helper import extend_multiplicatively_generic"; it is the main dependency.  It's only a page of code.  
                           1. Graceful failure when  
            * Doctest coverage to 100% 
            * Fix bugs that are found when doctesting. 
            * Use rubinstein _lcalc (see line 1116) 
            * Math question: given that you have a_p for Norm(p) <= B, how many bits of precision do we get?  Basically, invert the function L.number_of_coefficients(prec=50) 
            * Write an L-functions tutorial:  <a href="http://sagemath.org/doc/thematic_tutorials">http://sagemath.org/doc/thematic_tutorials</a>   This does not have to be long.  It has to start somewhere.  Small and focused first is fine! 
            * Speed of elliptic curves over number fields (smalljac). 
            * Make it so we use exactly one GP session for *all* of the Dokchitser L-functions 
            * Symmetric powers (and modular degree -- see trac 9758) 
            * Triple product L-functions: Gross-Kudla, Zhang, etc -- see the code in triple_prod/triple.py 
            * Make it so we use exactly one GP session for *all* of the Dokchitser L-functions 
            * Tensor products 
            * Genus 2 curves, via smalljac and genus2reduction 
            * Fast L-series of elliptic curves over number fields (not just sqrt(5)), via smalljac 
            * Inverse of number_of_coefficients function.      

### Work in progress

L-series tutorial: <a class="http" href="http://wiki.sagemath.org/days33/lfunction/tutorial">http://wiki.sagemath.org/days33/lfunction/tutorial</a> 

Triple product L-function code: <a class="http" href="http://wiki.sagemath.org/days33/lfunction/tripleproduct">http://wiki.sagemath.org/days33/lfunction/tripleproduct</a> 
