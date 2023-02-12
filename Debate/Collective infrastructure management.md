Here is a place to discuss about Sage infrastructure, its decision making, its hosting, its policy,...
See also [[Infrastructure]].
<<TableOfContents>>

== Infrastructure management workflow ==

=== What is wrong with the current workflow ===

 1. someone, not necessarily involved in Sage community (e.g. student, askbot developper) set up a service. S·he choses the tool independently from the others services (e.g apache vs nginx, modcgi vs uwsgi, crontab vs rc.local vs init.d vs cron.d, mysql vs postgresql). It is undocumented. But it works.
 2. as long as it works, no maintenance is done
 3. at some point, the service crashes or get spammed
 4. William Stein sends an email to call for volunteering to fix the issue
 5. hopefully, a one-day-hero shows up, and tries to fix the issue. Because nothing is documented, a huge work of archeology is required (each time). Fixing the issue usually adds one layer of undocumented and non-uniform choices.
 6. if it succeeds, goto 2.
 7. if it does not, perhaps another one-day-hero tries to fix the issue. Sometimes, this ends-up with the end of the service and users losing some of their work (e.g. sagenb.org). Sometimes it takes months (e.g. ask.sagemath.org).


=== What would be a better workflow ===

All infrastructure administration tasks should be done by a Sage engineering task force collective, with well identified tasks, in a transparent and documented way, so that there is no dependence on some people, that puts pressure if that person is not available (e.g. they should not apology to attend a conference for some weeks!).

