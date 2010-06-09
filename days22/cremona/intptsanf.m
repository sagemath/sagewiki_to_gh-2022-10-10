///////////////////////////////////////////////////////////////////////////////
// Computing all integral points on elliptic curves over number fields
// Based on Smart & Stephens' paper (Math. Proc. Camb. Phil. Soc. 122 (1997),
// pp. 9-16) with some modification
//
// Written by Thotsaphon Thongjunthug, BSc(Hons)
// Last update: 14 May 2009
//
// This package requires some functions on Silverman's bound implemented in
// John Cremona's "nfhtbound.m", available freely on his webpage
// http://www.warwick.ac.uk/~masgaj/ftp/progs/magma/index.html
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
// Commands:
// IntegralPoints() : Find all integral points on elliptic curves over
//                    number fields
///////////////////////////////////////////////////////////////////////////////


// Declare printing verbose
// 0 = return result only, no detail will be printed
// 1 = minimal amount of details shown
// 2 = all details (e.g. values of all constants) shown (for debugging only) 
declare verbose Detail, 2;


///////////////////////////////////////////////////////////////////////////////
// Constants for an upper bound on linear form in logarithm
// The indices of c are as in Smart & Stephens' paper
///////////////////////////////////////////////////////////////////////////////

// Compute constant c3
// Input: L = a sequence of points on elliptic curves over number field
function c3(L)
  M := Eigenvalues(HeightPairingMatrix(L));
  M := SetToSequence(M);
  M := [m[1] : m in M]; // ignore multiplicity
  M := Minimum(M); // least eigenvalue
  return M;
end function;

// Compute constant c6
// Input: E = elliptic curve over real/complex numbers
function c6(E)
  P<x> := PolynomialRing(ComplexField());
  C4, C6 := Explode(cInvariants(E));
  f := x^3 - (P! C4/48)*x - (P! C6/864);
  R := Roots(f);
  R := [r[1] : r in R]; // ignore multiplicity
  R := [Abs(r) : r in R];
  R := 2 * Maximum(R);
  return R;
end function;

// Compute constant c8, and the periods of the lattice L where E(C) = C/L
// This requires complex periods of elliptic curves over C
// Require: complexell.m
// Input: E = elliptic curve over real/complex numbers
function c8(E)
  org_w1, org_w2 := Explode(ComplexPeriods(E));
  // Apply transformation by SL(2,Z) so that tau = w2/w1 is in the
  // fundamental domain
  _, A := ReducedTau(org_w2 / org_w1); // require "complexell.m"
  w2 := A[1,1]*org_w2 + A[1,2]*org_w1;
  w1 := A[2,1]*org_w2 + A[2,2]*org_w1;
  L := [Abs(w) : w in [w1, w2, w1+w2]];
  L := Maximum(L);
  return L, [w1, w2];
end function;

// Compute absolute logarithmic height of an element in n-projective space
// over a number field K
// Input: X = a sequence of elements in a number field K  
function AbsLogHeight(X)
  // X cannot be zero vector
  if #X eq #[x : x in X | x eq 0] then
    error "AbsLogHeightExt: X cannot be zero vector";
  end if;
  
  // Find all prime ideal that divides some denominators of x_i
  I := {};
  K := Parent(X[1]); // assume each x_i is in the same field
  O := RingOfIntegers(K);
  for x in X do
    den := O ! Denominator(x);
    L := Decomposition(den);
    L := {l[1] : l in L}; // ignore multiplicity
    I := I join L;
  end for;
  
  h := 0;
  // Non-archimedean contributions
  for p in I do
    M := [Rationals()| ];
    for x in X do
      if x eq 0 then
        Append(~M, 0);
      else
        Append(~M, Norm(p)^(-Valuation(x, p)));
      end if;
    end for;
    M := Maximum(M);
    M := Log(M);
    h +:= M;
  end for;
  
  // Archimedean contributions
  s1, s2 := Signature(K);
  // M = [log max(|x_1|_v,..., |x_n|_v) : v in M_K]
  M := [];
  for x in X do
    C := Conjugates(x);
    newC := [];
    // Real embedding contributions
    for i := 1 to s1 do
      Append(~newC, Abs(C[i]));
    end for;
    // Complex embedding contributions
    for i := 1 to s2 do
      Append(~newC, Abs(C[s1+(2*i-1)])^2);
    end for;

    if #M eq 0 then
      M := newC;
    else
      for i := 1 to (s1+s2) do
        if newC[i] gt M[i] then
          M[i] := newC[i];
        end if;
      end for;
    end if;
  end for;
  M := [Log(m) : m in M];
  
  // Overall absolute logarithmic height
  h +:= (&+M);
  h /:= Degree(K);
  return h;
