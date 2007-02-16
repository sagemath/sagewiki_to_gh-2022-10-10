[[TableOfContents]]

== Introduction ==
 . We are implementing graph objects and algorithms in ["SAGE"]. The main people working on this project are Emily Kirkman and Robert Miller.

== Current Status ==
 * NetworkX base classes have been interfaced, and all functions are soon to follow (SAGE Days 3 project).
 * Jason Grout's (Brigham Young) SQL lite graph database is almost finished, and when it is done, it will be interfaced by Emily Kirkman.
 * Jim Morrow (UW) has expressed interest in using SAGE for his [http://www.math.washington.edu/~morrow/reu07/reu.html summer REU] on graphs. Robert is working on implementing electrical networks, which includes implementing edge weights and graphs with boundary.
 * Chris Godsil (Waterloo) has expressed interest in helping design a more general discrete math package in SAGE, including perhaps an open source version of nauty. Robert is working to fulfill his wish list.
 * Graph plotting has been implemented in two dimensions:
attachment:9_cube.png

{{{
# to see this on your own, try
C = graphs.CubeGraph(9)
color = {}
for v in C.vertices():
    b = v.count('1')/9
    g = 1 - b
    if color.has_key((0, g, b)): color[(0, g, b)].append(v)
    else: color[(0, g, b)] = [v]
C.show(vertex_labels=False, node_size=60, graph_border=True, color_dict=color, figsize=[9,8])
}}}

== Talks ==
 * On Oct. 20, 2006, Robert Miller gave a [http://sage.math.washington.edu/home/rlmill/talk_2001-10-20/2006-10-20SAGE.pdf talk] about the state of affairs for existing software which shared a few benchmarks and discussed some implementation ideas.
 * On Feb. 15, 2007, Robert Miller and Emily Kirkman gave an Informal Introduction to the Graph Theory Package. This talk was essentially a review of newly available features.

== Other wiki pages ==
 * Surveys
  . [http://sage.math.washington.edu:9001/graph_survey Existing Software]: We are always seeking additions and comments.
  . [http://sage.math.washington.edu:9001/graph_db_survey Databases]: Includes comments by Jason Grout.

 * [http://sage.math.washington.edu:9001/graph_benchmark Benchmarks]
  . Initial Benchmarks indicated that NetworkX was the appropriate package for inclusion in SAGE. They were designed to compare the constructions and very basic functionality found in our survey of existing software.

 * [http://sage.math.washington.edu:9001/graph_plotting Plotting]
  * 2D plotting is implemented using matplotlib.
  * 3D plotting via Tachyon is coming soon.
  * 3D interactive viewing is on its way, via Java applets (pending some serious implementation issues).

 * [http://sage.math.washington.edu:9001/graph_database Database]
  * So far: Basic graph structures with intuitive graphics
  * Plan:  Extensive educational docstrings and many, many more graph constructors
