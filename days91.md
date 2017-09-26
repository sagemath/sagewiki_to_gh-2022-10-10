= Sage Days 91: Open Source Computation and Algebraic Surfaces (Sept. 29 - Oct. 1, 2017) =

Location: Banff International Research Station.

== Schedule ==

[[https://www.birs.ca/events/2017/2-day-workshops/17w2677/schedule]]

== Projects ==

Feel free to add suggestions 

Please add "sd91" as a keyword to any tickets you are working on during this Sage Days so they show up in this list: [[https://trac.sagemath.org/query?keywords=~sd91&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=status|sd91 Tickets]]

'''Lattice related projects'''
  * fix vector matrix multiplication for free module elements [[https://trac.sagemath.org/ticket/23576|#23576]]
  * fix .annihilator() for the trivial abelian group [[https://trac.sagemath.org/ticket/22720|#22720]]
  * use the inner_product_matrix for module comparison [[https://trac.sagemath.org/ticket/23915|#23915]]
  * implement finite bilinear/quadratic forms and make sure that the discriminant group has one [[https://trac.sagemath.org/ticket/23699|#23699]]
  * implement QQ/ZZ , QQ/2ZZ or QQ/nZZ as abelian groups. This is where finite quadratic/bilinear forms have values
  * implement a class for (subgroups of) the orthogonal group of a finite bilinear/quadratic form and an algorithm to compute it
  * diagonalization and isomorphism testing for finite quadratic/bilinear forms
  * create a genus from a signature pair and a finite quadratic form
  * create a finite quadratic form from a genus
  * a latex representation for the genus using the Conway Sloane genus symbols [[https://trac.sagemath.org/ticket/23916|#23916]]
  * a base class for the orthogonal group of a lattice
  * a method to compute the orthogonal group of a positive definite lattice
  * expose more of [[https://github.com/jefferyphein/ternary-birch|Jeffery Hein's lattice code]] than is currently being used for modular forms [[https://trac.sagemath.org/ticket/23342|23342]]

'''Point counting and zeta function projects'''
  * hypergeometric motives: Euler factors at good primes [[https://trac.sagemath.org/ticket/23671|#23671]]; port more of [[https://magma.maths.usyd.edu.au/magma/handbook/hypergeometric_motives|Magma's functionality]]
  * get Edgar Costa's code for zeta functions of projective hypersurfaces into Sage [[https://trac.sagemath.org/ticket/23863|#23863]]
  * package Sebastian Pancratz's code for deformation computation of zeta functions [[https://trac.sagemath.org/ticket/20265|#20265]]
  * implement a (rigorous, sane) test for Weil polynomials. More ambitious: get [[https://github.com/kedlaya/root-unitary|this code]] for exhausting over Weil polynomials into Sage
  * Add Malcolm Kotok's code for zeta functions using the Sperber-Voight algorithm to Sage: [[https://trac.sagemath.org/ticket/19865|#19865]], [[http://hdl.handle.net/1802/30832]]
  * implement the Cayley trick for converting toric complete intersections into toric hypersurfaces

== Tickets needing review ==

  * a class for integral lattices [[https://trac.sagemath.org/ticket/23634|#23634]]

  * bugfix for genera equality testing [[https://trac.sagemath.org/ticket/23376|#23376]]

  * Speedups for reflexive polytopes: [[https://trac.sagemath.org/ticket/22391|#22391]], [[https://trac.sagemath.org/ticket/22391|#22594]]

== To prepare for the workshop ==

Before the workshop, we recommend opening a [[https://trac.sagemath.org/|Sage trac]] account and completing the [[https://www.codecademy.com/|Code Academy]] modules on Python and Git.  If you like you may [[http://www.sagemath.org/|download and install]] the latest version of the source code of Sage, or use the k8s server described below.

== The k8s server ==

William Stein has kindly provided a server for us to use during the workshop, with 48 CPUs and 256 GB of RAM.  It is running !CoCalc, so you can access it from your browser.

=== Creating an Account ===

You should create an account [[https://k8s.sagemath.org/settings|here]].  You will need a secret token, which will be e-mailed to participants (ask an organizer if you can't find it).  Once you have an account, someone will have to add you to the Sage Days 91 project; anyone who is already part of the project can do so from the project settings page.  At that point, you will be able to access the server at [[https://k8s.sagemath.org|k8s.sagemath.org]].

=== Git ===

If you will be doing Sage development, you need to set up a terminal that knows who you are (since we're all using the same user when we log in from the browser).  This way we will be able to share Sage installations on the server.  To set this up, open up a terminal (`~/Terms/Admin.term` exists for this purpose) and run the script `setup_user` (from anywhere).  This will ask you some questions (name, e-mail, trac account info) and create a terminal for you (`~/Terms/$TRAC_USERNAME.term`).  It will also create an ssh key specific to you that you should upload to [[https://trac.sagemath.org/prefs/sshkeys|trac]].  If you're ever interacting with git, you should use this terminal (or the ssh method described below) so that git knows who you are.

Note that by default, it will store your trac password in plain text in a file on the server.  If you don't want it to, just answer "No" to the "store trac password" question, and you'll be asked for it at the beginning of each terminal session.

=== SSH ===

Once you add the public key ''from your laptop'' (generated by `ssh-keygen` and then copied from `~/.ssh/id_rsa.pub` for example) to `~/.ssh/authorized_keys` ''in the browser'', you will be able to SSH into the project using the following command.

{{{ssh 07fd46cb55244d95a2175fa10faa3b36@k8s-ssh.sagemath.org -p 2222}}}

At the beginning of your key in `~/.ssh/authorized_keys` on the server you should add `command=".init_user roed" ` for example.  You can look at the other keys there for examples.

=== Sage installations ===

You can create a new Sage installation for yourself by running 
{{{
new_sage
}}}
at your command prompt, or `new_sage $YOUR_TRAC_USERNAME` at any prompt (replacing `$YOUR_TRAC_USERNAME` with your trac username.  Note that this will take a couple minutes.

The setup described above also means that the `sage` command in your terminal will be aliased to your copy of Sage, and anyone will be able to use your sage install from a Jupyter notebook by selecting the appropriate kernel.

=== Building and Large output ===

Avoid sending huge amounts of output in a terminal, as this slows the whole project down for everybody (proper output truncation isn’t sufficiently implemented).  Here are some options to avoid this.

1. When building Sage, you can do
{{{
./sage -b > output 2>&1
}}}
rather than just sending a large amount of output to your terminal.  You can check on output by typing
{{{
tail output
}}}

2. If you know tmux, do control+b, then c to make a new session, and leave the large-output session in a different session.  You can switch back and forth with control+b then n.

3. If you've set up your terminal as described above, then
{{{
make build
}}}
in your sage folder will do the redirection for you, as well as automatically use many threads (so that the build goes much faster).

== Possible Interest Groups ==

Lattices: Simon Brandhorst, Andreas Malmendier, David Roe, Ichiro Shimada

Zeta functions (Monsky-Washnitzer cohomology/deformation): Jen Balakrishnan, Edgar Costa, Kiran Kedlaya

Zeta functions (Dwork cohomology): Anastassia Etropolski, Heidi Goodson, Tony Várilly-Alvarado, Ursula Whitcher

People of many interests: Jen Berg, Renate Scheidler, Mckenzie West, David Zureick-Brown, Lenny Taelman
