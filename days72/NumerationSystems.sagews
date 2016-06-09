︠2b5155a7-be18-49da-b9b2-2dea83a4a891i︠
%html
<center><h1>Numeration Systems in Sage</h1></center>
<center><h3>by Attila Kovács</h3></center>
<center><h3>Eötvös Loránd University, Budapest</h3></center>

<center><h2>Guest Lecture at Sage Days, a satellite workshop of Numeration 2016</h2></center>
<center><h3>21-22 May, Prague</h3></center>
<hr />
<p>
This is an introductory lecture for computing Numeration Systems in Sage. We point out that this is <b>not</b> a full-fledged tutorial. Some more resources can be found in the author's home page at <<a href="http://compalg.inf.elte.hu/~attila">available here</a>>. Email: attila.kovacs at inf.elte.hu
</p>
︡1bff1911-9998-4308-9d0d-89ed68d330c5︡{"done":true,"html":"<center><h1>Numeration Systems in Sage</h1></center>\n<center><h3>by Attila Kovács</h3></center>\n<center><h3>Eötvös Loránd University, Budapest</h3></center>\n\n<center><h2>Guest Lecture at Sage Days, a satellite workshop of Numeration 2016</h2></center>\n<center><h3>21-22 May, Prague</h3></center>\n<hr />\n<p>\nThis is an introductory lecture for computing Numeration Systems in Sage. We point out that this is <b>not</b> a full-fledged tutorial. Some more resources can be found in the author's home page at <<a href=\"http://compalg.inf.elte.hu/~attila\">available here</a>>. Email: attila.kovacs at inf.elte.hu\n</p>"}
︠5470410a-6443-47b7-8fb5-a2fb44a548ddis︠
%md Linear operators, Eigenvalues, Expansivity and Unit condition
︡e4a5304e-6991-49ea-9921-c42f81b221d7︡{"hide":"input"}︡{"md":"Linear operators, Eigenvalues, Expansivity and Unit condition"}︡{"done":true}︡
︠3ed76851-0cf2-4680-8ce7-e14dabdab5ads︠
m = matrix(QQ, [[1,2,-3],[0,2,2],[0,-1,3]]); m
[abs(p) for p in m.eigenvalues()]
︡ee902567-0f04-43d8-b12d-59ab877179d6︡{"stdout":"[ 1  2 -3]\n[ 0  2  2]\n[ 0 -1  3]\n"}︡{"stdout":"[1, 2.828427124746190?, 2.828427124746190?]"}︡{"stdout":"\n"}︡{"done":true}︡
︠8cb8e958-76c6-4a55-914e-ab1277f77588s︠
m = Mat(ZZ,6,6).random_element(); m; [abs(p) for p in m.eigenvalues()]
m.charpoly(); m.det()
︡bb614cdd-cdc7-486d-aeb5-485c9c393322︡{"stdout":"[  4   6   5   2  -1  -1]\n[ -1   2 -10   0  -2   1]\n[  0   1  -1  -1  -4  -1]\n[ -1   0   0  -1   0   3]\n[  0   0  -1   0 -13   0]\n[ -4   0   3  -1   0  -1]\n[13.29127294226945?, 2.765432071777682?, 4.060812960994767?, 4.060812960994767?, 5.449371499654172?, 5.449371499654172?]\n"}︡{"stdout":"x^6 + 10*x^5 - 30*x^4 + 193*x^3 + 422*x^2 + 5142*x + 17999\n17999\n"}︡{"done":true}︡
︠4e3ed03c-8b3b-4c32-aeb7-606466e1ead3s︠
m = MatrixSpace(IntegerRing(),2)( [[1,2], [3,3]] ); m
f = m.charpoly(); f; m.det()
f.parent()
︡ef40047d-db92-4776-be55-c61b7b5093be︡{"stdout":"[1 2]\n[3 3]\n"}︡{"stdout":"x^2 - 4*x - 3\n-3\n"}︡{"stdout":"Univariate Polynomial Ring in x over Integer Ring\n"}︡{"done":true}︡
︠46ae62aa-40bb-43c1-a1cb-63c987e21ff2s︠
def checkRegularity(): #require: t = det(m)
    if t == 0:
        return false
    return true
def checkExpansivity(): #require m linear operator
    for i in [abs(p) for p in m.eigenvalues()]:
        if i<=1:
            return false
    return true
