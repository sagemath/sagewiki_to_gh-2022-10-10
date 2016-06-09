#################################################################
# NumerationClass.sage
# Author: Attila Kovács
# http://compalg.inf.elte.hu/~attila
# Last modification: June 5, 2016
#################################################################

##### Exception Handling #####
class NumberSystemException(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)
        
class NumberSystemFullResidueSystemException(NumberSystemException):
    def __init__(self, value):
        self.value = value
        
class NumberSystemExpansivityException(NumberSystemException):
    def __init__(self, value):
        self.value = value
        
class NumberSystemUnitConditionException(NumberSystemException):
    def __init__(self, value):
        self.value = value
        
class NumberSystemRegularityException(NumberSystemException):
    def __init__(self, value):
        self.value = value
        
##### The Number System Class #####
class NumberSystem:
    ### Checking the Expansivity
    def checkExpansivity(self):
        for i in [abs(p) for p in self.base.eigenvalues()]:
            if i <= 1:
                return false
        return true
    
    ### Checking the Unit Condition
    def checkUnitCondition(self):
        cp = self.base.charpoly()
        if abs(cp.subs(x=1)) == 1:
            return false
        return true
    
    ### Checking the Full Residue System Property and building the hashes of the digits
    def checkCRSPropertyAndBuildDigitsHashes(self):
        if len(self.digits) <> self.absDeterminant:
            raise NumberSystemFullResidueSystemException("The digit set must be a full residue system, it should have |det(M)| elements...")
        digitsList = []
        self.digitsHash = []
        for v in self.digits:
            res = 0
    	    i = self.dimension-1
    	    while i >= 0 and self.smithdiagonal[i] > 1:
                s = 0
                for j in range(self.dimension):
            	    s = s + (self.smU[i][j]*v[j] % self.smithdiagonal[i])
                res = res * self.smithdiagonal[i] + (s % self.smithdiagonal[i])
                i = i-1
            if res in digitsList:
                raise NumberSystemFullResidueSystemException("The digit set must be a full residue system, there are congruent elements...")
            else:
        	    digitsList.append(res)
        for i in range(len(digitsList)):
            self.digitsHash.append(self.digits[digitsList.index(i)])
        return true
    
    ### Computes the symmetric modulus of a number
    def getSymm_mod(self, num, mod):
        p=Mod(num,mod)
        r = p.lift()
        if r*2 > p.modulus():
            r -= p.modulus()
        return r
    
    ### Computes the congruent class of a given vector v using the Adjoint method
    def getAdjCongruentClass(self, v):
        v1 = []
        for i in range(self.dimension):
            s = 0
            for j in range(self.dimension):
                s = (s + self.adjointM[i,j]*v[j])
            s = self.getSymm_mod(s, self.base.det())
            v1.append(s)
        return v1
    
    ### Generates the j-canonical type digit set
    def generateCanonicalDigits(self, j):
        return [[a if b==j-1 else 0 for b in range(self.dimension)] for a in range(self.base.det().abs())]
    
    ### Generates the j-symmetric type digit set
    def generateSymmetricDigits(self, j):
        t=self.base.det().abs()
        return [[a-floor(t/2) if b==j-1 else 0 for b in range(self.dimension)] for a in range(t)]
    
    ### Generates the adjoint type digit set
    def generateAdjointDigits(self):
        ### first generating a complete residue system to cr_set
        insmU = self.smU.inverse()
        cr_set = []
        v = [0]*self.dimension
        j = 0
        finished = 0
        while finished == 0 and j < self.absDeterminant:
            cr_set.append((insmU * vector(v)).list())
            i = self.dimension-1
            while i >= 0 and v[i] == self.smithdiagonal[i] - 1:
                v[i] = 0
                i = i-1
            if i >= 0:
                v[i] = v[i] + 1
                j = j+1
            else:
                finished = 1
        ### second producing the adjoint type complete residue system
        Bs = []
        for i in cr_set:
            if i == [0]*self.dimension:
                Bs.append(i)
            else:
                Bs.append([x/self.base.det() for x in self.base*vector(self.getAdjCongruentClass(i))])
        return(Bs)
    
    ### Computes the congruent element for a given point v
    def getCongruentElement(self,v):
        res = 0
        i = self.dimension-1
        while i>=0 and self.smithdiagonal[i] > 1:
            s = 0
            for j in range(self.dimension):
                s = s + self.smU[i][j]*v[j]
            res = res * self.smithdiagonal[i] + (s % self.smithdiagonal[i])
            i = i-1
        return self.digitsHash[res]
    
    ### Computes the Phi function for a given point v
    def getPhi_fun(self,v):
        return((self.inverseM * (vector(v)-vector(self.getCongruentElement(v)))).list())
    
    ### Computes the Phi function for a given point v and gives back the congruent element as well
    def getPhi_fun_withDigit(self,v):
        w = self.getCongruentElement(v)
        return((self.inverseM * (vector(v)-vector(w))).list(),w)
    
    ### Computes the orbit from the starting point v
    def getOrbitFrom(self,v):
        R = [v]
        v1 = v
        v2 = self.getPhi_fun(v1)
        while not v2 in R:
            R.append(v2);
            v1 = v2
            v2 = self.getPhi_fun(v1);
        R.append(v2)
        return(R)
    
    ### Computes the set of points in the fraction set for plotting
    ### iterNum - the number of iterations, default is 7
    ### rgbcolor - the color, default is black
    ### flag - if it is 1 then the set of points of fractions are computed, if it is -1 then the opposite set, default is -1
    def getFractionsSetPlot(self, iterNum=7,rgbcolor=(0, 0, 0),flag=-1):
        K = [[0,0]]
        for i in range(1,iterNum):
            oldK = K[:]
            for d in self.digits:
                for k in oldK:
                    newPoint = (self.inverseM^i*vector(d) + vector(k)).list()
                    if newPoint not in K:
                        K.append(newPoint)
        K = [(flag * vector(k)).list() for k in K]
        return points(K,rgbcolor=rgbcolor)
    
    ### Computes the covering box of the fraction set
    ### The output is the coordinates of the lower and the upper corners of the box
    ### info - output to the screen, which can be True or False
    def getCoveringBox(self, info=True, eps=0.01):
        X = matrix.identity(self.dimension)
        v1 = [0]*self.dimension; v2 = [0]*self.dimension; v3 = [0]*self.dimension; v4 = [0]*self.dimension
        while X.norm(Infinity) >= eps:
            X = X * self.inverseM
            l = [X * vector(i) for i in self.digits]
            for i in range(self.dimension):
                y = 0; z = 0
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
        if info == True:
            print "Vertices of the covering Box of the periodic points: "
        return (v1,v3)
    
    ### The decision method
    def decideMethodA(self):
        ##### Checking the points in the Box
        if (self.lowBox == [0]*self.dimension and self.upBox == [0]*self.dimension):
            self.lowBox,self.upBox = self.getCoveringBox(info=False)
        v = self.lowBox[:]
        while true:
            last = self.getOrbitFrom(v)[-1]
            if last != [0]*self.dimension:
                print "Not GNS, one witness is: ", last
                return
            i = 0
            while i < self.dimension and v[i] == self.upBox[i]:
                v[i] = self.lowBox[i]
                i = i + 1
            if i < self.dimension:
                v[i] = v[i] + 1
            else:
                print("Numeration System")
                return
            
    ### The classification method of type A
    ### Gives back all the cycles
    def classifyMethodA(self):
        ##### Generating the points in the box
        if (self.lowBox == [0]*self.dimension and self.upBox == [0]*self.dimension):
            self.lowBox,self.upBox = self.getCoveringBox(info=False)
        v = self.lowBox[:]
        end = 0
        G = [];
        while end == 0:
            G.append(v[:])
            i = 0
            while i < self.dimension and v[i] == self.upBox[i]:
                v[i] = self.lowBox[i]
                i = i + 1
            if i < self.dimension:
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
                v = self.getPhi_fun(a)
                a = v
            if a in l:
                l.append(a)
                Li.append(l[l.index(a):len(l)])
        print "The classification is: "
        return Li
    
    ### Constructor
    ### m - the operator
    ### digits - the list of digits
    ### jDim - for canonical or symmetric digits set construction
    ### safeInit - for safe initialization, default is false
    def __init__(self, m, digits, jDim=1, safeInit=false):
        self.base = m
        self.absDeterminant = abs(self.base.det())
        
        if self.absDeterminant == 0:
            raise NumberSystemRegularityException("The operator must be regular")
        if self.checkUnitCondition() == False:
            raise NumberSystemUnitConditionException("abs(det(M-I)) must be greater than one")
        if self.checkExpansivity() == False:
            raise NumberSystemExpansivityException("The operator must be expansive")
            
        self.dimension = self.base.nrows()
        self.inverseM = self.base.inverse()
        self.adjointM = self.base.adjoint()
        self.sm,self.smU,self.smV = self.base.smith_form()
        self.smithdiagonal = [self.sm[i][i] for i in range(self.sm.nrows())]
        self.lowBox = [0]*self.dimension; self.upBox = [0]*self.dimension
        
        if (digits=='symmetric' and jDim > 0 and jDim <= self.dimension):
            self.digits=self.generateSymmetricDigits(jDim)
        elif (digits=='canonical' and jDim > 0 and jDim <= self.dimension):
            self.digits=self.generateCanonicalDigits(jDim)
        elif digits=="adjoint":
            self.digits=self.generateAdjointDigits()
        else:
            self.digits = digits
            
        self.checkCRSPropertyAndBuildDigitsHashes()
        
        