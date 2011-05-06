
############################################################################
################### Function to append poset elements to x #################
############################################################################
 
def build_line(x,s,f):
    p=list(s)
    q=list(f)
    if s[0]>f[0] or s[1]>f[1]:
        return
    x.append(tuple(p))
    while p!=q:
        if p[0]<q[0]:
            p[0]+=1
        if p[1]<q[1]:
            p[1]+=1
        x.append(tuple(p))
    return

############################################################################
########### Function to append lines of elements of poset to x #############
############################################################################

def build_block(x,sc,fc):
    if fc[1]-sc[1] > fc[0]-sc[0]:
        for i in range(sc[0],fc[0]+1):
            build_line(x,(i,sc[1]),(i,fc[1]))
    else:
        for i in range(sc[1],fc[1]+1):
            build_line(x,(sc[0],i),(fc[0],i))
    return
    
############################################################################
################### Relations between elements a and b #####################
############################################################################

def relations(a,b,p1=None,q1=None,p2=None,q2=None):
    if a[0]==b[0]:
        if b[1]==p1 and a[0]==q1:
            return False
        if a[1]+1==b[1]:
            return True
    elif a[1]==b[1]:
        if b[1]==p2 and a[0]==q2:
            return False
        if a[0]+1==b[0]:
            return True
    elif p1 is not None and p2 is not None:
        if b[0]>q1-1 and b[1]>p1-1:
            if a[0]+1==b[0] and a[1]+1==b[1]:
                return True
    return False

############################################################################
############# Function to return d-complete poset of class 1 ###############
############################################################################

def poset_1(part): # part = [base,height,hline1,...,hline_n]
		
    if len(part)>part[1]+2:
        raise ValueError("part can have a maximum length of part[1] (height=%s).\nThere can be a maximum of %s hlines."%(str(part[1]),str(part[1])))

    for i in range(2,len(part)):
        if part[i]+2>part[0]:
            raise ValueError("part[%s] (hline%s) is too long. It can have a maximum length of %s."%(str(i),str(i-1),str(part[0]-2)))

    x=[]
    
    build_block(x,(0,0),(1,part[0]-1))
    
    build_block(x,(2,0),(part[1]-1,1))

    ### Optional parts ###
    
    for i in range(2,len(part)):
        build_line(x,(i,2),(i,part[i]+1))
        
    def rel(a,b):
        return relations(a,b)
                 
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############# Function to return d-complete poset of class 2 ###############
############################################################################

def poset_2(part): # part = [base,vline1,...,vline_n]

    #if not all(x>y and x>0 and y>0 for x, y in zip(part, part[1:])):
    #    raise ValueError('part must be strictly decreasing and no zeros')
    #if part[0] > 1:
    #    if len(part) < 2:
    #        raise ValueError('part does not have enough elements')
    #    if part[1] != part[0]-1:
    #        raise ValueError('second element of part must be one less than first')    
    #elif part[0] > 2:
    #    if len(part) < 3:
    #        raise ValueError('part does not have enough elements')
    #    if part[2] < 1:
    #        raise ValueError('third element of part must be at least one') 

    x=[]
    
    x.append((0,0))
    
    build_block(x,(0,1),(1,part[0]-1))
    
    x.append((2,2))
    
    ### Optional parts ###
    
    for i in range(1,len(part)):
        build_line(x,(i+1,i+2),(i+part[i],i+2))
        
    def rel(a,b):
        return relations(a,b)
                 
    return Poset((x,rel),cover_relations=True)

############################################################################
############# Function to return d-complete poset of class 3 ###############
############################################################################

def poset_3(part): # part = [htail1,base,height,dtail1]
    
    x=[]
    
    build_line(x,(0,0),(0,part[0]-1))
    
    build_block(x,(0,part[0]),(1,part[1]-1))
    
    build_block(x,(2,part[0]),(part[2]-1,part[0]+1))
    
    build_line(x,(2,part[0]+2),(part[3]+1,part[3]+1+part[0]))
         
    def rel(a,b):
        return relations(a,b,part[0]+2,2,part[0]+2,1)
    
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############# Function to return d-complete poset of class 4 ###############
############################################################################

def poset_4(part): # part = [htail1,base,height,vline1,...,vline_n]
  
    x=[]
    
    build_line(x,(0,0),(0,part[0]-1))
    
    build_block(x,(0,part[0]),(1,part[1]-1))
    
    build_line(x,(2,part[0]+1),(part[2]-1,part[0]+1))
    
    ### Optional parts ###
    
    for i in range(3,len(part)):
        build_line(x,(2,part[0]+i-1),(part[i]+1,part[0]+i-1))         

    def rel(a,b):
        return relations(a,b)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############# Function to return d-complete poset of class 5 ###############
