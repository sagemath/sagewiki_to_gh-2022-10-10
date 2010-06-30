print "start";
li4=[];
li41=[];
li42=[];
li43=[];
li44=[];
li45=[];
li8=[];
li81=[];
li82=[];
li83=[];
li84=[];
li85=[];
li86=[];
li87=[];
li88=[];
li89=[];
li810=[];
li811=[];
li812=[];
li813=[];
li814=[];
li815=[];
li816=[];
li817=[];
li818=[];
c1=vector([ round(1/3,3), round(1/12.0,4), round(1/24.0,4), round( 1/12.0,4), round( 1/4.0,4), round(1/12.0,4), round(1/24.0,4), round(1/12.0 ,2) ]);
c2=vector([ round(1/4,4), round(1/12.0,4), round(1/24.0,4), round(1/12.0,4), round(1/3.0,4), round(1/12,4), round(1/24,4), round(1/12 ,2) ]);
c3=vector([ round(1/4,4), round(1/12,4), round(1/12,4), round(1/12,4), round(1/4,4), round(1/12,4), round(1/12,4), round(1/12 ,2) ]);
c4=vector([ round(7/24,4), round(1/12,4), round(1/24,4), round(1/12,4), round(7/24,4), round(1/12,4), round(1/24,4), round(1/12 ,2) ]);
c5=vector([ round(1/8,4), round(0,4), round(5/24,4), round(1/6,4), round(1/8,4), round(0,4), round(5/24,4), round(1/6 ,2) ]);
c6=vector([ round(1/8,4), round(1/12,4), round(1/6,4), round(1/12,4), round(1/8,4), round(1/12,4), round(1/4,4), round(1/12 ,2) ]);
c7=vector([ round(1/6,4), round(1/12,4), round(1/6,4), round(1/12,4), round(1/6,4), round(1/12,4), round(1/6,4), round(1/12 ,2) ]);
c8=vector([ round(1/2,4), round(0,4), round(1/12,4), round(1/6,4), round(0,4), round(0,4), round(1/12,4), round(1/6 ,2) ]);
c9=vector([ round(1/2,4), round(1/12,4), round(1/6,4), round(1/12,4), round(0,4), round(1/12,4), round(0,4), round(1/12 ,2) ]);
c10=vector([ round(13/24,4), round(1/12,4), round(1/24,4), round(1/12,4), round(1/24,4), round(1/12,4), round(1/24,4), round(1/12 ,2) ]);
c11=vector([ round(1/4,4), round(1/12,4), round(1/6,4), round(1/12,4), round(1/4,4), round(1/12,4), round(0,4), round(1/12 ,2) ]);
c12=vector([ round(1/4,4), round(0,4), round(1/12,4), round(1/6,4), round(1/4,4), round(0,4), round(1/12,4), round(1/6 ,2) ]);
c13=vector([ round(1/8,4), round(1/12,4), round(5/24,4), round(1/12,4), round(1/8,4), round(1/12,4), round(5/24,4), round(1/12 ,2) ]);
c14=vector([ round(3/16,4), round(1/12,4), round(1/6,4), round(1/12,4), round(7/48,4), round(1/12,4), round(1/6,4), round(1/12 ,2) ]);
c15=vector([ round(7/48,4), round(1/12,4), round(1/6,4), round(1/12,4), round(3/16,4), round(1/12,4), round(1/6,4), round(1/12 ,2) ]);
c16=vector([ round(1/2,4), round(1/12,4), round(1/24,4), round(1/12,4), round(1/12,4), round(1/12,4), round(1/24,4), round(1/12 ,2) ]);
c17=vector([ round(7/12,4), round(1/12,4), round(1/24,4), round(1/12,4), round(0,4), round(1/12,4), round(1/24,4), round(1/12 ,2) ]);
c18=vector([ round(1/2,4), round(1/12,4), round(1/12,4), round(1/12,4), round(0,4), round(1/12,4), round(1/12,4), round(1/12 ,2) ]);
d1=vector([round(1/2,4), 0, round(1/6, 2), round(1/3, 2)]);
d2=vector([round(1/2,4), round(1/6, 2), round(1/6, 2), round(1/6, 2)]);
d3=vector([round( 1/4,4), round( 1/6,4), round( 5/12,4), round( 1/6,2) ]);
d4=vector([round( 1/4,4), 0, round(5/12,4), round(1/3,2) ]);
d5=vector([ round(7/12,4), round(1/6,4), round(1/12,4), round(1/6,2) ]);
d6=vector([round( 1/3,4), round(1/6,4), round( 1/3,4), round( 1/6,2) ]);
group41=0;
group42=0;
group43=0;
group44=0;
group45=0;
group4=0;
group81=0;
group82=0;
group83=0;
group84=0;
group85=0;
group86=0;
group87=0;
group88=0;
group89=0;
group810=0;
group811=0;
group812=0;
group813=0;
group814=0;
group815=0;
group816=0;
group817=0;
group818=0;
group8=0;
for E in cremona_curves([10..10000]):
    rho=E.galois_representation();
    if E.has_cm()==False and  rho.is_surjective(2):
        
        aps=E.aplist(1000000); 
        apsmod4=vector([x%4 for x in aps])
        lenaps=n(len(aps))
        a0=len([x for x in apsmod4 if x==0])/lenaps;
        a1=len([x for x in apsmod4 if x==1])/lenaps;
        a2=len([x for x in apsmod4 if x==2])/lenaps;
        a3=len([x for x in apsmod4 if x==3])/lenaps;
        a=vector([round(a0,4),round(a1,4),round(a2,4),round(a3,2)]);
        nm41=norm(a-d1);
        nm42=norm(a-d2);
        nm43=norm(a-d3);
        nm44=norm(a-d4);
        nm45=norm(a-d5);
        nm46=norm(a-d6);
        if nm41<.01:
           group41=group41+1; 
           group4=group4+1; 
           li4.append(E.label());
           li41.append(E.label());
        elif nm42<.01:
            group42=group42+1; 
            group4=group4+1; 
            li4.append(E.label());
            li42.append(E.label());
        elif  nm43<.01:
            group43=group43+1; 
            group4=group4+1; 
            li4.append(E.label());
            li43.append(E.label());
        elif nm44<.01:
            group44=group44+1; 
            group4=group4+1; 
            li4.append(E.label());
            li44.append(E.label());
        elif nm45<.01:
            group45=group45+1; 
            group4=group4+1; 
            li4.append(E.label());
            li45.append(E.label());
        else:
            apsmod8=vector([x%8 for x in aps]);
            lenaps=n(len(aps));
            b0=len([x for x in apsmod8 if x==0])/lenaps;
            b1=len([x for x in apsmod8 if x==1])/lenaps;
            b2=len([x for x in apsmod8 if x==2])/lenaps;
            b3=len([x for x in apsmod8 if x==3])/lenaps;
            b4=len([x for x in apsmod8 if x==4])/lenaps;
            b5=len([x for x in apsmod8 if x==5])/lenaps;
            b6=len([x for x in apsmod8 if x==6])/lenaps;
            b7=len([x for x in apsmod8 if x==7])/lenaps;
            b=vector([round(b0,4),round(b1,3),round(b2,3),round(b3,3), round(b4,3),round(b5,3),round(b6,3),round(b7,3)]);
            nm81=norm(b-c1);
            nm82=norm(b-c2);
            nm83=norm(b-c3);
            nm84=norm(b-c4);
            nm85=norm(b-c5);
            nm86=norm(b-c6);
            nm87=norm(b-c7);
            nm88=norm(b-c8);
            nm89=norm(b-c9);
            nm810=norm(b-c10);
            nm811=norm(b-c11);
            nm812=norm(b-c12);
            nm813=norm(b-c13);
            nm814=norm(b-c14);
            nm815=norm(b-c15);
            nm816=norm(b-c16);
            nm817=norm(b-c17);
            nm818=norm(b-c18);
            if nm81<.005:
                group81=group81+1;    
                group8=group8+1;
                li8.append(E.label());
                li81.append(E.label());
            elif nm82 <.01:
                group82=group82+1;    
                group8=group8+1;
                li8.append(E.label());
                li82.append(E.label());
            elif nm83<.01:
                group83=group83+1;    
                group8=group8+1;
                li8.append(E.label());
                li83.append(E.label());
            elif nm84<.01:
                group84=group84+1;    
                group8=group8+1;
                li8.append(E.label());
                li84.append(E.label());
            elif nm85<.01:
                group85=group85+1;    
                group8=group8+1;
                li8.append(E.label());
                li85.append(E.label());
            elif nm86<.01:
                group86=group86+1;    
                group8=group8+1;
                li8.append(E.label());
                li86.append(E.label());
            #elif nm87<.01:
                 
                #if b==c7:  
                   # print E.label(),"Is E semistable?", E.is_semistable(), E.j_invariant(), "not surjective mod 8 group 7","they are equal";
                
               # else:
                   # print E.label(),"Is E semistable?", E.is_semistable(), E.j_invariant(),"not surjective mod 8 group 7",":", nm87,":", b,":", c7;
            # elif nm88<.01:
                #print E.label(),"Is E semistable?", E.is_semistable(), E.j_invariant(),"not surjective mod 8 group 8";
                #if b==c8:
                #    print E.label(),"Is E semistable?", E.is_semistable(), E.j_invariant(), "not surjective mod 8 group 8","they are equal";
                #else:
                 #   print nm88,":", b,":", c8;
            elif nm89<.01:
                group89=group89+1;    
                group8=group8+1;
                li8.append(E.label());
                li89.append(E.label());
            elif nm810<.01:
                group810=group810+1;    
                group8=group8+1;
                li8.append(E.label());
                li810.append(E.label());
            elif nm811<.01:
                group811=group811+1;    
                group8=group8+1;
                li8.append(E.label());
                li811.append(E.label());
            elif nm812<.01:
                group812=group812+1;    
                group8=group8+1;
                li8.append(E.label());
                li821.append(E.label());
            elif nm813<.01:
                group813=group813+1;    
                group8=group8+1;
                li8.append(E.label());
                li813.append(E.label());
            elif nm814<.001:
                group814=group814+1;    
                group8=group8+1;
                li8.append(E.label());
                li814.append(E.label());
            elif nm815<.01:
                group815=group815+1;    
                group8=group8+1;
                li8.append(E.label());
                li815.append(E.label());
            #elif nm816<.01:
                #print E.label(),"Is E semistable?", E.is_semistable(), E.j_invariant(),"not surjective mod 8 group 16";
            #elif nm817<.01:
                #print E.label(),"Is E semistable?", E.is_semistable(), E.j_invariant(),"not surjective mod 8 group 17";  
            #elif nm818<.01:
                #print E.label(),"Is E semistable?", E.is_semistable(), E.j_invariant(),"not surjective mod 8 group 18";
