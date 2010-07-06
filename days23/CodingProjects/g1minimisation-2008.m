
/************************************************************************\
*  Minimisation of Genus One Models over Q (of degrees n = 2,3,4 and 5)  *
*  Author: T. Fisher (based on joint work with J. Cremona and M. Stoll)  *
*  Date: 22nd July 2008                                                  *
*  Version for n = 5 is not yet proven to work in all cases              *
*  This file also contains an intrinsic "GenusOneModel" that takes as    *
*    input n and P, and computes a minimal genus one model of degree n   * 
*    for (E,[(n-1)0+P]) where P in E(Q).                                 *
\************************************************************************/

declare verbose Minimisation,3;

MC := MonomialCoefficient;
MD := MonomialsOfDegree;
Diag := DiagonalMatrix;
Id := IdentityMatrix;
Char := Characteristic;
Deriv := Derivative;
MAT := func<R,n,Q|Matrix(R,n,n,[Deriv(Deriv(Q,i),j): i,j in [1..n]])>;

function RationalGCD(S)
   Z := Integers();
   Q := Rationals();
   d := LCM([Denominator(Q!x):x in S| x ne 0] cat [1]);
   return Universe(S)!(GCD([Z!(x*d): x in S])/d);
end function;

PRIM := func<seq|[Integers()|x/d: x in seq] where d is RationalGCD(seq)>;

function MySaturate(mat)
  n := Nrows(mat);
  D := DiagonalMatrix([RationalGCD(Eltseq(mat[i])): i in [1..n]]);
  mat := D^(-1)*mat;
  L := Lattice(mat);
  L1 := PureLattice(L);
  return D*Matrix(Rationals(),n,n,[Coordinates(L1,L!mat[i]): i in [1..n]]);
end function;

