

# Deferreds are Beautiful


```python
#!python 
from twisted.internet import reactor

# pedantic and gets nasty quickly

def main():
    d = O.doLongCalculation()
    d.addCallback(gotResult)
    return d                  # the pattern you'll end up following

def gotResult(result):
    print "result is: ", result

reactor.callWhenRunning(main)
reactor.run()

########################

# a little nicer

def main():
    return O.doLongCalculation().addCallback(gotResult)

def gotResult(result):
    print "result is: ", result

reactor.callWhenRunning(main)
reactor.run()

#######################

# making things a bit more pythonic

def main():
    def gotResult(result):
            print "result is: ", result
    return O.doLongCalculation().addCallback(gotResult)

#######################

# deferreds are chains

def main():
    def gotResult(result):
            print "result is: ", result
    d = O.doLongCalculation()
    d.addCallback(gotResult)
    d.addCallback(lambda r: reactor.stop())  # throw away the result
    return d

#####################

# making our own deferreds
import sys
from twisted.internet import reactor, defer
from twisted.python import log

def sleepyCalc(message):
    log.msg("sleepyCalc: " + message)
    d = defer.Deferred()
    reactor.callLater(10.0, wakeyTime, d, message)
    return d

def wakeyTime(d, message):
    log.msg("wakeyTime: " + message)
    d.callback(message)

def gotResult(result):
    log.msg("gotResult: " + result)
    return "-+- gotResult -+- " + result

def main(message):
    log.msg("main message: " + message)
    d=sleepyCalc(message)
    d.addCallback(gotResult)
    d.addCallback(sleepyCalc)   # hmmm...
    d.addCallback(gotResult)
    log.msg("main exit: " + message)

log.startLogging(sys.stdout)

reactor.callWhenRunning(main, "FIRST")
reactor.callLater(2.0,main,"SECOND")
log.msg("away we go")
reactor.run()

log.msg("bye....")
```
[[!map pages="DsageNg/TwistedTalk/*"]] 
