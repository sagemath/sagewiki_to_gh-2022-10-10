See the thread

http://groups.google.com/group/sage-devel/browse_thread/thread/69ab50fe11672111

for the impetus of this page.  I will repeat here that the original author of this page (Ryan Hinton) is *not* an expert at Sage or GiNaC.  Consequently, there are likely syntactic and semantic errors below.  Feel free to edit, comment, or discuss any of my mistakes.

My best idea is to use Python's indexing notation and hook ``__getitem__()`` for Pynac expressions.  (Is this already done?)  So the following GiNaC C++ and Sage Python code should do essentially the same thing.
{{{
symbol A("A"), i_sym("i"), j_sym("j");
idx i_idx(i_sym, 3), j_idx(j_sym, 3);
ex s = indexed(A, i, j).sum();
}}}
vs.
{{{
var('A i j')
s = A[i,j].sum(3,3)
}}}
