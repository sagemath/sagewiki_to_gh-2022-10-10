I gave two talks on using graphics with LaTeX. The slides, in source and PDF format, are available here.PDF of my first talk: attachment:graphics-talk-1.pdf , and LaTeX source (and images) of my first talk: attachment:sd9-talk-1.tar.gz

One warning: you really need PGF/TikZ version 2.00 to compile the slides. Right now, TeXShop doesn't include this, and nor does Ubuntu. I have no idea what the state of affairs is with Windows. To fix this in OS X:

 * download [http://sourceforge.net/projects/pgf/ PGF]
 * extract the package. You get a directory `pgf-2.00`
 * create the directories `~/Library/texmf/tex/generic`
 * move the `pgf-2.00` directory into the `generic` directory you just created.
 * in a terminal, go to the `~/Library/texmf` directory and run "`texhash .`" (note the dot!)

In Ubuntu, it's almost the same thing, but create a directory `/usr/local/share/texmf/tex/generic` and put the PGF package there, just as above, and run "`sudo texhash .`" from the `texmf` directory.

In Windows you are on your own. 

This all seems very complicated, and it is because (1) a complete TeX system relies on tens of thousands of files, and (2) the system for finding the right file dates to the 80's.

[Nils Bruin] There is actually an easy way of putting animations in pdf-presentations created by LaTeX. See the [:days9/PDFLaTeXAnimations: LaTeX animations] page.
