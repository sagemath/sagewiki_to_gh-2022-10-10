= NTL wrapper =

 NTL wrapper -- Joel Mohler, Robert Bradshaw, Craig Citro, David Roe, William Stein, Martin Albrecht, Gonzalo Tornaria


Call to arms email from David Harvey:
{{{
Last night Craig suggested that we should maybe devote some serious  
SD5 time to working on the NTL wrapper(s).

I don't think there's going to be enough time to actually do all the  
coding, and I'm not sure that it should be displacing other things,  
but definitely I think it would be an excellent idea to have a  
discussion meeting. Perhaps Monday afternoon or evening so that  
Robert can join in.

The thing is, we currently have *five* developers pretty actively  
working on NTL-related code: Joel, Robert, Craig, David Roe, and  
myself. This is a historic opportunity to finally Get It Right, while  
we have everyone's attention focussed.

So I propose the following: we should have a meeting, with the  
following goals:

(a) get some idea of what is the current status of NTL-related code
(b) figure out where we want it all to be
(c) come up with a rough plan of how we're going to get there, over  
the next few weeks perhaps
(d) get some of (c) and (d) *written down*

Here are some of the issues I identify:

(1) a consistent naming schemes for type, functions in the wrapper  
(Joel has already been doing a splendid job with this, but I think  
there's still a lot to do)
(2) a uniform interface for conversions to/from NTL objects, and  
efficient underlying conversion code
(3) I claim that ZZ_p::init, ZZ_pE::init should *never* be called, it  
should all go through Context objects
(4) what is the point of a zz_p wrapper?
(5) pointers or references? What's the best way to wrap? Can we do  
this consistently?
(6) how to minimise code duplication between the libs.ntl wrapper and  
SAGE classes that use NTL directly (or that soon will use NTL directly)
(7) memory management? When to use new? Placement new?

I think the most import thing that can come out of this meeting is an  
RFC-like document... "the NTL wrapper MUST do XYZ..... the NTL  
wrapper SHOULD do ABC....."
}}}
