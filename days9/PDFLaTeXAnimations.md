

# Animations in LaTeX now easy

One of the main things that <a href="/PowerPoint">PowerPoint</a> used to have up on presentations prepared by pdflatex were animations. It turns out this is easy to do now if you use acroread to display your slides! 

We need the <a class="http" href="http://www.ctan.org/tex-archive/macros/latex/contrib/animate/">animate package</a>. 

As an example, we'll build an example starting from Bill Casselman's <a class="http" href="http://www.math.ubc.ca/~cass/piscript/examples/c3d.eps">rotating Gamma</a> in eps format. 

First, we turn this into a pdf file, using `epstopdf` by calling 
```txt
epstopdf c3d.eps
```
Conversion from eps to pdf is tricky because many programs get the bounding box wrong. This one seems to work. 

The following LaTeX file now does the trick (let's call the file gamma.tex) 
```txt
\documentclass{beamer}
\usepackage{animate}
\begin{document}

\begin{frame}
    \frametitle{Bill's character rotations}
    \begin{center}
        % Set frame rate to 20 frames/sec
        % We use frames 1 through 71. The file really has 72 frames, but the last is
        % identical to the first, which causes a hiccup in the looped animation.
        % See the animate manual for further options. 
        \animategraphics[autoplay,loop,controls]{20}{c3d}{1}{71}
    \end{center}
\end{frame}
\end{document}
```
After making sure we have `animate` installed, we run 
```txt
pdflatex gamma.tex
```
and the resulting file <a href="days9/PDFLaTeXAnimations/gamma.pdf">gamma.pdf</a> produces a nice animation when viewed with `acroread`. 
