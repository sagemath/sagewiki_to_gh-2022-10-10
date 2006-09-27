Describe sd2-padicArithmetic here.

{{{
---------- Forwarded message ----------
Date: Wed, 27 Sep 2006 12:26:36 -0400
From: David Harvey <dmharvey@math.harvard.edu>
To: Iftikhar Burhanuddin <burhanud@usc.edu>
Cc: sage-devel@lists.sourceforge.net
Subject: Re: [SAGEdev] p-adic nonsense?

On Sep 27, 2006, at 10:42 AM, Iftikhar Burhanuddin wrote:

> BTW can you make a todo list (more than just bugs ... we have trac for
> that) for p-adic arithmetic (possibly on the SD2 wiki page)? It'll  
> come in
> handy when we discuss overhauling the current p-adic nonsense :) at
> Seattle.

The reason I'm working on the bugs now is that I need p-adics to work  
a bit better for the p-adic heights application.

I propose the following long-term plan for p-adics in SAGE:

(1) Research how other people have done it, both *implementation* and  
*interface*. This includes studying MAGMA, PARI, and that local  
fields library that was mentioned on this list a few weeks back.  
Possibly others that I don't know about. It also includes a  
literature search, both in mathematics and computer science. It  
includes analyses of performance, both theoretical and maybe even  
actual performance.

(2) Come up with our own ideal interface. The interface should  
support an implementation which takes into account (at least) the  
following issues:

(a) Obviously, fast arithmetic, for small p, large p, p = 2, large  
precision, small precision... all bases must be covered.
(b) Fast conversions between p-adic integers, p-adic rationals, plain  
integers and rationals, and the quotient rings Z/p^n Z (wherever  
these conversions make sense)
(c) Finite extensions of p-adic fields... heh... ramified and  
unramified cases... :-). I want to be able to take a general number  
field and construct the local field corresponding to a selected prime  
ideal.
(d) Fast polynomial arithmetic with p-adic coefficients (this is much  
trickier than it sounds at first... you can throw all the usual  
algorithms out the window if the precision of the coefficients varies  
a lot)

(3) Throw out the current p-adic implementation/interface entirely,  
and quickly write a new, inefficient (but correct!) implementation in  
python which has the *right interface*. I'm not at all convinced that  
our current interface (prec, ordp, big_oh, etc) is the right one. In  
fact I often find it quite confusing. Is this what MAGMA does?

(4) Later, we can write the efficient version, either in C/Pyrex  
ourselves, or using an external library.

I think it's crucial that someone (who knows what they are doing)  
puts in the hard work in step (1). Otherwise someone is going to  
waste a lot of time on the other steps. William I think mentioned  
earlier that MAGMA has already been through three or four  
implementations (even interfaces!) for p-adics.

You can stick any of this on the wiki if you like.

David

}}}
