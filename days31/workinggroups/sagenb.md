= Upgrade, flask, sage 4.7, and ext4 filesystem =

People: W. Stein, J. Grout, M. Hansen

== Database ==

  * If we stick with the filesystem: NEED a very fast filesystem that supports > 4 million inodes and > 32000 directories per directory, i.e., ext4.   This is difficult because boxen and sage.math are both Ubuntu 8.10.
  * Also, want to at a minimum have user and worksheet metadata stored in database so startup is faster. 
  * Could run the server in a virtual machine, which would support ext4.  But are virtual machines fast enough these days?  They weren't last year.  This would be worth trying. 
  * Or stick with the filesystem (see below).


== Filesystem Thoughts ==

  * (mhansen is doing this) Fix the {{{__worksheet}}} object to not load everything.  Scary stuff if you look at notebook.py.
  * (mhansen) Write a script to prune the filesystem, e.g., deleting cell directories that are empty.
  * (mhansen?) Make it so user directories are stored in a hierarchical way.  E.g., home/_store/


== Current Servers ==

  * http://sagenb.org
  * http://480.sagenb.org
  * http://nt.sagenb.org
  * http://demo.sagenb.org
  * http://demo2.sagenb.org
  * http://tutorial.sagenb.org
  * http://prep.sagenb.org
  * http://flask.sagenb.org
  * http://uw.sagenb.org

== Backup Strategy ==

  ?

== Untrusted User Code: must all be executed in a virtual machine ==

  ? 


== Monitoring ==

  * Nagios -- investigate for monitoring
  * Or extend this script: http://wstein.org/home/wstein/bin/watch.sage

== Virtual Machines ==

  * I tried install virtualbox 4 on sage.math and failed, due to the Linux source and Linux kernel being out of sync somehow.  Probably just needs an upgrade and reboot.

  * I am scared to upgrade virtualbox on boxen.math.

  * The Virtualbox on boxen.math is somewhat unstable and very old. 
