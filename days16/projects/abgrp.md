

# Rewrite Abelian Groups

Comment from John Cremona:  
```txt
If I were there (sorry for the millionth time) I would want to contribute to 
both the projects you have listed!  Especially the second one (abelian groups).  
I have been looking at #5882 with interest and expected that a rewrite of 
abelian groups would follow.

One plea: make sure that both additive and multiplicative notations
are supported.  It's really only a matter of input & output, plus some
fairly obvious terminology changes (e.g. you allow A(0) only when A is
additive and A(1) only if it is multiplicative), all the underlying
computation is in common (and indeed is handled by #5882).  For
example, in the now defunct ticket #4739 I did add additive versions
of the existing abelian group code (which uses multiplicative
notations exclusively despite being based on an additive
implementation) as I got fed up with elliptic curve torsion groups
being displayed multiplcatively.

The way I did this at #4739 might have some useful code which can be
recycled.  It was based on 3.2.1 six months ago and obviously does not
now apply cleanly.

[I could have added the above comments to the wiki page but was not
sure of that was appropriate.  Feel free to do so if it is.]
```

## Proposed (draft) roadmap

1. Write a new `AdditiveAbelianGroup` class which inherits from `AdditiveGroup` which builds on #5882. Essentially a very thin wrapper to f.g. Z-modules. 

2. Do the same thing for `MultiplicativeAbelianGroup`. 

3. Implement subgroups and quotients of these, and implement the subgroup enumeration algorithm described in Henri Cohen's book. 

4. Try to get Sage developers to switch code which uses current Abelian groups over to the new classes. 

5. Do the rest of #4, and kill the current code. 

6. It would also be nice to have a natural way of dealing with vectors in `A^n` for `A` an abelian group, which could be multiplied with integer matrices. 
