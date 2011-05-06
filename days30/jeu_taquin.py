####################################################################################
#																				   #
# Takes the poset, a vertex and a dictionary as input and returns a map (in the    #
# form of a list) for making a new dictionary.									   #
#																				   #
####################################################################################

def assignment_map(pos,vert,dic,comp):
    upc=pos.upper_covers(vert)
    kgo=False
    next=None
    value=len(pos.list())+1
    
    for x in upc:
        a=x.element
        
        if dic[a][0]==comp and dic[a][1]<value:
            next=x
            value=dic[a][1]
    
    if next is not None:
        shift=[[dic[vert],(comp,value)]]
        kgo=True
    
    while kgo:
        upc=pos.upper_covers(next)
        
        if upc==[]:
            kgo=False
            shift.append([dic[next.element],dic[vert]])
        else:
            test=None
            value=len(pos.list())+1
            for x in upc:
                a=x.element
                if dic[a][0]==comp and dic[a][1]<value:
                    test=x
                    value=dic[a][1]
            if test is not None:
                shift.append([dic[next.element],dic[test.element]])
                next=test
            else:
                kgo=False
                shift.append([dic[next.element],dic[vert]])
    
    if next is not None:
        return shift
	 
########################################################################################
#																					   #
# Gets a tuple corresponding to next poset											   #
#																					   #
########################################################################################

def get_vertex(dic,val,tag,istuple=True):
    V = dic.values()
    K = dic.keys()
    D2 = dict((V[i],K[i]) for i in xrange(len(V)))
    if istuple:
        return D2.get((tag,val))
    else:
        return D2.get(val)

#######################################################################################
#																					  #
# Gets amount of elements in the ideal												  #
#																					  #
#######################################################################################
def amount_ideal(dic,ideal):
    amount=0
    for i in xrange(len(dic)):
        if dic.values()[i][0]==ideal:
            amount += 1
    
    return amount

#######################################################################################
#																					  #
# Creates a new dictionary with the input map										  #
#																					  #
#######################################################################################

def dic_shift(map,dic):
    for pos_key in dic.iterkeys():
        for map_el in map:
            if dic[pos_key]==map_el[0]:
                dic[pos_key]=map_el[1]
                break
    return dic

#######################################################################################
#																					  #
# Jeu de taquin function. Plays out jeu de taquin for poset.						  #
#																					  #
# dictionary must be of the form: D1 = {(0,0):('a',1), (0,1):('a',2), (1,0):('a',3),  #
# (2,0):('a',4), (1,1):('b',1), (2,1):('b',2), (0,2):('b',3), (1,2):('b',4),		  #
# (2,2):('b',5)}																	  #
#																					  #
#######################################################################################

def jeu_taquin(pos,dic,ideal='a',comp='b'):
    newdic = dic
    length = amount_ideal(dic,ideal)
    
    for i in xrange(length,0,-1):
        ver=get_vertex(newdic,i,ideal)  # gets a tuple representing a vertex in the ideal
        map=assignment_map(pos,ver,newdic,comp) # creates a map for modifying the dict.
        newdic=dic_shift(map,newdic) # creates a new dictionary with the map
    
    return newdic
	
########################################################################################
#																					   #
# Promoter function. Given a numbered poset, plays out one promotion.				   #
#																					   #
# dictionary must be of the form: 
#
#
########################################################################################
			
			
def promoter(pos,dic):
    dic[get_vertex(dic,1,None,istuple=False)]=('a',1)
    
    for i in range(2,len(pos.list())+1):
        dic[get_vertex(dic,i,None,istuple=False)]=('b',i-1)
    
    dic=jeu_taquin(pos,dic)
    
    dic[get_vertex(dic,1,'a')]=len(pos.list())
    
    for i in range(1,len(pos.list())):
        dic[get_vertex(dic,i,'b')]=i

#########################################################################################
#																						#
# Executes n promotions on the input poset												#
#																						#
#########################################################################################

def promotion_loop(pos,dic,n):
    set=pos
    for i in range(n):
        set=promoter(set,dic)
    
    return set	
		