

# Sage 3.1 and 3.1.1 Release Tour

Sage 3.1.1 was released on August 17th, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see sage-3.1.1.txt.  


## New Coercion Infrastructure

Robert Bradshaw, David Roe: new coercion model 


## Graph and Plotting Improvements

Arnaud Bergeron, Jason Grout, Robert Miller, Franco Saliola 

   * (Robert Miller, Franco Saliola) Automatic plotting of trees and posets. 

## Major Update to Root Systems

Dan Bump, Nicolas Thiery, Nicolas Borie, Mike Hansen 


## Steenrod Algebra Calculations

John Palmieri 


## Notebook improvements

Timothy Clemans 


## Free Modules Revision

David Kohel 


## Multimodular Algorithm for Bernoulli Numbers

David Harvey 


## Partition Refinement

Robert Miller 

   * Generalized the existing algorithms for graphs and binary codes, rewrote algorithm to be substantially more legible and maintainable. 

## Integral Point Finding for Elliptic Curves over Q

Tobias Nagel, Michael Mardaus, John Cremona 

   * Integral points on elliptic curves over Q: done, in 3.1.1 
   * S-integral points on elliptic curves over Q: in progress 

## New sage_input Function

Carl Witty 


## New printing for intervals and QQbar elements

Carl Witty 

Sage 3.1.1 introduces a new way to print intervals and QQbar elements: 
```txt
sage: QQbar(sqrt(2))
1.414213562373095?
```
The question mark syntax indicates that the real value is within 1.414213562373094 and 1.414213562373096 (that the last digit could vary by up to plus or minus one).  For QQbar elements, Sage knows the real value and uses that value in calculations. 
