<<TableOfContents(2)>>

= Setting up a Sage server =
by Jason Grout


I recently set up a Sage server, and here are very rough notes of what I did.  Please email the [[http://groups.google.com/group/sage-support|sage-support]] email list if you have any questions.  Please feel free to make these notes better.



== Why set up a server? ==

I used [[http://www.sagenb.org]] for a semester.  I then set up a campus server and used that for a semester.  Here are the advantages to having a campus server that I found (in no particular order): 

  1. At various times, we would experience slowdowns in {{{sagenb.org}}} (it always seemed to happen during a class presentation!).  We attributed this to our internet connection, the server being overloaded, or both.  A dedicated campus server takes care of both of these issues (provided you budget enough hardware).
  2. I am not comfortable with asking students to publish worksheets on the public server.  There are some people that would not be comfortable with having the students do any work on an external server.  A campus server can be firewalled to only be accessible from on campus.
  3. While the {{{sagenb.org}}} administrators do a fantastic job, there are no guarantees about service, uptime, backups, etc.  Having a campus server allows us to control these things (especially backups!).  
  4. We had no control over when upgrades were performed.  It was possible that a feature of Sage that we were using would change in a next release.  If so, having a campus server allows me to fix a version for the semester and stick with it (or just do upgrades if it won't negatively affect the students' experience), so that the experience is consistent for the semester.  On the other hand, there were several features that I contributed to Sage to help the students, and I could apply those immediately on a campus server, instead of having to wait until the next version of Sage.

In our case, we found an old server that was several years old sitting unused.  We put some RAM in it to handle the load we would like to handle (see the table above) and that was our only cost.


== Hardware Requirements ==

=== RAM ===

The biggest bottleneck seems to be RAM; that will determine how many simultaneous users you can have.  From some informal tests, it seems that the Sage notebook uses about 150MB of RAM for the server and about 50MB for a worksheet instance.  If the OS uses between 512 and 1G of RAM, then I conservatively calculate that the following amounts of RAM will support the corresponding numbers of users (if the users are doing just basic calculations and not using a lot of RAM):

||'''RAM (GB)'''||'''Simultaneous worksheets'''||
|| 1 ||  5 ||
|| 2 ||  20 ||
|| 3 ||  40 ||
|| 4 ||  60 ||
|| 8 ||  140 ||
|| 12 ||  200 ||

These numbers have not been tested.  If anyone has real-world numbers, please correct the table above.

Note that the numbers above are for simultaneously running worksheets.  There can be many, many more accounts on the server.

== Install the server ==

I started with a fresh copy of Ubuntu 10.04, with a working Sage compiled from source (which means I had to install some extra packages so that Sage compiles and runs; see the Sage README.  In particular, I needed to install ).

  0) I install libssl-dev so that Sage can load https urls
{{{
sudo apt-get install libssl-dev
}}}

Also, I had to install the following so that Sage would build (see the README.txt file that comes with Sage):

{{{
sudo apt-get install build-essential
sudo apt-get install gfortran
}}}

I installed these packages to provide extra capabilities in Sage:

{{{
sudo apt-get install graphicsmagick-imagemagick-compat # could also install imagemagick instead
sudo apt-get install libpango1.0-dev libcairo-dev # to pick up dependencies for R to enable png support
sudo apt-get install texlive-full # could probably install a subset of texlive instead
sudo apt-get install libreadline-dev # for qepcad
}}}

(I think the R png capabilities line is right.  If it's not, you may have to also install the xorg-dev, libpng-dev, and/or r-base packages)

I installed this to help me manage the server better:

{{{
sudo apt-get install unattended-upgrades
sudo vim /etc/apt/apt.conf.d/50unattended-upgrades # edit unattended upgrades config; see https://help.ubuntu.com/10.04/serverguide/C/automatic-updates.html
sudo apt-get install mercurial
}}}

  1) Install apache2 and enable the proxy modules
{{{
sudo apt-get install apache2

sudo a2enmod proxy
sudo a2enmod proxy_http
}}}

  2) Create an apache virtual server for the Sage server.  I created a file {{{/etc/apache2/sites-available/sagenotebook}}} with the following contents, replacing YOUR_SERVER_NAME with your server name (e.g. sagenb.example.com).  Also replace YOUR_SERVER_ADMIN_EMAIL_ADDRESS with your admin email address.
{{{
<VirtualHost *:80>   
ServerName YOUR_SERVER_NAME

ProxyRequests Off
ProxyPreserveHost On

<Proxy *>
Order deny,allow
Allow from all
</Proxy>

ProxyPass / http://localhost:8000/
ProxyPassReverse / http://localhost:8000/

 DocumentRoot /
 <Location />   DefaultType text/html
 </Location>

   ErrorLog /var/log/apache2/error.log

   # Possible values include: debug, info, notice, warn, error, crit,
   # alert, emerg.
   LogLevel warn

   CustomLog /var/log/apache2/access.log combined
   ServerAdmin YOUR_SERVER_ADMIN_EMAIL_ADDRESS
 </VirtualHost>
}}}


  3) Enable the site in apache and restart apache
{{{
sudo a2dissite default
sudo a2ensite sagenotebook
sudo /etc/init.d/apache2 restart
}}}


  4) Now add a server and 10 user accounts.  The Sage notebook will invoke one of these 10 accounts to do the worksheet processing.
{{{
sudo addgroup sageuser
sudo adduser --disabled-password sageserver
for i in $(seq 0 9); do
 sudo adduser --disabled-password --ingroup sageuser sage$i
done
}}}

  5) I wanted to restrict logins for the sage server and sage users.  I want to prevent logins as sageserver, and restrict sage* logins to only come from localhost.  I'll use sudo to run commands as the sage server.  Under {{{/etc/pam.d/sshd}}}, uncomment this line, and add "nodefgroup":

