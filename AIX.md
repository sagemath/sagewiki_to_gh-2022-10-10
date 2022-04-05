## page was renamed from AIX_port
== Porting Sage to AIX ==
IBM make some very fast computers with clock speeds of at least 5 GHz, so potentially Sage on AIX could be very fast. But there are problems in porting Sage to AIX. 
 * The platform is not popular, so will have few developers and few users. 
 * There is a lack of suitable hardware available. 

However,  there are source of hardware.
 * One of the Sage developers, David Kirkby does have an old 32--bit IBM RS/6000 7025 F50 which runs AIX 5.3
 * There has been some interest from IBM in possibly giving access to an IBM server. 
 * http://www.metamodul.com/10.html have provided access to a 64-bit machine running AIX 6.0, but the software is not optimally configured for that machine. 

However, David Kirkby has tried, and has hit some problems. At the time of writing (September 2010), none of them look particulary difficult to solve, though some will probably be quite hard. A trac ticket showing the parts of Sage which build, and those that do not, can be found at

http://trac.sagemath.org/sage_trac/ticket/9999  