def checkUnitCondition(): #require m linear operator
    cp = m.charpoly()
    if abs(cp.subs(x=1)) == 1:
        return false
    return true
︡7e8cbeac-3291-4b82-9f50-fdb85af79150︡{"done":true}︡
︠afb3184c-e577-4e49-a56f-389360ba0dbc︠
for i in range(10):
    m=Mat(ZZ,3,3).random_element();t=m.det()
    if not(checkRegularity() and checkExpansivity() and checkUnitCondition()):
        print m, "can not be a base"
︡8539954c-812b-4a98-b596-ec634e526ea2︡{"done":true}︡
︠28e78680-5891-46ce-b0d1-c3b103dda5a4s︠
m=matrix(SR,2,[1,1,1,'m']);checkUnitCondition()

︡cc958863-4866-418b-93cf-40452a57f7a7︡{"stdout":"False"}︡{"stdout":"\n"}︡{"done":true}︡
︠15d92162-c722-49c8-a7f3-07b2b5b998f5s︠
m=random_matrix(ZZ, 5);m;A,B=m.frobenius(2);A;B;
︡7d1bcca6-6b06-4506-9079-224292bbd254︡{"stdout":"[-1  0 -1  5  0]\n[ 0 -1  2  1 -2]\n[-1 -1  0  1 12]\n[ 0  0  0  0 -6]\n[16  3  2  1  0]\n[   0    0    0    0 -744]\n[   1    0    0    0 -520]\n[   0    1    0    0 -597]\n[   0    0    1    0   10]\n[   0    0    0    1   -2]\n[              1   970819/572964  -327181/143241 -2215765/429723   -45985/572964]\n[              0   -38053/120624     -13318/7539   -137945/40208    -5779/120624]\n[              0    9923/1145928      1574/47747  180155/3437784      787/381976]\n[              0    2251/1145928    -1046/143241  -52567/3437784    -523/1145928]\n[              0   -1075/2291856      -143/47747  -40015/6875568     -143/763952]\n"}︡{"done":true}︡
︠c56e8b41-043d-4e01-aa17-65c2ed7b069c︠
︡474c0f09-efff-40d8-af82-4102aed1b161︡
︠7fd5d076-8c5d-4651-9faa-f22fcfd51af9s︠
m=Matrix(ZZ,2,[[2,-1],[1,2]]);Digits=[[0,0],[1,0],[0,1],[0,-1],[-6,-5]]
︡c1c6d6a4-435b-45bc-9908-f5c84b040b7c︡{"done":true}︡
︠1755e61d-5a6d-496a-a00d-b27d848a256ds︠
inM=m.inverse()
def getFractionSetPlot(iterNum=7,rgbcolor=(0, 0, 0),flag=-1): #Requires inM - inverse of m; and Digits
        K = [[0,0]]
        for i in range(1,iterNum):
            oldK = K[:]
            for d in Digits:
                for k in oldK:
                    newPoint = (inM^i*vector(d) + vector(k)).list()
                    if newPoint not in K:
                        K.append(newPoint)
        K = [(flag * vector(k)).list() for k in K]
        return points(K,rgbcolor=rgbcolor)
