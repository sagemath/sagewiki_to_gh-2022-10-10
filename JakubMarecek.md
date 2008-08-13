##master-page:HomepageTemplate
#format wiki
== Jakub Marecek ==
My personal homepage proper is at http://cs.nott.ac.uk/~jxm. This is just SAGE Days related stuff:

Compiling VTK:

 * Even the latest stable version of VTK (5.0.4) makes some weird assumptions about namespaces. In order to make it compile with GCC 4.3, replace #include <string> with  #include <string.h> and similarly for other C library headers.

Using Java VTK Wrappers:

 * Add vtk.jar to your classpath. Notice the jar file can end up in a fresh /VTK-build/, even though you have specified other build output directory.
 * Add the directory where libvtkRenderingJava.so resides to your path (export to PATH seems to work just as well as -Djava.library.path=~/VTK-build/bin/ at java's command line)
 * Add libmawt.so to you LD_LIBRARY_PATH in your environment (export seems to work, although -DLD_LIBRARY_PATH at java's command line does not)

SVG and PDF Output for JyScript.

 * This should be a quick hack using Apache Batik (http://xmlgraphics.apache.org/batik/). Replace the standard Graphics2D with the Graphics2D from Batik to get PDF. 

TeX and PS and PDF Output for SAGE plot3s

 * This could perhaps be done using Sketch (http://www.frontiernet.net/~eugene.ressler/). It implements the painter's algorithm (z-buffering), and hence it should be just the output of triangles in the right format it takes.
----
 . CategoryHomepage
