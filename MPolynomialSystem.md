

# MPolynomialSystem


## Introduction

This page's purpose is to describe the design of a MPolynomialSystem class. This class is supposed to model multivariate polynomial systems as they e.g. appear in algebraic cryptanalysis. The proposed and almost implemented design is as follows. There is a class MPolynomialSystem which models the actual polynomial system. Also there is a base class called MPolynomialSystemGenerator which is meant as a base class for specific generators for polynomial systems like AES or the Courtois Toy Cipher. 


## MPolynomialSystem

see <a href="http://trac.sagemath.org/sage_trac/ticket/681">http://trac.sagemath.org/sage_trac/ticket/681</a> 


## MPolynomialSystemGenerator

see <a href="http://trac.sagemath.org/sage_trac/ticket/681">http://trac.sagemath.org/sage_trac/ticket/681</a> 


## Implemented Polynomial System generators

* AES; see <a href="http://trac.sagemath.org/sage_trac/ticket/681">http://trac.sagemath.org/sage_trac/ticket/681</a> 
* CTC; not published yet 

## Example


```python
#!python 
sage: sr = mq.SR(1,1,1,4,gf2=True)
sage: sr
SR(1,1,1,4)

sage: F,s = sr.polynomial_system();
sage: F
Polynomial System with 56 Polynomials in 20 Variables

sage: s
{k003: 0, k002: 1, k001: 1, k000: 0}

sage: F.groebner_basis()
[k003, k001 + k002, k000 + k002 + 1, s003 + k001 + k002 + 1, s002 + k001 + k002 + 1, s001 + s003 + k001 + k002 + k003, s000 + s002 + s003 + k001 + k003 + 1, w103 + k003, w102 + k002 + 1, w101 + k001 + 1, w100 + k000 + 1, x103 + s003, x102 + x103 + s002 + s003, x101 + x102 + x103 + s001 + s002 + s003, x100 + x103 + s000 + s003 + 1, k103 + s001 + s002 + s003 + 1, k102 + s000 + s001 + s002 + 1, k101 + s000 + s001 + s003 + 1, k100 + s000 + s002 + s003, k002^2 + k002]
```