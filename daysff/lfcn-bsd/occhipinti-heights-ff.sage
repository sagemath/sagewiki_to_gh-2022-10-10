#This file provides the tools to compute the canonincal height and canonincal height pairing
#of points on elliptic curves over global function fields using intersection theory.
#
#Note:  We omit the factor of log(q) included by some authors, so our height pairing will
#always be a rational number
#
#This code implements a new class called ellwithheights.  If you would like to compute heights
#on an elliptic curve E defined over a rational function field k(t), you must first endow
#E with the structure of an ellwithheights.

#sage: R.<t>=PolynomialRing(GF(19))
#sage: K=FractionField(RR)
#sage: K=FractionField(R)
#sage: EE=EllipticCurve(K,[t^2,(17*t+1)*t^2])
#sage: E=ellwithheights(EE)
#sage: P=E(t,t)
#sage: E.height(P)
#Out: 1/3
#sage: E.height(20*P)
#Out: 400/3
#sage: E.heightpairing(P,-P)
#Out: -1/3
#sage: E.heightpairing(2*P,10*P)
#Out: 20/3


#Dreams:  Rearrange the data structure to include what components a point passes through
#so that this data is not recomputed each time

def contrv(Ktype,i,j):
    #Computes the correction factor for points passing through the ith and jth component
    #of a fiber of type Ktype.  Note this is depedent on numbering the components correctly
    
    #This code is based on a table in Shioda's "Elliptic Surfaces"
    
    if i*j==0:
        return 0
    
    if Ktype=="II" or Ktype=="IIstar" or Ktype=="I_1" or Ktype=="I_0":
        return 0
    
    if Ktype=="IIIstar":
        return 3/2
    
    if Ktype=="III":
        return 1/2
    
    if Ktype=="IV":
        if i==j:
            return 2/3
        return 1/3
    
    if Ktype=="IVstar":
        if i==j:
            return 4/3
        return 2/3
    
    if Ktype=="Istar_0":
        if i==j:
            return 1
        return 1/2
    
    if Ktype[0:6]=="Istar_":
        if j<i:
            i,j = j, i
            
        n=Ktype[6:]
        if i==j and i==1:
            return 1
        if i==j and (i==2 or i==3):
            return 1+n/4
        if i==1:
            return 1/2
        if i==2:
            return 1/2+n/4
    
    if Ktype[0:2]=="I_":
        n=int(Ktype[2:])
        if i==j:
            return i*(n-i)/n
        
        if j<i:
            i,j = j, i

        return i*(n-j)/n
    
    return "oops"

def component(x,y,a,b,v,Ktype):
    #return the component of the fiber at v through which the point passes.  
    #0 is the identity component
    
    #if the type is II or IIstar, the identity component is the only possibility
    if Ktype=="II" or Ktype=="IIstar" or Ktype=="I_1":
        return 0
    
    #check if the point lies on the identity component
    if (3*x^2+a).numerator().valuation(v)==0:
        return 0
    
    #if the type is III or IIIstar then there is only one non-identity component
    #We call that component 1
    if Ktype=="III" or Ktype=="IIIstar" or Ktype=="I_2":
        return 1
    
    #if the type is IV or IVstar then there are two non-identity components, which we 
    #will arbitrarily call 1 and 2
    if Ktype=="IV":
        ydivv=y/v
        y0=constant_part(ydivv)
        #this less than uses the lexicographic ordering of Fq to label the components
        if y0 < -y0:
            return 1
        return 2
    if Ktype=="IVstar":
        ydivv=y/v^2
        y0=constant_part(ydivv)
        #this less than uses the lexicographic ordering of Fq to label the components
        if y0 < -y0:
            return 1
        return 2

    #Istar0 fibers have three non-zero components, which correspond to the roots of a 
    #certain cubic polynomial.  
      
    if Ktype=="Istar_0":
        r=a/v^2 
        r0=constant_part(r)
        s=b/v^3
        s0=constant_part(s)
        x1=constant_part(x/v)
        
        k=s0.parent()
        R.<t>=PolynomialRing(k)
        rootpoly=t^3+r0*t+s0
        roots=rootpoly.roots()
        roots.sort()
        
        if x1==roots[0][0]:
            return 1
            
        if x1==roots[1][0]:
            return 2
        return 3        
        
    if Ktype[0:2]=="I_":
        #call the number of components b
        n=int(Ktype[2:])
        k=y.numerator().valuation(v)
        if 2*k > n-1:
            return n/2
        c=constant_part((3*x^2+a)/v^k)
        yk=constant_part(y/v^k)
        if yk/c > -yk/c:
            return k
        return n-k
    
    if Ktype[0:6]=="Istar_":
        #In this case we label our mult 1 components 0, 1, 2, 3
        #Following Shioda, 1 is the "near" component and 2, 3 are the "far" components
        n=int(Ktype[6:])
        r=a/v^2
        s=b/v^3
        r0=constant_part(r)
        s0=constant_part(s)
        x0=constant_part(x/v)

        
        k=r0.parent()
        R.<t>=PolynomialRing(k)
        poly=t^3+r0*t+s0
        roots=poly.roots()
        coxa = next(item[0] for item in roots if item[1] == 2)
        
        if x0==-2*coxa:
            return 1
        
        #in this case we must break into separate cases for b even and odd
        if n%2==0:
            sing0=constant_part((3*x^2+a)/(t^((n+4)/2)))
            if sing0 > -sing0:
                return 2
            return 3
        
            
        if n%2==1:
            y0=constant_part(y/v^((b+3)/2))
            if y0 > -y0:
                return 2
            return 3        
        
    return "oops"