function CoeffMatrix(polys,d)
  R := Universe(polys);
  mons := MD(R,d);
  return Matrix(BaseRing(R),#polys,#mons,[MC(f,mon): mon in mons,f in polys]);
end function;  

function GlobalLevel(phi)
  vprintf Minimisation,1 : "Computing the invariants\n";
  E := Jacobian(phi);
  _,iso := MinimalModel(E);
  u := IsomorphismData(iso)[4];
// When n = 5, we compensate for the fact "Jacobian" uses the 
// cInvariants (instead of the aInvariants).
  if Degree(phi) eq 5 then u := 6*u; end if;
  return Integers()!(1/u);
end function;

function MultipleRoots(F,m) 
// Find roots of F of multiplicity at least m
  k := BaseRing(F);
  if Char(k) gt m then
    for i in [2..m] do 
      F := GCD([F,Deriv(F)]); 
    end for;
    rts := [rt[1]: rt in Roots(F)];
  else
    rts := [rt[1]: rt in Roots(F)| rt[2] ge m];
  end if;
  return rts;
end function;

function PrettyFactorization(F) 
// Only used for verbose printing 
  P<t> := Parent(F);
  if F eq 0 or Degree(F) eq 0 then return Sprint(F); end if;
  ff := Factorization(F);
  str := "";
  for i in [1..#ff] do
    f := ff[i];
    if (f[1] eq t) or (#ff eq 1 and f[2] eq 1) then 
      str cat:= Sprint(f[1]);
    else
      str cat:= ("(" cat Sprint(f[1]) cat ")");
    end if;
    if f[2] ne 1 then 
      str cat:= ("^" cat Sprint(f[2]));
    end if;
    if i lt #ff then str cat:= "*";end if;
  end for;
  return str;
end function;

function PrettySubstitution(tr)
// Only used for verbose printing 
  R<x,z> := PolynomialRing(Rationals(),2);
  S<y> := PolynomialRing(R);
  mons := [x^2,x*z,x^2];
  rr := &+[tr[2][i]*mons[i]: i in [1..3]];
  return "y <- " cat Sprint((1/tr[1])*y + rr);
end function;

//////////////////////////////////////////////////////////////
//                      Case n = 2                          //
//////////////////////////////////////////////////////////////

function RemoveCrossTerms(phi)
// Same as "CompleteTheSquare", but also returns the transformation. 
  Q := Rationals();
  seq := Eltseq(phi);
  if #seq eq 5 then 
    tr := <1,Id(Q,2)>;
  else
    a0,a1,a2 := Explode(seq);
    tr := <2,[-a0/2,-a1/2,-a2/2],Id(Q,2)>;
    seq := Eltseq(tr*phi);
    phi := GenusOneModel(Q,2,[seq[i]: i in [4..8]]);
  end if;
  return phi,tr;
end function;

function RepeatedRoot(F,d);
  assert Degree(F) le d;
  m := Floor(d/2) + 1;
// Finds the m-fold root of F, where the latter is given as
// a univariate polynomial, but viewed as a binary form 
// of degree d. 
  error if F eq 0, "Error: Reduced polynomial should be non-zero.";
  vprintf Minimisation,3 : "F = %o\n",PrettyFactorization(F);
  if Degree(F) le d - m then 
    ans := [1,0];
  else 
    rts := MultipleRoots(F,m);
    if #rts eq 0 then return false,_; end if;
    ans := [rts[1],1];
  end if;
  return true,ans;
end function;

function PolynomialQ1(phi,p)
  k := GF(p);
  Z := Integers();
  P<t> := PolynomialRing(k);
  seq := Eltseq(phi);
  if #seq eq 5 then 
    if forall{x : x in seq | (Z!x) mod p eq 0} then 
      seq := [x/p: x in seq];
    end if;
    F := &+[(k!seq[i+1])*t^(4-i): i in [0..4]];
    dd := 4;
  else   
    assert p eq 2;
    l,m,n,a,b,c,d,e := Explode(ChangeUniverse(seq,k));
    dd := 2;
    F := l*t^2 + m*t + n;
    if F eq 0 then F := b*t^2 + d; end if;
    if F eq 0 then 
      F := &+[k!(seq[i+4]/2)*t^(4-i): i in [0..4]];
      dd := 4;
    end if;
  end if;
  return F,dd; 
end function;

function SaturateWithCrossTerms(phi)
// Apply y-substitutions to a genus one model of degree 2,
// with the aim of decreasing the level at p = 2.
// Returns (P,Q) with either v(P,Q) = 0, or v(P) > 0 and v(Q) = 1.
  Q := Rationals();  
  tr := <1,[0,0,0],Id(Q,2)>;
  while true do
    seq := ChangeUniverse(Eltseq(phi),Integers());
    vP := Minimum([Valuation(seq[i],2): i in [1..3]]);
    vQ := Minimum([Valuation(seq[i],2): i in [4..8]]);
    vPQ := Minimum(2*vP,vQ);
    if vPQ eq 0 and forall{i : i in [1,2,3,5,7] | seq[i] mod 2 eq 0} then 
      tr1 := <1,[seq[i] mod 2: i in [4,6,8]],Id(Q,2)>;
    else
      if vPQ lt 2 then break; end if;
      tr1 := <1/(2^Floor(vPQ/2)),[0,0,0],Id(Q,2)>; 
    end if;
    phi := tr1*phi;
    tr := tr1*tr;
  end while;
  vprintf Minimisation,3 : "y-substitution: %o\n",PrettySubstitution(tr);
  return phi,tr,1;
end function;

//////////////////////////////////////////////////////////////
//                      Case n = 3                          //
//////////////////////////////////////////////////////////////

function SingularLocusThree(V,phi);
// Computes the singular locus of a ternary cubic.
// The answer is returned as a subspace of V = k^3.
  F := Equation(phi);
  k := CoefficientRing(phi);
  R<x,y,z> := PolynomialRing(phi);
  error if Discriminant(phi) ne 0,
    "Error: Reduced cubic should be singular.";
  error if cInvariants(phi) ne [0,0],
    "Error: Reduced cubic should be a null-form.";
  error if F eq 0, "Error: Reduced cubic should be non-zero.";
  eqns := [F] cat [Derivative(F,i): i in [1..3]];
  gcd := GCD(eqns);
  if TotalDegree(gcd) gt 0 then
    f := Factorization(gcd)[1][1];
    assert TotalDegree(f) eq 1;
    vprintf Minimisation,3 : "Singular locus is { %o = 0 }.\n",f;
    U := sub<V|V![MC(f,R.i): i in [1..3]]>;
  else
    PP := Points(Scheme(Proj(R),eqns));
    assert #PP eq 1;
    vprintf Minimisation,3 : "Singular locus is { %o }.\n",PP[1];
    mat := Matrix(k,3,1,Eltseq(PP[1]));
    km := KernelMatrix(mat);
    assert Nrows(km) eq 2;
    U := sub<V|[V!km[i]: i in [1..2]]>;
  end if;
  return U;
end function;
  
//////////////////////////////////////////////////////////////
//                      Case n = 4                          //
//////////////////////////////////////////////////////////////

function KernelOfQuadric(V,Q)
// V is a copy of the k-vector space k^d.
// Q is a homogeneous form of degree 2 in k[x_1,..,x_d].
// We compute ker(Q), i.e. the subspace of V where Q and all its
// partial derivatives vanish.
  k := BaseField(V);
  d := Dimension(V);
  mat := MAT(k,Dimension(V),Q);
  km := KernelMatrix(mat);
  n := Nrows(km);
  if Char(k) eq 2 and n ge 1 then
    R := PolynomialRing(k,n);
    subst := [&+[km[i,j]*R.i: i in [1..n]]: j in [1..d]];
    Q1 := Evaluate(Q,subst);
    if Q1 ne 0 then  
      f := SquareRoot(Q1);
      mat1 := Matrix(k,n,1,[MC(f,R.i): i in [1..n]]);
      km := KernelMatrix(mat1)*km;
    end if;
  end if;
  return sub<V|[V!km[i]: i in [1..Nrows(km)]]>;
end function;

function DeterminantPolynomial(phi4,t)
// The polynomial whose roots correspond to singular quadrics
// (with suitable modifications in characteristic 2)
  k := CoefficientRing(phi4);
  P := Parent(t);
  if Char(k) ne 2 then 
    M := [MAT(P,4,Q): Q in Equations(phi4)];
    return Determinant(t*M[1]+M[2]),4;
  else 
    phi2 := DoubleGenusOneModel(phi4);
    l,m,n,a,b,c,d,e := Explode(Eltseq(phi2));
    f := l*t^2 + m*t + n;
    return (f ne 0 select f else b*t^2 + d),2;
  end if;
end function;

function SubDiscriminantThree(Q)
// Find a non-zero 3 by 3 "sub-discriminant" of the quadric Q.
  R := Parent(Q);
  for i in [1..4] do
    x,y,z := Explode([R.j : j in [1..4]| j ne i]);
    a,b,c := Explode([MC(Q,mon): mon in [x^2,y^2,z^2]]);
    d,e,f := Explode([MC(Q,mon): mon in [y*z,z*x,x*y]]);
    Delta3 := 4*a*b*c - a*d^2 - b*e^2 - c*f^2 + d*e*f;
    if Delta3 ne 0 then return Delta3; end if;
  end for;
  return 0;
end function;

function SpanOfSingularLocusInternal(V,quads,F,d) 
  assert Degree(F) le d;
  m := Floor(d/2) + 1;
// Finds the m-fold root of F, where the latter is given as
// a univariate polynomial, but viewed as a binary form 
// of degree d. Then lets Q1,Q2 be a basis for the pencil
// of quadrics, where Q2 corresponds to this root, and
// returns the linear span of (ker(Q2) meet {Q1 = 0}),
// as a subspace of V = k^4.
  if Degree(F) le (d - m) then 
    Q2,Q1 := Explode(quads);
  else 
    rts := MultipleRoots(F,m);
    if #rts eq 0 then return false,_; end if;
    Q1,Q2 := Explode(quads);   
    Q2 := rts[1]*Q1 + Q2;
  end if;
  k := BaseRing(Universe(quads));
  U := KernelOfQuadric(V,Q2);
  mat := Matrix(Basis(U));
  d := Nrows(mat);
  R := PolynomialRing(k,d);
  subst := [&+[mat[i,j]*R.i: i in [1..d]]: j in [1..4]];
  Q1 := Evaluate(Q1,subst);
  if Q1 ne 0 then
    ff := Factorization(Q1);
    if ff[1,2] eq 2 then // Q1 restricted to ker(Q2) has rank 1
      mat1 := Matrix(k,d,1,[MC(ff[1,1],R.i): i in [1..d]]);
      mat := KernelMatrix(mat1)*mat;
      U := sub<V|[V!mat[i]: i in [1..d-1]]>;
    end if;
  end if;
  return true,U;
end function;

function SpanOfSingularLocus(V,phi);
// Computes the span of the singular locus of a quadric intersection.
// The answer is returned as a subspace of V = k^4.
  quads := Equations(phi);
  k := CoefficientRing(phi);
  R := PolynomialRing(phi);
  error if Discriminant(phi) ne 0,
    "Error: Reduced quadric intersection should be singular.";
  error if cInvariants(phi) ne [0,0],
    "Error: Reduced quadric intersection should be a null-form.";
  error if GCD(quads) ne 1,
    "Error: Reduced quadrics should be coprime.";
  U := &meet[KernelOfQuadric(V,q): q in quads];
  P<t> := PolynomialRing(k);
  common_nullity := Dimension(U);
  vprintf Minimisation,3 : "Common Nullity = %o\n",common_nullity;
  error if common_nullity gt 2, 
    "Error : Common nullity =",common_nullity," Please report";
  case common_nullity :
    when 0:
      F,d := DeterminantPolynomial(phi,t);
      vprintf Minimisation,3 : "F = %o\n",PrettyFactorization(F);
      if F eq 0 then 
        Q1,Q2 := Explode(quads);
        UU := [KernelOfQuadric(V,q): q in [Q1,Q2,Q1+Q2]];
        U := &+[U : U in UU | Dimension(U) eq 1];
      else
        flag,U := SpanOfSingularLocusInternal(V,quads,F,d);
        assert flag;
      end if;
    when 1 :
      Q1,Q2 := Explode(Equations(ChangeRing(phi,P)));
      F := SubDiscriminantThree(t*Q1+Q2);
      error if F eq 0, 
        "Error: Generic rank is less than 3. Please report.";
      vprintf Minimisation,3 : "F = %o\n",PrettyFactorization(F);
      flag,Unew := SpanOfSingularLocusInternal(V,quads,F,3);
      if flag then U := Unew; end if;
  end case;
  vprintf Minimisation,3 : 
    "Span of singular locus has basis \n%o\n",Matrix(Basis(U));  
  return U;
end function;

//////////////////////////////////////////////////////////////
//                      Case n = 5                          //
//////////////////////////////////////////////////////////////

function GetQuadrics(phi,p,irreg)
  cc := p^irreg;
  quads := [(1/cc)*q : q in Equations(phi)];
  if irreg gt 0 then 
    R := PolynomialRing(phi);
    Q := Rationals();
    M := Matrix(phi);
    mat := Matrix(Q,5,25,[[MC(M[i,r],R.s): r,s in [1..5]]: i in [1..5]]);
    mat := MySaturate(mat);
    quads := [&+[mat[i,j]*quads[i]: i in [1..5]]: j in [1..5]];
  end if;
  return quads;
end function;

function SpanOfSingularLocusFive(quads)
  R := Universe(quads);
  k := CoefficientRing(R);
  J := Matrix(R,5,5,[Deriv(q,i): i in [1..5],q in quads]);
  I := ideal<R|quads cat Minors(J,3)>;
  ff := MinimalBasis(Radical(I));
  ff := [f : f in ff | TotalDegree(f) eq 1];
  mat := Matrix(k,#ff,5,[MC(f,R.i): i in [1..5],f in ff]);
  vprintf Minimisation,3 :
    "Singular locus defined by linear forms\n%o\n",mat;
  return mat;
end function;

//////////////////////////////////////////////////////////////
//                   Cases n = 2,3,4,5                      //
//////////////////////////////////////////////////////////////

function SaturateModel(phi)
// n = 2  : makes GCD(coeffs) square-free
// n = 3  : makes GCD(coeffs) = 1
// n = 4  : makes quadrics linearly indep. mod p for all p.
// n = 5  : makes Pfaffians linearly indep. mod p for all p.
  Q := Rationals();  
  case Degree(phi) :
    when 2:
      if #Eltseq(phi) eq 5 then 
        d := RationalGCD(Eltseq(phi));
        a1,a2 := SquareFree(Numerator(d));
        b1,b2 := SquareFree(Denominator(d));
        tr := <b1*b2/a2,Id(Q,2)>;
      else
        return SaturateWithCrossTerms(phi);
      end if;
    when 3:
      tr := <1/RationalGCD(Eltseq(phi)),Id(Q,3)>;
    when 4:  
      tr := <MySaturate(CoeffMatrix(Equations(phi),2))^(-1),Id(Q,4)>;
      vprintf Minimisation,3 : 
        "Change of basis for space of quadrics \n%o\n",tr[1];
    when 5:
      mat := MySaturate(CoeffMatrix(Equations(phi),2));
      d1 := RationalGCD(Eltseq(mat));
      mat := (1/d1)*mat;
      tr := <Transpose(mat),Id(Q,5)>;
      phi := tr*phi;
      d2 := RationalGCD(Eltseq(phi));
      irreg := Integers()!(d1*Determinant(mat)/d2^2);
      tr1 := <Id(Q,5),(1/d2)*Id(Q,5)>;
      vprintf Minimisation,3 : 
        "Change of basis for space of quadrics \n%o\n",tr[1];
      vprintf Minimisation,3 : 
        "Irregularity = %o\n",Factorization(irreg);
      return tr1*phi,tr1*tr,irreg;
  end case;
  return tr*phi,tr,1;
end function;

function MinimiseInternal(phi,tr,leveldata,tflag)
  Z := Integers();
  Q := Rationals();
  n := Degree(phi);
  assert n in {2,3,4,5};
  maxsteps := case< n | 2:2, 3:4, 4:5, 5:6, default:0 >;// a guess when n = 5
  idqtrans := case< n | 4:Id(Q,2), 5:Id(Q,5), default:1 >;
  vprintf Minimisation,1 : "Level = %o\n",leveldata;
  vprintf Minimisation,2 : 
     "Notation: \"/\" = level decreases  \".\" = level preserved\n";
  failedprimes := [];
  for pr in leveldata do 
    p,level := Explode(pr);
    vprintf Minimisation,1 : "Minimising at p = %o (level = %o)\n",p,level;
    k := GF(p);
    V := VectorSpace(k,n);
    R := PolynomialRing(k,n);
    if n eq 5 then irreg := pr[3]; end if;
    nsteps := 0;
    oldphi := phi;
    tr0 := <idqtrans,Id(Q,n)>;
    IndentPush();
    while level gt 0 do
      if n in {3,4} then 
        seq := ChangeUniverse(Eltseq(phi),k);
        phibar := GenusOneModel(n,seq:PolyRing:=R);
      end if;
      case n :
        when 2 :
          F,d := PolynomialQ1(phi,p);
          flag,rr := RepeatedRoot(F,d);
          if not flag then 
            vprintf Minimisation,2 : 
              " no triple root => minimal at level %o\n",level; 
            error if p ne 2, "Error:  Null-form without triple root.";
            failedprimes cat:= [<p,level>]; 
            break;
          end if;
          mat := Matrix(k,1,2,[-rr[2],rr[1]]);
        when 3 :         
          U := SingularLocusThree(V,phibar);
          mat := Matrix(Basis(U));
        when 4 :
          f := GCD(Equations(phibar));
          if TotalDegree(f) eq 1 then
            vprintf Minimisation,3 : "GCD = %o\n",f;
            mat := Matrix(k,1,4,[MC(f,R.i): i in [1..4]]);
          else
            U1 := SpanOfSingularLocus(V,phibar);
            mat := Matrix(Basis(U1));
            mat := KernelMatrix(Transpose(mat));
          end if;
        when 5 :
	  quads := ChangeUniverse(GetQuadrics(phi,p,irreg),R);
          vprintf Minimisation,3 :
            "Space of quadrics has dimension %o\n",Rank(CoeffMatrix(quads,2));
          mat := SpanOfSingularLocusFive(quads);
      end case;
      q := Nrows(mat);
      assert q lt n;
      _,_,mat := SmithForm(ChangeRing(mat,Z));
      dd := [i le q select p else 1 : i in [1..n]];
      M := Diag(Q,dd)*Transpose(mat); 
      vprintf Minimisation,3 : 
        "Change of co-ordinates on P^%o\n%o\n",n-1,M;
      tr1 := <idqtrans,M>;
      phi := tr1*phi; 
      if tflag then tr0 := tr1*tr0; end if;
      phi,tr1,globirreg := SaturateModel(phi);
      if tflag then tr0 := tr1*tr0; end if;
      ch := q + Valuation(ScalingFactor(n,tr1),p:Check:=false);
      if n eq 5 then 
        newirreg := Valuation(globirreg,p:Check:=false);
        ch := ch - 2*(newirreg - irreg);
        irreg := newirreg;
      end if;
      level +:= ch;
      error if ch gt 0, "Error : The level increased. Please report.";
      vprintf Minimisation,3 : "Level decreases by %o   (",-ch;
      if ch lt 0 then
        nsteps := 0;
        oldphi := phi;
        if tflag then tr := tr0*tr; end if;
        tr0 := <idqtrans,Id(Q,n)>;
        vprintf Minimisation,2 :"/";
      else 
        nsteps +:= 1;
        vprintf Minimisation,2 :".";
      end if;
      vprintf Minimisation,3 : ")\n";
      if nsteps ge maxsteps then 
        vprintf Minimisation,2 : " => minimal at level %o\n",level;
        phi := oldphi;
        failedprimes cat:= [<p,level>];
        break;
      end if;
    end while;
    if level eq 0 then 
      vprintf Minimisation,2 : "  => level 0 \n";
    end if;
    IndentPop();
  end for;
  return phi,tr,failedprimes;
end function;

function MyFactorization(n,plist)
  n := Integers()!n;
  if #plist ne 0 then 
    plist := Sort(SetToSequence(SequenceToSet(plist)));
    return [<p,Valuation(n,p:Check:=false)>: p in plist];
  else 
    vprintf Minimisation,1 : "Factoring the level\n";
    return Factorization(n);
  end if;
end function; 

intrinsic Minimise2008(model::ModelG1:
  Transformation := true,
  CrossTerms := false,
  UsePrimes := [] ) 
  -> ModelG1, Tup, SetEnum
{Minimises a genus one model of degree 2,3,4 or 5 over Q.
Also returns the transformation (unless Transformation = false)
and the set of primes p where the minimal model has positive level. 
Except possibly when p = 2 (for models of degree 2 with CrossTerms = false), 
these are the primes where the model is not Q_p^nr-soluble. The current
version for models of degree 5 is not yet proven to work in all cases.}
  R := CoefficientRing(model);
  require (R cmpeq Rationals()) or (R cmpeq Integers()) 
    : "Model must be defined over the rationals";
  require Discriminant(model) ne 0 : "Model is singular";
  n := Degree(model);
  phi := ChangeRing(model,Rationals());
  vprintf Minimisation, 1 :"Minimising a genus one model of degree %o\n",n;
  require n in {2,3,4,5} : "Model must have degree 2,3,4 or 5.";
  if n eq 2 then 
    phi,tr1 := RemoveCrossTerms(phi); 
    phi,tr2 := SaturateModel(phi);
    tr := tr2*tr1;
  else
    phi,tr,irreg := SaturateModel(phi);
  end if;
  if n eq 5 then 
    globlev := GlobalLevel(phi)/irreg^2;
    ff := MyFactorization(globlev,UsePrimes);
    leveldata := [<f[1],f[2],Valuation(irreg,f[1]:Check:=false)>: f in ff];
  else
    leveldata := MyFactorization(GlobalLevel(phi),UsePrimes);
  end if;
  phi,tr,leveldata := MinimiseInternal(phi,tr,leveldata,Transformation);
  failedprimes := {f[1]: f in leveldata};
  if n eq 2 and CrossTerms then 
    vprintf Minimisation,1 : "Final stage : introducing cross terms\n";
    phi := <1,[0,0,0],Id(Rationals(),2)>*phi; 
    ld2 := [pr : pr in leveldata | pr[1] eq 2];
    level := #ld2 ne 0 select ld2[1][2] else 0;
    phi,tr1 := SaturateModel(phi);
    tr := tr1*tr;
    level +:= Valuation(ScalingFactor(2,tr1),2);
    vprintf Minimisation,1 : 
      "Making a y-substutition => level = %o\n",level;
    if level gt 0 then 
      phi,tr,ld2 := MinimiseInternal(phi,tr,[<2,level>],Transformation);
      level := #ld2 ne 0 select ld2[1][2] else 0;
    end if;
    if level eq 0 then Exclude(~failedprimes,2); end if;
  end if;
  if #failedprimes gt 0 then
    vprintf Minimisation,1 : 
      "Minimal model has positive level at primes %o.\n",failedprimes;
  else
    vprintf Minimisation,1 : "Model has level 0 at all primes.\n";
  end if;
  if Transformation then
    return phi,tr,failedprimes;
  else
    return phi,_,failedprimes;
  end if;
end intrinsic;

/////////////////////////////////////////////////////////////////////////
//       Alternative treatment of (globally) soluble models            //
/////////////////////////////////////////////////////////////////////////

// The following is a bug-fix for ApplyTransformation (see g1invariants.m)
// The modification required is 
//      R0 := BaseRing(R);
//      subst := subst cat [R0!(1/mu)*y + r[1]*x^2 + r[2]*x*z + r[3]*z^2]; 
// This is to cope with the fact Magma doesn't recognise 1/1 as an integer!

function ApplyTransformation2(g,model)
// {Apply the transformation g to the given genus one model.}
  n := model`Degree;
  flag,lambda := IsTransformation(n,g);
//  require flag : "g must be a transformation of genus one curves of degree n (matching the given model).";
  if n in {2,3} then
    f := model`Equation;
    R := Parent(f);
    if #g eq 2 then 
      mu,B := Explode(g);
      r := [0,0,0];
    else
      mu,r,B := Explode(g);
    end if;
    if VariableWeights(R) eq [1,1] and #g eq 3 then
      f := Equations(model)[1];
      R := Parent(f);
    end if;
    subst := [&+[B[i,j]*R.i: i in [1..n]]: j in [1..n]];
    if VariableWeights(R) eq [1,1,2] then 
      R<x,z,y> := Parent(f);
// the modification is here
      R0 := BaseRing(R);
      subst := subst cat [R0!(1/mu)*y + r[1]*x^2 + r[2]*x*z + r[3]*z^2]; 
    end if;
    f_new := (n eq 2 select mu^2 else mu)*Evaluate(f,subst);
    return GenusOneModel(f_new);
  elif n eq 4 then
    R := PolynomialRing(model);
    phi := model`Equations;
    A,B := Explode(g);
    subst:=[&+[B[i,j]*R.i :i in [1..4]]: j in [1..4]];
    phi_B := [ Evaluate(phi[j],subst) : j in [1..2] ];  
    return GenusOneModel([ A[1,1]*phi_B[1] + A[1,2]*phi_B[2], A[2,1]*phi_B[1] + A[2,2]*phi_B[2] ]);
  else 
    R := PolynomialRing(model);
    phi := model`DefiningMatrix;
    A,B := Explode(g);
    A := MatrixRing(R,5)!A; 
    subst:=[&+[B[i,j]*R.i :i in [1..5]]: j in [1..5]];
    phi_B := Parent(phi)![Evaluate(phi[i,j],subst):j in [1..5],i in [1..5]];
    phi1 := Parent(phi)!(A*phi_B*Transpose(A));
    for i in [1..5] do phi1[i,i] := 0; end for;
for i in [1..5] do for j in [1..i-1] do phi1[i,j] := -phi1[j,i]; 
end for; end for;
    return GenusOneModel(phi1);

//    _,ans := IsGenusOneModel( Parent(phi)!(A*phi_B*Transpose(A)) );
//    return ans;
  end if;
end function;

function IntegralGenusOneModel(eqns)
  RZ := Universe(eqns);
  case Rank(RZ) :
    when 2 : 
      P,Q := Explode(eqns);
      coeffs1 := [MC(P,RZ.1^(2-i)*RZ.2^i): i in [0..2]];
      coeffs2 := [MC(Q,RZ.1^(4-i)*RZ.2^i): i in [0..4]];
      model := GenusOneModel(2,coeffs1 cat coeffs2);
    when 3 : 
      model := GenusOneModel(eqns[1]);
    when 4 : 
      model := GenusOneModel(eqns);
    when 5 :
      RQ := PolynomialRing(Rationals(),5);
      eqns := ChangeUniverse(eqns,RQ);
      model := GenusOneModel(eqns);
      coeffs := PRIM(Eltseq(model));
      model := GenusOneModel(5,coeffs:PolyRing:=RZ);
  end case;
  return model;
end function;

function WeierstrassEquations(E,n)
  assert n in {3,4,5,6};
  R<x,y,z> := PolynomialRing(Integers(),3); 
  if n eq 3 then 
    return [Evaluate(Equation(E),[y,z,x])],[z,x,y];
  end if;
  ainv := ChangeUniverse(aInvariants(E),Integers());
  a1,a2,a3,a4,a6 := Explode(ainv);
  case n :
    when 4 :
      RR<x0,x2,x3,x4> := PolynomialRing(Integers(),4);
      ff := [z^2,x*z,y*z,x^2];
      quads := [ x0*x4 - x2^2,
	x3^2 + a1*x2*x3 + a3*x0*x3 - (x2*x4 + a2*x0*x4 + a4*x0*x2 + a6*x0^2)];
    when 5 :
      RR<x0,x2,x3,x4,x5> := PolynomialRing(Integers(),5);
      ff := [z^2,x*z,y*z,x^2,x*y];
      quads := [ x0*x4 - x2^2,x0*x5 - x2*x3,x2*x5 - x3*x4,
	x3^2 + a1*x0*x5 + a3*x0*x3 - (x2*x4 + a2*x0*x4 + a4*x0*x2 + a6*x0^2),
        x3*x5 + a1*x2*x5 + a3*x2*x3 - (x4^2 + a2*x2*x4 + a4*x2^2 + a6*x0*x2)];
    when 6 :
      RR<x0,x2,x3,x4,x5,x6> := PolynomialRing(Integers(),6);
      ff := [z^3,x*z^2,y*z^2,x^2*z,x*y*z,x^3];
      quads := [ x0*x4 - x2^2,x0*x5 - x2*x3,x0*x6 - x2*x4,
        x2*x5 - x3*x4,x2*x6 - x4^2,x3*x6 - x4*x5,
        x3^2 + a1*x0*x5 + a3*x0*x3 - x0*(x6 + a2*x4 + a4*x2 + a6*x0),
        x3*x5 + a1*x2*x5 + a3*x2*x3 - x2*(x6 + a2*x4 + a4*x2 + a6*x0),
	x5^2 + a1*x3*x6 + a3*x2*x5 - x4*(x6 + a2*x4 + a4*x2 + a6*x0)];
  end case;
  return quads,ff;
end function;

function GenusOneModelFromPoint(n,eqns,pt)
  assert forall{f: f in eqns| Evaluate(f,pt) eq 0};
  target := Proj(Universe(eqns))!([1] cat [0: i in [1..n]]);
  vprintf Minimisation,1 : "Moving P to %o\n",target;
  _,_,mat := SmithForm(Matrix(1,n+1,pt));
  matdual := Transpose(mat^(-1));
  eqns := [q^matdual : q in eqns];
  pt := [mat[n+1,j]: j in [2..n+1]]; 
  vprintf Minimisation,1 : "Projecting away from %o\n",target;
  R := PolynomialRing(Integers(),n);
  S<t> := PolynomialRing(R);
  subst := [t] cat [R.i : i in [1..n]];
  eqns := [Evaluate(q,subst): q in eqns];
  if n eq 2 then 
    f1,f2,f3 := Explode([Coefficient(eqns[1],i): i in [2,1,0]]);
    eqns := [f2,-f1*f3];
    yy := mat[3,1]*Evaluate(f1,pt);
  else
    gg := [Coefficient(f,1): f in eqns];
    hh := [Coefficient(f,0): f in eqns];
    if n eq 3 then
      eqns := [gg[1]*hh[2]-gg[2]*hh[1]];  
    else
      km := KernelMatrix(CoeffMatrix(gg,1)); 
      eqns := [&+[km[i,j]*hh[j]: j in [1..#hh]]: i in [1..Nrows(km)]];
    end if;
  end if;
  vprint Minimisation,1 : "Performing some ad hoc reduction";
  submat := Matrix(n,n+1,[mat[i,j]: i in [1..n+1],j in [2..n+1]]);
  _,T := LLL(submat);
  Tinv := T^(-1);
  eqns := [q^Tinv : q in eqns];
  pt := [&+[T[i,j]*pt[j]: j in [1..n]]: i in [1..n]];
  if n in {4,5} then 
    _,U := LLL(CoeffMatrix(eqns,2));
    eqns := [&+[U[i,j]*eqns[j]: j in [1..#eqns]]: i in [1..#eqns]];
  end if;
  vprintf Minimisation,1 : "Re-writing as a genus one model\n";
  model := IntegralGenusOneModel(eqns);
  if n eq 2 then 
    rr := [-Floor(seq[i]/2): i in [1..3]] where seq is Eltseq(model);
// a bug fix to ApplyTransformation was required (see above)
    model := ApplyTransformation2(<1,rr,Id(Integers(),2)>,model);
    yy := yy - rr[1]*pt[1]^2 - rr[2]*pt[1]*pt[2] - rr[3]*pt[2]^2;
    pt := pt cat [yy];
  end if;
  if n eq 5 then
    quads := Equations(model);
    assert (eqns eq quads) or (eqns eq [-q: q in quads]);
  end if;
  return model,pt;
end function;

intrinsic GenusOneModel(n::RngIntElt,P::PtEll:NoReduction := false)
  -> ModelG1, Pt
{Given a point P on an elliptic curve E over Q, and n = 2,3,4 or 5, maps E to P^\{n-1\} via the complete linear system |(n-1).O+P| and returns the corresponding genus one model of degree n. The formulae used give a genus one model that is minimised and is close to being reduced. Finally the function Reduce is called (unless NoReduction = true). The second returned value is a point on the covering curve that maps down to P (or -P).}
  E := Curve(P);
  K := BaseRing(E);
  require K cmpeq Rationals() 
    : "Elliptic curve must be defined over the rationals";
  K := Ring(Parent(P));
  require K cmpeq Rationals() 
    : "Point must be defined over the rationals";
  vprintf Minimisation, 1 :"Computing a minimal genus one model of degree %o\n",n;
  require n in {2,3,4,5} : "Model must have degree 2,3,4 or 5.";
  if P eq E!0 then 
    error "Point given is the identity - use GenusOneModel(n,E) instead";
  end if;
  E,iso := MinimalModel(E);
  P := iso(P);
  eqns,ff := WeierstrassEquations(E,n+1);
  pt := PRIM([Evaluate(f,Eltseq(P)): f in ff]);
  vprintf Minimisation, 1 :
    "We embed E in P^%o via the linear system |%o.0|\n",n,n+1;
  model,pt := GenusOneModelFromPoint(n,eqns,pt);
  model := ChangeRing(model,Rationals());  
  vprintf Minimisation, 1 : "Model has coefficients\n%o\n",Eltseq(model);
  if not NoReduction then 
    model,tr := Reduce2008(model);
    if n eq 2 then yy := pt[3]; end if;
    T := Transpose(tr[#tr])^(-1);
    pt := [&+[T[i,j]*pt[j]: j in [1..n]]: i in [1..n]];
    cc := RationalGCD(pt);
    pt := [x/cc: x in pt];
    if n eq 2 then
      rr := tr[2];   
      yy := yy/cc^2 - rr[1]*pt[1]^2 - rr[2]*pt[1]*pt[2] - rr[3]*pt[2]^2;
      pt := pt cat [yy];
    end if;
  end if;
  vprintf Minimisation, 1 :"Checking the invariants\n";
  error if cInvariants(model) ne cInvariants(E),
    "Model is not minimal. Please report";
  P := Curve(model)!pt; 
  return model,P;
end intrinsic;

