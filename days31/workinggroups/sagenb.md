= Upgrade, flask, sage 4.7, and ext4 filesystem =

People: W. Stein, J. Grout

== Database ==

  * If we stick with the filesystem: NEED a very fast filesystem that supports > 4 million inodes and > 32000 directories per directory, i.e., ext4.   This is difficult because boxen and sage.math are both Ubuntu 8.10.
  * Also, want to at a minimum have user and worksheet metadata stored in database so startup is faster. 

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