end function;


///////////////////////////////////////////////////////////////////////////////
// Constants for David's lower bound on linear form in logarithm
// Notation used as in Appendix A of Smart's book
// "The Algorithmic Resolution of Diophantine Equations", with c's being
// replaced by d's
///////////////////////////////////////////////////////////////////////////////

// Compute the "height" of elliptic curve
// Input: E = elliptic curve over number field
function h_E(E)
  j := jInvariant(E);
  C4, C6 := Explode(cInvariants(E));
  g2 := C4/12;
  g3 := C6/216;
  m := Maximum([1, AbsLogHeight([1, g2, g3]), AbsLogHeight([1, j])]);
  return m;
end function;

// Compute the list of modified height of a point P in E(K)
// according to embeddings
// Input: E = elliptic curve over a number field K
//        P = a point in E(K)
//        ElogEmbedP = elliptic logarithm of P when embedded in some
//                     embedding
//        D7 = constant d7 (depending on embedding)
function h_m(E, P, ElogEmbedP, D7)
  K := BaseRing(E);
  L := [Height(P), h_E(E), D7/Degree(K)*Abs(ElogEmbedP)^2];
  L := Maximum(L);
  return L;
end function;

// Compute two extra h_m's based on the two periods
// Similar to h_m, but now ElogEmbedP becomes a period of the fundamental
// parallelogram of E(C) for some embedding
// Input: E = elliptic curve over a number field
//        Periods = a sequence of two periods of the fundamental
//                  parallelogram of E(C) for some embbeding
//        D7 = constant d7 (depending on embedding)
function Extra_h_m(E, Periods, D7)
  D := Degree(BaseRing(E));
  h := h_E(E);
  tmp1 := Maximum([0, h, D7/D*Abs(Periods[1])^2]);
  tmp2 := Maximum([0, h, D7/D*Abs(Periods[2])^2]);
  return [tmp1, tmp2];
end function;

// Compute constant d8
// Input: E = elliptic curve over a number field K
//        L = a sequence of points in E(K) (e.g. Mordell-Weil basis)
//        Elog = a sequence of (pre-computed) elliptic logarithm of
//               each point in L at a fixed embedding
//        Periods = a sequence of two periods of the fundamental
//                  parallelogram of E(C) for some embbeding
//        D7 = constant d7 (depending on embedding)
function d8(E, L, Elog, Periods, D7)
  C := [Exp(1) * h_E(E)];
  D := Degree(BaseRing(E));
  for i := 1 to #L do
    Append(~C, h_m(E, L[i], Elog[i], D7) / D);
  end for;
  C := C cat [t / D : t in Extra_h_m(E, Periods, D7)];
  C := Maximum(C);
  return C;
end function;

// Compute constant d9
// Input: E = elliptic curve over a number field
//        L = a sequence of points in E(K) (e.g. Mordell-Weil basis)
//        Elog = a sequence of (pre-computed) elliptic logarithm of
//               each point in L at a fixed embedding
//        Periods = a sequence of two periods of the fundamental
//                  parallelogram of E(C) for some embbeding
//        D7 = constant d7 (depending on embedding)
function d9(E, L, Elog, Periods, D7)
  D := Degree(BaseRing(E));
  C := [];
  for i := 1 to #L do
    tmp := Exp(1) * Sqrt(D * h_m(E, L[i], Elog[i], D7) / D7);
    tmp /:= Abs(Elog[i]);
    C[i] := tmp;
  end for;

  // Take minimum among extra_h_m
  Ehm := Extra_h_m(E, Periods, D7);
  tmp1 := Exp(1) * Sqrt(D*Ehm[1]/D7) / Abs(Periods[1]);
  tmp2 := Exp(1) * Sqrt(D*Ehm[2]/D7) / Abs(Periods[2]);
  C := C cat [tmp1, tmp2];
  C := Minimum(C);
  return C;
