{
  iterate(n,w,v) =
    if(n==1,if(v[1]==w[1],return(-1),v[1]=v[1]+1;return(v)),
     nv=iterate(n-1,vecextract(w,"^1"),vecextract(v,"^1"));
     if(nv<>-1,for(j=1,n-1,v[j+1]=nv[j]);return(v),
       if(v[1]==w[1],return(-1),v[1]=v[1]+1;for(j=1,n-1,v[j+1]=0);return(v))
     )
    )
}

/* GetPrimaryPrime(p) : for a prime p, compute an element in Z(\mu_3) with norm p, of the primary form
use 'binary integer gcd algorithm, check "Fundamentals of Computation Theory:14th International Symposium, FCT" 
*/
GetPrimaryPrime(p) = {
	local(fp);
    w=quadgen(-3);
    
    if(Mod(p,3)==2,
	  fp=p,
	  if(p==3,
	    fp=1+w,
	    fp=lift(polrootsmod(x^2-x+1,p)[1]);
	    fp=FindGCD(p,fp-w);
	  );
	);
	
	fp+=0*w;
	
	UNITS=[1,-1,w,-w,w^2,-w^2];
    for(i=1,length(UNITS),
      if(Mod(component(fp*UNITS[i],2),3)==2 & Mod(component(fp*UNITS[i],3),3)==0,
        return(fp*UNITS[i]);
      );
    );
}

/* FindGCD(f1,f2) : find the gcd of two elements in Q(\mu_3). */
FindGCD(f1,f2) = {
	g1=FindPrimary(f1);
	g2=FindPrimary(f2);
	
	if(IsInRingOfInt(g1/g2), return(g2));
	if(IsInRingOfInt(g2/g1), return(g1));
	
	if(norm(g1)>=norm(g2),
		return(FindGCD(g2,FindPrimary(g1-g2))),
		return(FindGCD(g1,FindPrimary(g2-g1)))
	);
}

/* FindPrimary(inp) : any element in Q(\mu_3) is uniquely of form u*(1+quadgen(-3))^b*(1+3*v) 
where u \in {1,-1,w,-w,w^2,-w^2}, w=\mu_3. Return 1+3*v.
*/
FindPrimary(inp) = {
	nm=norm(inp);
	if(nm==1,return(inp));
	
	while(IsInteger(nm/3),inp=inp/(1+quadgen(-3));nm=nm/3);
	
	if(IsInRingOfInt((inp-1)/3),return(inp));
	if(IsInRingOfInt((-inp-1)/3),return(-inp));
	if(IsInRingOfInt((inp*quadgen(-3)-1)/3),return(inp*quadgen(-3)));
	if(IsInRingOfInt((-inp*quadgen(-3)-1)/3),return(-inp*quadgen(-3)));
	if(IsInRingOfInt((inp*quadgen(-3)^2-1)/3),return(inp*quadgen(-3)^2));
	if(IsInRingOfInt((-inp*quadgen(-3)^2-1)/3),return(-inp*quadgen(-3)^2));
	return(inp);
}

/* IsInRingOfInt(val) : return 1 if val is in Z(\mu_3), 0 otherwise */
IsInRingOfInt(val) = {
	if(IsInteger(component(val+0*quadgen(-3),2)) & IsInteger(component(val+0*quadgen(-3),3)),return(1),return(0));
}

/* IsInteger(t) : return 1 if t is an integer, 0 otherwise */
IsInteger(t) = {
	if(floor(t)==t,return(1),return(0));
}

/*
CubicResidue(p,q) : Returns the cubic residue (q/p)_3
*/
{
  CubicResidue(p,q)=
    local(pp,pa,pb,cr,mq);
    
    if(isprime(p) & Mod(p,3)==2 & Mod(q,p) !=0,
      return(Mod(0,3));
    );
    
    if(isprime(p) & Mod(p,3)==1 & Mod(q,p) !=0,
      pp=GetPrimaryPrime(p);
      
      \\ pp=pa+pb*w^2 ( w^2 = (-1+sqrt(-3))/2 )
      pa=component(pp,2)+component(pp,3);
      pb=component(pp,3);
      
      cr=Mod(q,p)^((p-1)/3);
      
      if(cr==1,return(Mod(0,3)));
      if(cr==Mod(-pa/pb,p),return(Mod(1,3)));
      return(Mod(2,3));
    );
    
    if(p==9,
      mq=Mod(q,9);
      if(mq==1 | mq==8,return(Mod(0,3)));
      if(mq==2 | mq==7,return(Mod(2,3)));
      if(mq==4 | mq==5,return(Mod(1,3)));
    );
    
    print("Wrong Input : [p,q] = " [p,q]);
    return(-1);
}