statistics=(["group41",group41,"group42",group42, "group43",group43,"group44",group44,"group45",group45,"group4",group4, "percentage:"," group41",group41/group4,"group42",group42/group4, "group43", group43/group4, "group44", group44/group4, "group45",group45/group4,"group81",group81,"group82",group82, "group83",group83,"group84",group84,"group85",group85,"group86",group86,"group87",group87,"group88",group88,"group89",group89,"group810",group810,"group811",group811,"group812",group812,"group813",group813,"group814",group814,"group815",group815,"group816",group816,"group817",group817,"group818",group818, "group8", group8, "percentage:", "group81",group81/group8,"group82", group82/group8, "group83",group83/group8,"group84",group84/group8, "group85",group85/group8, "group86",group86/group8,"group87",group87/group8,"group88",group88/group8,"group89",group89/group8,"group810",group810/group8,"group811",group811/group8,"group812",group812/group8,"group813",group813/group8,"group814",group814/group8,"group815",group815/group8,"group816",group816/group8,"group817",group817/group8,"group818",group818/group8]);
save(statistics,"/Users/sekhon/statistics");
save(li4,"/User/sekhon/li4");
save(li41,"/Users/sekhon/li41");
save(li42,"/Users/sekhon/li42");
save(li43,"/Users/sekhon/li43");
save(li44,"/Users/sekhon/li44");
save(li45,"/Users/sekhon/li45");
save(li8,"/Users/sekhon/li8");
save(li81,"/Users/sekhon/li81");
save(li82,"/Users/sekhon/li82");
save(li83,"/Users/sekhon/li83");
save(li84,"/Users/sekhon/li84");
save(li85,"/Users/sekhon/li85");
save(li86,"/Users/sekhon/li86");
save(li87,"/Users/sekhon/li87");
save(li88,"/Users/sekhon/li88");
save(li89,"/Users/sekhon/li89");
save(li810,"/Users/sekhon/li810");
save(li811,"/Users/sekhon/li811");
save(li812,"/Users/sekhon/li812");
save(li813,"/Users/sekhon/li813");
save(li814,"/Users/sekhon/li814");
save(li815,"/Users/sekhon/li815");
save(li816,"/Users/sekhon/li816");
save(li817,"/Users/sekhon/li817");
save(li818,"/Users/sekhon/li818");

print "done";