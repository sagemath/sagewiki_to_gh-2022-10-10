// Functions for finding MW groups of elliptic curves over number
// fields.  Uses RankBound() and MyRationalPoints() and height
// functions, together with saturaration at small primes.

intrinsic LLLpoints(Plist::[PtEll] : verb:=false, hprec:=10) -> SeqEnum
{Takes a list of points and returns a Z-independent set with the same Z-span}
n:=#Plist;
if n eq 0 then return Plist; end if;
E:=Curve(Plist[1]);
if verb then
    print "Max height of original generators = ",
    Maximum([Height(P) : P in Plist]);
    print "Starting to compute height pairing matrix";
end if;
M:=Matrix(RealField(),n,n,[0:i in [1..n*n]]);
for i in [1..n] do M[i,i]:=Height(Plist[i]); end for;
for i in [1..n] do for j in [i+1..n] do
  M[i,j]:=(Height(Plist[i]+Plist[j])-M[i,i]-M[j,j])/2;
  M[j,i]:=M[i,j];
end for; end for;
if verb then 
 print "Finished computing h.p. matrix: ",M; 
end if;
R:=Determinant(M);
if verb then 
 print "Regulator = ",R;
end if;
M2,T,r:=LLLGram(M);
if verb then 
 print "M2 =  ",M; 
 print "T  =  ",T; 
 print "r  =  ",r; 
end if;
newPlist:=[&+[T[i,j]*Plist[j]:j in [1..r]]:i in [1..r]];
if verb and r gt 0 then 
  print "Max height of new generators = ",Maximum([Height(P):P in newPlist]);
end if;
return newPlist;
end intrinsic;



intrinsic MyMordellWeilGroup(E::CrvEll,Bound::RngIntElt : verb:=false)
 -> SeqEnum
{Attempts to find MW group of an elliptic curve over a number field}
m2:=MultiplicationByMMap(E,2);
rb:=RankBound(E);
if verb then
 print "rank bound = ",rb;
end if;
if rb eq 0 then
 TE,Tf:=TorsionSubgroup(E);
 pts:=[Tf(P) : P in TE | P ne TE!0];
else
 pts:=RationalPoints(E : Bound:=Bound , DenominatorBound:=Round(Sqrt(Bound)));
 pts:=[P : P in pts];
end if;
if verb then
 print "points found: ",pts;
end if;
pts:=LLLpoints(pts: verb:=verb);
if verb then
 print "LLL-reduced basis of points found: ",pts;
end if;
return(pts);

end intrinsic;

