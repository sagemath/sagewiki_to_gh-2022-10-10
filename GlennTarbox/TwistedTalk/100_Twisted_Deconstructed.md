## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:SlideTemplate
##master-date:Unknown-Date
#format wiki
#language en
#pragma section-numbers off
[[Navigation(slides)]]
= Concurrency =
== We got Both Kinds ==

 * I/O Bound
 * Compute Bound

== Waiting For Answers ==
 1. Just Wait... wasn't doing nothin' anyway
 1. Spawn Process
 1. Spawn Thread
 1. Non-blocking calls and "a plan"

== Non-Blocking Calls ==
  * Register Callback
{{{#!python
O.registerCallback(fn, *args, **kargs) # fn can be function or method

def fn(result, *args, **kargs)
  print "important message: ", result
}}}

  * Use Deferreds
{{{#!python
d = O.doComplicatedLengthyCalc(a,b,c) # returns deferred
def gotResult(result)
  print "important message: ", result
  return "a more important message"
d.addCallback(gotResult)             # first callback
def gotResult2(result)
   print "gotResult2 returns: ", result # will print "a more important message"
d.addCallback(fn2, ...)
d.addErrback(errfn,...)    # exception handling for deferreds
}}}

{{{
If you need to call a method that returns a deferred within your callback chain, just return that deferred, and the result of the secondary deferred's processing chain will become the result that gets passed to the next callback of the primary deferreds processing chain
}}}
...

[[Navigation(siblings)]]