/* return the highest power of p dividing n */
MaxPow(p,n)= {
	if(Mod(n,p),return(0),return(MaxPow(p,(n/p))+1));
}

/* reduction by p, if p|l, p^3|n, then return reduction(l/p,n/p^3) */
preduction(p,l,n) = {
	if(MaxPow(p,n) < 3 | MaxPow(p,l) == 0, return([l,n]), preduction(p,l/p,n/p^3));	
}

/* print as a standard form */
{
  eqnprint(coef,vars,isfirst=0)=
    prefix="";
    if(coef>0 & !isfirst,prefix="+");
    if(coef==1,if(vars=="",prefix=concat(prefix,"1")),
      if(coef==-1,
        if(vars!="",prefix="-",prefix="-1"),
        prefix=mconcat([prefix,Str(coef),if(vars!="","*","")]);
      );
    );
    if(coef,return(mconcat([prefix,vars])),return(""));
}

/* multi concat */
{
  mconcat(v)=
    resstr="";
    for(i=1,#v,resstr=concat(resstr,v[i]));
    return(resstr);
}

/* Return Selmer Matrix whose column and row nullspaces are the Selmer group of 3 isogenies */
{
  ThreeIsogenyDescent(A1,A3,upto=10,verbose=0)=
    local(da1,da3,cf,fda3,nda3,a1,a3,fac,p,p1,pv,qv,pred,mpow,clist,rlist,m9a1,m9a3,twist,RET,KERNEL,cr,ci,tmp,rcn,rrn,mapto);
    
    
    if(A3*(A1^3-27*A3)==0,print("*** singular curve in ThreeIsogenyDescent"),
    
      gettime();
      
      da1=denominator(A1);
      da3=denominator(A3);
      
      if(a1==1 | a3==1, cf=1,
        fda3=factor(da3);
        nda3=1;
        for(k=1,length(fda3~),nda3*=fda3[k,1]^(floor((fda3[k,2]-1)/3)+1));
        cf=lcm(da1,nda3);
      );  
      
      a1=A1*cf;
      a3=A3*cf^3;
      
      fac=factor(abs(a3));
      
      clist=[];
      rlist=[];
      
      pred=[a1,a3];
      
      for(i=1,#fac~,
        p=fac[i,1];
        pred=preduction(p,pred[1],pred[2]);
        
        mpow=MaxPow(p,pred[2]);
        if(mpow>0,clist=concat(clist,[[p,mpow]]));
      );
      
      if(verbose>0,print("clist " clist));
      if(verbose>0,print("reduced [a1,a3] " pred));
      
      fac=factor(abs(pred[1]^3-27*pred[2]));
      
      for(i=1,#fac~,
        p=fac[i,1];
        if(Mod(p,3)==1,
          p1=GetPrimaryPrime(p);
          rlist=concat(rlist,[[p,p1/conj(p1)]]);
        );
      );
      
      if(verbose>0,print("rlist " rlist));
      
      m9a1=Mod(pred[1],9);
      m9a3=Mod(pred[2],9);
      
      if( (m9a1==0 & m9a3==0)
        | (m9a1==0 & m9a3==1)
        | (m9a1==0 & m9a3==8)
        | (m9a1==3 & m9a3==6)
        | (m9a1==6 & m9a3==3)
        | (m9a1==3 & m9a3==8)
        | (m9a1==6 & m9a3==1)
        | (m9a1==3 & m9a3==1 & Mod(a1-a3,27) != 11)
        | (m9a1==6 & m9a3==8 & Mod(a1-a3,27) != 16),
        rlist=concat(rlist,[[9,1-w]]);
      );
      
      RET=matrix(length(rlist),length(clist));
      
      for(i=1,#rlist,for(j=1,#clist,
        pv=rlist[i];
        qv=clist[j];
      
        if(Mod(pv[1],qv[1])!=0,
          RET[i,j]=CubicResidue(pv[1],qv[1]),
          RET[i,j]=2*qv[2]*CubicResidue(pv[1],pred[2]/qv[1]^qv[2])
        );
        if(verbose>1,print("p=" pv[1] ",q=" qv[1] " Cubic Residue="RET[i,j] ));
      ));
      
      if(verbose>0,print(" Selmer matrix : " RET));
      
      \\ when a1^3-27*a3 has no prime divisors, we use the 1 by #clist zero matrix to get homogeneous spaces
      if(abs(pred[1]^3-27*pred[2])==1,
        RET=matrix(1,#clist);
      );
      
      KERNEL=matker(RET);
      
      count=0;
      rcn=#KERNEL;
      
      idx=if(#KERNEL,vector(#KERNEL),-1);
      limidx=vector(#KERNEL,X,2);
      
      while(idx != -1 & count++ <= upto,
        i=1;
        while(i<=#KERNEL & idx[i]==1,i++);
        
        if(i<=#KERNEL & idx[i]==0,
          kerelmt=sum(j=1,#KERNEL,(idx[j]-1)*KERNEL[,j]);
          twist=prod(j=1,#KERNEL,clist[j][1]^lift(Mod(kerelmt[j],3)));
          
          print("=== Curve Over Rational Field Defined By ");
          print(mconcat(["-u^3",eqnprint(twist^2,"v^3"),eqnprint(A1*twist,"u*v"),eqnprint(A3*twist,""),","]));
          print(mconcat(["    the Map to the Curve Defined By y^2",eqnprint(A1,"x*y"),eqnprint(A3,"y"),"-x^3,"]));
          print(mconcat([" (u,v) -> (u*v,",if(eqnprint(twist,"v^3",1)=="","0",eqnprint(twist,"v^3",1)),")"]));
          print("");
        );
      
        idx=iterate(#KERNEL,limidx,idx);
      );
      
      \\ when a3 has no prime divisors, we use the 1 by #rlist zero matrix to get homogeneous spaces
      if(abs(pred[2])==1,
        RET=matrix(#rlist,1);
      );
      if(abs(pred[1]^3-27*pred[2])!=1,
          
        KERNEL=matker(RET~);
        
        count=0;
        rrn=#KERNEL;
        
        idx=if(#KERNEL,vector(#KERNEL),-1);
        limidx=vector(#KERNEL,X,2);
        
        while(idx != -1 & count++ <= upto,
          i=1;
          while(i<=#KERNEL & idx[i]==1,i++);
          
          if(i<=#KERNEL & idx[i]==0,
            kerelmt=sum(j=1,#KERNEL,(idx[j]-1)*KERNEL[,j]);
            twist=prod(j=1,#KERNEL,rlist[j][2]^lift(Mod(kerelmt[j],3)))+ 0*w;
            
            print("=== Curve Over Rational Field Defined By ");
            
            \\ twist = n + mw where w^2 - w + 1 = 0, so let w = (1+\sqrt{-3})/2
            \\ then cr = n + m/2, ci = m/2
            
            cr=component(twist,2)+component(twist,3)/2;
            ci=component(twist,3)/2;
            
            tmp=-(A1^3-27*A3);
            print(mconcat([eqnprint(ci,"(u^3-9*u*v^2)",1),eqnprint(3*cr,"(u^2*v-v^3)"),eqnprint(3/2*A1,"(u^2+3*v^2)"),eqnprint(3/2*tmp,""),","]));
            print(mconcat(["    the Map to the Curve Defined By y^2 - x^3 + 27/4*(",eqnprint(A1,"x",1),eqnprint(tmp,"",if(A1==0,1,0)),")^2 "]));
            mapto=concat(eqnprint(cr,"(u^3-9*u*v^2)",1),eqnprint(-9*ci,"(u^2*v-v^3)",if(cr==0,1,0)));
            print(mconcat([" (u,v) -> (u^2+3*v^2,",if(mapto=="","0",mapto),")"]));
            print("");
          );
        
          idx=iterate(#KERNEL,limidx,idx);
        );
      );
      
      if(verbose>0,
        print("Time Elapsed: " gettime());
        print("Upper Bound of Rank : " rcn+rrn-1); 
        print("Selmer matrix: " RET);    
      );
      return(rcn+rrn-1);
    );
}