end function;

// Compute constant d10
// Input: E = elliptic curve over a number field
//        L = a sequence of points in E(K) (e.g. Mordell-Weil basis)
//        Elog = a sequence of (pre-computed) elliptic logarithm of
//               each point in L at a fixed embedding
//        Periods = a sequence of two periods of the fundamental
//                  parallelogram of E(C) for some embbeding
//        D7 = constant d7 (depending on embedding)
function d10(E, L, Elog, Periods, D7)
  D := Degree(BaseRing(E));
  n := #L+2;
  scalar := 2 * 10^(8 + 7*n) * (2/Exp(1))^(2*n^2);
  scalar *:= (n+1)^(4*n^2 + 10*n) * D^(2*n + 2);
  scalar *:= (Log(d9(E, L, Elog, Periods, D7)))^(-2*n-1);
  for i := 1 to #L do
    scalar *:= h_m(E, L[i], Elog[i], D7);
  end for;
  scalar *:= &*(Extra_h_m(E, Periods, D7));   
  return scalar;
end function;

// Compute the right-hand side of the Principal Inequality
// Input: D   = Degree(K), K = number field
//        r   = rank(E(K))
//        C9  = constant c9
//        C10 = constant c10
//        D9  = constant d9
//        D10 = constant d10
//        h   = h_E(E), E = elliptic curve over K
//        Q   = initial bound for the coefficients of P_i's, where
//              P_i's are in the Mordell-Weil basis
function RHS(D, r, C9, C10, D9, D10, h, Q, expTors)
  bound := (Log(Log(Q*r*expTors)) + h + Log(D*D9))^(r+3);
  bound *:= D10*(Log(Q*r*expTors) + Log(D*D9));
  bound +:= Log(C9*expTors);
  bound /:= C10;
  return bound;
end function;

// Approximate initial bound on Q = max_{1\le i\le r}{|q_i|}
// Input: D   = Degree(K), where K = number field
//        r   = rank of E(K)
//        Q0  = constant Q0 (in S&S paper, this is called K0)
//        C9  = constant c9
//        C10 = constant c10
//        D8  = constant d8 (from function d8())
//        D9  = constant d9 (from function d9())
//        D10 = constant d10 (from function d10())
//        h   = h_E(E)
//        expTors = exponent of the torsion subgroup of E(K)
// Revised: 5 May 2009
function InitialQ(D, r, Q0, C9, C10, D8, D9, D10, h, expTors)
  minQ := Maximum(Q0, Exp(D8));
  
  // Try to approximate Q such that Q^2 = RHS(Q) (i.e. Q makes both sides
  // of the Principal Inequality equal)
  // Firstly, set a guess for Q, say minQ + 1 (so that Q > minQ)
  // For simplicity, let's round Q up to the nearest power of 10
  Q := minQ + 1;
  x := Ceiling(Log(10, Q)); // x = log_10(Q)

  // Check if Q satisfies the Principal Inequality, i.e. if Q^2 < RHS(Q)
  // If so, repeat with the larger Q until we find the first Q that
  // violates the P.I.
  // N.B. This loop will eventually terminate 
  exp_OK := 0;   // the exponent that satisfies P.I.
  exp_fail := 0; // the exponent that fails P.I.
  while 10^(2*x) lt RHS(D, r, C9, C10, D9, D10, h, 10^x, expTors) do
    exp_OK := x; // Principal Inequality satisfied
    x *:= 2;     // double x, and retry
  end while;
  exp_fail := x; // x that fails the Principal Inequality
  
  // So now x = log_10(Q) must lie between exp_OK and exp_fail
  // Refine x further using "binary search"
  repeat
    x := Floor((exp_OK + exp_fail)/2);
    if 10^(2*x) ge RHS(D, r, C9, C10, D9, D10, h, 10^x, expTors) then
      exp_fail := x;
    else
      exp_OK := x;
    end if;
  until (exp_fail - exp_OK) le 1;
  return exp_fail; // over-estimate
end function;

