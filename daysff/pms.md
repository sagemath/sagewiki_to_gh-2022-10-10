
Goal--get the examples from the thesis to work 

Pointsearch  

                                 * height zero or one, easy, since we just need a point, we can possibly just do this ourselves 
                                 * eventually need the whole thing, since points might have larger height 
                                 * in the examples they are all height zero or one 
ConcisFF(Kevin)  

                                 * square roots in residue fields and lifts, also conic solving over QQ (auxiliary,i.e. useful in general) 
DescentFF(Kevin and Jen)  

                                 * in the process of being decomposed and doctested/tested 
                                 * need to find intersections of curves (points) -restrict to hight zero or one? 
                                 * find all the singular points? make this case work? 
<a href="/LocSol">LocSol</a>(Aly)  

                                 * needs testing and debugging 
Independent(Jen) 

                                 * needs is_linear_independent method on elliptic curves (mwrank from number field to function field--ask Cremona?) 
                                 * this is dependent on heights 
PointSearchFF  

                                 * immediate goal is height zero and one cases 
<a href="/QuartMin">QuartMin</a>(Gerriet) (<a href="daysff/pms/quartmin_ff.sage">current implementation</a>) 

                                 * finished but not tested 
                                 * UPDATE (6/4): When Kevin and Jen were trying to put everything together, they noticed that this file actually isn't used in DAR's original code. Turns out, if you read his thesis closely, it should in fact *never* be used. So nothing's wrong with his algorithm, we just have an extra file. Kevin and Jen are now discontinuing work on this file. 
Other  

                                 * Need to put the following functions into ell_function_field: 
                                 * * gens() 
                                 * * rank() 
                                 * * torsion_subgroup() (need Mazur's theorem!!!!) 
Typos in Examples  

                                 * compile and fix these 
                                 * p. 34: (3.15) T+36 should be T+56 
                                 * p. 35: should be (d_1, d_2) = ((T+17)(T+25),1) (not (T+17)(T+35)) 
                                 * p. 35: should be (1) (T+17)(T+25)Z<sub>1</sub><sup>2</sup> - Z<sub>2</sub><sup>2</sup> + ... 
                                 * p. 35: should be (2) (T+17)(T+25)Z<sub>1</sub><sup>2</sup> - (T+17)(T+25)Z<sub>3</sub><sup>2</sup> +  ... 
Comments: 

                                 * p. 34: quadric intersection in (3.16) depends on the labeling of two torsion as in (3.14). See TD_full comment at the top of the code. 