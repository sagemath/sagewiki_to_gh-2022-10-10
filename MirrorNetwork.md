= Sage Mirror Network =

This is a collection of notes on how the [[http://www.sagemath.org/mirrors.html|mirror network]] of Sage operates and some howto on how a mirror is setup. This might be of interest outside Sage, too.

== RSYNC ==

[[http://www.samba.org/ftp/rsync/rsync.html|rsync]] 

 1. is a tool to synchronize a local directory with the contents of a remote directory.
 1. is a server, that provides access to local directories to exchange data using the rsync protocol.

To synchronize with Sage's master, you can use this command:

rsync -av --delete-after sage.math.washington.edu::sage $TARGET

where $TARGET should be replaced by your local target directory.

 1. -a switches to archive mode (same timestamp, ...)
 1. -v (or -vv, -vvv) verbosity level, for the lovely logs
 1. --delete-after tells rsync to delete files that are not on the master '''after''' the synchronization has finished. There are also other versions of --delete* that can be used to delete older files earlier or during the process.
