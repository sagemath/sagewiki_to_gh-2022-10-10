## Please edit system and help pages ONLY in the master wiki!
## For more information, please see MoinMoin:MoinDev/Translation.
## IMPORTANT NOTE:
## When you use this page as a template for creating your project's groups page:
##  * please remove all lines starting with two hashes (##)
##  * except the acl line, please keep that, but remove one hash, so it reads #acl ...
##  * fix the acl line so it has the correct page instead of the sample Project/AdminGroup
##  * the "ME" will be automatically replaces with your name when you save the page
##acl Project/AdminGroup:read,write,delete,revert
##master-page:Unknown-Page
##master-date:Unknown-Date
#format wiki
#language en

Goal--get the examples from the thesis to work

Pointsearch 
            *height zero or one, easy, since we just need a point, we can possibly just do this ourselves
            *eventually need the whole thing, since points might have larger height
            *in the examples they are all height zero or one

ConcisFF(Kevin) 
            *square roots in residue fields and lifts, also conic solving over QQ (auxiliary,i.e. useful in general)

DescentFF(Kevin and Jen) 
            *in the process of being decomposed and doctested/tested
            *need to find intersections of curves (points) -restrict to hight zero or one?
            *find all the singular points? make this case work?

LocSol(Aly) 
            *needs testing and debugging

Independent(Jen)
            *needs is_linear_independent method on elliptic curves (mwrank from number field to function field--ask Cremona?)
            *this is dependent on heights

PointSearchFF 
            *immediate goal is height zero and one cases

QuartMin(Gerriet) 
            *finished but not tested

Other 
            *decide classes, i.e. where these go and how to get them into trac

Typos in Examples 
            *compile and fix these
            * p. 34: (3.15) T+36 should be T+56
            * p. 35: should be (d_1, d_2) = ((T+17)(T+25),1) (not (T+17)(T+35))
            * p. 35: should be (1) (T+17)(T+25)Z,,1,,^2^ - Z,,2,,^2^ + ...
            * p. 35: should be (2) (T+17)(T+25)Z,,1,,^2^ - (T+17)(T+25)Z,,3,,^2^ +  ...
Comments:
            * p. 34: quadric intersection in (3.16) depends on the labeling of two torsion as in (3.14). See TD_full comment at the top of the code.
