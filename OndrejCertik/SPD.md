= Source Python Distribution =

== Mailinglist ==

http://groups.google.com/group/spd-dev

== Packages ==

http://qsnake.googlecode.com/files/qsnake_all-0.2.tar

== How to create the SPD ==

  1. Download sage-3.3.tar
  2. ./build_spd

where `build_spd` is:
{{{
tar xf sage-3.3.tar
cd sage-3.3
mv spkg/standard/sage_scripts-3.3.spkg /tmp
rm spkg/standard/*.spkg
mv /tmp/sage_scripts-3.3.spkg spkg/standard
cd ..
mv sage-3.3 spd-0.3
tar czf spd-0.3.tar.gz spd-0.3
rm -rf spd-0.3
}}}
