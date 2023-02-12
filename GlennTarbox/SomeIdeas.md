
[[!map pages="GlennTarbox/SomeIdeas/* and !GlennTarbox/SomeIdeas/*/*/*"]] [[_TOC_]] 


# Low Hanging Fruit

* Engineering - Sage has traditionally focused on mathematics and has many unique features.  However, already included is a massive amount of functionality perfect for engineering (<a href="/SciPy">SciPy</a>, <a href="/NumPy">NumPy</a>, R, BLAS etc.). 
* Distributed / Service Architecture - For the most part, Sage is a single process application.  Some progress has been made with multicore type parallelism using <a href="/PyProcessing">PyProcessing</a> but isn't currently very general or thoroughly supported 

# Engineering

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

Sage's generality is a true strength but probably confuses the engineering community.  Engineers know about integers, doubles, and Complex Variables (even there, that tends to be the Electrical / Controls folks as much of that work is Linear Systems where everything takes place in the Complex Frequency domain... which really means Laplace Transforms or its degenerate case Fourier Transforms).  Groups, Rings, etc. are completely outside most engineer's lexicon (not all, some fancy stuff takes place, obviously, but you're into fractional percentages at the graduate level... no undergraduate engineer has ever been exposed to a ring) 

Being familiar with the Controls / EE pieces of engineering: 

Matlab packages are mostly about convenience and adherence to the "Forms" engineers are familiar with.  Unless one is talking about nonlinear or stochastic control, what the "controls toolbox" provides are straightforward ways to define a linear system.  Prior to graduate school, this means defining a linear differential equation which is always represented using the coefficients which are the same in the complex domain.  The slight (very slight) twist is when Discrete Time Systems are used and the "Z" transform replaces Laplace... Of course, its all the same stuff and the matrix operation extremely straightforward. 

In terms of functionality, the controls toolbox knows how to plot the "root locus" which is the zeros of the characteristic equation = the eigenvalues of the transform.  Sage has all this built in since it can do numerical matrix manipulations. 


# Distributed Architecture

* Service Architecture - Components available as services with a language / OS / location neutral interface 
* Parallel computing - This is gonna take some splain'... a number of decisions will need to be made on the (approximately) 8.2 gazillion issues at the heart of distributed / parallel computing.  The good news is a majority of folks can be served very well with a few paradigms such as scatter-gather and map-reduce.  More below 
* Language neutral integration - the author is not clear whether this is critical just yet.  I'll present a few thoughts but will shelve any substantial discussion for the time being (war wounds beginning to act up) 
Service Architecture is pretty straightforward nowadays.  Typically, some form of XML (ReST) service is defined and XML is pumped around (SOAP is silly and evil and no time will be spent discussing it here... those interested can find great architecture flame-wars in various places). 


## Distributed Sage

Distribution using Python is amazingly easy as the interpreter can be exploited to trivialize what is often nasty in strongly typed compiled languages.  The simple case is shipping a string of python code to be "eval()ed" on the other side.  When data needs to be shipped it can be pickled... Most Sage objects support dumps() and loads().  Sending arguments to functions / methods is a matter of constructing lists and dictionaries... Much of the plumbing can be hidden very easily using decorators (I have examples of this approach) and also permits exceptions to be thrown "over the wire" 


### General Distributed Object Computing (DOC)

Distributed Object Computing (DOC) takes this relatively simple concept a step further.  Generally, the idea is that the user obtains an object with methods to be used like any Plain Old Python Object (<a href="/PoPo">PoPo</a>).  Under the covers, this object (aka proxy) gathers up the arguments, encodes which method was called, the "Id" of the sending object, serializes the lot, ships it to the "other side" where the computation is to occur and does the inverse with anything returned. 

Of course, this is where the fun begins... general DOC is a massive failure with lots of good reasons why its been such a disaster. I won't burden the audience with my life and since I don't drink any more, the chances of you hearing about the millions of lives lost on this problem may be erased from history (good riddance) (look up the history of CORBA and the OMG to follow a still ongoing DOC train wreck). 

But, I will say that the difficulties stem from the fact that a call over the wire isn't the same as a call in the same process space.  For one thing, the failure modes are wildly more complex.  Another has to do with subtle performance issues which can be hidden under the local proxy object (this will be discussed below as the Call-to-Compute ratio)...  then there's the deadlock problem which occurs even in single threaded processes if one starts to use peer-to-peer style computing... and this is way before we get into the issues of object ownership, persistence, transactions or any of the madness which always comes up in the general case... bake for 30 years and throw out the result. 


### Parallel Computing for Scientists / Mathematicians / Engineers

Fortunately, technical folks with compute bound problems are often able to greatly simplify what is necessary (sufficient?) for their parallel computing problems... and, it turns out, is pretty simple to implement. 

Here we assume that the problem is "trivially" parallelizable: which (essentially) means that the problem can be decomposed into blocks of sufficiently coarse granularity that the inter-block communication can be ignored.  Examples are multiple runs of a problem which have stochastic properties (monte-carlo simulation) or a problem with a set of parameters each which can be run independently with no relationship to the other runs. 


#### Scatter-Gather

The simplest general purpose parallel problems can be solved with a framework supporting "Scatter-Gather".  Essentially, this means that the jobs are defined, handed off to a system which runs them on a farm, and returns the results.  The one extension which is often required involves the ability to initialize a slave process if that initialization is time consuming and can be reused for a number of jobs.  Examples are loading a large data set, firing up a complex package etc.  This isn't conceptually complex but does impose requirements that each run job return the slave to this initialized state.  If thats too hard, then the cost of initialization will need to be imposed for each job... one of those engineering tradeoffs we all hate. 


#### Map-Reduce

Google is credited with getting Map-Reduce popularized but has its roots in Functional Programming.  I recommend Wikipedia or any of the other thousands of hits one gets from a search.  Also, the open source Hadoop framework is an Apache effort to implement an open source version of the features.  Hadoop is Java but, apparently, supports C++ and "may" be appropriate for Sage (research required) 
### Service Architecture

Not a great deal to discuss here other than to say that there are many cases where live services which can be reached "over the wire" are quite useful.  Since some form of IPC is required for the parallel problem discussed above, and since this IPC mechanism will almost certainly be some open source framework, efforts to facilitate building Sage services would likely be useful. 
### Asynchronous Programming

The only tricky bit is that distributed systems "tend" to work better when they're asynchronous. Blocking on IO is, generally speaking, bad as it tends to lead to threads.  Threads are great when they're needed... they're hell but great... when they're not needed, they're just hell. Nothing beats debugging a completely non-deterministic, non-reproducable bug caused by threads when threads weren't needed. 

Asynchronous programming is straightforward but requires a bit of rethinking.  Twisted Python is the penultimate asynchronous inversion thought process but is truly great stuff.  It is anticipated that much of the asynchronous nastiness could be hidden from the mainstream Sage user. 

The one area which would need some work, therefore, is the Sage Notebook itself.  While the core notebook server uses Twisted to manage connections (and is asynchronous), the notebook process itself is Pexpect based and blocks...  I'm fairly sure that inverting the notebook process to be asynchronous would be straightforward but would require some evaluation. 


### Language Neutral (advanced topic)

Google Protocol Buffers - <a href="http://code.google.com/p/protobuf/">http://code.google.com/p/protobuf/</a> (protobuf) was open sourced by Google some time ago.  Protobuf was Google's core mechanism for transport and storage of serialized data.  The reasons for this and why there are some advantages over XML are available on their site. 

AMQO - Advanced Message Queuing Protocol - <a href="http://jira.amqp.org/confluence/display/AMQP/Advanced+Message+Queuing+Protocol">http://jira.amqp.org/confluence/display/AMQP/Advanced+Message+Queuing+Protocol</a> is gathering some steam 

For Sage, the advantages are: 

* Language support - Native bindings are available for Python, Java and C++ 
* Performance - Protocol buffers are substantially higher performance in terms of size and speed when compared with XML 
To simplify the discussion, the two main areas for Sage WRT distribution are: 

* Sage specific - Sage on both sides of the wire for general services and parallel computing 
* Integration with other systems - an example here is Java based systems or other legacy systems where coarse grained integration is preferred over linking with Sage in the same process 