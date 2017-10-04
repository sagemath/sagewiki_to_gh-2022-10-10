= Sage Days 91: Open Source Computation and Algebraic Surfaces (Sept. 29 - Oct. 1, 2017) =

Location: Banff International Research Station.

== Schedule ==

[[https://www.birs.ca/events/2017/2-day-workshops/17w2677/schedule]]

== Projects ==

Feel free to add suggestions 

Please add "sd91" as a keyword to any tickets you are working on during this Sage Days so they show up in this list: [[https://trac.sagemath.org/query?keywords=~sd91&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=status|sd91 Tickets]]

'''Lattice related projects'''
  * fix vector matrix multiplication for free module elements [[https://trac.sagemath.org/ticket/23576|#23576]] (David)
  * implement finite bilinear/quadratic forms and make sure that the discriminant group has one [[https://trac.sagemath.org/ticket/23699|#23699]] (Simon)
  * implement a class for (subgroups of) the orthogonal group of a finite bilinear/quadratic form and an algorithm to compute it
  * diagonalization and isomorphism testing for finite quadratic/bilinear forms
  * create a genus from a signature pair and a finite quadratic form
  * create a finite quadratic form from a genus
  * a base class for the orthogonal group of a lattice
  * a method to compute the orthogonal group of a positive definite lattice
  * expose more of [[https://github.com/jefferyphein/ternary-birch|Jeffery Hein's lattice code]] than is currently being used for modular forms [[https://trac.sagemath.org/ticket/23342|23342]]

'''Point counting and zeta function projects'''
  * hypergeometric motives: 
    * port more of [[https://magma.maths.usyd.edu.au/magma/handbook/hypergeometric_motives|Magma's functionality]]; see [[https://trac.sagemath.org/ticket/23952|#23952]]
    * find (or compute) the list of HGMs which are K3 surfaces
  * get Edgar Costa's code for zeta functions of projective hypersurfaces into Sage [[https://trac.sagemath.org/ticket/23863|#23863]]
  * package Sebastian Pancratz's code for deformation computation of zeta functions [[https://trac.sagemath.org/ticket/20265|#20265]]
  * Get [[https://github.com/kedlaya/root-unitary|this code]] for exhausting over Weil polynomials into Sage: [[https://trac.sagemath.org/ticket/23946|#23946]] 
  * Add Malcolm Kotok's code for zeta functions using the Sperber-Voight algorithm to Sage: [[https://trac.sagemath.org/ticket/19865|#19865]], [[http://hdl.handle.net/1802/30832]]
  * implement the Cayley trick for converting toric complete intersections into toric hypersurfaces
  * Fix the !IntegerVectors documentation to point to !IntegerListsLex [[https://trac.sagemath.org/ticket/23939|#23939]]

== Tickets needing review ==

  * allow inner products of free modules to take values in rings different from the base ring. [[https://trac.sagemath.org/ticket/23958|#23958]]
  * a minor bugfix in the Genus class [[https://trac.sagemath.org/ticket/23955|#23955]]
  * a latex representation for the genus using the Conway Sloane genus symbols [[https://trac.sagemath.org/ticket/23916|#23916]]
  * Speedups for reflexive polytopes: [[https://trac.sagemath.org/ticket/22391|#22391]], [[https://trac.sagemath.org/ticket/22524|#22524]]
  * iterator for hypergeometric motives [[https://trac.sagemath.org/ticket/23953|#23953]]

== Positively Reviewed Tickets ==

  * has_cyclotomic_factor for polynomials [[https://trac.sagemath.org/ticket/23948|#23948]]
  * bugfix for genera equality testing [[https://trac.sagemath.org/ticket/23376|#23376]]
  * use the inner_product_matrix for module comparison [[https://trac.sagemath.org/ticket/23915|#23915]]
  * a class for integral lattices [[https://trac.sagemath.org/ticket/23634|#23634]]
  * fix .annihilator() for the trivial abelian group [[https://trac.sagemath.org/ticket/22720|#22720]] 
  * hypergeometric motives: Euler factors at good primes [[https://trac.sagemath.org/ticket/23671|#23671]]
  * Reciprocal transfrom for polynomials [[https://trac.sagemath.org/ticket/23947|#23947]]
  * implement a (rigorous, sane) test for Weil polynomials: [[https://trac.sagemath.org/ticket/23945|#23945]]
  * implement QQ/ZZ , QQ/2ZZ or QQ/nZZ as abelian groups. This is where finite quadratic/bilinear forms have values [[https://trac.sagemath.org/ticket/23944|#23944]]

== To prepare for the workshop ==

Before the workshop, we recommend opening a [[https://trac.sagemath.org/|Sage trac]] account and completing the [[https://www.codecademy.com/|Code Academy]] modules on Python and Git.  If you like you may [[http://www.sagemath.org/|download and install]] the latest version of the source code of Sage, or use the k8s server described below.

== The k8s server ==

William Stein has kindly provided a server for us to use during the workshop, with 48 CPUs and 256 GB of RAM.  It is running !CoCalc, so you can access it from your browser.

=== Creating an Account ===

You should create an account [[https://k8s.sagemath.org/settings|here]].  You will need a secret token, which will be e-mailed to participants (ask an organizer if you can't find it).  Once you have an account, someone will have to add you to the Sage Days 91 project; anyone who is already part of the project can do so from the project settings page.  At that point, you will be able to access the server at [[https://k8s.sagemath.org|k8s.sagemath.org]].

=== Git ===

If you will be doing Sage development, you need to set up a terminal that knows who you are (since we're all using the same user when we log in from the browser).  This way we will be able to share Sage installations on the server.

If you provided your trac username to Simon, the setup has been done for you.  Otherwise, open up a terminal (`~/Terms/Admin.term` exists for this purpose) and run the script `setup_user` (from anywhere).  This will ask you some questions (name, e-mail, trac account info) and create a terminal for you (`~/Terms/$TRAC_USERNAME.term`).  If you're ever interacting with git, you should use this terminal (or the ssh method described below) so that git knows who you are.

=== Trac Passwords ===

You have the option of storing your trac password (in a plain text file on the server, so don't do so if your trac password is sensitive).  You can control how your trac password is handled by the scripts `set_trac_password` and `unset_trac_password` from your terminal.  If you don't store your trac password in a file, you will be prompted for it when you open your terminal.

=== Editor ===

When you make a git commit, you can specify the commit message on the command line with the `-m` flag.  Otherwise, git will open an editor for you to enter the commit message.  The default editor is Vim.  If you would rather use a different editor (such as emacs), you can set your editor by running the `set_editor` script in your terminal.

=== SSH ===

==== SSHing into the project ====

Instead of using the browser, you can also SSH into the project and work in a terminal on your laptop.

Once you add the public key ''from your laptop'' (generated by `ssh-keygen` and then copied from `~/.ssh/id_rsa.pub` for example) to `~/authorized_keys` ''in the browser'', you will be able to SSH into the project using the following command.

{{{ssh 07fd46cb55244d95a2175fa10faa3b36@k8s-ssh.sagemath.org -p 2222}}}

At the beginning of your key in `~/authorized_keys` on the server you should add `command=".init_user roed" ` for example.  You can look at the other keys there for examples.

==== Setting up SSH keys for trac ====

If you want to be able to push changes to trac, you need to upload your key from the k8s server to [[https://trac.sagemath.org/prefs/sshkeys|trac]].  You can find your ssh key by running `show_ssh_key` in your terminal.

=== Sage installations ===

If you provided your trac username to Simon, you should have a Sage install in `~/Src`.  If not, you can create a new Sage installation for yourself by running 
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

Lattices: Jen Berg, Simon Brandhorst, Amy Feaver, Andreas Malmendier, David Roe, Ichiro Shimada

Zeta functions (Monsky-Washnitzer cohomology/deformation): Jen Balakrishnan, Edgar Costa, Kiran Kedlaya

Zeta functions (Dwork cohomology): Heidi Goodson, Renate Scheidler, Mckenzie West, Ursula Whitcher

People of many interests:  David Zureick-Brown, Lenny Taelman
