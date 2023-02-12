

## Daily progress reports on Project 2


#### Subproject 1

Monday 21 June: Noam Elkies solved the 929 problem!  The curve  $[w, 1 - w, 1 + 20*w, -1738 - 82*w, -11808 - 201*w]$ where $w=(1+\sqrt{929})/2$ has everywhere good reduction. 


#### Subproject 2

Thursday 24 June:     

1. The patch by Aly and Rado to implement functions including is_S_integral (trac #9317) has been positively reviewed by Anna and Erin! 

2. Jim has finished implementing $S$-class groups, extending earlier work by Robert M.  He is now working on computing $K(S,4)$ and $K(S,4)_2$.  (We wrongly thought that RLM's code already computed $K(S,4)$). 

3. Xiao Xiao is working on the algorithm which, given a single $j$ and set $S$, computes the set of elliptic curves with that $j$-invariant and good reduction outside $S$ (if any). 

Saturday 26 June: 

Jim and John worked on S-class group code, realising that as it is a quotient of the class group and Sage cannot deal with quotients groups properly, something more basic will have to do temporarily. 

Sunday 27 June: 

Jim has finished implementing $K(S,2)_4$ and is testing.: 

Thursday 1 July: 

Jim implemented some code (using that written by Jackie and Rado ) that implements finding curves over number fields with everywhere good reduction (modulo using the correct version of Jackie and Rado's code and the wrapper of Simon two descent being worked out). 


#### Subproject 3

Several people have been studying the papers showing how to find all integral points, and $S$-integral points. 
