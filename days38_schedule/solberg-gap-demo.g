#
#       a       b
#   1 ----> 2 ----> 3
#
Q := Quiver(3,[[1,2,"a"],[2,3,"b"]]);
KQ := PathAlgebra(Rationals,Q);
#
#       (1)
#       (0)     (1 0)
#   k^2 ----> k ----> k^2
#
mat := NullMat(3,2,Rationals); 
mats := [["a",[[1],[0]]],["b",[[1,0]]]];
M := RightModuleOverPathAlgebra(KQ,mats);
#
#       (1)
#       (1)     (0)
#   k^2 ----> k ----> 0
#
mats := [["a",[[1],[1]]]];
N := RightModuleOverPathAlgebra(KQ,[2,1,0],mats);
#
#                (0)
#     (0 0)      (0)
#   0 ----> k^2 ----> 0
#
S2 := RightModuleOverPathAlgebra(KQ,[0,2,0],[]);
DimensionVector(S2);
#
#            Action of the algebra
#
B := BasisVectors(CanonicalBasis(KQ));
BM := BasisVectors(Basis(M));
BM[1];
B[4];
BM[1]^B[4];
m := 2*BM[1] - BM[2] + 4*BM[5];
U := SubRepresentation(M,[m]);
#
#            Quotient of a path algebra
# 
gens := GeneratorsOfAlgebra(KQ);
a := gens[4];
b := gens[5];
rels := [a*b];
I := Ideal(KQ,rels);
gb := GBNPGroebnerBasis(rels,KQ);
gbb := GroebnerBasis(I,gb);
A := KQ/I;
Dimension(A);
Zero(A);
One(A);
BA := BasisVectors(CanonicalBasis(A));
#
#       Modules over quotients:
#       (1)
#       (0)     (1 0)
#   k^2 ----> k ----> k^2
#
mats := [["a",[[1],[0]]],["b",[[1,0]]]];
M := RightModuleOverPathAlgebra(A,mats);
#
#       (1)
#       (1)     (0)
#   k^2 ----> k ----> 0
#
mats := [["a",[[1],[1]]]];
N := RightModuleOverPathAlgebra(A,[2,1,0],mats);
#
#              Homomorphisms
#                   (0)
#         (1 0)     (1)
# M:    k ----> k^2 ---> k
#       |        |       |
#       |        | (1)   |
# (0 1) |        | (0)   | (0)
#       |  (1)   |       | 
#       V  (1)   V (0)   V
# N:   k^2 ----> k ----> 0
#
mats := [["a",[[1,0]]],["b",[[0],[1]]]];
M := RightModuleOverPathAlgebra(A,mats);
maps := [[[0,1]],[[1],[0]],[[0]]];
f := RightModuleHomOverAlgebra(M,N,maps);
Source(f) = M;
Range(f) = N;
#
#          Kernel, image, cokernel, etc.
#
Kernel(f);
DimensionVector(Kernel(f));
g := KernelInclusion(f);            # g : Ker(f) ----> M 
h := ImageProjection(f);            # h : M ---> Im(f)
j := ImageInclusion(f);             # j : Im(f) ---> N
p := CoKernelProjection(f);         # p : N ---> Coker(f)
IsDirectSummand(Source(g),Range(g));
M1 := DirectSumOfModules([Source(g),Range(h)]);
IsomorphicModules(M,M1);
#
#          Hom-sets, endomorphism algebra
#
HomMN := HomOverAlgebra(M,N);
Length(HomMN);
MatricesOfPathAlgebraMatModuleHomomorphism(HomMN[1]);
EndM := EndOverAlgebra(M);
#
#               Special modules:
#
#               Indecomposable projectives
P := IndecProjectiveModules(KQ);
Display(List(P, x -> DimensionVector(x)));
MatricesOfPathAlgebraModule(P[1]);
#
#               Indecomposable injectives
I := IndecInjectiveModules(KQ);
Display(List(I, x -> DimensionVector(x)));
#
#               Simples
S := SimpleModules(KQ);
Display(List(S, x -> DimensionVector(x)));
#
#               Projective covers, 1stSyzygy
#
#      ProjectiveCover(M)    P(M) ----> M
#
p1 := ProjectiveCover(S[1]);    
M1 := Kernel(p1);  
M2 := 1stSyzygy(S[1]);
IsomorphicModules(M1,M2);
#
#             Almost split sequences
# 
eta := AlmostSplitSequence(S[1]);
I2 := Range(eta[1]); 
DimensionVector(I2);
L := DecomposeModule(I2);
eta2 := AlmostSplitSequence(I2);
U := Range(eta2[1]);
L := DecomposeModule(U);
DimensionVector(L[1]);
DimensionVector(L[2]);
IsomorphicModules(S[2],L[1]);
IsomorphicModules(S[2],L[2]);
eta3 := AlmostSplitSequence(S[2]);
#
#               Periodic algebras
#
q := Quiver(1,[[1,1,"a"],[1,1,"b"]]);
Kq := PathAlgebra(Rationals,q);
gens := GeneratorsOfAlgebra(Kq);
a := gens[2];
b := gens[3];
relations := [a*b+b*a,a*a*a-b*b];
I := Ideal(Kq,relations);
gb := GBNPGroebnerBasis(relations,Kq);
gbb := GroebnerBasis(I,gb);
A := Kq/I;
Dimension(A);
IsSelfinjectiveAlgebra(A);
Aenv := EnvelopingAlgebra(A);
Dimension(Aenv);
M := AlgebraAsModuleOfEnvelopingAlgebra(Aenv);
IsOmegaPeriodic(M,5);
#
#               Hochschild cohomology of
#               Rationals<x,y>/(x^2, xy+2yx, y^2)
#
Q := Quiver(1,[[1,1,"x"],[1,1,"y"]]);
KQ := PathAlgebra(Rationals,Q);
gens := GeneratorsOfAlgebra(KQ);
x := gens[2];;
y := gens[3];;
rels := [x^2,x*y+2*y*x,y^2];;
I := Ideal(KQ,rels);;
gb := GBNPGroebnerBasis(rels,KQ);;
gbb := GroebnerBasis(I,gb);;
A := KQ/I;;
IsSelfinjectiveAlgebra(A);
Aenv := EnvelopingAlgebra(A);
M := AlgebraAsModuleOfEnvelopingAlgebra(Aenv);
H0 := HomOverAlgebra(M,M);
Length(H0);
Center(A);
#
#             ExtOverAlgebra(M,N)[1] = Omega(M) --> P(M)
#             ExtOverAlgebra(M,N)[2] = list of maps Omega(M) --> N
#
H1 := ExtOverAlgebra(M,M);
Length(H1[2]);
M1 := 1stSyzygy(M);
H2 := ExtOverAlgebra(M1,M);
Length(H2[2]);
M2 := 1stSyzygy(M1);
H3 := ExtOverAlgebra(M2,M); 
M3 := 1stSyzygy(M2);
H4 := ExtOverAlgebra(M3,M); 
#
#
#     That's it, folks.
#     
#     Thank you for your attention.
#
#
