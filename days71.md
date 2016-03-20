= Sage Days 71: Explicit p-adic methods in number theory (March 20-24, 2016) =

'''Organizers''': Jennifer Balakrishnan, David Roe

Location: Oxford, UK

Funding: Clay Mathematics Institute and the Beatrice Yormark Fund for Women in Mathematics

== Schedule and Participants ==

[[days71schedule |Workshop schedule]]

[[days71abstracts | Talk abstracts and slides]]

[[days71participants | Workshop participants]]

== Topics ==

We'll have morning talks on the following topics, with afternoons and evenings dedicated to related projects.

=== p-adic methods for zeta functions ===

Beginning with Kedlaya's algorithm in 2001, ''p''-adic methods have seen practical use in counting points on curves and varieties over finite fields.  This information is traditionally packaged into a generating function, known as a zeta function, which satisfies a functional equation analogous to the classical zeta function.  Recently, Harvey has given an algorithm to compute zeta functions of hyperelliptic curves in average polynomial time.

=== Explicit computations in Iwasawa theory ===

In 2006, Mazur, Stein, and Tate gave an algorithm for the fast computation of ''p''-adic heights on elliptic curves. This has since inspired a flurry of activity on computations related to the ''p''-adic Birch and Swinnerton-Dyer Conjecture and conjectures in Iwasawa theory: in particular, on ''p''-adic heights, ''p''-adic regulators, ''p''-adic ''L''-functions, and ''p''-primary components of the Shafarevich-Tate group.

=== Overconvergent modular symbols and p-adic L-functions ===

One can situate classical modular forms in an infinite dimensional ''p''-adic Banach space of overconvergent modular forms, where the classical forms' integral weights sit densely within a ''p''-adic analytic weight space.  Similarly, overconvergent modular symbols interpolate classical modular symbols and ''p''-adic ''L''-functions interpolate classical ''L''-functions.  Recently, Pollack and Harron have led a group working on Sage code for computing with these objects using a paper of Pollack and Stevens.  The code is [[http://trac.sagemath.org/ticket/812|functional]] and is currently being extended to families of overconvergent modular symbols.

=== Motivic integration and orbital integrals ===

Orbital integrals play a fundamental role in trace formulas and their applications to the Langlands program.  Hales has been pursuing a program to practically compute these integrals using motivic integration.  The methods used in these computations differ from the other projects in that ''p'' is not fixed at the beginning of the computation.  Instead, the end result is motivic, and can be evaluated for a particular prime using algorithms for computing zeta functions as in the first project.

=== p-adic Precision and Sage ===
 
This project will focus on implementing various core p-adic functionality in Sage, especially precision models for arithmetic with polynomials, matrices, and power series.  Other goals include improving the coercion between p-adic fields and their residue fields, working on p-adic fields that are neither unramified nor totally ramified, and adding completions for number fields.  

=== Variations on the Chabauty-Coleman method and rational points on curves ===

By Faltings' Theorem, curves of genus at least 2 over number fields ''K'' have finitely many ''K''-rational points; however, the proof is not effective and thus does not yield an algorithm. Nevertheless, under certain hypotheses on the Jacobian of the curve, the method of Chabauty-Coleman can produce these points. Recently, Kim has proposed a nonabelian analogue.  In the last few years, explicit examples of Kim's program have been studied for elliptic and hyperelliptic curves, using ''p''-adic Hodge theory and local ''p''-adic heights.

== Getting started ==

== Sage Math Cloud Project ==

We'll be using a [[https://cloud.sagemath.com/projects/6883ce8a-99c6-4d78-a678-34bfff8afa39|Sage Math Cloud project]] for development during the workshop.  If you need access, email [[mailto:roed@pitt.edu|David]].

=== Setting up terminals ===

You should set up a terminal for using git and for using Sage.  Open `~/Terms/Admin.term` and then

{{{
~$ cd ~/Terms/
~/Terms$ ./setup_gitterm.py
Your name (for git commits): <TYPE YOUR FULL NAME>
Your email (for git commits): <TYPE YOUR EMAIL>
Your trac username: <TYPE YOUR TRAC USERNAME>
Do you want to save your trac password? [y/N] <CHOOSE Y OR N>
Your trac password: <TYPE YOUR TRAC PASSWORD>
}}}
If you have it save your trac password, it will be stored in plaintext in ~/Terms/.USERNAME_git.term.init (though only accessible to people at this workshop).  If not, you'll need to type your password when you open the terminal and it will be stored in a bash environment variable.  If you're not happy with either option, talk to David.

You can then create a terminal for working on each project.
{{{
~/Terms$ ./join_group.py --help
usage: join_group.py [-h]
                     {Chabauty,Prec,Zeta,Iwasawa,Overconvergent,Motivic} users
                     [users ...]
 
Create terminals for users interested in working on a given project. They
alias the correct copy of Sage.
 
positional arguments:
  {Chabauty,Prec,Zeta,Iwasawa,Overconvergent,Motivic}
                        which project to create terminals for
  users                 users to create terminals for.
 
optional arguments:
  -h, --help            show this help message and exit
~/Terms$ ./join_group NAME_OF_PROJECT YOUR_TRAC_USERNAME
}}}

== Relevant trac tickets ==

[[days71tickets |Open tickets ]]
