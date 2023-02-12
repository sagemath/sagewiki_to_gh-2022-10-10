
At <a href="/days9">Sage Days 9</a>, I (<a href="/DanDrake">DanDrake</a>) gave two talks on using graphics with LaTeX. The slides, in source and PDF format, are available here. PDF of my first talk: <a href="DanDrake/Days9Talks/graphics-talk-1.pdf">graphics-talk-1.pdf</a> , and LaTeX source (and images) of my first talk: <a href="DanDrake/Days9Talks/sd9-talk-1.tar.gz">sd9-talk-1.tar.gz</a> . 

PDF of the second talk: <a href="DanDrake/Days9Talks/graphics-talk-2.pdf">graphics-talk-2.pdf</a> and source file: <a href="DanDrake/Days9Talks/graphics-talk-2.tex">graphics-talk-2.tex</a> . The materials for both talks are licensed under the <a class="http" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-Share Alike 3.0 Unported License</a>. 

*CORRECTION!* In the second talk, I claimed that the arXiv does not support TikZ. I am very glad to be wrong about this; you *can* submit papers with TikZ figures to the arXiv -- see <a class="http" href="http://arxiv.org/abs/0708.0245">arxiv:0708.0245</a> for an example. They may not have the newest version of PGF/TikZ, though. 

**A note of warning:** you really need PGF/TikZ version 2.00 to compile the slides from the first talk. Right now, TeXShop doesn't include this, and nor does Ubuntu Hardy. (Intrepid, version 8.10, has the necessary version). I have no idea what the state of affairs is with Windows. To fix this in OS X: 

* download <a class="http" href="http://sourceforge.net/projects/pgf/">PGF</a> 
* extract the package. You get a directory `pgf-2.00` 
* create the directories `~/Library/texmf/tex/generic` 
* move the `pgf-2.00` directory into the `generic` directory you just created. 
* in a terminal, go to the `~/Library/texmf` directory and run "`texhash .`" (note the dot!) 
In Ubuntu, it's almost the same thing, but create a directory `/usr/local/share/texmf/tex/generic` and put the PGF package there, just as above, and run "`sudo texhash .`" from the `texmf` directory. 

In Windows you are on your own. Free free to edit this page if you know what to do. 

This all seems very complicated, and it is because (1) a complete TeX system relies on tens of thousands of files, and (2) the system for finding the right file dates to the 80's. If you'll pardon the massive understatement, it's a bit crufty. 

<a href="/NilsBruin">NilsBruin</a> says: There is actually an easy way of putting animations in pdf-presentations created by LaTeX. See the <a href="/days9/PDFLaTeXAnimations">LaTeX animations</a> page. 
