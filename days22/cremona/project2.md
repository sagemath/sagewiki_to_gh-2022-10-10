== Daily progress reports on Project 2 ==

==== Subproject 1 ====

Monday 21 June: Noam Elkies solved the 929 problem!  The curve  $[w, 1 - w, 1 + 20*w, -1738 - 82*w, -11808 - 201*w]$ where $w=(1+\sqrt{929})/2$ has everywhere good reduction.


==== Subproject 2 ====

Thursday 24 June:    

1. The patch by Aly and Rado to implement functions including is_S_integral (trac #9317) has been positively reviewed by Anna and Erin!

2. Jim has finished implementing $S$-class groups, extending earlier work by Robert M.  He is now working on computing $K(S,4)$ and $K(S,4)_2$.  (We wrongly thought that RLM's code already computed $K(S,4)$).

3. Xiao Xiao is working on the algorithm which, given a single $j$ and set $S$, computes the set of elliptic curves with that $j$-invariant and good reduction outside $S$ (if any).

==== Subproject 3 ====

Robert Miller made some progress in setting this up to run, and is about to start running it.  (But he is also release manager for Sage 4.5!)


==== Subproject 4 ====

Rado and Jeremy found a paper by Petho giving an algorithm for listing number field elements by height and implemented it.  It does not seem very efficient (the vast majority of the elements it lists have height greater than the bound!)  So they are continuing to implement the other strategy we started on earlier in the week.  They have already implemented an iterator over ideals of bounded norm.  The next stage involves units.  We found that the fundamental units (as computed by pari) are LLL-reduced, which will help.  