// Reduce the bound Q by LLL reduction until no further improvement
// is possible. This function initially requires high precision to
// proceed, although this should be done automatically by now
// Require: complexell.m
// Input: EmbedE  = model of E embedded in some (complex) embedding
//        EmbedL  = a sequence of points on EmbedE (e.g. points in the
//                  Mordell-Weil basis when embedded into EmbedE)
//        Elog    = a sequence of (pre-computed) elliptic logarithm of
//                  each point in EmbedL
//        C9      = constant c9
//        C10     = constant c10
//        Periods = sequence of the double periods of the fundamental
//                  parallelogram associated to EmbedE
//        expTors = exponent of the torsion subgroup of E(K), K = number field
//        initQ   = initial guess for Q to be reduced by LLL
function ReducedQ(EmbedE, EmbedL, Elog, C9, C10, Periods, expTors, initQ)
  w1, w2 := Explode(Periods);
  r := #EmbedL;  
  newQ := initQ;

  // Repeat LLL reduction until no further reduction is possible
  repeat
    Q := newQ;
    S := r*(Q^2)*(expTors^2);
    T := 3*r*Q*expTors/Sqrt(2);

    // Create the basis matrix
    C := 1;
    repeat
      C *:= Q^Ceiling((r+2)/2);  
      L := ZeroMatrix(Integers(), r+2, r+2);
      
      // Elliptic logarithm should have precision "suitable to" C
      // e.g. If C = 10^100, then Re(Elog[i]) should be computed
      // correctly to at least 100 decimal places
      pow10_C := Ceiling(Log(10, C));
      if pow10_C gt Precision(Elog[1]) then
	vprint Detail, 2: 
	  "Need higher precision, recompute elliptic logarithm ...";
        // Re-compute elliptic logarithm to the right precision
        Elog := [ComplexEllLog(EmbedE, P : Prec := pow10_C+10) : P in EmbedL];
        vprint Detail, 2: "Elliptic logarithm recomputed";
      end if;
      // Assign all non-zero entries
      for i := 1 to r do
        L[i,i] := 1;
        L[r+1, i] := Truncate(C*Re(Elog[i]));
        L[r+2, i] := Truncate(C*Im(Elog[i]));
      end for;
      L[r+1, r+1] := Truncate(C*Re(w1));
      L[r+1, r+2] := Truncate(C*Re(w2));
      L[r+2, r+1] := Truncate(C*Im(w1));
      L[r+2, r+2] := Truncate(C*Im(w2));
      L := Transpose(L); // In Magma, basis is spanned by row vector!
          
      // LLL reduction and constants
      L := LLL(L);
      b1 := L[1]; // 1st row of reduced basis
      // Norm(b1) = square of Euclidean norm
      lhs := 2^(-r-1)*Norm(b1) - S;
    until (lhs ge 0) and (Sqrt(lhs) gt T);
    
    newQ := ( Log(C*C9*expTors) - Log(Sqrt(lhs) - T) ) / C10;
    newQ := Floor(Sqrt(newQ));
    pow10 := Floor(Log(10, C));
    vprintf Detail, 2: "Choose C = %.4o x 10^%o. ", 1.*C/10^pow10, pow10;  
    vprintf Detail, 2: "After reduction, Q <= %o\n", newQ;
  until ((Q - newQ) le 1) or (newQ le 1);
  return newQ;
end function;


///////////////////////////////////////////////////////////////////////////////
// Main intrinsic functions
///////////////////////////////////////////////////////////////////////////////

