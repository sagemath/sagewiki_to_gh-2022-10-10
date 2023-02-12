
<a href="/TableOfContents">TableOfContents</a> 


## Introduction

The SAGE [<a href="http://wiki.sagemath.org/graph">http://wiki.sagemath.org/graph</a> Graph Theory Project] aims to implement Graph objects and algorithms in ["SAGE"]. The main people working on this project are Emily Kirkman and Robert Miller. 

The programs we are currently benchmarking are GRAPE, Magma, NetworkX, Mathematica (the optional Combinatorica package), and Maple. We will post our results here.  As always, we love [<a href="mailto:rlmill@math.washington.edu">mailto:rlmill@math.washington.edu</a> feedback!] 


## Oct 19 Benchmarks


### Algorithms

* A database of 15 random* graphs on 100 vertices were used to time the following functions. 
* *- The distribution was G(n,p), with p the probability each edge is independently included and n the number of vertices. Our p was 0.45. 
* Connectivity Check 
* Component List 
* Diameter 
* Girth 
* Planarity 

### Results

* Testing "Connectivity" on 100 verts 
   1. Grape 
      * Constructing Grape graphs...DONE. 
      * Timing Grape's Connectivity function ( 100 verts ) : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 0...DONE. Wall: 0.0065, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 1...DONE. Wall: 0.0445, CPU: 0.0 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 2...DONE. Wall: 0.006, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 3...DONE. Wall: 0.0113, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 4...DONE. Wall: 0.0065, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 5...DONE. Wall: 0.0061, CPU: 0.0 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 6...DONE. Wall: 0.0105, CPU: 0.0 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 7...DONE. Wall: 0.0395, CPU: 0.0 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 8...DONE. Wall: 0.0101, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 9...DONE. Wall: 0.0063, CPU: 0.0 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 10...DONE. Wall: 0.006, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 11...DONE. Wall: 0.0102, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 12...DONE. Wall: 0.0061, CPU: 0.0 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 13...DONE. Wall: 0.044, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:12 +0000 
         * Timing graph number 14...DONE. Wall: 0.0064, CPU: 0.0 : Thu, 19 Oct 2006 14:36:12 +0000 
      * Results: average wall time- 0.0147 : average cpu time- 0.002 
   1. Sparse Magma 
      * Constructing Sparse Magma graphs...DONE. 
      * Timing Sparse Magma's Connectivity function ( 100 verts ) : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 0...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 1...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 2...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 3...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 4...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 5...DONE. Wall: 0.0006, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 6...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 7...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 8...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 9...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 10...DONE. Wall: 0.0006, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 11...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 12...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 13...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
         * Timing graph number 14...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:14 +0000 
      * Results: average wall time- 0.0006 : average cpu time- 0.0004 
   1. Dense Magma 
      * Constructing Dense Magma graphs...DONE. 
      * Timing Dense Magma's Connectivity function ( 100 verts ) : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 0...DONE. Wall: 0.0007, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 1...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 2...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 3...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 4...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 5...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 6...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 7...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 8...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 9...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 10...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 11...DONE. Wall: 0.0006, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 12...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 13...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 14...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
      * Results: average wall time- 0.0006 : average cpu time- 0.0007 
   1. NetworkX 
      * Constructing NetworkX graphs...DONE. 
      * Timing NetworkX's Connectivity function ( 100 verts ) : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 0...DONE. Wall: 0.0046, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 1...DONE. Wall: 0.0022, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 2...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 3...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 4...DONE. Wall: 0.0023, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 5...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 6...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 7...DONE. Wall: 0.0023, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 8...DONE. Wall: 0.0022, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 9...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 10...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 11...DONE. Wall: 0.0022, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 12...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 13...DONE. Wall: 0.0023, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:15 +0000 
         * Timing graph number 14...DONE. Wall: 0.0022, CPU: 0.0 : Thu, 19 Oct 2006 14:36:15 +0000 
      * Results: average wall time- 0.0024 : average cpu time- 0.0024 
   1. Combinatorica 
      * Constructing Combinatorica graphs...DONE. 
      * Timing Combinatorica's Connectivity function ( 100 verts ) : Thu, 19 Oct 2006 14:36:17 +0000 
         * Timing graph number 0...DONE. Wall: 0.0485, CPU: 0.0 : Thu, 19 Oct 2006 14:36:17 +0000 
         * Timing graph number 1...DONE. Wall: 0.0788, CPU: 0.0 : Thu, 19 Oct 2006 14:36:18 +0000 
         * Timing graph number 2...DONE. Wall: 0.1148, CPU: 0.0 : Thu, 19 Oct 2006 14:36:18 +0000 
         * Timing graph number 3...DONE. Wall: 0.0836, CPU: 0.0 : Thu, 19 Oct 2006 14:36:18 +0000 
         * Timing graph number 4...DONE. Wall: 0.1153, CPU: 0.0 : Thu, 19 Oct 2006 14:36:19 +0000 
         * Timing graph number 5...DONE. Wall: 0.0819, CPU: 0.0 : Thu, 19 Oct 2006 14:36:19 +0000 
         * Timing graph number 6...DONE. Wall: 0.082, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:19 +0000 
         * Timing graph number 7...DONE. Wall: 0.1169, CPU: 0.0 : Thu, 19 Oct 2006 14:36:19 +0000 
         * Timing graph number 8...DONE. Wall: 0.0807, CPU: 0.0 : Thu, 19 Oct 2006 14:36:20 +0000 
         * Timing graph number 9...DONE. Wall: 0.1157, CPU: 0.0 : Thu, 19 Oct 2006 14:36:20 +0000 
         * Timing graph number 10...DONE. Wall: 0.0819, CPU: 0.0 : Thu, 19 Oct 2006 14:36:20 +0000 
         * Timing graph number 11...DONE. Wall: 0.1149, CPU: 0.0 : Thu, 19 Oct 2006 14:36:21 +0000 
         * Timing graph number 12...DONE. Wall: 0.0823, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:21 +0000 
         * Timing graph number 13...DONE. Wall: 0.1152, CPU: 0.0 : Thu, 19 Oct 2006 14:36:21 +0000 
         * Timing graph number 14...DONE. Wall: 0.0818, CPU: 0.0 : Thu, 19 Oct 2006 14:36:21 +0000 
      * Results: average wall time- 0.0929 : average cpu time- 0.0004 
* Testing "Component List" on 100 verts 
   1. Grape 
      * Constructing Grape graphs...DONE. 
      * Timing Grape's Component List function ( 100 verts ) : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 0...DONE. Wall: 0.0116, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 1...DONE. Wall: 0.0066, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 2...DONE. Wall: 0.007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 3...DONE. Wall: 0.0076, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 4...DONE. Wall: 0.0063, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 5...DONE. Wall: 0.0067, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 6...DONE. Wall: 0.0074, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 7...DONE. Wall: 0.0062, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 8...DONE. Wall: 0.0065, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 9...DONE. Wall: 0.0065, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 10...DONE. Wall: 0.0068, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 11...DONE. Wall: 0.0068, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 12...DONE. Wall: 0.0074, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 13...DONE. Wall: 0.0071, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:22 +0000 
         * Timing graph number 14...DONE. Wall: 0.0071, CPU: 0.0 : Thu, 19 Oct 2006 14:36:22 +0000 
      * Results: average wall time- 0.0072 : average cpu time- 0.0009 
   1. Sparse Magma 
      * Constructing Sparse Magma graphs...DONE. 
      * Timing Sparse Magma's Component List function ( 100 verts ) : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 0...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 1...DONE. Wall: 0.0007, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 2...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 3...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 4...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 5...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 6...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 7...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 8...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 9...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 10...DONE. Wall: 0.0007, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 11...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 12...DONE. Wall: 0.0007, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 13...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 14...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
      * Results: average wall time- 0.0007 : average cpu time- 0.0007 
   1. Dense Magma 
      * Constructing Dense Magma graphs...DONE. 
      * Timing Dense Magma's Component List function ( 100 verts ) : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 0...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 1...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 2...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 3...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 4...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 5...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 6...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 7...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 8...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 9...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 10...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 11...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 12...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 13...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 14...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
      * Results: average wall time- 0.0007 : average cpu time- 0.0 
   1. NetworkX 
      * Constructing NetworkX graphs...DONE. 
      * Timing NetworkX's Component List function ( 100 verts ) : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 0...DONE. Wall: 0.0017, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 1...DONE. Wall: 0.0015, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 2...DONE. Wall: 0.0014, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 3...DONE. Wall: 0.0014, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 4...DONE. Wall: 0.0014, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 5...DONE. Wall: 0.0014, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 6...DONE. Wall: 0.0014, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 7...DONE. Wall: 0.0014, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 8...DONE. Wall: 0.0014, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 9...DONE. Wall: 0.0014, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 10...DONE. Wall: 0.0014, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 11...DONE. Wall: 0.0014, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 12...DONE. Wall: 0.0014, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 13...DONE. Wall: 0.0015, CPU: 0.0 : Thu, 19 Oct 2006 14:36:23 +0000 
         * Timing graph number 14...DONE. Wall: 0.0014, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:23 +0000 
      * Results: average wall time- 0.0014 : average cpu time- 0.0016 
   1. Combinatorica 
      * Constructing Combinatorica graphs...DONE. 
      * Timing Combinatorica's Component List function ( 100 verts ) : Thu, 19 Oct 2006 14:36:24 +0000 
         * Timing graph number 0...DONE. Wall: 0.0486, CPU: 0.0 : Thu, 19 Oct 2006 14:36:24 +0000 
         * Timing graph number 1...DONE. Wall: 0.0489, CPU: 0.0 : Thu, 19 Oct 2006 14:36:25 +0000 
         * Timing graph number 2...DONE. Wall: 0.0482, CPU: 0.0 : Thu, 19 Oct 2006 14:36:25 +0000 
         * Timing graph number 3...DONE. Wall: 0.0491, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:25 +0000 
         * Timing graph number 4...DONE. Wall: 0.0815, CPU: 0.0 : Thu, 19 Oct 2006 14:36:25 +0000 
         * Timing graph number 5...DONE. Wall: 0.1162, CPU: 0.0 : Thu, 19 Oct 2006 14:36:25 +0000 
         * Timing graph number 6...DONE. Wall: 0.0816, CPU: 0.0 : Thu, 19 Oct 2006 14:36:26 +0000 
         * Timing graph number 7...DONE. Wall: 0.0823, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:26 +0000 
         * Timing graph number 8...DONE. Wall: 0.115, CPU: 0.0 : Thu, 19 Oct 2006 14:36:26 +0000 
         * Timing graph number 9...DONE. Wall: 0.0825, CPU: 0.0 : Thu, 19 Oct 2006 14:36:26 +0000 
         * Timing graph number 10...DONE. Wall: 0.1163, CPU: 0.0 : Thu, 19 Oct 2006 14:36:27 +0000 
         * Timing graph number 11...DONE. Wall: 0.0818, CPU: 0.0 : Thu, 19 Oct 2006 14:36:27 +0000 
         * Timing graph number 12...DONE. Wall: 0.1152, CPU: 0.0 : Thu, 19 Oct 2006 14:36:27 +0000 
         * Timing graph number 13...DONE. Wall: 0.0818, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:28 +0000 
         * Timing graph number 14...DONE. Wall: 0.1142, CPU: 0.0 : Thu, 19 Oct 2006 14:36:28 +0000 
      * Results: average wall time- 0.0842 : average cpu time- 0.0007 
   1. Maple 
      * Constructing Maple graphs...DONE. 
      * Timing Maple's Component List function ( 100 verts ) : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 0...DONE. Wall: 0.0093, CPU: 0.0 : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 1...DONE. Wall: 0.0424, CPU: 0.0 : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 2...DONE. Wall: 0.0577, CPU: 0.0 : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 3...DONE. Wall: 0.043, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 4...DONE. Wall: 0.0094, CPU: 0.0 : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 5...DONE. Wall: 0.0423, CPU: 0.0 : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 6...DONE. Wall: 0.0089, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:41 +0000 
         * Timing graph number 7...DONE. Wall: 0.0427, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:42 +0000 
         * Timing graph number 8...DONE. Wall: 0.0092, CPU: 0.0 : Thu, 19 Oct 2006 14:36:42 +0000 
         * Timing graph number 9...DONE. Wall: 0.0507, CPU: 0.0 : Thu, 19 Oct 2006 14:36:42 +0000 
         * Timing graph number 10...DONE. Wall: 0.0429, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:42 +0000 
         * Timing graph number 11...DONE. Wall: 0.0095, CPU: 0.0 : Thu, 19 Oct 2006 14:36:42 +0000 
         * Timing graph number 12...DONE. Wall: 0.0432, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:42 +0000 
         * Timing graph number 13...DONE. Wall: 0.0091, CPU: 0.0 : Thu, 19 Oct 2006 14:36:42 +0000 
         * Timing graph number 14...DONE. Wall: 0.0425, CPU: 0.0 : Thu, 19 Oct 2006 14:36:42 +0000 
      * Results: average wall time- 0.0309 : average cpu time- 0.0011 
* Testing "Diameter" on 100 verts 
   1. Grape 
      * Constructing Grape graphs...DONE. 
      * Timing Grape's Diameter function ( 100 verts ) : Thu, 19 Oct 2006 14:36:43 +0000 
         * Timing graph number 0...DONE. Wall: 0.1573, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:44 +0000 
         * Timing graph number 1...DONE. Wall: 0.156, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:44 +0000 
         * Timing graph number 2...DONE. Wall: 0.1518, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:45 +0000 
         * Timing graph number 3...DONE. Wall: 0.1568, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:45 +0000 
         * Timing graph number 4...DONE. Wall: 0.1536, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:46 +0000 
         * Timing graph number 5...DONE. Wall: 0.16, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:46 +0000 
         * Timing graph number 6...DONE. Wall: 0.1553, CPU: 0.01 : Thu, 19 Oct 2006 14:36:46 +0000 
         * Timing graph number 7...DONE. Wall: 0.1611, CPU: 0.0067 : Thu, 19 Oct 2006 14:36:47 +0000 
         * Timing graph number 8...DONE. Wall: 0.1563, CPU: 0.01 : Thu, 19 Oct 2006 14:36:47 +0000 
         * Timing graph number 9...DONE. Wall: 0.1579, CPU: 0.01 : Thu, 19 Oct 2006 14:36:48 +0000 
         * Timing graph number 10...DONE. Wall: 0.1593, CPU: 0.01 : Thu, 19 Oct 2006 14:36:48 +0000 
         * Timing graph number 11...DONE. Wall: 0.1586, CPU: 0.01 : Thu, 19 Oct 2006 14:36:49 +0000 
         * Timing graph number 12...DONE. Wall: 0.1584, CPU: 0.01 : Thu, 19 Oct 2006 14:36:49 +0000 
         * Timing graph number 13...DONE. Wall: 0.1559, CPU: 0.01 : Thu, 19 Oct 2006 14:36:50 +0000 
         * Timing graph number 14...DONE. Wall: 0.1568, CPU: 0.0133 : Thu, 19 Oct 2006 14:36:50 +0000 
      * Results: average wall time- 0.157 : average cpu time- 0.0084 
   1. Sparse Magma 
      * Constructing Sparse Magma graphs...DONE. 
      * Timing Sparse Magma's Diameter function ( 100 verts ) : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 0...DONE. Wall: 0.0012, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 1...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 2...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 3...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 4...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 5...DONE. Wall: 0.0009, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 6...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 7...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 8...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 9...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 10...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 11...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 12...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 13...DONE. Wall: 0.001, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 14...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
      * Results: average wall time- 0.0009 : average cpu time- 0.0004 
   1. Dense Magma 
      * Constructing Dense Magma graphs...DONE. 
      * Timing Dense Magma's Diameter function ( 100 verts ) : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 0...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 1...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 2...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 3...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 4...DONE. Wall: 0.0008, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 5...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 6...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 7...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 8...DONE. Wall: 0.0008, CPU: 0.0033 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 9...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 10...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 11...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 12...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 13...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 14...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:36:51 +0000 
      * Results: average wall time- 0.0008 : average cpu time- 0.0004 
   1. NetworkX 
      * Constructing NetworkX graphs...DONE. 
      * Timing NetworkX's Diameter function ( 100 verts ) : Thu, 19 Oct 2006 14:36:51 +0000 
         * Timing graph number 0...DONE. Wall: 0.1261, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:52 +0000 
         * Timing graph number 1...DONE. Wall: 0.1272, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:52 +0000 
         * Timing graph number 2...DONE. Wall: 0.1256, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:52 +0000 
         * Timing graph number 3...DONE. Wall: 0.1265, CPU: 0.1233 : Thu, 19 Oct 2006 14:36:53 +0000 
         * Timing graph number 4...DONE. Wall: 0.1266, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:53 +0000 
         * Timing graph number 5...DONE. Wall: 0.1275, CPU: 0.13 : Thu, 19 Oct 2006 14:36:53 +0000 
         * Timing graph number 6...DONE. Wall: 0.1265, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:54 +0000 
         * Timing graph number 7...DONE. Wall: 0.127, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:54 +0000 
         * Timing graph number 8...DONE. Wall: 0.1253, CPU: 0.1233 : Thu, 19 Oct 2006 14:36:55 +0000 
         * Timing graph number 9...DONE. Wall: 0.1271, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:55 +0000 
         * Timing graph number 10...DONE. Wall: 0.1268, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:55 +0000 
         * Timing graph number 11...DONE. Wall: 0.1262, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:56 +0000 
         * Timing graph number 12...DONE. Wall: 0.1254, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:56 +0000 
         * Timing graph number 13...DONE. Wall: 0.1258, CPU: 0.1233 : Thu, 19 Oct 2006 14:36:56 +0000 
         * Timing graph number 14...DONE. Wall: 0.1247, CPU: 0.1267 : Thu, 19 Oct 2006 14:36:57 +0000 
      * Results: average wall time- 0.1263 : average cpu time- 0.1262 
   1. Combinatorica 
      * Constructing Combinatorica graphs...DONE. 
      * Timing Combinatorica's Diameter function ( 100 verts ) : Thu, 19 Oct 2006 14:36:58 +0000 
         * Timing graph number 0...DONE. Wall: 5.1816, CPU: 0.0 : Thu, 19 Oct 2006 14:37:13 +0000 
         * Timing graph number 1...DONE. Wall: 5.2109, CPU: 0.0 : Thu, 19 Oct 2006 14:37:29 +0000 
         * Timing graph number 2...DONE. Wall: 5.1302, CPU: 0.0033 : Thu, 19 Oct 2006 14:37:44 +0000 
         * Timing graph number 3...DONE. Wall: 5.1968, CPU: 0.0033 : Thu, 19 Oct 2006 14:38:00 +0000 
         * Timing graph number 4...DONE. Wall: 5.2016, CPU: 0.0 : Thu, 19 Oct 2006 14:38:16 +0000 
         * Timing graph number 5...DONE. Wall: 5.5481, CPU: 0.0 : Thu, 19 Oct 2006 14:38:32 +0000 
         * Timing graph number 6...DONE. Wall: 5.2037, CPU: 0.0 : Thu, 19 Oct 2006 14:38:48 +0000 
         * Timing graph number 7...DONE. Wall: 5.2333, CPU: 0.0 : Thu, 19 Oct 2006 14:39:04 +0000 
         * Timing graph number 8...DONE. Wall: 5.0587, CPU: 0.0033 : Thu, 19 Oct 2006 14:39:19 +0000 
         * Timing graph number 9...DONE. Wall: 5.2813, CPU: 0.0 : Thu, 19 Oct 2006 14:39:35 +0000 
         * Timing graph number 10...DONE. Wall: 5.2476, CPU: 0.0 : Thu, 19 Oct 2006 14:39:50 +0000 
         * Timing graph number 11...DONE. Wall: 5.192, CPU: 0.0 : Thu, 19 Oct 2006 14:40:06 +0000 
         * Timing graph number 12...DONE. Wall: 5.1713, CPU: 0.0 : Thu, 19 Oct 2006 14:40:21 +0000 
         * Timing graph number 13...DONE. Wall: 5.1719, CPU: 0.0 : Thu, 19 Oct 2006 14:40:37 +0000 
         * Timing graph number 14...DONE. Wall: 5.1415, CPU: 0.0033 : Thu, 19 Oct 2006 14:40:52 +0000 
      * Results: average wall time- 5.2114 : average cpu time- 0.0009 
   1. Maple 
      * Constructing Maple graphs...DONE. 
      * Timing Maple's Diameter function ( 100 verts ) : Thu, 19 Oct 2006 14:41:06 +0000 
         * Timing graph number 0...DONE. Wall: 22.7694, CPU: 0.0 : Thu, 19 Oct 2006 14:42:14 +0000 
         * Timing graph number 1...DONE. Wall: 22.451, CPU: 0.0 : Thu, 19 Oct 2006 14:43:21 +0000 
         * Timing graph number 2...DONE. Wall: 22.3481, CPU: 0.0 : Thu, 19 Oct 2006 14:44:28 +0000 
         * Timing graph number 3...DONE. Wall: 22.7295, CPU: 0.0033 : Thu, 19 Oct 2006 14:45:37 +0000 
         * Timing graph number 4...DONE. Wall: 19.3066, CPU: 0.0 : Thu, 19 Oct 2006 14:46:35 +0000 
         * Timing graph number 5...DONE. Wall: 19.3794, CPU: 0.0 : Thu, 19 Oct 2006 14:47:33 +0000 
         * Timing graph number 6...DONE. Wall: 21.9165, CPU: 0.0033 : Thu, 19 Oct 2006 14:48:38 +0000 
         * Timing graph number 7...DONE. Wall: 19.9926, CPU: 0.0 : Thu, 19 Oct 2006 14:49:38 +0000 
         * Timing graph number 8...DONE. Wall: 18.1134, CPU: 0.0033 : Thu, 19 Oct 2006 14:50:33 +0000 
         * Timing graph number 9...DONE. Wall: 20.1315, CPU: 0.0 : Thu, 19 Oct 2006 14:51:33 +0000 
         * Timing graph number 10...DONE. Wall: 14.662, CPU: 0.0 : Thu, 19 Oct 2006 14:52:17 +0000 
         * Timing graph number 11...DONE. Wall: 11.2313, CPU: 0.0067 : Thu, 19 Oct 2006 14:52:51 +0000 
         * Timing graph number 12...DONE. Wall: 16.8578, CPU: 0.0 : Thu, 19 Oct 2006 14:53:41 +0000 
         * Timing graph number 13...DONE. Wall: 19.9063, CPU: 0.0 : Thu, 19 Oct 2006 14:54:41 +0000 
         * Timing graph number 14...DONE. Wall: 21.0883, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:44 +0000 
      * Results: average wall time- 19.5256 : average cpu time- 0.0013 
* Testing "Girth" on 100 verts 
   1. Grape 
      * Constructing Grape graphs...DONE. 
      * Timing Grape's Girth function ( 100 verts ) : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 0...DONE. Wall: 0.0031, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 1...DONE. Wall: 0.0056, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 2...DONE. Wall: 0.003, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 3...DONE. Wall: 0.003, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 4...DONE. Wall: 0.0058, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 5...DONE. Wall: 0.0031, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 6...DONE. Wall: 0.0061, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 7...DONE. Wall: 0.0032, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 8...DONE. Wall: 0.0058, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 9...DONE. Wall: 0.0031, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 10...DONE. Wall: 0.0032, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 11...DONE. Wall: 0.0063, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 12...DONE. Wall: 0.0032, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 13...DONE. Wall: 0.0063, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
         * Timing graph number 14...DONE. Wall: 0.0032, CPU: 0.0 : Thu, 19 Oct 2006 14:55:45 +0000 
      * Results: average wall time- 0.0043 : average cpu time- 0.0004 
   1. Sparse Magma 
      * Constructing Sparse Magma graphs...DONE. 
      * Timing Sparse Magma's Girth function ( 100 verts ) : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 0...DONE. Wall: 0.0009, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 1...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 2...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 3...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 4...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 5...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 6...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 7...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 8...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 9...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 10...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 11...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 12...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 13...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 14...DONE. Wall: 0.0008, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:46 +0000 
      * Results: average wall time- 0.0007 : average cpu time- 0.0002 
   1. Dense Magma 
      * Constructing Dense Magma graphs...DONE. 
      * Timing Dense Magma's Girth function ( 100 verts ) : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 0...DONE. Wall: 0.0008, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 1...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 2...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 3...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 4...DONE. Wall: 0.0007, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 5...DONE. Wall: 0.0007, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 6...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 7...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 8...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 9...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 10...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 11...DONE. Wall: 0.0006, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 12...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 13...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
         * Timing graph number 14...DONE. Wall: 0.0007, CPU: 0.0 : Thu, 19 Oct 2006 14:55:46 +0000 
      * Results: average wall time- 0.0007 : average cpu time- 0.0004 
   1. Combinatorica 
      * Constructing Combinatorica graphs...DONE. 
      * Timing Combinatorica's Girth function ( 100 verts ) : Thu, 19 Oct 2006 14:55:47 +0000 
         * Timing graph number 0...DONE. Wall: 0.226, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:48 +0000 
         * Timing graph number 1...DONE. Wall: 0.2071, CPU: 0.0 : Thu, 19 Oct 2006 14:55:48 +0000 
         * Timing graph number 2...DONE. Wall: 0.2025, CPU: 0.0 : Thu, 19 Oct 2006 14:55:49 +0000 
         * Timing graph number 3...DONE. Wall: 0.2037, CPU: 0.0 : Thu, 19 Oct 2006 14:55:49 +0000 
         * Timing graph number 4...DONE. Wall: 0.2021, CPU: 0.0 : Thu, 19 Oct 2006 14:55:50 +0000 
         * Timing graph number 5...DONE. Wall: 0.2056, CPU: 0.0067 : Thu, 19 Oct 2006 14:55:51 +0000 
         * Timing graph number 6...DONE. Wall: 0.1991, CPU: 0.0 : Thu, 19 Oct 2006 14:55:51 +0000 
         * Timing graph number 7...DONE. Wall: 0.204, CPU: 0.0 : Thu, 19 Oct 2006 14:55:52 +0000 
         * Timing graph number 8...DONE. Wall: 0.1976, CPU: 0.0 : Thu, 19 Oct 2006 14:55:52 +0000 
         * Timing graph number 9...DONE. Wall: 0.2053, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:53 +0000 
         * Timing graph number 10...DONE. Wall: 0.2052, CPU: 0.0 : Thu, 19 Oct 2006 14:55:54 +0000 
         * Timing graph number 11...DONE. Wall: 0.2074, CPU: 0.0 : Thu, 19 Oct 2006 14:55:54 +0000 
         * Timing graph number 12...DONE. Wall: 0.2045, CPU: 0.0 : Thu, 19 Oct 2006 14:55:55 +0000 
         * Timing graph number 13...DONE. Wall: 0.2073, CPU: 0.0 : Thu, 19 Oct 2006 14:55:56 +0000 
         * Timing graph number 14...DONE. Wall: 0.1947, CPU: 0.0033 : Thu, 19 Oct 2006 14:55:56 +0000 
      * Results: average wall time- 0.2048 : average cpu time- 0.0011 
   1. Maple 
      * Constructing Maple graphs...DONE. 
      * Timing Maple's Girth function ( 100 verts ) : Thu, 19 Oct 2006 14:56:09 +0000 
         * Timing graph number 0...DONE. Wall: 0.3105, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:10 +0000 
         * Timing graph number 1...DONE. Wall: 0.2526, CPU: 0.0 : Thu, 19 Oct 2006 14:56:11 +0000 
         * Timing graph number 2...DONE. Wall: 0.2719, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:11 +0000 
         * Timing graph number 3...DONE. Wall: 0.3053, CPU: 0.0 : Thu, 19 Oct 2006 14:56:12 +0000 
         * Timing graph number 4...DONE. Wall: 0.3111, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:13 +0000 
         * Timing graph number 5...DONE. Wall: 0.3105, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:14 +0000 
         * Timing graph number 6...DONE. Wall: 0.3097, CPU: 0.0 : Thu, 19 Oct 2006 14:56:15 +0000 
         * Timing graph number 7...DONE. Wall: 0.3118, CPU: 0.0 : Thu, 19 Oct 2006 14:56:16 +0000 
         * Timing graph number 8...DONE. Wall: 0.3108, CPU: 0.0 : Thu, 19 Oct 2006 14:56:17 +0000 
         * Timing graph number 9...DONE. Wall: 0.3115, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:18 +0000 
         * Timing graph number 10...DONE. Wall: 0.3071, CPU: 0.0 : Thu, 19 Oct 2006 14:56:19 +0000 
         * Timing graph number 11...DONE. Wall: 0.3131, CPU: 0.0 : Thu, 19 Oct 2006 14:56:20 +0000 
         * Timing graph number 12...DONE. Wall: 0.3119, CPU: 0.0 : Thu, 19 Oct 2006 14:56:21 +0000 
         * Timing graph number 13...DONE. Wall: 0.3091, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:22 +0000 
         * Timing graph number 14...DONE. Wall: 0.3104, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
      * Results: average wall time- 0.3038 : average cpu time- 0.0013 
* Testing "Planarity" on 100 verts 
   1. Sparse Magma 
      * Constructing Sparse Magma graphs...DONE. 
      * Timing Sparse Magma's Planarity function ( 100 verts ) : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 0...DONE. Wall: 0.003, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 1...DONE. Wall: 0.0027, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 2...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 3...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 4...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 5...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 6...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 7...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 8...DONE. Wall: 0.0027, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 9...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 10...DONE. Wall: 0.0028, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 11...DONE. Wall: 0.0027, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 12...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 13...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 14...DONE. Wall: 0.0027, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
      * Results: average wall time- 0.0028 : average cpu time- 0.0004 
   1. Dense Magma 
      * Constructing Dense Magma graphs...DONE. 
      * Timing Dense Magma's Planarity function ( 100 verts ) : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 0...DONE. Wall: 0.003, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 1...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 2...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 3...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 4...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:23 +0000 
         * Timing graph number 5...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 6...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 7...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 8...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 9...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 10...DONE. Wall: 0.0029, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 11...DONE. Wall: 0.0028, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 12...DONE. Wall: 0.0031, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 13...DONE. Wall: 0.0029, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
         * Timing graph number 14...DONE. Wall: 0.003, CPU: 0.0 : Thu, 19 Oct 2006 14:56:24 +0000 
      * Results: average wall time- 0.0029 : average cpu time- 0.0004 
   1. Combinatorica 
      * Constructing Combinatorica graphs...DONE. 
      * Timing Combinatorica's Planarity function ( 100 verts ) : Thu, 19 Oct 2006 14:56:25 +0000 
         * Timing graph number 0...DONE. Wall: 0.3201, CPU: 0.0 : Thu, 19 Oct 2006 14:56:26 +0000 
         * Timing graph number 1...DONE. Wall: 0.5235, CPU: 0.0 : Thu, 19 Oct 2006 14:56:27 +0000 
         * Timing graph number 2...DONE. Wall: 0.4845, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:29 +0000 
         * Timing graph number 3...DONE. Wall: 0.5233, CPU: 0.0 : Thu, 19 Oct 2006 14:56:30 +0000 
         * Timing graph number 4...DONE. Wall: 0.5246, CPU: 0.0 : Thu, 19 Oct 2006 14:56:32 +0000 
         * Timing graph number 5...DONE. Wall: 0.5275, CPU: 0.0067 : Thu, 19 Oct 2006 14:56:33 +0000 
         * Timing graph number 6...DONE. Wall: 0.4925, CPU: 0.0 : Thu, 19 Oct 2006 14:56:35 +0000 
         * Timing graph number 7...DONE. Wall: 0.5299, CPU: 0.0 : Thu, 19 Oct 2006 14:56:36 +0000 
         * Timing graph number 8...DONE. Wall: 0.5221, CPU: 0.0 : Thu, 19 Oct 2006 14:56:38 +0000 
         * Timing graph number 9...DONE. Wall: 0.5298, CPU: 0.0033 : Thu, 19 Oct 2006 14:56:40 +0000 
         * Timing graph number 10...DONE. Wall: 0.5294, CPU: 0.0 : Thu, 19 Oct 2006 14:56:41 +0000 
         * Timing graph number 11...DONE. Wall: 0.4932, CPU: 0.0 : Thu, 19 Oct 2006 14:56:43 +0000 
         * Timing graph number 12...DONE. Wall: 0.5268, CPU: 0.0 : Thu, 19 Oct 2006 14:56:44 +0000 
         * Timing graph number 13...DONE. Wall: 0.5261, CPU: 0.0 : Thu, 19 Oct 2006 14:56:46 +0000 
         * Timing graph number 14...DONE. Wall: 0.5213, CPU: 0.0 : Thu, 19 Oct 2006 14:56:47 +0000 
      * Results: average wall time- 0.505 : average cpu time- 0.0009 