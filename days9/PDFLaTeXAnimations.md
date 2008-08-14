= Animations in LaTeX now easy =

One of the main things that PowerPoint used to have up on presentations prepared by pdflatex were animations. It turns out this is easy to do now if you use acroread to display your slides!

We need the [http://www.ctan.org/tex-archive/macros/latex/contrib/animate/ animate package].

As an example, we'll build an example starting from Bill Casselman's [http://www.math.ubc.ca/~cass/piscript/examples/c3d.eps rotating Gamma] in eps format.

First, we turn this into a pdf file, using {{{epstopdf}}} by calling
{{{
epstopdf c3d.eps
}}}
Conversion from eps to pdf is tricky because many programs get the bounding box wrong. This one seems to work.

The following LaTeX file now does the trick (let's call the file gamma.tex)
{{{
\documentclass{beamer}
\usepackage{animate}
\begin{document}

\begin{frame}
    \frametitle{Bill's character rotations}
    \begin{center}
        % Set frame rate to 12 frames/sec. Load frames from setanim.pdf.
        % We will use all frames, so there is no need to specify a start
        % and end frame.
        \animategraphics[autoplay,loop,controls]{20}{c3d}{1}{71}
    \end{center}
\end{frame}
\end{document}
}}}
After making sure we have {{{animate}}} installed, we run
{{{
pdflatex gamma.tex
}}}
and the resulting file {{{gamma.pdf}}} does the trick when viewed with {{{acroread}}}
