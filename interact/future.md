
Some thoughts about the future of interacts 

Things to be able to do: 

   * Easily create controls on the fly 
   * When a variable changes, update the control automatically 
   * Easily use the value of a control 
   * Easily change the state of the widget 
   * Easily have controls that depend on each other -- I should be able to manipulate one control and see another control change 
   * backwards compatible with current interacts 
   * easy to create a complicated layout of controls 
   * create a layout of controls dynamically 

## Separating controls and variables

William's implementation makes it easy to create graphical control, and provides a way to easily get and set the value of the control. 

My way separately provides an easy way to create a variable where changes are tracked and notified, and separately provides an easy way to create a control reflecting the value of a variable or expression. 

William's way explicitly ties each control to a chunk of code that gets evaluated whenever a control in the control group is updated. My way does not.  It provides a way to tie a chunk of code to a variable, but it is not necessary. 

William's way forces each control to belong to a namespace (same with mine) and also forces all updates to execute a specific piece of code (and only execute a specific piece of code).  All update logic must be in that function.  Hmmm..that is nice. 

My way forces each control to belong to a namespace, but the update logic can be spread around since updates happen to all dependencies.  Is that better?  It's more flexible, but it's also more complicated since logic is spread around in different places. 

A serious problem with my implementation right now is that a variable update requires: 

   * message sent to browser about update 
   * propogate message at browser about update 
   * messages sent back to python to get the updates 
   * here is the key part: those updates don't happen until *after* the current code executes.  Thus there are no instantaneous updates while other code is executing 
   * each update sends a message back to the javascript control 
Here are two ways to overcome this problem: 

   * do the dependency management in Python, automatically sending updates.  This can be wasteful (sending updates that aren't needed), but oh well. 
   * do update messages in a thread tied to the main process.  This could have problems when you have code that updates a few variables and then runs a huge block of C code (thus locking the GIL).  Also, updates still require a round-trip to the browser.  On the other hand, you'd be able to update variables in real-time, even while another piece of code is running.  That is kind of cool (and could be really dangerous, of course). 