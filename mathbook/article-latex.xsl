<?xml version='1.0'?> <!-- As XML file -->
<!-- Identify as a stylesheet -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!-- Intend output for rendering by pdflatex -->
<xsl:output method="text" />

<xsl:template match="/article">\documentclass{article}
%% Page layout
\usepackage{geometry}
\geometry{letterpaper,total={5.0in,9in}}
%% Symbols, align environment, bracket-matrix
\usepackage{amsmath}
%% Theorem-like environments
\usepackage{amsthm}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}{Corollary}
\newtheorem{lemma}{Lemma}
%% Convenience macros
<xsl:value-of select="macros" />
%% Title information
\title{<xsl:value-of select="title" />}
\author{<xsl:value-of select="author" />\\
\texttt{<xsl:value-of select="email" />}\\
<xsl:value-of select="department" />\\
<xsl:value-of select="institution" />
}
\date{<xsl:value-of select="date" />}
\begin{document}
\maketitle
<xsl:apply-templates select="p|theorem|lemma|corollary" />
\end{document}
</xsl:template>

<xsl:template match="theorem|corollary|lemma">
<xsl:apply-templates select="statement" />
<xsl:apply-templates select="proof" />
</xsl:template>

<xsl:template match="theorem/statement">\begin{theorem}
<xsl:apply-templates select="p"/>\end{theorem}
%
</xsl:template>

<xsl:template match="corollary/statement">\begin{corollary}
<xsl:apply-templates select="p"/>\end{corollary}
%
</xsl:template>

<xsl:template match="lemma/statement">\begin{lemma}
<xsl:apply-templates select="p"/>\end{lemma}
%
</xsl:template>

<xsl:template match="proof">\begin{proof}
<xsl:apply-templates select="p"/>\end{proof}
%
</xsl:template>


<xsl:template match="p"><xsl:apply-templates />\par
%
</xsl:template>


<!-- Math  -->

<xsl:template match= "m">\(<xsl:value-of select="." />\)</xsl:template>

<xsl:template match="dm">\[<xsl:value-of select="." />\]</xsl:template>

<xsl:template match="am">\begin{align*}<xsl:value-of select="." />\end{align*}</xsl:template>


<!-- Lists -->

<xsl:template match="ol">\begin{enumerate}
<xsl:apply-templates select="li"/>\end{enumerate}
%
</xsl:template>

<xsl:template match="ul">\begin{itemize}
<xsl:apply-templates />\end{itemize}
%
</xsl:template>

<xsl:template match="li">\item <xsl:apply-templates />
</xsl:template>



<!-- <xsl:template match="@*|node()"></xsl:template> -->




</xsl:stylesheet>