show(getFractionSetPlot())
︡17a62f16-43ef-482f-b54b-a37662d2323f︡{"file":{"filename":"/projects/cc1219bf-eea6-46ad-906e-ba5a1706a420/.sage/temp/compute2-us/15773/tmp_GNtdqN.svg","show":true,"text":null,"uuid":"12cdffe8-3a73-495d-a6e3-e3cb48c5e9ae"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠dc794dfb-ee12-49e1-9c01-f860dc31dd55s︠
︡3845e2e7-d226-4be9-a857-0db528bc0ff9︡{"done":true}︡
︠e8358b11-6ebe-4bbf-a4fb-b06cb6cdc386s︠
m=Matrix(ZZ,2,[[-1,-1],[1,-1]]);Digits=[[0,0],[1,0]]
inM=m.inverse();show(getFractionSetPlot(iterNum=14, rgbcolor=(0.2,0.6,0.1), flag=1),aspect_ratio=1)
︡cfe5faea-e806-4eaa-88df-ffa04b47f32e︡{"file":{"filename":"/projects/cc1219bf-eea6-46ad-906e-ba5a1706a420/.sage/temp/compute2-us/15773/tmp_vlcdUG.svg","show":true,"text":null,"uuid":"f14ce8d1-80c2-456b-98f6-26e1078bcda6"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠e59bc3e9-b335-49e9-bed0-286b2212f496s︠
︡d95e86c1-9c82-41b2-b271-fc3ab5e9c739︡
︠907042c0-43d5-4317-9ac2-97d03175eb31s︠
m=Matrix(ZZ,2,[[1,-2],[1,1]]);Digits=[[0,0],[1,0],[-1,0]]
inM=m.inverse();show(getFractionSetPlot(iterNum=10, rgbcolor=(0.2,0.6,0.1), flag=1),aspect_ratio=1)
︡bfce9184-91c9-424c-82f4-ed638339d5ee︡{"file":{"filename":"/projects/cc1219bf-eea6-46ad-906e-ba5a1706a420/.sage/temp/compute2-us/15773/tmp_IUNjhf.svg","show":true,"text":null,"uuid":"c85d5e42-47f3-4c25-a260-8698a3fd94f7"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠3bcc782a-bc38-4c67-94d0-ebb43614efd7s︠

︡0841f48a-cbc2-4c5e-bdb5-3da3bfee3be8︡{"done":true}︡
︠54de25e2-4a18-4cbc-b26e-50e7eaf6d6f2is︠
%md Computing Orbit - Congruences
︡84ae80fc-8bbf-48a1-8c2d-e239123116d1︡{"hide":"input"}︡{"md":"Computing Orbit - Congruences"}︡{"done":true}︡
︠28f95855-fbc1-41ca-95ee-265bd2482a61is︠
%md Hashing by the Adjoint method
︡fd89134f-8dcc-48d6-bf0a-a4356c485337︡{"hide":"input"}︡{"md":"Hashing by the Adjoint method"}︡{"done":true}︡
︠2bcb2f17-03f7-4da4-91d6-aa7560d9de5es︠
︡0db08f0c-56a7-460e-beea-91f2a44caafe︡
︠5c168444-f3e2-4f89-b212-66cbd872efd8s︠
n = 2
m = MatrixSpace(IntegerRing(),n)( [[4,1], [1,2]] )
adM = m.adjoint(); t = m.det().abs()
def congr_class_adj(v): #Require dimension n, adM - adjoint of m, t = det(m)
    v1=[]
    for i in range(n):
        s=0
        for j in range(n):
            s=(s+(adM[i,j]*v[j] % t))
        v1.append(s % t)
    return v1
congr_class_adj([1,1])
congr_class_adj([0,-1])
congr_class_adj([1,2])
congr_class_adj([-3,0])
︡efe10c3e-b397-46f5-9d95-3b31f94d5cbe︡{"stdout":"[1, 3]\n"}︡{"stdout":"[1, 3]\n"}︡{"stdout":"[0, 0]\n"}︡{"stdout":"[1, 3]\n"}︡{"done":true}︡
︠f9462d67-003a-4ca3-9d6a-ac773314347bis︠
%md Hashing by Smith normal form
︡30ef32f5-8cb9-4ac8-b7b8-913f44e2b729︡{"hide":"input"}︡{"md":"Hashing by Smith normal form"}︡{"done":true}︡
︠704bc834-999e-43ad-a2b3-a9868d9c79bas︠
Sm,smU,V = m.smith_form(); smU
smithdiag = [Sm[z][z] for z in range(Sm.nrows())];smithdiag
def congr_class_sm(v): #Require dimension n, smithdiag[] - smith diagonal, smU - smith U
    v1=[]
    i = n-1
    while i>=0 and smithdiag[i] > 1:
        s = 0
        for j in range(n):
            s = (s + (smU[i][j]*v[j] % smithdiag[i]));
        v1.append(s % smithdiag[i])
        i = i-1
    return v1
congr_class_sm([1,1])
congr_class_sm([0,-1])
congr_class_sm([1,2])
congr_class_sm([-3,0])
︡43868f8f-63c5-45a9-a038-00e36ae0dc88︡{"stdout":"[ 0  1]\n[ 1 -4]\n"}︡{"stdout":"[1, 7]\n"}︡{"stdout":"[4]\n"}︡{"stdout":"[4]\n"}︡{"stdout":"[0]\n"}︡{"stdout":"[4]\n"}︡{"done":true}︡
︠501fa947-6c4c-4a41-9715-cfa479920312is︠
%md Finding the congruent element
︡459e10bd-1924-4a5d-9204-fcb13067b2e2︡{"hide":"input"}︡{"md":"Finding the congruent element"}︡{"done":true}︡
︠4eeebb80-2167-427a-accd-ce9c7b0fa34as︠
n=2
m = MatrixSpace(IntegerRing(),n)( [[4,1], [1,2]] )
inM = m.inverse()
Digits = [[0,0],[1,1],[2,1],[2,2],[3,1],[3,2],[4,2]]
DigitsHash = []
Sm,smU,V = m.smith_form()
smithdiag = [Sm[i][i] for i in range(Sm.nrows())];smithdiag;m.det()
for i in Digits:
    DigitsHash.append(congr_class_sm(i))
def findCongrElement(v): #Require: DigitHash[]
    i=0
    while DigitsHash[i] != congr_class_sm(v):
        i=i+1
    return(Digits[i])
findCongrElement([10,6])
findCongrElement([0,-2])
findCongrElement([0,2])
︡a41b5396-675a-4665-af04-3d544a56ce4c︡{"stdout":"[1, 7]\n7\n"}︡{"stdout":"[0, 0]\n"}︡{"stdout":"[2, 2]\n"}︡{"stdout":"[3, 1]\n"}︡{"done":true}︡
︠1d872c3b-7cce-4cd4-b411-699fc384451ais︠
%md Hashing and finding the congruent element using mixed radix representation
︡899ecb0a-d96e-4fd8-a0be-e716fac659b9︡{"hide":"input"}︡{"md":"Hashing and finding the congruent element using mixed radix representation"}︡{"done":true}︡
︠945f251c-c9b8-40c7-a1f3-b24f0a8f6a0es︠
DigitsList = []; DigitsL = []
for v in Digits:
    res = 0
    i = n-1
    while i>=0 and smithdiag[i] > 1:
        s = 0
        for j in range(n):
            s = (s + (smU[i][j]*v[j] % smithdiag[i]))
        res = res * smithdiag[i] + (s % smithdiag[i])
        i = i-1
    DigitsList.append(res)
for i in range(len(DigitsList)):
    DigitsL.append(Digits[DigitsList.index(i)])
def findCongruentElement(v): #Require dimension n, smithdiag[] - smith diagonal, smU - smith U, DigitsL
    res = 0
    i = n-1
    while i>=0 and smithdiag[i] > 1:
        s = 0
        for j in range(n):
            s = (s + (smU[i][j]*v[j] % smithdiag[i]))
        res = res * smithdiag[i] + (s % smithdiag[i])
        i = i-1
    return DigitsL[res]
findCongruentElement([10,6])
findCongruentElement([0,-2])
findCongruentElement([0,2])
findCongrElement([0,-1])
︡3c3f0426-37b7-44a2-8f00-f366fbdbf61d︡{"stdout":"[0, 0]\n"}︡{"stdout":"[2, 2]\n"}︡{"stdout":"[3, 1]\n"}︡{"stdout":"[1, 1]\n"}︡{"done":true}︡
︠5ac9283d-9f75-48cd-ada0-88d9c67e98fci︠

%md Function Phi
︡2e5f52c4-5f83-4c73-b389-8f0642593a0f︡{"hide":"input"}︡{"md":"Function Phi"}︡{"done":true}︡
︠c4e107cc-d338-447e-8408-12597f8c12f8s︠
def Phi_fun(v):
    return((inM * (vector(v)-vector(findCongruentElement(v)))).list())
Phi_fun([10,5])
Phi_fun([0,-2])
def Phi_fun_withDigit(v):
    w = findCongruentElement(v)
    return((inM * (vector(v)-vector(w))).list(),w)
Phi_fun_withDigit([10,5])
Phi_fun_withDigit([0,-1])
︡fc6cd6be-c8bb-49ce-a795-e2f92b70ac71︡{"stdout":"[2, 1]\n"}︡{"stdout":"[0, -2]\n"}︡{"stdout":"([2, 1], [1, 1])\n"}︡{"stdout":"([0, -1], [1, 1])\n"}︡{"done":true}︡
︠997db86c-cd34-4a86-85a7-d00620761a77is︠
%md Orbit
︡d46018f1-c466-4d61-826e-29b892e52ca4︡{"hide":"input"}︡{"md":"Orbit"}︡{"done":true}︡
︠5a775909-09ff-4dbb-9df1-a142e4a9e4a8s︠
def OrbitFrom(v): #Require Phi_fun()
    R = [v]
    v1 = v
    v2 = Phi_fun(v1)
    while not v2 in R:
        R.append(v2);
        v1 =v2
        v2 = Phi_fun(v1);
    R.append(v2)
    return(R)
L = OrbitFrom([42,73]);L
L[-1] #a periodic point
︡c84635ae-f639-42f4-b3bc-4e99cbbf484a︡{"stdout":"[[42, 73], [1, 35], [-5, 19], [-5, 11], [-3, 7], [-2, 4], [-2, 2], [-1, 1], [-1, 0], [-1, 0]]\n"}︡{"stdout":"[-1, 0]\n"}︡{"done":true}︡
︠8d70834c-36bb-4c21-a1f3-ad36fb97c28di︠
%md Box Computing
︡53bb2b00-e217-4c34-a0e2-877abccb22c5︡{"hide":"input"}︡{"md":"Box Computing"}︡{"done":true}︡
︠d26857e6-16da-4d29-b170-9691f929fab3s︠
def Box_Computing(eps=0.01): #Requires: n, inM, Digits
    X = matrix.identity(inM.ncols())
    v1 = [0]*n
    v2 = [0]*n
    v3 = [0]*n
    v4 = [0]*n
    while X.norm(Infinity) >= eps:
        X = X * inM
        l = [X * vector(i) for i in Digits]
        for i in range(n):
            y = 0
            z = 0
            for j in l:
                y=min(j[i],y)
                z=max(j[i],z)
            v1[i] = y
            v3[i] = z
        v2 = [v1[i]+v2[i] for i in range(len(v1))]
        v4 = [v3[i]+v4[i] for i in range(len(v3))]
    tempMultiplier = 1/(1-X.norm(Infinity))
    v3 = [-ceil(x * tempMultiplier) for x in v2]
    v1 = [-floor(x * tempMultiplier) for x in v4]
    print("vertices of the n-dim. box ",v1,v3)
    return (v1,v3)
︡d0be6781-e090-4882-a17c-f03f6d73ddde︡{"done":true}︡
︠07e8ab95-9da9-4db5-b39b-65848672f6d0s︠
︡b757a048-a766-480e-b82d-9c8e8ee105cb︡
︠35a43506-40b9-493f-a3c0-54fdf065359es︠
LowBox,UpBox = Box_Computing()
︡61ec333c-f7ba-4e86-9449-7f40f013f14c︡{"stdout":"('vertices of the n-dim. box ', [-1, -2], [0, 0])\n"}︡{"done":true}︡
︠8355f468-703c-4770-a74b-1224863a1c66is︠
%md Decide Method A
︡02b8e395-443e-4876-9bc7-3c0d1a310583︡{"hide":"input"}︡{"md":"Decide Method A"}︡{"done":true}︡
︠2b25cd6a-dac6-4a9f-b71a-b0d868e307cds︠
︡b6718c3e-8ba5-4926-9d9f-b3f9abca9a69︡{"done":true}︡
︠c5c05978-a470-4d7e-b4ec-87cdff38197es︠
def Decide_Method_A(): #Require LowBox, UpBox, OrbitFrom()
    ##### Checking the points in the Box
    v = LowBox[:]
    while true:
        last = OrbitFrom(v)[-1]
        if last != [0]*n:
            print("Not GNS, one witness is: ", last)
            return
        i = 0
        while i < n and v[i] == UpBox[i]:
            v[i]=LowBox[i]
            i = i + 1
        if i < n:
            v[i] = v[i]+1
        else:
            print("Numeration System")
        return
︡2f71d539-a03d-49fe-b73e-e540135aba17︡{"done":true}︡
︠acf3aa8c-809f-43d4-8b67-a87e950a32ads︠
︡f3ecde33-912c-4956-a5e0-ab714f888b7c︡
︠d81152b6-b255-44ee-96d9-66ad97eeade4s︠
Decide_Method_A()
︡5702113b-d37f-4542-8719-956435ccbc64︡{"stdout":"('Not GNS, one witness is: ', [0, -1])\n"}︡{"done":true}︡
︠40a10413-5746-49d1-8e77-614e5ad62e55︠
︡a0fa7572-572a-4851-af76-76a7883bca37︡
︠f0a97119-a5f3-4364-aa5b-97aaeb1c15b0s︠
def Classify_Method_A(): #Require LowBox, UpBox, Phi-fun()
    ##### Generating the points in the Box
    v = LowBox[:]
    end = 0
    G = [];
    while end == 0:
        G.append(v[:])
        i = 0
        while i < n and v[i] == UpBox[i]:
            v[i]=LowBox[i]
            i = i + 1
        if i < n:
            v[i] = v[i]+1
        else:
            end = 1
    ##### Determining the cycles
    Li = []
    while len(G) > 0:
        l = []
        a = G[0];
        while a in G:
            G.remove(a)
            l.append(a)
            v = Phi_fun(a)
            a = v
        if a in l:
            l.append(a)
            Li.append(l[l.index(a):len(l)])
    return Li
︡d0b25e0f-05dd-4a6b-b8f4-51ba99dc9c31︡{"done":true}︡
︠4ad2ec87-08f0-4a4b-b2cf-862b7b18c878s︠
︡70e8709a-7d95-457c-98ea-80e195136668︡
︠b9fabf15-3dfa-4616-8f52-b491cccfee6es︠
Classify_Method_A()
︡1dcdf7d2-0a9d-4676-8474-39933c8a1866︡{"stdout":"[[[0, -1], [0, -1]], [[0, -2], [0, -2]], [[-1, -1], [-1, -1]], [[-1, 0], [-1, 0]], [[0, 0], [0, 0]]]\n"}︡{"done":true}︡
︠6e878644-8162-4710-ba0f-28ca64ad7ddes︠
︡8abb7fa1-da85-484a-b18e-db04533f0f9b︡
︠49e32957-618e-4261-a3b0-2739aaba9e0es︠
Phi_fun([0,-1])
Phi_fun([0,-2])
Phi_fun([-1,-1])
Phi_fun([-1,0])
︡fad4ab47-a2b9-4066-9e54-8f43ad353093︡{"stdout":"[0, -1]\n"}︡{"stdout":"[0, -2]\n"}︡{"stdout":"[-1, -1]\n"}︡{"stdout":"[-1, 0]\n"}︡{"done":true}︡
︠2efa389f-d590-49fb-b22e-1f0f826ea687is︠
%md Digit sets
︡bed68030-9ab9-4769-97f1-752788a3efbe︡{"hide":"input"}︡{"md":"Digit sets"}︡{"done":true}︡
︠fb2190d3-801a-4f93-8399-218f3d40a067s︠
def generateCanonicalCRS(mtx,j=1):
    return [[a if b==j-1 else 0 for b in range(n)] for a in range(mtx.det().abs())]
def generateSymmetricCRS(mtx,j=1):
    t=mtx.det().abs()
    return [[a-floor(t/2) if b==j-1 else 0 for b in range(n)] for a in range(t)]
︡84069aa8-1708-4329-bec0-3d0382c92a01︡{"done":true}︡
︠2875174f-ce92-4468-9801-18ae6ee8af61s︠

︡134d4010-4bae-4690-8a26-48c8d13a36df︡{"done":true}︡
︠e64eea2b-029c-4257-8a1d-986b6145d4fes︠
generateCanonicalCRS(m)
generateSymmetricCRS(m,2)
︡f3933c90-56ad-4c81-9281-28f7288d65b5︡{"stdout":"[[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0]]\n"}︡{"stdout":"[[0, -3], [0, -2], [0, -1], [0, 0], [0, 1], [0, 2], [0, 3]]\n"}︡{"done":true}︡
︠852a1901-ddc5-43f5-bee9-621d2e639fd0is︠
%md Example in the Gaussian ring
︡c6c55f94-eef6-46e6-ba9f-909e1cd01988︡{"hide":"input"}︡{"md":"Example in the Gaussian ring"}︡{"done":true}︡
︠2b407a29-1ed1-4e31-a4bf-af614c8d1e3as︠
R.<x> = QQ[]; # Q[x]
K.<i> = NumberField(x^2 +1);
alpha=-3+i
1+2*alpha+3*alpha^2+4*alpha^3
︡0c173572-5646-492f-b431-3458407019c2︡{"stdout":"88*i - 53\n"}︡{"done":true}︡
︠4a4d0061-6f96-4e36-8a89-d88809a9beb9s︠
M = MatrixSpace(IntegerRing(),2)( [[-3,-1], [1,-3]] ); M
︡0dc72ad6-743e-469a-bda2-4c7fc1507e9f︡{"stdout":"[-3 -1]\n[ 1 -3]\n"}︡{"done":true}︡
︠ccd5ef0f-7117-4208-8fe6-4a0f4889002as︠
vector([1,0])+M*vector([2,0])+M^2*vector([3,0])+M^3*vector([4,0])
︡55d5c58c-b91c-44df-a1c1-1d69255629f1︡{"stdout":"(-53, 88)\n"}︡{"done":true}︡
︠a8546a70-1130-4833-82b6-7c0952dc9c0fis︠
%md Other examples using the package NumerationClass
︡988467c3-1ee7-4d8b-b129-e068f3360813︡{"hide":"input"}︡{"md":"Other examples using the package NumerationClass"}︡{"done":true}︡
︠78169baf-d308-49b5-ad00-c6c20a13a1abs︠

︡1afb5414-3811-43da-879d-aa2ab6c38225︡{"done":true}︡
︠b5a69574-019a-4cd0-a6ae-109a2436c8c5s︠
sage.repl.load.load("NumerationClass.sage", globals())
︡c4e48d9e-d9b7-4174-a9d6-850eebbc4b09︡{"done":true}︡
︠595f85d2-0d0e-47f6-bf79-c8ad424dedd8s︠
R.<x> = ZZ[]
poly = x^5 + 2*x^2 + 6
m=companion_matrix(poly);m;t=m.det()
︡4f417d04-c336-4576-a03e-fb8085563633︡{"stdout":"[ 0  0  0  0 -6]\n[ 1  0  0  0  0]\n[ 0  1  0  0 -2]\n[ 0  0  1  0  0]\n[ 0  0  0  1  0]\n"}︡{"done":true}︡
︠6ed286aa-f2a3-4469-8c6c-567006b75fb2s︠
ns1 = NumberSystem(m,'canonical')
ns1.getCoveringBox()
︡23e85b2d-b7a5-4d93-8252-5b30f0594933︡{"stdout":"Vertices of the covering Box of the periodic points: \n([-1, -1, 0, 0, 0], [3, 3, 1, 1, 1])\n"}︡{"done":true}︡
︠68a6a689-f114-4d7b-8ca1-300d1a4d7b8css︠
ns1.decideMethodA()
︡8be0388a-d273-4572-81ea-709672b8ee1f︡{"stdout":"Numeration System"}︡{"stdout":"\n"}︡{"done":true}︡
︠64a778df-aab5-4447-afa3-404caf945368s︠
ns2 = NumberSystem(Matrix(ZZ,2,[[2,-1],[1,2]]),"canonical")
︡188e8cf8-487e-48a9-9f93-3fc3670088b9︡{"done":true}︡
︠c14a9120-7904-4e5b-a2a1-22ca4a047bbas︠
ns2.classifyMethodA()
︡edf82902-a8ee-47ed-9ce4-574da6f435d4︡{"stdout":"The classification is: \n[[[-1, 1], [-1, 1]], [[0, 0], [0, 0]], [[-2, 2], [-2, 2]]]\n"}︡{"done":true}︡
︠0138865d-5c7d-4df2-b109-4a953beb02b5s︠

ns3= NumberSystem(Matrix(ZZ,2,[[2,-1],[1,2]]),[[0,0],[1,0],[0,1],[0,-1],[-6,5]])
ns3.decideMethodA()

︡0d1f9374-9b60-47d2-bad4-425a208bb2ff︡{"stdout":"Numeration System\n"}︡{"done":true}︡
︠ee55e0b8-958d-46d0-9fcd-15b2d09ce648s︠
ns4=NumberSystem(Matrix(ZZ,2,[[8,-4],[3,-4]]),digits='adjoint')
︡e1717f35-e658-472e-be35-eb4e2c65ce57︡{"done":true}︡
︠4e218aef-a9d8-4a31-a2ca-d5e076f3e689s︠
ns4.decideMethodA()
︡afd16799-11f6-4fac-80e1-ceae9b4369c9︡{"stdout":"Numeration System\n"}︡{"done":true}︡
︠0156400a-8619-4280-a357-351c8fe78115s︠
show(ns4.getFractionsSetPlot(4, (0.2,0.6,0.1), 1),aspect_ratio=1)
︡88d2ce4d-6806-4985-adba-be186b882085︡{"file":{"filename":"/projects/cc1219bf-eea6-46ad-906e-ba5a1706a420/.sage/temp/compute2-us/15773/tmp_PtT7uT.svg","show":true,"text":null,"uuid":"f85df7b4-b5b0-4146-ba9f-1d71285c5f25"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠84551a49-d15d-4160-822e-b0a410e8f703︠










