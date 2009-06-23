#format wiki
#language en

<<Navigation(children,2)>>
<<TableOfContents>>

= Low Hanging Fruit =

 * Engineering - Sage has traditionally focused on mathematics and has many unique features.  However, already included is a massive amount of functionality perfect for engineering (SciPy, NumPy, R, BLAS etc.).  
 * Distributed / Service Architecture - For the most part, Sage is a single process application.  Some progress has been made with multicore type parallelism using PyProcessing but isn't currently very general or thoroughly supported

= Engineering =

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
 * Parallel computing - This is gonna take some splaining... a number of decisions will need to be made on the (approximately) 8.2 gazillion issues at the heart of distributed / parallel computing.  The good news is a majority of folks can be served very well with a few paradigms such as scatter-gather and map-reduce.  More below
 * Language neutral integration - the author is not clear whether this is critical just yet.  I'll present a few thoughts but will shelve any substantial discussion for the time being (war wounds beginning to act up)

Service Architecture is pretty straightforward nowadays.  Typically, some form of XML (ReST) service is defined and XML is pumped around (SOAP is silly and evil and no time will be spent discussing it here... those interested can find great architecture flamewars in various places).  

For Sage, the advantages are:
 * Language support - Native bindings are available for Python, Java and C++
 * Performance - Protocol buffers are substantially higher performance in terms of size and speed when compared with XML

To simplify the discussion, the two main areas for Sage WRT distribution are:
 * Sage specific - Sage on both sides of the wire for general services and parallel computing
 * Integration with other systems - an example here is Java based systems or other legacy systems where coarse grained integration is preferred over linking with Sage in the same process

== Distributed Sage ==

Distribution using Python is amazingly easy as the interpreter can be exploited to trivialize what is often nasty in strongly typed compiled languages.  The simple case is shipping a string of python code to be "eval()ed" on the other side.  When data needs to be shipped it can be pickled... Most Sage objects support dumps() and loads().  Sending arguments to functions / methods is a matter of constructing lists and dictionaries... Much of the plumbing can be hidden very easily using decorators (I have examples of this approach) and also permits exceptions to be thrown "over the wire"

The only tricky bit is that distributed systems "tend" to work better when they're asynchronous.  Its simply not effective to block waiting for a result over the wire, particularly when working on scatter-gather parallelism or when integrating with live data sets (the types of things engineers would also be interested in).  Often, threads are introduced to get around this blocking, making the code more complex than it need be and introducing all the wonderful bugs which tend to crop up.  Threads are great when they're needed... they're hell but great... when they're not needed, they're just hell.

Asynchronous programming is straightforward but requires a bit of rethinking.  Twisted Python is the penultimate asynchronous inversion thought process but is truly great stuff and, again, for Sage much of the Twisted nastiness could be hidden beneath a library for those not wanting to delve too deeply into Twisted.

The one area which would need some work, therefore, is the Sage Notebook itself.  While the core notebook server uses Twisted to manage connections (and is asynchronous), the notebook process itself is Pexpect based and blocks...  I'm fairly sure that inverting the notebook process to be asynchronous would be straightforward but would require some evaluation.

=== Language Neutral (advanced topic) ===

Google Protocol Buffers - http://code.google.com/p/protobuf/ (protobuf) was open sourced by Google some time ago.  Protobuf was Google's core mechanism for transport and storage of serialized data.  The reasons for this and why there are some advantages over XML are available on their site.

AMQO - Advanced Message Queuing Protocol - http://jira.amqp.org/confluence/display/AMQP/Advanced+Message+Queuing+Protocol is gathering some steam
