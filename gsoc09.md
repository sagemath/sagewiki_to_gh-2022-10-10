= Google Summer of Code 2009 =

== Important Dates ==
See the GSoC2009 FAQ for the timeline here http://code.google.com/opensource/gsoc/2009/faqs.html#0_1_timeline_5354032302481437_.

== GSoC Sage Projects ==

All #numbers below refer to [[http://trac.sagemath.org|trac tickets]].

== Note: ==

We should take care to define delivarables for the items below. These should be doable with less than 3 months of work.

=== Notebook ===

The Sage notebook is an AJAX application similar to Google Documents that provides
functionality for all mathematical software somewhat like Mathematica notebooks. 
It was written from scratch (in Javascript and Python) by the Sage development team,
and has been used daily by thousands of people over the last year.  It's one of the
main ''killer features'' of Sage.  This project is about improving the notebook.
No special mathematical knowledge is required.  Knowledge of Javascript, jQuery, Python,
and general AJAX techniques is needed. 

 * Authentication backend (ldap, kerberos?)

    The Sage notebook is a web-based AJAX application for multiple users. It allowes them to sign in to their worksheets, stored on the server. The authentication is handled by Sage. It would be very useful to create a plugable authentication mechanism for existing sytems like LDAP, Kerberos, Active Directory, etc. - possibly supporting single-side-on - or other systems like OpenID (i.e. use your google or yahoo! account to log in using  https://www.google.com/accounts/o8/id or http://openid.yahoo.com/ )

 * Refactoring
  * independent component of Sage
  * move to Django
 * Improvements to interact
 * Add support for making presentations

 * Add task here

=== Interfaces to Sage ===

Make it easier to call Sage from other applications. 

 * Add task here

== Potential Mentors ==
 * Add your name here
