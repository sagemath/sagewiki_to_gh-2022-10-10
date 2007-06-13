= Graph Theory =

[:days4/projects/: Other SAGE Days 4 Project]

Participants:  Emily Kirkman, Robert Miller, Craig Citro and David Roe


 * Expose these in SAGE: centrality, cliques, cluster, cores, search -- These are pretty standard graph theoretic programs, and should not take too long to wrap.


 * NetworkX: The following modules could be useful, and have not yet been wrapped: centrality, cliques, cluster, cores, hybrid, search, spectrum, threshold
  
   * spectrum -- This should probably not be wrapped, but instead mimicked, since sage's linear algebra is undoubtedly faster.
   * hybrid, threshold -- These seem to be specialized programs that are closely related to the research areas of the NetworkX authors. It is unclear what to do with these.

 * NICE: The nauty clone for computing automorphism groups of graphs, and computing isomorphism. It has been converted to Pyrex, but it could still stand much optimization.

 * [http://sage.math.washington.edu/home/rlmill/wshlst.pdf Wishlist] from Chris Godsil: It would be great if we could complete the list this week.

 * Electrical Networks, Jim Morrow's REU: Graphs with boundary are already in sage, but there are probably some useful constructions for Jim's summer REU that are not implemented yet. Especially data structures, perhaps an !ElectricalNetworks class.  Look at the Dirichlet problem and (circular) planar embeddings of graphs.

 * Latex Graphs: At sage days 3, Craig Citro gave Robert Miller a scheme program to plot graphs in postscript format. It would be great to get this working from python.

 * Graph Database: Update interface to sqlite database of all graphs with 8 or fewer vertices.