############################################################################

def poset_5(part): # part = [htail1,base,height,hline1,vline1]
    
    x=[]
    
    build_line(x,(0,0),(0,part[0]-1))
    
    build_block(x,(0,part[0]),(1,part[1]-1))

    build_line(x,(2,part[0]+1),(2,part[2]-1))

    build_line(x,(2,part[0]+2),(3,part[0]+3))
 
    ### Optional parts ###
    
    for i in range(3,len(part)-1):
        build_line(x,(3,part[0]+i-1),(2+part[i],part[0]+i-1))

    def rel(a,b):
        return relations(a,b,part[0]+3,3,part[0]+3,2)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############# Function to return d-complete poset of class 6 ###############
############################################################################

def poset_6(part): # part = [htail1,base,height,hline1,hline2]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-1))
    
    build_block(x,(0,part[0]),(1,part[1]-1))
    
    for i in range(2,4):
        build_line(x,(i,part[0]+1),(i,part[0]+3))
        
    build_line(x,(3,part[0]+1),(part[2]-1,part[0]+1))
     
    ### Optional parts ###
    
    for i in range(3,len(part)):
        build_line(x,(i-1,part[0]+4),(i-1,part[0]+3+part[i]))
        
    def rel(a,b):
        return relations(a,b,p1=part[0]+2,q1=3)
        
    return Poset((x,rel),cover_relations=True)

############################################################################
############# Function to return d-complete poset of class 7 ###############
############################################################################

def poset_7(part): # part = [htail1,base,height,vline1,vline2]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-1))
    
    build_block(x,(0,part[0]),(1,part[1]-1))

    build_block(x,(2,part[0]+1),(3,part[0]+3))
    
    build_line(x,(4,part[0]+1),(part[2]-1,part[0]+1))
    
    ## Optional parts ###
    
    for i in range(2,len(part)-1):
        build_line(x,(4,part[0]+i),(part[i+1]+3,part[0]+i))
             
    def rel(a,b):
        return relations(a,b,p2=part[0]+3,q2=1)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############# Function to return d-complete poset of class 8 ###############
############################################################################

def poset_8(part): # part = [base,height,vline1,...,vline4]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-4))
    
    build_block(x,(0,part[0]-3),(1,part[0]-1))

    build_block(x,(2,part[0]-2),(3,part[0]))
    
    build_line(x,(4,part[0]-2),(part[1]-1,part[0]-2))
    
    ### Optional parts ###
    
    for i in range(2,len(part)):
        if i < 4:
            build_line(x,(4,part[0]+i-3),(part[i]+3,part[0]+i-3))
        else:
            build_line(x,(3,part[0]+i-3),(part[i]+2,part[0]+i-3))
                     
    def rel(a,b):
        return relations(a,b)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############# Function to return d-complete poset of class 9 ###############
############################################################################

def poset_9(part): # part = [base,height,vline1,...,vline4]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-4))
    
    build_block(x,(0,part[0]-3),(1,part[0]-1))

    build_block(x,(2,part[0]-2),(3,part[0]))

    build_block(x,(3,part[0]-2),(4,part[0]+1))
 
    build_line(x,(5,part[0]-2),(part[1]-1,part[0]-2))
    
    for i in range(2,len(part)):
        if i == 5:
            build_line(x,(3,part[0]+2),(part[5]+2,part[0]+2))
        else:
            build_line(x,(5,part[0]+i-3),(part[i]+4,part[0]+i-3))

    build_line(x,(4,part[0]+1),(5,part[0]+2))
            
    def rel(a,b):
        return relations(a,b,part[0]+2,5,part[0]+2,4)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############ Function to return d-complete poset of class 10 ###############
############################################################################

def poset_10(part): # part = [base,height,vline1,...,vline4]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-4))
    
    build_block(x,(0,part[0]-3),(1,part[0]-1))

    build_block(x,(2,part[0]-2),(3,part[0]))

    build_block(x,(4,part[0]-2),(5,part[0]+2))
    
    build_line(x,(3,part[0]+1),(3,part[0]+2))
    
    build_line(x,(6,part[0]-2),(part[1]-1,part[0]-2))
    
    ### Optional parts ###
    
    for i in range(2,len(part)):
        build_line(x,(6,part[0]+i-3),(part[i]+5,part[0]+i-3))
    
    def rel(a,b):
        return relations(a,b,p2=part[0]+2,q2=3)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############ Function to return d-complete poset of class 11 ###############
############################################################################

