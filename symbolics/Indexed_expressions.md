
This page discusses an interface for implementing indexed GiNaC expressions in Sage/Pynac. 

[[_TOC_]] 


## Background

See the thread 

<a href="http://groups.google.com/group/sage-devel/browse_thread/thread/69ab50fe11672111">http://groups.google.com/group/sage-devel/browse_thread/thread/69ab50fe11672111</a> 

for the impetus of this page.  I will repeat here that the original author of this page (Ryan Hinton) is *not* an expert at Sage or GiNaC.  Consequently, there are likely syntactic and semantic errors below.  Feel free to edit, comment, or discuss any of my mistakes. 


## General idea

My best idea is to use Python's indexing notation and hook `__getitem__()` for Pynac expressions.  (Is this already done?)  So the following GiNaC C++ and Sage Python code should do essentially the same thing. 
```cpp
#!cplusplus 
symbol A("A"), i_sym("i"), j_sym("j");
idx i_idx(i_sym, 3), j_idx(j_sym, 4);
ex s = indexed(A, i, j).sum();
```
vs. 
```python
#!python 
var('A i j')
s = A[i,j].sum(3,4)
```

## Detailed ideas


### Index dimensions

I like the `A[...]` indexing syntax, but the dimensions are missing.  There are three obvious approaches for specifying dimensions. 

* Cram them into the indexing syntax, e.g. `A[(i,3), (j,4)]`. 
* Specify the dimensions in a separate method call, e.g. `A[i,j].dimension(3,4)`.  The final result should be the same as a GiNaC indexed expression. 
* Specify them when they are used, e.g. `A[i,j].sum(3,4)`.   
RWH does *not* like cramming the dimensions into the indexing syntax.  Instead, specifying the dimensions when they are used seems most natural to RWH, but he has a shallow understanding and no experience with the GiNaC approach.   

In fact, the dimensioning method call and specify-on-use approaches can coexist.  Since GiNaC requires the dimension to be specified when the indexed expression is created, both cases require defining *implicit* dimensions.  So `A[i,j]` might translate to the following C++ code. 
```cpp
#!cplusplus 
symbol i_dim("__stmt627_A_dim_i"), j_dim("__stmt627_A_dim_j");  // unique symbol names
idx i_idx(i_sym, i_dim), j_idx(j_sym, j_dim);
return indexed(A, i_idx, j_idx);
```
Later, when we know the desired dimensions (e.g. in the `dimension()` or `sum()` method), we can substitute the actual dimensions.  We can use the indexed expression whether or not the indixes are explicitly dimensioned.  For example, `A[i,j].sum()` would return the 2-D sum over the implicit dimensions.  We could even give the implicit dimensions nice LaTeX names, e.g. the GiNaC equivalent of the Sage pseudocode 
```python
#!python 
var('__stmt627_A_dim_i', latex_name='N_{%s,%s}'%(A._latex_(), i_sym._latex_()))
```

### Specifying index dimensions

There are several options for the syntax specifying the index dimensions.  These ideas apply equally to the calling convention for `sum()` and `dimension()`. 
```python
#!python 
A[i,j].dimension(3, 4})  # positional syntax is simple, but not always clear
A[i,j].dimension({i:3, j:4})  # hash syntax allows specifying the index 
        # expression to be dimensioned
A[i,j].dimension(i=3, j=4)  # keyword syntax is similar, but may have problems 
        # with general expression indexes
A[i,j].dimension(i==3, j==4)  # relation syntax is similar to substitution 
        # syntax; perhaps confusingly, this would sum ``i`` over 0,1,2 and 
        # *not* 3 -- so i==3 is the first value that is *not* included in the 
        # sum
A[i,j].dimension(0<=i<3, 0<=j<4)  # more complex relation syntax shows exactly 
        # which values are included in the sum, but not sure if GiNaC can 
        # handle general dimension ranges
```
We should probably include the positional syntax at a minimum.  It will do just fine for only one index, and will probably be easier when trying to specifying the dimensions of a non-trivial index expression.  RWH's next favorite option is the hash syntax.  In all of the non-positional cases there will be issues of figuring out which string/expression matches which index.  RWH assumes facilities exist so this will not be a significant obstacle. 


## Operations

Indexed expressions should already support addition, multiplication, etc. with other expressions.  Below are ideas for operations specific to indexed expressions. 

* Of course, we should define `sum` and `prod` methods to form sums and products, respectively.   
* (Other operations that use indices?) 
* We could use indexed expressions to create vectors and matrices.  This would probably require new vector and matrix classes to support symbolic dimensions. 
* We could use indexed expressions to create polynomials (over `SR`). 
* (Other constructions that use indices?) 
* By allowing an infinite dimension, we can take limits of sequences, (sums of) series, etc.  Sequences of functions may fit in the same framework. 
Any other ides? 
