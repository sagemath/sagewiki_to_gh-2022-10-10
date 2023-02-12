
[[_TOC_]] 

Last Update: <a href="/GlennTarbox">GlennTarbox</a> Jul 03, 2008 21:23:00 (need to get the timestamp macros figured out) 


# Shared State and Remote Access

The recent development activity has centered around getting simple forms of communication working with Sage objects.  As is discussed some length in <a href="/DsageNg/ScatterGather">DsageNg/ScatterGather</a>, Foolscap makes RPC style comms fairly straightforward. 


## Telnet and SSH

Fortunately, the Twisted folks have spent a lot of time building things on top of their core architecture.  In particular, support for terminals and the Telnet and SSH protocols are among them. 

Basically, we &ldquo;borrowed&rdquo; some of the twisted example code and put together a conch terminal server. Simple case is just telnet to a known port.  Unless you're on a vpn or restrict access to localhost, its not useful.  SSH is fully supported as well and the enabling of that capability is forthcoming. 

As an early demonstration of metaphors for collaborative work, when connecting by terminal, there is a shared object provided in the namespace of the session called &ldquo;shared&rdquo;.  Shared has a variable called &ldquo;m&rdquo; which is a dictionary... the intended use is that an object that one wants to hang around between sessions or be shared with other users is put in &ldquo;m&rdquo;. 

The current head of my git repo working branch has a script in dsageng/scripts called dsage_manhole.py.  To run it: 


```txt
twistd -ny dsage_manhole.py
```
I'm able to grab keyboard entries and have an example of the ability to grab &ldquo;tab&rdquo; which you can see by trying.  I'll need to look into the infrastructure used in the notebook so we can reuse it here.  Also, since IPython does tab completion, we might consider emulating what they do as well. 


## Shipping Code to Distributed Nodes

<a href="/DsageNg">DsageNg</a> makes no assumptions currently about shared code state other than the expected installed code at a node.  Most developers write scripts outside the development tree and run them... eventually integrating them into core Sage capabilities. 

With a distributed system and no disk sharing (comming soon), its important to be able to distribute code to the remote notes to run as part of the system. 

Fortunately, ths turns out to be trivial.  An example easy case is: 


```python
#!python 
@sageRemoteValue
def remote_mySuperFunc(self, sizeSeries,distribution='normal',
                   loc=1,scale=1,bins=50):
    s='AllServer.local_execJob %d, %s, %d, %d, %d'
    #log.msg(s % (sizeSeries, distribution,loc, scale, bins))
    ts = TimeSeries(sizeSeries)
    ts.randomize(distribution,loc,scale)
    return ts.histogram(bins=bins)
```
which lives in a file.  From the workbook, grab the file as a string and ship it to the servers.  There's a method to do this.... more below... 

Decorator magic, in its early stages, makes the miracle occur on the server side.  Calling the object is similar to that done in <a href="/DsageNg/ScatterGather">DsageNg/ScatterGather</a>.  The remote method indicator is &ldquo;mySuperFunc&rdquo; as the leading &ldquo;remote_&rdquo; is used by foolscap to identify remotely callable methods. 


## General Execution of Remote Commands

Turns out, its all made very simple because we're using an interpreter.  And this is why progress slowed for a few days... The true generality of the language needed to be investigated to see how hard things could become easy.  Unfortunately, finding the easy way can be hard... 

But, the answer is to exploit Python's code.<a href="/InteractiveConsole">InteractiveConsole</a>.  Essentially, with the right namespace handling, also easy, you can define methods, classes, etc. or simply send an expression and get the result back. 

The only bit which needs to be managed is the scattering and gathering of the command / results.  Also easy... 


## The Notebook

And it was going so well... 

Here's the thing.  The forking of the child process to support Twisted and do the event handling is cool... but unnecessary.  We'll use it where we need performance, but this weeks work has made what was a concept more compelling and, turns out, easier. 

I came across the problem when trying to marshall remote references through the queue...  Foolscap doesn't want you to do that because those objects are &ldquo;factoried&rdquo; into existence so all the attendant nailup can occur.  If you want to simply email a remote reference, you ship the purl (url for Perspective Broker (Twisted spread) is where I'm guessing the p comes from) 

Which started to generate code... 

But, this isn't right.  What you really want to do is build **The Sage Kernel System** 


# The Sage Kernel System

This is going to take longer than I have right this second.  <a href="/DsageNg/SageKernel">DsageNg/SageKernel</a> will contain an architecture overview in the next couplea days. 

Briefly, user interaction should be unified as a thin font end to a Kernel.  This kernel can be standalone or be part of a persistent distributed mesh...  All configuration really as the core infrastructure has been built. 



---

 <a href="/CategoryDsageNg">CategoryDsageNg</a> 