def constant_part(rat):
    return rat.numerator().constant_coefficient()/rat.denominator().constant_coefficient()
   

def minimalE(E):
    #this cleans up to minimal Weierstrass model, given a short W model
    #This only works if char = 0 or char > 3
    #To Do: deal with the c4 or c6 = 0 case
    #Okay, so these aren't really c4 or c6, they are a4 and a6 in a "short" W model

    c4=E.a4()
    c6=E.a6()

    conv=1

    for v in factor(c4.denominator()):
        r = c4.denominator().valuation(v[0])
        c4=c4*v[0]^(4*ceil(r/4))           
        c6=c6*v[0]^(6*ceil(r/4))    
        conv=conv*v[0]^ceil(r/4)
    for v in factor(c6.denominator()):
        r = c6.denominator().valuation(v[0])
        c4=c4*v[0]^(4*ceil(r/6))
        c6=c6*v[0]^(6*ceil(r/6))
        conv=conv*v[0]^ceil(r/6)
    for v in factor(gcd(c4.numerator(),c6.numerator())):
        while c4.numerator().valuation(v[0]) > 3 and c6.numerator().valuation(v[0]) > 5:
            c4=c4/v[0]^4            
            c6=c6/v[0]^6
            conv=conv/v[0]

    #this does not deal with minimality at infinity, which is dealt with elsewhere

    return EllipticCurve([c4,c6]), conv

def kodaira_type(v,vdisc,j,b):
    #if the reduction is multiplicative, we're done
    if b.numerator().valuation(v)==0:
        return "I_"+str(vdisc)
    
    if vdisc>10 or vdisc==6 or vdisc==7:
        return "Istar_"+str(vdisc-6)
    if vdisc==2:
        return "II"
    if vdisc==3:
        return "III"
    if vdisc==4:
        return "IV"
        
    #if we aren't done yet we need to know a bit about the j-invariant
    jmodv=1;
    if j.denominator().valuation(v)>0:
        jmodv=infinity
    if j.numerator().valuation(v)>0:
        jmodv=0
    
    if vdisc==8:
        if jmodv==0:
            return "IVstar"
        return "Istar_2"
    
    if vdisc==9:
        if jmodv==infinity:
            return "Istar_3"
        return "IIIstar"
    
    if vdisc==10:
        if jmodv==0:
            return "IIstar"
        return "Istar_4"
    #all cases should be covered at this point
    return "Oops, that didn't work"


