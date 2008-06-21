[[TableOfContents]]

= Quantitative Finance in Sage =

[[ImageLink(mrw.png)]]

= PEOPLE =
  * [:WilliamStein:William Stein]
  * [:GlennTarbox:GlennTarbox]
  * Brett Nakashima
  * Christopher Swierczewski

= GROUP =
  http://groups.google.com/group/sage-finance

= LINKS =
  http://wiki.sagemath.org/GlennTarbox/QuantFin

= HG REPO =

ghtdak's repo, which he (I) uses internally to sync all my machines, is both a gitweb style http server and a repo
which can be pulled / cloned from.  You can't push to it... (you wouldn't want to do that anyway)

http://tarbox.org:9000

browse away... but if you want to clone / pull, you should read the mercurial docs... but some hints.

If you want a clean all by itself repo with all the history from the beginning of time:

{{{
cd /tmp; mkdir ghtpull; cd ghtpull; hg clone http://tarbox.org:9000; 
mv tarbox.org:9000 sage-ght
}}}

remember about branches.  Some helpful commands

 * hg help branches
 * hg help branch
 * hg help clone
 * hg update -C finpatch 