{{{
account  required     pam_access.so nodefgroup
}}}

  Then in {{{/etc/security/access.conf}}}, add these lines:

{{{
-:(sageuser):ALL EXCEPT localhost
-:sageserver:ALL
}}}


  6) Now set up passwordless ssh keys
{{{
sudo -u sageserver -i "ssh-keygen -t dsa"
for i in $(seq 0 9); do
 sudo cat ~sageserver/.ssh/id_dsa.pub | sudo -u sage$i -i "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys "
done
}}}

  7) Test logins (do at least one to generate the known_hosts file)
{{{
sudo -u sageserver -i "ssh sage0@localhost echo Done"
}}}


  8) I store the following command in a file {{{/home/sageserver/startnotebook}}} to start the notebook
{{{
 #!/bin/sh

~/sage/sage -c "notebook(interface='localhost', directory='./sage_notebook.sagenb',port=8000, accounts=True, timeout=3600, server_pool=['sage%d@localhost'%i for i in range(10)], ulimit='-u 100 -t 36000 -v 500000', open_viewer=False)" 
}}}

Note that I explicitly set the notebook directory, so that the directory doesn't default to live inside of {{{~/.sage}}}.  This is so that the normal procedure of making {{{~/.sage}}} not publicly accessible doesn't also cut off access to each cell's DATA directory.


  9) Now copy the current version of Sage into the sageserver home directory.  I set up things so that {{{/home/sageserver/sage/}}} is a symbolic link to whatever the current version is (like {{{/home/sageserver/sage-4.3.2/}}}):

{{{
   cd ~sageserver
   ln -s sage-4.3.2 sage
}}}

  10) Install any optional spkgs that you want.  I install these:

{{{
for i in 'jsmath_image_fonts' 'biopython' 'cbc' 'glpk' 'graphviz' 'pyx' 'dot2tex' 'fricas'; do
    sudo -u sageserver -i "~/sage/sage -i $i";
done;
}}}

To start the sage server, do the following.  Note that since I am using sudo to run commands as sageserver, instead of logging in as sageserver, I have to do the {{{script /dev/null}}} trick to get screen to work.

{{{
sudo su -l sageserver
script /dev/null
screen ./startnotebook
}}}

I also added this to ~/sage/sage to control process limits:

{{{
if [[ `whoami` = sage* ]]; then
   echo "User " `whoami`
   ulimit -v 1500000 -u 300 -n 128 -t 1800
fi
}}}

== Additional Notes ==

 * Enable acl permissions by editing fstab and adding the "acl" option behind the ext4 option (make sure your filesystem allows acls, of course).  Then you can better protect files from being seen by sage worksheet processes.
 * [[https://help.ubuntu.com/10.04/serverguide/C/automatic-updates.html]] also has some helpful tips.
 * Jason Ekstrand from Iowa State University notes that if you want to enable SSL, you can do this at the command line: {{{
sudo apt-get install ssl-cert
sudo make-ssl-cert
}}} and then use this for your {{{/etc/apache2/sites-available/sagenotebook}}} {{{
<VirtualHost *:80>
Redirect / https://MY_SAGE_SERVER_NAME/
</VirtualHost>
<VirtualHost *:443>   
ServerName MY_SAGE_SERVER_NAME

ProxyRequests Off
ProxyPreserveHost On

##############################################################
# Stuff to make the notebook secure. Copied from default-ssl #
##############################################################
SSLEngine on
SSLCertificateFile    /etc/ssl/certs/ssl-cert-snakeoil.pem
SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
BrowserMatch "MSIE [2-6]" \
	nokeepalive ssl-unclean-shutdown \
	downgrade-1.0 force-response-1.0
# MSIE 7 and newer should be able to use keepalive
BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
####################
# END OF SSL STUFF #
####################

<Proxy *>
Order deny,allow
Allow from all
</Proxy>

ProxyPass / http://localhost:8000/
ProxyPassReverse / http://localhost:8000/

DocumentRoot /
<Location />   DefaultType text/html
</Location>

   ErrorLog /var/log/apache2/error.log

   # Possible values include: debug, info, notice, warn, error, crit,
   # alert, emerg.
   LogLevel warn

   CustomLog /var/log/apache2/access.log combined
   ServerAdmin SERVER_ADMIN_E-MAIL
</VirtualHost>
}}}

== Alternative port forwarding arrangements ==

Apart from Apache, it may also be possible to use `iptables` or some other NAT firewall to do the port forwarding. In that case you should of course run the sage notebook with `secure=True`, because a firewall will not be providing an SSL layer for you. The command to forward, for instance, port 443 to port 8000, is
{{{
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 8000
}}}
You should check with your own system to see how to make such a rule permanent. If you want check which `nat` rules are in effect type
{{{
iptables -t nat -L
}}}

== Other Instructions ==

You can find another set of instructions at JustEnoughSageServer
