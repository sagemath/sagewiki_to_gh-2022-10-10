

# Upgrade, flask, sage 4.7, and ext4 filesystem

People: W. Stein, J. Grout, M. Hansen 


## Published Interacts

   * See if it is possible to get Mitesh Patel's patch to work: <a href="http://trac.sagemath.org/sage_trac/ticket/7908">http://trac.sagemath.org/sage_trac/ticket/7908</a> 
   * Test server (might be up): <a href="http://sage.math.washington.edu:8976/pub/">http://sage.math.washington.edu:8976/pub/</a> 

## Database

   * If we stick with the filesystem: NEED a very fast filesystem that supports > 4 million inodes and > 32000 directories per directory, i.e., ext4.   This is difficult because boxen and sage.math are both Ubuntu 8.10. 
   * Also, want to at a minimum have user and worksheet metadata stored in database so startup is faster.  
   * Could run the server in a virtual machine, which would support ext4.  But are virtual machines fast enough these days?  They weren't last year.  This would be worth trying.  
   * Or stick with the filesystem (see below). 

## Filesystem Thoughts

   * (mhansen is doing this) Fix the `__worksheet` object to not load everything.  Scary stuff if you look at notebook.py. 
   * (mhansen) Write a script to prune the filesystem, e.g., deleting cell directories that are empty. 
   * (mhansen?) Make it so user directories are stored in a hierarchical way.  E.g., home/_store/ 

## Current Servers

   * <a href="http://sagenb.org">http://sagenb.org</a> 
   * <a href="http://prep.sagenb.org">http://prep.sagenb.org</a> 
   * <a href="http://tutorial.sagenb.org">http://tutorial.sagenb.org</a> 
   * <a href="http://480.sagenb.org">http://480.sagenb.org</a> 
   * <a href="http://alpha.sagenb.org">http://alpha.sagenb.org</a> 
   * <a href="http://demo.sagenb.org">http://demo.sagenb.org</a> 
   * <a href="http://demo2.sagenb.org">http://demo2.sagenb.org</a> 
   * <a href="http://nt.sagenb.org">http://nt.sagenb.org</a> 
   * <a href="http://standalone.sagenb.org">http://standalone.sagenb.org</a> 
   * <a href="http://test.sagenb.org">http://test.sagenb.org</a> 
   * <a href="http://uw.sagenb.org">http://uw.sagenb.org</a> 
   * <a href="http://flask.sagenb.org">http://flask.sagenb.org</a>    -- not upgraded 

## Backup Strategy

   * ? 

## Untrusted User Code: must all be executed in a virtual machine

   * ?  

## Monitoring

   * I spent a day writing this script to *manage* a collection of notebook servers: <a href="days31/workinggroups/sagenb/admin">admin</a> 
   * Nagios -- investigate for monitoring 
   * Or extend this script: <a href="http://wstein.org/home/wstein/bin/watch.sage">http://wstein.org/home/wstein/bin/watch.sage</a> 

## Virtual Machines

   * I tried install virtualbox 4 on sage.math and failed, due to the Linux source and Linux kernel being out of sync somehow.  Probably just needs an upgrade and reboot. 
   * I am scared to upgrade virtualbox on boxen.math. 
   * The Virtualbox on boxen.math is somewhat unstable and very old.  

## William's TODO List


```txt
 [x] official sagenb list of optional packages, and install them all.
 [x] make a "stop" script for servers that works.
 [x] fix any remaining links issues, then archive the fixlinks script
 [x] start servers and test
 [x] re-enable automatic backups
 [x] upgrade my sagenb install to include rado's fix for unicode issue, etc. 
 [x] search is broken (mhansen is on it)
 [x]  The _sage_ directory gets too big. (mhansen is on it)
 [x] script that computes and summarizes stats about all notebook servers:
      - number of users
      - how many users who evaluated code during the last day, week, etc. -- implement by reading last mod time on all history.pickle files.
      - what code was evaluated recently (read from history)
      - size of each notebook server
      - disk usage of each user
      - how many worksheets each user has
      
    (use a nosqlite db?)
    datetime server username last_datetime num_worksheets disk_usage

 [ ] make it so all pickle db's get saved in a non-corruptable way (atomic)
 [ ] push merged combined changes to wstein repo?
 [ ] MATHJAX (or jsmath image fonts ?!)
 [ ] twisted -- number of threads?



 [ ] ban copying results over if too big.


 [ ] somehow migrate flask.sagenb.org ???  or just wait.

```