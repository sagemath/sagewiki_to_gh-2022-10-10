

### Daily progress on Project 1

The database has so far reached: $N=130057$ 


#### Thursday 24th June

John and Jeremy and Noam discussed ways of speeding up the (sparse, mod $p$) linear algebra stage of the rational newform-finding part of the modular elliptic curve computation, which is currently the main bottleneck (in time and memory). 

1. Jeremy will try to replace the basic modular arithmetic steps with inline assembly calls. 

2. Noam suggested using Wiedemann's method for finding eigenvalues and eigenspaces.  This looks very promising and John will do some experiments. 


#### Friday 25th June

1. Jamie W asked yesterday for all elliptic curves of conductor N=154687.  The optimal curves are here: <a href="days22/cremona/project1/curves.154587.txt">curves.154587.txt</a> 
