-- We investigate the 27 lines on a cubic surface

restart
printWidth=68
viewHelp
viewHelp minors

-- We start by constructing a cubic surface in P^3.
-- We choose 6 points, and blow them p
P2 = QQ[r,s,t]
p1 = trim minors(2, matrix"r,s,t;0,0,1")
p2 = trim minors(2, matrix"r,s,t;0,1,0")
p3 = trim minors(2, matrix"r,s,t;1,0,0")
p4 = trim minors(2, matrix"r,s,t;1,1,1")
p5 = trim minors(2, matrix"r,s,t;1,2,6")
p6 = trim minors(2, matrix"r,s,t;3,7,-2")
pts = {p1,p2,p3,p4,p5,p6}
I = intersect pts
netList I_*
P3 = QQ[a..d]
phi = map(P2,P3,gens I)
IX = kernel phi
RX = P3/IX

X = Proj RX
dim X
degree X
codim singularLocus X
HH^0(OO_X)
for i from 0 to 10 list rank HH^0(OO_X(i))

-- Consider the strict transform of the lines through 
-- two of the 6 points:
I1 = preimage(phi,ideal(t))  -- these are lines in P^3 on X
I2 = preimage(phi,ideal(s))
I3 = preimage(phi,ideal(r))

-- there are actually 15 of these
netList subsets(pts,2)
apply(subsets(pts,2), pq -> (
	  lin := (intersect(pq_0,pq_1))_0;
     	  lin))
Lines2 = apply(subsets(pts,2), pq -> (
	  lin := (intersect(pq_0,pq_1))_0;
	  preimage(phi, ideal(lin))))
#Lines2
Lines2/codim
Lines2/degree
codim(Lines2_0 + Lines2_1) -- these two lines do not meet

-- there are 6 conics through each set of 5 of the points
-- the preimages of these are lines in P^3
intersect drop(pts,1)
J = ideal((intersect drop(pts,1))_0)
preimage(phi,J)

Lines3 = for i from 0 to 5 list (
     J = intersect drop(pts,{i,i});
     preimage(phi,ideal(J_0))
     )
netList Lines3

-- There are 6 more lines on X: the exceptional curves 
-- of the blowup.
-- These can be obtained in a number of ways

-- One way is to construct the graph of the map 
--    phi:P2 ---> P3
-- (as a bigraded ideal)
S = QQ[r,s,t][a..d]
IS = sub(I,S)
m = matrix{{a,b,c,d},IS_*}
Gr = saturate(minors(2,m), ideal"a,b,c,d")
Gr = trim saturate(Gr,IS)
primaryDecomposition Gr

codim Gr -- so Gr defines a surface (which is isomorphic to X)
degree Gr_0
isHomogeneous Gr

trim(Gr + sub(p1,S))
primaryDecomposition oo
saturate(trim(Gr + sub(p1,S)), ideal(r_S,s,t))
select(oo_*, f -> first degree f > 0) -- equations of the line

Lines1 = apply(pts, p -> (
	  J := saturate(trim(Gr + sub(p,S)), 
	       ideal(r_S,s,t));
	  substitute(ideal select(J_*, f -> 
		    first degree f > 0), P3)
	  ))
netList Lines1

Lines = join(Lines1,Lines2,Lines3)
netList Lines
-- check that they all lie on X
tally apply(Lines, L -> isSubset(IX, L))

-- theory tells us that these 27 lines are all 
-- exceptional curves, i.e. have self 
-- intersection -1 on X.

-- Let's check that.
-- How should we find intersection numbers 
-- of curves on X?

LinesR = apply(Lines, L -> sub(L,RX));
L = LinesR_0
ML = sheaf Hom(L,RX)

euler RX
euler ML
euler(ML ** ML)

ML2 = ML ** ML
HH^0 ML2
HH^1 ML2
HH^2 ML2

intersectionNumber = (F,G) -> 
     euler ring F - euler F - euler G + euler(F**G)
     
intersectionNumber := method()
intersectionNumber(CoherentSheaf,CoherentSheaf) := (F,G) ->
     euler ring F - euler F - euler G + euler(F**G)

LinesM = apply(Lines, L -> sheaf Hom(sub(L,RX),RX))
apply(LinesM, F -> intersectionNumber(F,F))
matrix for i from 0 to 26 list
  for j from 0 to 26 list
    intersectionNumber(LinesM_i, LinesM_j)

Lines13 = LinesM_{0..5,21..26}
matrix apply(Lines13, L -> 
         apply(Lines13, M -> 
	      intersectionNumber(L,M)))
    

-- This configuration of 12 lines is called 
-- Schlaffi's double six
