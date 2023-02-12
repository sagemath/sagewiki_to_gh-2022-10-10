

# Concurrency


## We got Both Kinds

* I/O Bound 
* Compute Bound 

## Waiting For Answers

1. Just Wait... wasn't doing nothin' anyway 
1. Spawn Process 
1. Spawn Thread 
1. Non-blocking calls and "a plan" 

## Non-Blocking Calls

   * Register Callback 

```python
#!python 
O.registerCallback(fn, *args, **kargs) # fn can be function or method

def fn(result, *args, **kargs)
  print "important message: ", result
```
   * Use Deferreds 

```python
#!python 
d = O.doComplicatedLengthyCalc(a, b, c) # returns deferred
def gotResult(result)
  print "important message: ", result
  return "a more important message"
d.addCallback(gotResult)             # first callback
def gotResult2(result, i2, s2, specialLabel)
   print "gotResult2 returns: ", result # will print "a more important message"
   print i2, s2, specialLabel               # will print "2, string2, special"
d.addCallback(gotResult2, 2, "string2", specialLabel="special")
d.addErrback(errfn,...)    # exception handling for deferreds
```
This is a very important passage... but don't hurt your brain!! 


```txt
If you need to call a method that returns a deferred within your callback chain, just return that deferred, and the result of the secondary deferred's processing chain will become the result that gets passed to the next callback of the primary deferreds processing chain
```
[[!map pages="DsageNg/TwistedTalk/*"]] 