def poset_11(part): # part = [base,height,vline1,...,vline_n]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-4))
    
    build_block(x,(0,part[0]-3),(1,part[0]-1))

    build_block(x,(2,part[0]-2),(3,part[0]))

    x.append((3,part[0]+1))
    
    build_block(x,(4,part[0]-2),(5,part[0]+2))
    
    build_line(x,(6,part[0]-2),(part[1]-1,part[0]-2))
    
    for i in range(2,len(part)):
        build_line(x,(6,part[0]+i-3),(part[i]+5,part[0]+i-3))
    
    def rel(a,b):
        return relations(a,b)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############ Function to return d-complete poset of class 12 ###############
############################################################################

def poset_12(part): # part = [base,height,vline1,vline2]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-4))
    
    build_block(x,(0,part[0]-3),(1,part[0]-1))

    build_block(x,(2,part[0]-2),(3,part[0]))

    build_block(x,(3,part[0]-2),(4,part[0]+2))
    
    build_line(x,(5,part[0]+1),(5,part[0]+2))
    
    build_line(x,(5,part[0]-2),(part[1]-1,part[0]-2))
    
    ### Optional parts ###
    
    for i in range(2,len(part)):
        build_line(x,(5,part[0]+i-3),(part[i]+4,part[0]+i-3))
    
    def rel(a,b):
        return relations(a,b,p1=part[0]+1,q1=5)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############ Function to return d-complete poset of class 13 ###############
############################################################################

def poset_13(part): # part = [base,height,vline1]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-4))
    
    build_block(x,(0,part[0]-3),(1,part[0]-1))

    build_block(x,(2,part[0]-2),(3,part[0]))

    build_block(x,(3,part[0]-2),(4,part[0]+2))
    
    build_line(x,(5,part[0]+1),(5,part[0]+2))

    build_line(x,(5,part[0]-2),(part[1]-1,part[0]-2))
            
    x.append((6,part[0]+2))
    
    ### Optional part ###
    
    for i in range(2,len(part)):
        build_line(x,(5,part[0]+i-3),(part[i]+4,part[0]+i-3))
    
    def rel(a,b):
        return relations(a,b)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############ Function to return d-complete poset of class 14 ###############
############################################################################

def poset_14(part): # part = [base,height]
     
    x=[]
    
    build_line(x,(0,0),(0,part[0]-4))
    
    build_block(x,(0,part[0]-3),(1,part[0]-1))

    build_block(x,(2,part[0]-2),(3,part[0]+1))

    build_block(x,(3,part[0]-2),(4,part[0]+2))
    
    build_line(x,(5,part[0]+1),(5,part[0]+2))
    
    build_line(x,(6,part[0]+2),(7,part[0]+2))
    
    build_line(x,(5,part[0]-2),(part[1]-1,part[0]-2))
    
    def rel(a,b):
        return relations(a,b)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
############ Function to return d-complete poset of class 15 ###############
############################################################################

def poset_15(): # only one ideal: itself
     
    x=[]

    build_line(x,(0,0),(0,2))
    
    build_block(x,(0,3),(1,4))

    build_block(x,(2,4),(3,6))

    build_block(x,(3,4),(4,8))
    
    build_line(x,(5,7),(5,8))
    
    build_line(x,(6,8),(8,8))
    
    def rel(a,b):
        return relations(a,b)
        
    return Poset((x,rel),cover_relations=True)
    
############################################################################
######## Function to return d-complete poset of class classification #######
############################################################################

def dCompletePoset(classification,description):
    
    if classification < 1 or classification > 15:
        raise ValueError('classification must be integer between 1 and 15')
        
    return dCompletePoset_class(classification, description)

############################################################################
######################## d-complete poset class ############################
############################################################################

from sage.combinat.posets.posets import FinitePoset,PosetElement

class dCompletePoset_class(FinitePoset):

    def __init__(self, classification, description):
    
        if classification==1:
            p = poset_1(description)
        if classification==2:
            p = poset_2(description)
        if classification==3:
            p = poset_3(description)
        if classification==4:
            p = poset_4(description)
        if classification==5:
            p = poset_5(description)
        if classification==6:
            p = poset_6(description)
        if classification==7:
            p = poset_7(description)
        if classification==8:
            p = poset_8(description)
        if classification==9:
            p = poset_9(description)
        if classification==10:
            p = poset_10(description)
        if classification==11:
            p = poset_11(description)
        if classification==12:
            p = poset_12(description)
        if classification==13:
            p = poset_13(description)
        if classification==14:
            p = poset_14(description)
        if classification==15:
            p = poset_15(description)
    
        FinitePoset.__init__(self,p)

        # This defines the type (class) of elements of poset.
        _element_type = PosetElement
        
        