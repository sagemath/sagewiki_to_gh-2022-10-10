

# Generators - Maintaining Local Frame State

The Python literature mostly discusses generators in the context of iterators.  This masks the subtle truth: 

* Generators are objects which maintain the local frame 
   * These are not coroutines as there is no true stack frame maintained 
   * But, you can invoke other generators from a generator getting you closer to where you might want to get 
   * Python Extensions such as &ldquo;Greenlets&rdquo; support true coroutines 
* Twisted supports callbacks to &ldquo;yield&rdquo; using the &ldquo;send&rdquo; operator through the &ldquo;inlineCallback&rdquo; mechanism 
   * Twisted folks view this as syntatic sugar.  That Tarbox guy thinks they're a bigger deal 
