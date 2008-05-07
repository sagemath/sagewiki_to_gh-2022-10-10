## Please edit system and help pages ONLY in the moinmaster wiki! For more
## information, please see MoinMaster:MoinPagesEditorGroup.
##master-page:SlideTemplate
##master-date:Unknown-Date
#format wiki
#language en
#pragma section-numbers off
[[Navigation(slides)]]
= Concurrency =
 * We got &ldquo;Both Kinds&rdquo;
  * I/O Bound - Twisted's Domain
  * Compute Bound - Twisted Can Help

 * Non-Blocking Calls
  * Register Callback - O.registerCallback(fn, *args, **kargs)
   * &ldquo;fn&rdquo; can be function or method
   * def fn(result, *args, **kargs) &larr; signature of callback
  * Use Deferreds
   * d `=` O.meth(...)
   * d.addCallback(fn,*args,**kargs)
   * d.addCallback(fn2, ...)
   * d.addErrback(errfn,...)

{{{
If you need to call a method that returns a deferred within your callback chain, just return that deferred, and the result of the secondary deferred's processing chain will become the result that gets passed to the next callback of the primary deferreds processing chain
}}}
...

[[Navigation(siblings)]]
