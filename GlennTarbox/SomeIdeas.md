#format wiki
#language en

<<Navigation(children,2)>>
<<TableOfContents>>

= Low Hanging Fruit =

 * Engineering - Sage has traditionally focused on mathematics and has many unique features.  However, already included is a massive amount of functionality perfect for engineering (SciPy, NumPy, R, BLAS etc.).  
 * Distributed / Service Architecture - For the most part, Sage is a single process application.  Some progress has been made with multicore type parallelism using PyProcessing but isn't currently very general or thoroughly supported

== Engineering ==

Engineers (for the most part) have never heard of Magma.  Engineers use Matlab, Mathematica, and Maple.  Matlab rules for many reasons but is a very easy target

 * Its language sucks.  Sage uses Python
 * Difficult to extend
 * Expensive - although this needs to be qualified, most schools have reasonable access due to Mathworks academic pricing

OTOH, Matlab has been around for a while and has a number of packages directed at engineers
 * Controls
 * Optimization
 * Simulation

Mathematica has had some success, has a nicer interface (notebook) but hasn't had a huge effect on the core engineering market.  Early on, it showed promise as a middle ground between Matlab and Maple due to its symbolic capabilities.

I don't know where Maple currently stands, but my guess is that Sage already has way more than the typical engineer really needs.

The appeal to engineers would be
 * Price
 * Open Source
 * Python
 * Cython - speed and integration with C/C++ and other libraries

In the extreme cases, its hard to truly compete with Matlab, but IMHO, that isn't the goal.  Most folks use Matlab for the easy stuff... plotting, matrix manipulation, etc.  Its not even clear that much (if any) additional functionality is needed in Sage, a bunch of examples of common engineering tasks would probably do in the short term.

= Distributed Architecture =

 * Service Architecture - Components available as services with a language / OS / location neutral interface
 * Parallel computing - Components designed as workers

Service Architecture is pretty straightforward nowadays.  Typically, some form of XML (ReST) service is defined and XML is pumped around.  This could be done although I think for the Sage domain, a simpler and more useful approach might be tried first - Protocol Buffers.
