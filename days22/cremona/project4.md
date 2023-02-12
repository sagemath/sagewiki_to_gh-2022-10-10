

## Daily progress report on Project 4


### Thursday 24 June

Rado and Jeremy found a paper by Petho giving an algorithm for listing number field elements by height and implemented it.  It does not seem very efficient (the vast majority of the elements it lists have height greater than the bound!)  So they are continuing to implement the other strategy we started on earlier in the week.  They have already implemented an iterator over ideals of bounded norm.  The next stage involves units.   

We found out (by asking Karim Belabas, the lead pari developer) that the fundamental units (as computed by pari) are LLL-reduced, which will help: 

JEC --> pari-users, 24 June 

<blockquote> I was wondering what normalization, if any, is done to the system of fundamental units as computed by bnfinit? 

I think it makes sense to talk of a unit basis being LLL-reduced, in the sense that the lattice which is the image of the units under the logarithmic embedding has many bases and these may (or may not) be LLL-reduced. 

So the question is:  is the unit basis LLL-reduced in this sense?  If not, could it be? </blockquote> 

KB --> JEC, 24 June: 

<blockquote> It is. :-)  [ cf getfu() ] 

Actually, starting from an arbitrary LLL-reduced basis $(u_1,...,u_r)$ in your sense, we then normalize so that each $u \in \{u_1,..., u_r\}$ is replaced by the "nicest" one among $\{ u, -u, 1/u, -1/u \}$, for some silly ad hoc notion of "nice" usually translating to "using fewer characters when fully printed out as a t_POLMOD". 

The result is still LLL-reduced of course. </blockquote> 