Some more specific proposals:

 * '''Use a similar set of tools among services'''. Indeed, we are not all syadmins, so chosing different tools among the services will let the less experienced at the side of the road, while wee need all of them.  For example, we used to have:
   * various ways to run a recurrent task (user crontab, root crontab, init.d, rc.local, cron.d,...). A good one is /etc/cron.d as it allows one specific file per service (hence no need to sed within a single file to automatically add or remove a task), it also supports things like @reboot, the task can be launched in the name of some specific user (not necessarily root).
   * various webservers (apache, nginx,...).
   * various ways to generate and manage SSL certificates (self-signed certificate, let's encrypt, CDN???). It seems let's encrypt works well (mmarco set it up for wiki.sagemath.org).
   * various database engine (postgresql, mysql).
 * '''document every change''' so that it is easier for a new volunteer to get involved, and so that it is easier to migrate or upgrade.
 * '''discuss every choice''' and describe every change so that we can '''learn from eachother'''.
 * '''centralize all config files''' that differ from the distro-default one, so that it is easy to get the whole context (note: they are located at /home/asa/asksage_private/configs for ask.sagemath.org and at /root/admin/files on sagewiki.lipn.univ-paris13.fr as well as patchbot.sagemath.org). As much as possible (but not artificially), minimize the amount of information that differs from the distro's defaults (version number, config variables, default ports, ...).
 * '''refuse any state of emergency''', as this tends to concentrate power artificially.
 * '''don't worry about downtime''': 1-week downtime of collective maintenance is way better than 2-hour one-day-hero downtime followed by 2months+ downtime once a crash appears and nobody is able to set things back.
 * on the longer term, and if enough people are ready/willing to that, and once the situation is stabilized with a good global view and consensual choices, use a '''config management software''' such as ansible or salt. Knowledge spreading would require a dedicated sage days or it is likely the collective will get reduced then.


== Infrastructure hosting ==

=== Advantages of academic (University or research networks) hosting ===

The proposal is to spread Sage services (including replication and backup) among universities worldwide, administered by a dedicated team of Sage developers (see above).

Here are some more precise benefits:

 * '''independence'''
   * '''from investors''' : we do not need someone to pay for a cloud service, we do not depend on who owns money. No income is guaranteed in a long-term, so let us not being artificially dependent on this.
   * '''from national sepcificities''' : having services spread among Universities in various countries secures the evolutions that could happen in some particular country (like budget restriction, rules about computer accounts, network neutrality, licensing issues, ...). Note that currently : 
     * sagecell is hosted both in Spain and Germany, such replication should be promoted
     * asksage is hosted in the USA (OSU)
     * Jeroen proposed to host trac in Belgium
     * Thierry proposed to host wiki in France
   * note that ask.sagemath.org were already hosted on GCE, and we had to move to OSU by lack of funding. University hosting, especially if we have various hosts is much more robust with that respect.

 * '''visibility''' : by letting universities host part of the infrastructure, we let them being acknowledged for that (it is currently not done enough), a good list may encourage other universities to invest more in the development of Sage
   * perhaps should we design a "proudly hosting a Sage service" icon for such labs to put on their webpage ?
   * perhaps should we add "proudly hosted by XXX University" on each service hosted by a university ?
   * perhaps should we launch a public "call for universities" to provide various kind of hosting support ?

 * '''extend academic contribution''' : Academics is, by very far, the first founder of Sage development (by the salaries of people spending thousands of hours of research time to work on Sage development). This resource is precious and pretty robust. We should promote it by using it, as public resource has the property to increase while being used. Having academic sysadmins involved in the infrastructure may attract them to enter the game as well. Note, for example that some french sysadmin in Lyon used to host some sage notebooks, and in returns gave us lots of feedback, advices and bug reports. Note that for the current university-hosted services we have been helped by local sysadmins in the setup and testing, we would have to do this work ourselves (the developers) if thoseservices were hosted on some commercial cloud.

 * '''improve overall culture''' : by maintaining those services ourselves:
   * we get ready to maintain the 20+computers farm that is sleeping at UW for about 1 year (those are not going to be administered by cloud sysadmins).
   * we allow more people to understand technical choices and debate about them, not only the few who pretend to know the right way to do
 
 * '''robustness by decentralization''': having everything hosted by a single operator let us take the risk of a global down (due to bad content, unpaid bill, spam, whatever). We saw this with the crash of ask.sagemath.org since spam could let the UW decide to close all other services. If such services are independent, we can serenely work on such issue without a sword of Damocles on the other services.

 * '''direct contact with the system administrators hosting the VM''' : can be very useful for having physical acces to the VM, allowing outgoing SMTP connections (which are [[https://cloud.google.com/compute/docs/tutorials/sending-mail/|disallowed by GCE]] hence requiring using yet another third-party provider as a workaround, [[https://groups.google.com/d/msg/sagemath-admins/wEfrWR_LeKk/IbDPlUp9AwAJ|see this post]] [[https://groups.google.com/d/msg/sage-devel/Er2oTyG5NzY/niQKkR6FAwAJ|or this post]]), etc...

 * '''very-long-term support''' : the Universities exist for many centuries and are not likely to die soon :P


=== Invalid arguments against academic hosting ===

 * "''Why move to GCE from UW?   (1) the machines at UW are not backed up at all!   -- I assumed a certain student had them backed up, but nope; in fact, we can't even ssh into the VM host right now (obviously, I could get physical access).''" [[http://article.gmane.org/gmane.comp.mathematics.sage.devel/84894|see this post]]
   * The problem is not University hosting, the problem is student exploitation

 * "''But I think that the current state of affairs shows all too well how bad in the long run would be to host such things like trac away at a university, with only very few persons having access in a case of emergency like the current one. So I think that the opposition to GCE hosting has no arguments in its favour left.''" [[http://article.gmane.org/gmane.comp.mathematics.sage.devel/86954|see this post]]
  * The problem is not University hosting, the problem is a lack of a strong syadmin collective. Cloud hosting will not solve this issue. Whe have to change our way of thinking and behaving in the Sage community with that respect.

 * Commercial cloud is better because "''anybody can be added as admins''" [[http://article.gmane.org/gmane.comp.mathematics.sage.devel/86991|see this post]]
   * The problem is not University hosting, see how many people have access to ask.sagemath.org or sagewiki.lipn.univ-paris13.fr
   * Btw, it is probably better to have a strong and stable collective administering all services transversally, than having "anybody" depend on the service.

 * Commercial cloud is better because "''we can make global backups''" [[http://article.gmane.org/gmane.comp.mathematics.sage.devel/86991|see this post]]
   * University hosting can do that easily, actually we are already setting up a dedicated backup service in a separate place than any public services.

 * Commercial cloud is better because we can "''move the machines to have a presence anywhere in the world (due to many data centers all over)''" [[http://article.gmane.org/gmane.comp.mathematics.sage.devel/86991|see this post]]
   * University hosting can do that easily, actually this is already the case:
      * sagecell is hosted both in Spain and Germany
      * there are 29 working Sage mirrors worldwide, 93% being hosted by universities or research networks

 * "''better (ob)served by Google than the French gov (or any other nation)''" [[https://groups.google.com/forum/#!msg/sage-devel/8-BfX8KxFuI/k69yoHb6AQAJ|see this post]]
   * There are ''evidences'' that google spies on its customers, that it works with with some governments (see e.g. Prism), and even that some governments MITM between the public internet and google cloud.
   * Conversely, i do not see how easy it is for some government to access a VM whose SSL keys are specific to that host. Could someone provide some documented evidence, and an evaluation of the risk for each country ? In any case, there should be enough countries out there to avoid such practices.


=== Advantages of corporate cloud hosting ===
