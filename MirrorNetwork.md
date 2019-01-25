= SageMath Mirror Network =

This is a collection of notes on how the [[http://www.sagemath.org/mirrors.html|mirror network]] of SageMath operates and a '''howto on how a mirror is setup'''. This might be of interest outside SageMath, too. It's only Linux specific.

== RSYNC ==

[[http://www.samba.org/ftp/rsync/rsync.html|rsync]]

 1. is a tool to synchronize a local directory with the contents of a remote directory.
 1. is a server, that provides access to local directories to exchange data using the rsync protocol.

To synchronize with SageMath's master, you can use this command:
{{{
rsync -av --checksum --delete-after rsync.sagemath.org::sage $TARGET
}}}
where {{{$TARGET}}} should be replaced by your local target directory.

'''NOTE:''' If you are a new mirror or re-syncing everything, please use
{{{
rsync://rsync.mirrorservice.org/www.sagemath.org/
}}}
to avoid traffic on the main mirror server. Thank you!

 1. {{{-a}}} switches to archive mode (same timestamp, ...)
 1. {{{-v}}} (or {{{-vv}}}, {{{-vvv}}}) verbosity level, for the lovely logs
 1. {{{--checksum}}} is an extra check for file integrity
 1. {{{--delete-after}}} tells rsync to delete files that are not on the master ''after'' the synchronization has finished (i.e. old binary files from the last release). There are also other versions of {{{--delete*}}} that can be used to delete older files earlier or during the process, but it's best if files stay on the mirror during sync. '''Do not forget one of the {{{--delete*}}} switches to avoid using up more and more disk space!'''

'''Other Sources''': Since the master is sometimes slow, you can also try to rsync from one of the mirrors:
  * --(rsync://ftp.sh.cvut.cz/sagemath)--
  * rsync://rsync.mirrorservice.org/www.sagemath.org/

=== rsync master ===

It's dead simple to setup an rsync master server. In Ubuntu/Debian, you have to install rsync and then edit the rsync config file {{{/etc/rsyncd.conf}}}. The inet deamon calls the rsync process if someone wants to connect.

== Periodic Checks ==

At least twice a day, a mirror should check if there are updates on the master. Most of the time there is nothing to do, so it quits fast and nothing happens. If there is a new release, the synchronization starts and it might take some time. Here I describe two techniques, how to avoid concurrent calls of the rsync task in case it takes a bit longer. I use a setup where the mirror checks on every full hour and only runs as one instance.

=== crontab ===

[[http://linux.die.net/man/1/crontab|cron]] is a nice system daemon, that does periodic task scheduling in linux. As a regular user, run '''crontab -e''' in a terminal to start the crontab editor. A line like

{{{
*/10 * * * * "/home/<username>/rsync_sagemath" 2> /home/<username>/rsync_sagemath.errors > /dev/null
}}}
calls the rsync_sagemath script every time the minutes in the computer clock are "00" or a multiple of "10" (modulo 10). Something like "{{{0 */2 * * * }}}" does it every second hour when the minutes are "00", "{{{0 1,9,19 * * * }}}" at full hours 1am, 9am and 7pm, ... Read the [[http://linux.die.net/man/1/crontab|man crontab]] page for more information. The part after that just says that errors should be written into a specific file and everything else should be written nowhere.

Beware, there *has* to be a <newline> at the end of the file, not just the crontab line.

A nice addition would be to write the output of the rsync task to a temporary file that is copied into the mirror as a hidden file. Then, the operators of the master server can check, if there were problems with that mirror server!

=== flock ===

[[http://linux.die.net/man/1/flock|flock]] is a utility that ensures, that a certain command is only called once.
This is very useful, because the mirror task from above maybe lasts longer than the time interval of the scheduler.
The way I use it is the following:
{{{
flock -xn ./mirror_sagemath.lock rsync ....
}}}
 1. {{{-xn}}} means, that it should grap an eXclusive lock and should '''Not''' run, when the task is already running
 1. {{{./mirror_sagemath.lock}}} is the lock file
 1. then, the entire rsync command ...

=== No flock ??? ===

It might happen that the debian package linux-utils (that holds flock) is not installed. I found a [[http://stackoverflow.com/questions/185451/quick-and-dirty-way-to-ensure-only-one-instance-of-a-shell-script-is-running-at-a|nice workaround at stackoverflow]]. This is how I use it:

{{{
$ cat rsync_sagemath

# rsyncs from sage.math.washington.edu using its rsync daemon
# for automated use, remove the "vv" and "progress" switches

# locking mechanism from
# http://stackoverflow.com/questions/185451/quick-and-dirty-way-to-ensure-only-one-instance-of-a-shell-script-is-running-at-a
# since flock is not installed :(

cd

LOCKFILE=./rsync_sagemath.lock

if [ -e ${LOCKFILE} ] \&\& kill -0 `cat ${LOCKFILE}`; then
    echo "rsync_sagemath already running ... exit"
    exit
fi

# make sure the lockfile is removed when we exit and then claim it
trap "rm -f ${LOCKFILE}; exit" INT TERM EXIT
echo $$ > ${LOCKFILE}

# actual work
rsync -av --checksum --delete-after --partial rsync.sagemath.org::sage /home/<username>/sage/

rm -f ${LOCKFILE}
}}}