class ellwithheights:
    def __init__(self,E):
        self.Eorg=E
        self.Eswm=E.short_weierstrass_model()
        self.E, self.conv = minimalE(self.Eswm)
        self.a4, self.a6 = self.E.a4(), self.E.a6()
        
        self.t=E.base_ring().gen()
        self.k=self.a4.numerator().parent().base_ring()
    
        self.Einf, self.Einfconv = minimalE(EllipticCurve([self.a4().subs({self.t:1/self.t}), 
        self.a6().subs({self.t:1/self.t})]))


        j=self.E.j_invariant()
        disc=(-16*(4*self.a4^3+27*self.a6^2)).numerator()
        factoreddisc=factor(disc.numerator())
        self.typedict={}
        
        for v in factoreddisc:
            self.typedict[v[0]]=kodaira_type(v[0],v[1],j,self.a6);   
        idisc=self.Einf.discriminant().numerator()
        self.tinf=idisc.parent().gen()
        if idisc.valuation(self.tinf) > 0:
            self.typedict["infinity"]=kodaira_type(self.tinf, idisc.valuation
            (self.tinf),self.Einf.j_invariant(), self.Einf.a6())
    
        degj=max(self.E.j_invariant().numerator().degree(),self.E.j_invariant().denominator
        ().degree())
        localparts=0
        typedict=self.typedict
        for v in self.typedict:
            if v!="infinity":
                if typedict[v]=="II":
                    localparts=localparts+2*v.degree()
                if typedict[v]=="IIstar":
                    localparts=localparts+10*v.degree()
                if typedict[v]=="III":
                    localparts=localparts+3*v.degree()
                if typedict[v]=="IIIstar":
                    localparts=localparts+9*v.degree()
                if typedict[v]=="IV":
                    localparts=localparts+4*v.degree()
                if typedict[v]=="IVstar":
                    localparts=localparts+8*v.degree()
                if typedict[v][0:6]=="Istar_":
                    localparts=localparts+6*v.degree()
            if v=="infinity":
                if typedict[v]=="II":
                    localparts=localparts+2
                if typedict[v]=="IIstar":
                    localparts=localparts+10
                if typedict[v]=="III":
                    localparts=localparts+3
                if typedict[v]=="IIIstar":
                    localparts=localparts+9
                if typedict[v]=="IV":
                    localparts=localparts+4
                if typedict[v]=="IVstar":
                    localparts=localparts+8
                if typedict[v][0:6]=="Istar_":
                    localparts=localparts+6
    
        self.EulerCharacteristic = 1/12*(degj+localparts)





    def __call__(self, x, y):
        return self.E(self.conv^2*(x+(self.Eorg.a2()+1/4*self.Eorg.a1()^2)/3),(y
        +1/2*self.Eorg.a1()*x+self.Eorg.a3()/2)*self.conv^3)
    
    def PinEinf(self,P):
        x=P[0].numerator().reverse()/P[0].denominator().reverse()*self.tinf^-(P[0].numerator
        ().degree()-P[0].denominator().degree())
        y=P[1].numerator().reverse()/P[1].denominator().reverse()*self.tinf^-(P[1].numerator
        ().degree()-P[1].denominator().degree())
        return self.Einf(x*self.Einfconv^2,y*self.Einfconv^3)
        
    def PinEinf2(self,P):
        #this probably shouldn't exist anymore, pending the above working out
        return self.Einf(P[0].subs(t=1/self.t)*self.Einfconv^2,P[1].subs(t=1/self.t)
        *self.Einfconv^3)
        
    
    def componentsofpoint(self,P):        
        for d in self.typedict:
            if d!="infinity":
                print d,"\t\t", self.typedict[d], "\t", component(P[0],P[1], self.a4, 
                self.a6,d,self.typedict[d])  
            if d=="infinity":
                Pinf=self.PinEinf(P)
                print d, "\t\t", self.typedict[d], "\t", component(Pinf[0],Pinf[1],self.Einf
                .a4(),self.Einf.a6(), self.tinf ,self.typedict[d])
                

    def intersect(self,P,Q):
        if P==Q:
            return -self.EulerCharacteristic
        PminusQ=P-Q
        PminusQinf=self.PinEinf(PminusQ)
        return PminusQ[0].denominator(
        ).degree()/2+PminusQinf[0].denominator().valuation(self.tinf)/2    
    
                
    def height(self,P):
        heightP=2*self.EulerCharacteristic+2*self.intersect(P,0*P)
        
        for v in self.typedict:
            if v!="infinity":
                componentv=component(P[0],P[1],self.a4,self.a6,v,self.typedict[v])
                heightP=heightP-v.degree()*contrv(self.typedict[v],componentv,componentv)
            if v=="infinity":
                Pinf=self.PinEinf(P)
                componentv=component(Pinf[0],Pinf[1],self.Einf.a4(),self.Einf.a6
                (),self.tinf,self.typedict[v])
                heightP=heightP-contrv(self.typedict[v],componentv,componentv)
        return heightP

    def heightpairing(self,P,Q):
        pairPQ=(self.EulerCharacteristic+self.intersect(P,0*P)+self.intersect(Q,0*Q)-
        self.intersect(P,Q))
        for v in self.typedict:
            if v!="infinity":
                componentvP=component(P[0],P[1],self.a4,self.a6,v,self.typedict[v])
                componentvQ=component(Q[0],Q[1],self.a4,self.a6,v,self.typedict[v])
                pairPQ=pairPQ-v.degree()*contrv(self.typedict[v],componentvP,componentvQ)
            if v=="infinity":
                Pinf=self.PinEinf(P)
                Qinf=self.PinEinf(Q)
                componentvP=component(Pinf[0],Pinf[1],self.Einf.a4(),self.Einf.a6
                (),self.tinf,self.typedict[v])
                componentvQ=component(Qinf[0],Qinf[1],self.Einf.a4(),self.Einf.a6
                (),self.tinf,self.typedict[v])
                pairPQ=pairPQ-contrv(self.typedict[v],componentvP,componentvQ)
        return pairPQ