// Search for all integral points on elliptic curves over number fields
// within a given bound
// Input:    E = elliptic curve over a number field K
//           L = a sequence of points in the Mordell-Weil basis for E(K)
//           Q = a maximum for the absolute bound on all coefficients
//               in the linear combination of points in L
// Output:  S1 = sequence of all integral points on E(K) modulo [-1]
//          S2 = sequence of tuples representing the points as a
//               linear combination of points in L
// Option: tol = tolerance used for checking integrality of points.
//               (Default = 0 - only exact arithmetic will be performed)
intrinsic IntegralPoints(E::CrvEll, L::[PtEll], Q::RngIntElt : tol := 0) ->
  SeqEnum, SeqEnum
{Given an elliptic curve E over a number field, its Mordell-Weil basis L, and a positive integer Q, return the sequence of all integral points modulo [-1] of the form P = q_1*L[1] + ... + q_r*L[r] + T with some torsion point T and |q_i| <= Q, followed by a sequence of tuple sequences representing the points as a linear combination of points. An optional tolerance may be given to speed up the computation when checking integrality of points.}

  // Check input validity
  require IsNumberField(BaseRing(E)):
    "Elliptic curve must be defined over a number field";
  require tol ge 0: "Tolerance must be non-negative";

  // Find the generators of the torsion subgroup of E(K)
  Tors, map := TorsionSubgroup(E);
  expTors := Exponent(Tors);
  G := Generators(Tors);
  Tors := [map(g) : g in G];   // each generator of E(K)_tors
  OrdG := [Order(g) : g in G]; // order of each generator

  if (#L eq 0) and (#Tors eq 0) then
    return [], [];
  end if;

  // Create all possible r+#Tors-tuples
  r := #L; // r = rank of E(K)
  C := [0 : i in [1..(r + #Tors)]];
  ListC := [];
  for i := 0 to Q do
    C[1] := i;
    Append(~ListC, C);
  end for;

  for i := 2 to r do
    tmp := [];
    for j := 1 to Q do
      for l in ListC do
        tup := l;
        tup[i] := j;
        Append(~tmp, tup);

        // Avoid having its negative in the list
        // Only use when all previous entries in tuple are zero
        for k := 1 to i-1 do
          if tup[k] ne 0 then
            tup[i] := -j;
            Append(~tmp, tup);
            break;
          end if;
        end for;

      end for;
    end for;
    ListC := ListC cat tmp;
  end for;

  // Add torsion point, if any
  if #Tors ne 0 then
    for i := 1 to #Tors do
      tmp := [];
      for j := 1 to (OrdG[i]-1) do
        for l in ListC do
          tup := l;
          tup[r+i] := j;
          Append(~tmp, tup);
        end for;
      end for;
      ListC := ListC cat tmp;
    end for;
  end if;
  Remove(~ListC, 1); // remove point at infinity

  L := L cat Tors;
  vprint Detail, 2: "Generators = ", L;
  PtsList := [];
  CoeffList := [];
  
  // Skip the complex arithmetic and only perform exact arithmetic if tol = 0
  if tol eq 0 then
    vprint Detail : "Exact arithmetic";
    for l in ListC do
      P := &+[l[i]*L[i] : i in [1..#L]];
      if IsIntegral(P[1]) and IsIntegral(P[2]) then
        vprintf Detail: "%o ---> %o\n", l, P;
        Append(~PtsList, P);
        TupList := [ <L[i], l[i]> : i in [1..#L] | l[i] ne 0 ];
        Append(~CoeffList, TupList);
      end if;
    end for;
    vprint Detail: "*"^45;
    return PtsList, CoeffList;
  end if;

  // Suggested by John Cremona
  // Point search. This is done via arithmetic on complex points on each
  // embedding of E. Exact arithmetic will be carried if the resulting
  // complex points are "close" to being integral, subject to some tolerance
  
  // Embed each generator of the torsion subgroup
  X := [Conjugates(P[1]) : P in (L cat Tors)];
  Y := [Conjugates(P[2]) : P in (L cat Tors)];
  // Create all embeddings of E
  K := BaseRing(E);
  s1, s2 := Signature(K);
  a1, a2, a3, a4, a6 := Explode(aInvariants(E));
  a1 := Conjugates(a1);
  a2 := Conjugates(a2);
  a3 := Conjugates(a3);
  a4 := Conjugates(a4);
  a6 := Conjugates(a6);
  EmbedEList := [EllipticCurve([a1[j], a2[j], a3[j], a4[j], a6[j]]): j in 
    [1..(s1+2*s2)]];

  // Set tolerance - This should be larger than 10^(-current precision) to
  // avoid missing any integral points. Too large tolerance will slow the
  // computation, too small tolerance may lead to missing some integral points.
  // This is now made as an option.
  vprint Detail: "Tolerance = ", tol * 1.;
  
  // Create the matrix containing all embeddings of the integral basis of K
  // as its columns
  IntBasis := IntegralBasis(K); 
  B := Matrix([Conjugates(a) : a in IntBasis]);
  // Note that B is always invertible, so we can take its inverse
  B := B^(-1);
  
  // Embeddings of each point in L
  // Format: [[P1 ... P1], [P2 ... P2], ...]
  EmbedLList := [];
  for i := 1 to (r+#Tors) do
    EmbedLi := [];
    for j := 1 to (s1+2*s2) do
      P_i := Points(EmbedEList[j], X[i][j])[1];
      // Choose the right sign for the y-coordinate
      if (Y[i][j] ne 0) and (Re(P_i[2]/Y[i][j]) lt 0) then
        P_i := -P_i;
      end if;
      Append(~EmbedLi, P_i);
    end for;
    Append(~EmbedLList, EmbedLi);
  end for;

  // Point search
  for l in ListC do
    // Compute P by complex arithmetic for every embedding
    EmbedPList := [E![0,1,0] : E in EmbedEList];
    for j := 1 to (s1+2*s2) do
      EmbedPList[j] := &+[l[i]*EmbedLList[i][j] : i in [1..(r + #Tors)]];
    end for;

    // Check if the x-coordinate of P is "close to" being integral
    // If so, compute P exactly and check if it is integral; skip P otherwise
    XofP := Matrix([[P[1] : P in EmbedPList]]);
    // Write x(P) w.r.t. the integral basis of (K)
    // Due to the floating arithmetic, some entries in LX may have very tiny
    // imaginary part, which can be thought as zero
    LX := XofP * B;
    LX := [Abs( Re(LX[1,i]) - Round(Re(LX[1,i])) ): i in [1..#IntBasis]];
    LX := &and[dx lt tol : dx in LX];
    if not LX then
      // x-coordinate of P is not integral, skip P
      continue;
    end if;

    // Now check P by exact arithmetic
    // Add P and the list of tuples representing P into the list
    // if P is integral
    P := &+[l[i]*L[i] : i in [1..#L]];
    if IsIntegral(P[1]) and IsIntegral(P[2]) then
      vprintf Detail: "%o ---> %o\n", l, P;
      Append(~PtsList, P);
      TupList := [ <L[i], l[i]> : i in [1..#L] | l[i] ne 0 ];
      Append(~CoeffList, TupList);
    end if;
  end for;
  vprint Detail: "*"^45;
  return PtsList, CoeffList;
end intrinsic;

// Compute all integral points on elliptic curve over a number field
// This function simply computes a suitable bound Q, and return
// IntegralPoints(E, L, Q : tol := ...). 
// Input :   E = elliptic curve over a number field K
//           L = a sequence of points in the Mordell-Weil basis for E(K)
// Output:  S1 = sequence of all integral points on E(K) modulo [-1]
//          S2 = sequence of tuples representing the points as a
//               linear combination of points in L
// Option: tol = tolerance used for checking integrality of points.
//               (Default = 0 - only exact arithmetic will be performed) 
intrinsic IntegralPoints(E::CrvEll, L::[PtEll] : tol := 0) -> SeqEnum, SeqEnum
{Given an elliptic curve over a number field and its Mordell-Weil basis, return the sequence of all integral points modulo [-1], followed by a sequence of tuple sequences representing the points as a linear combination of points. An optional tolerance may be given to speed up the computation when checking integrality of points. (This function simply computes a suitable Q and call IntegralPoints(E, L, Q: tol := ...)}

  // Check input validity
  require IsNumberField(BaseRing(E)):
    "Elliptic curve must be defined over a number field";
  require tol ge 0:
    "Tolerance must be non-negative";

  if #L eq 0 then
    return IntegralPoints(E, [], 0 : tol := tol);
  end if;

  a1, a2, a3, a4, a6 := Explode(aInvariants(E));

  // Embed E into various (real/complex) embeddings
  a1 := Conjugates(a1);
  a2 := Conjugates(a2);
  a3 := Conjugates(a3);
  a4 := Conjugates(a4);
  a6 := Conjugates(a6);
  K := BaseRing(E);
  s1, s2 := Signature(K);
  b2 := Conjugates(bInvariants(E)[1]);
  pi := Pi(RealField());

  // Embed generators in the Mordell-Weil basis
  X := [Conjugates(P[1]) : P in L];
  Y := [Conjugates(P[2]) : P in L];
  
  // Find the generators of the torsion subgroup of E(K)
  Tors, map := TorsionSubgroup(E);
  expTors := Exponent(Tors);
  G := Generators(Tors);
  Tors := []; OrdG := [];
  for g in G do
    Append(~Tors, map(g));   // torsion point
    Append(~OrdG, Order(g)); // order of torsion point
  end for;
  
  // Global constants (independent to the embedding of E)
  C2 := -SilvermanLowerHeightBound(E); // require "nfhtbound.m"
  C3 := c3(L);
  h := h_E(E);
  vprint Detail, 2: "Global constants";
  vprintf Detail, 2: "c2 = %.4o\n", C2;
  vprintf Detail, 2: "c3 = %.4o\n", C3;
  vprintf Detail, 2: "h_E = %.4o\n", h;
  vprint Detail, 2: "-"^45;
  
  Q := [];
  // Find the most reduced bound on each embedding of E
  // But first let's adjust the index
  for i := 1 to (s1+s2) do
    if i le s1 then
      j := i;
      nv := 1;
      vprintf Detail, 2: "Real embedding #%o\n", j; 
    else
      j := s1 + (2*(i-s1)-1);
      nv := 2;
      vprintf Detail, 2: "Complex embedding #%o\n", i-s1; 
    end if;
    
    // Create complex embedding of E
    ee := EllipticCurve([a1[j], a2[j], a3[j], a4[j], a6[j]]);

    // Embedding of all points in Mordell-Weil basis
    // Find complex elliptic logarithm of each embedded point
    // Let's set precision initially to, say, 1000
    EmbedL := [[X[i][j], Y[i][j]] : i in [1..#L]];
    Elog := [ComplexEllLog(ee, P: Prec := 1000) : P in EmbedL];
    // Local constants (depending on embedding)
    // C9, C10 are used for the upper bound on the linear form in logarithm
    C4 := C3 * Degree(K) / (nv*(s1+s2));
    vprintf Detail, 2: "c4 =  %.4o\n", C4;
    C5 := C2 * Degree(K) / (nv*(s1+s2));
    vprintf Detail, 2: "c5 = %.4o\n", C5;
    C6 := c6(ee);
    vprintf Detail, 2: "c6 = %.4o\n", C6;
    delta := 1 + (nv-1)*pi;
    C8, Periods := c8(ee);
    vprintf Detail, 2: "c8 = %.4o\n", C8;
    C7 := 8*(delta^2) + (C8^2)*Abs(b2[j])/12;
    vprintf Detail, 2: "c7 = %.4o\n", C7;
    C9 := C7*Exp(C5/2);
    vprintf Detail, 2: "c9 = %.4o\n", C9;
    C10 := C4/2;
    vprintf Detail, 2: "c10 = %.4o\n", C10;
    Q0 := Sqrt( ( Log(C6+Abs(b2[j])/12) + C5) / C4 );
    vprintf Detail, 2: "Q0 = %.4o\n", Q0;

    // Constants for David's lower bound on the linear form in logarithm
    w1, w2 := Explode(Periods); // N.B. periods are already in "standard" form
    D7 := 3*pi / ((Abs(w2)^2) * Im(w2/w1));
    D8 := d8(E, L, Elog, Periods, D7);
    D9 := d9(E, L, Elog, Periods, D7);
    D10 := d10(E, L, Elog, Periods, D7);
    vprintf Detail, 2: "d7 =  %.4o\n", D7;
    vprintf Detail, 2: "d8 = %.4o\n", D8;
    vprintf Detail, 2: "d9 = %.4o\n", D9;
    vprintf Detail, 2: "d10 = %.4o\n", D10;
    
    // Find the reduced bound for the coefficients in the linear
    // logarithmic form
    initQ := InitialQ(Degree(K), #L, Q0, C9, C10, D8, D9, D10, h, expTors);
    vprintf Detail, 2: "Initial Q <= 10^%o\n", initQ;
    initQ := 10^initQ;
    Append(~Q, ReducedQ(ee, EmbedL, Elog, C9, C10, Periods, expTors, initQ));
    vprint Detail, 2: "-"^45;
  end for;
  Q := Maximum(Q);
  vprintf Detail: "Maximum absolute bound on coefficients = %o\n", Q;  
  return IntegralPoints(E, L, Q : tol := tol);
end intrinsic;
