# François Maltey - october 2010 
#
# The "mapexpression" function maps recursively an expression as a tree.
#
# This function 
#    remains the framework of the expression, 
#    treats first the leaves and then the composed expression, and
#    can change only some subtree.
# This change can be done 
#    at the main level only, 
#    at some levels in the tree,
#    at all the levels.
# 
# The function goes thru sum and product and can consider 
# that the depth of the subexpression doesn't change.
# 
# expr = the current expression
# mulDepth = 0 or 1, if 0 the depth in the tree remains the same in a sum.
# addDepth = 0 or 1, if 1 the depth in the tree increases in a product.
# fct = the effective function called for subtrees 
# param = the parameter of fct
# level = -1 for a fully recursive call, or the list of levels to treat.
# level = [0] for the first main level.

import operator

def mapexpression (expr, fct, param, level, addDepth=0, mulDepth=0) :
  def mapex (expr, depth) :               # a very local function
    opor = expr.operator()     
    opands = expr.operands()  
    if (opor == None) : return expr       # a leaf in the expression tree 
    if (opor == operator.add) :           # recursive call thru sum
      opands = map (lambda ex : mapex (ex, depth+addDepth), opands)
      return add (opands)
    if (opor == operator.mul) :           # recursive call thru mul
      opands = map (lambda ex : mapex (ex, depth+mulDepth), opands)
      return mul (opands)   
    if (level == -1) or (level[-1] >= depth) : # recursive call over operands
      opands = map (lambda ex : mapex (ex, depth+1), opands)
    if level == -1 or depth in level :    # root of the subtree must be changed
      return fct (opor, opands, param)
    return opor (*opands) # opands may or maynot be changed by a recursive call
  return mapex (expr, 0) 

#
# Choose the sign of expressions in respect of the opposite form.
# If a-b is said "positive" then -(a-b) is negative.
# For 

def pseudoPositive (expr) :
  if expr._is_real() : 
    return bool (RR(expr) >= 0) # can be improved by .is_positive()
  if expr._is_numeric () :      # see .is_positive()
    return bool ((expr.real() > 0) or (expr.real() == 0 and expr.imag() > 0))
  if expr._is_symbol() : return True  # a_variable as x or a "is positive"
  opor = expr.operator()
  opands = expr.operands()
  if opor == operator.mul :            # look at the last factor in a product
    return pseudoPositive (opands[-1]) # it's the number if there is one
  if opor == operator.add :    # look at the first term in a sum
    return pseudoPositive (opands[0]) 
  return True    # for functions call as sin(x)...

def pseudoRealAndImag (expr) : # try to get (a,b) from a+i*b
  opands = expr.operands()     # don't decompose (a+i*b)*(x+i*y)
  opor = expr.operator()       
  if opor == operator.mul :    # but treat Complex_number * expressions   
    coeff = 1 
    unit = 1
    for ex in opands :
      if ex._is_numeric() : coeff = coeff * ex
      else : unit = unit*ex
    return (coeff.real()*unit, coeff.imag()*unit)
  elif opor == operator.add :  # and treat sum
    rp = 0
    ip = 0
    for ex in opands :
      if ex._is_numeric() : rp = rp + ex.real() ; ip = ip + ex.imag()
      res = pseudoRealAndImag(ex)
      rp = rp + res[0] 
      ip = ip + res[1]
    return (rp, ip)
  return (expr, 0)             # in doubt remain the expression as real

# There are 2 uses of rewrite : 
#   either by the 2 parameters source=... and target=...
#   either by the name "source2target" of this rule
# This function transforms the first method to the second one

def searchRule (source, target) :
  if source in [sin,cos] and target in [sinh,cosh] : return ["trigo2trigh"]
  elif source == exp and target in [sin,cos] : return ["exp2trigo"]
  elif source == exp and target in [sinh,cosh] : return ["exp2trigh"]
  elif source in [sin,cos] and target == exp : return ["exp2trigo"]
  elif source in [sinh,cosh] and target == exp : return ["exp2trigh"]
  else : return "can't match source and target, use one rule or a list of rules"

def rewrite (expr, rule=None, source=None, target=None, filter=None, level=-1) :
  if rule==target==None :    # the function controls the most common errors 
    return "must choose either rule=... or target=..."
  if rule!=None and target!=None :
    return "must choose either rule=... or target=..."
  if target==None and source!= None :
    return "must choose target=... for a definded source"
  if rule==None : rule=searchRules (source, target)
  elif type(rule)==str : rule=[rule]
  else : return 'a rule must be a string or a list of strings'
  if filter==None : filter = lambda ex : true
  if type(filter).__name__ != 'function' :
    return 'filter must be a function'
  if level != -1 and type(level) != list :
    return 'level must be -1 for a fully recursive call or a list of integer'
  k=0 
  while k<len(rule) : 
    if rule[k] == "sinhcosh2exp" :   # sinh(x) -> (exp(x)-exp(-x))/2, ...
      expr = mapexpression (expr, sinhcosh2exp, filter, level)
    elif rule[k] == "sincos2exp" :   # sin(x) -> (exp(ix)-exp(-ix))/(2i), ...
      expr = mapexpression (expr, sincos2exp, filter, level)
    elif rule[k] == "exp2sinhcosh" : # exp(x) -> sinh(x)+cosh(x)
      expr = mapexpression (expr, exp2sinhcosh, filter, level)
    elif rule[k] == "exp2sincos" :   # exp(x)=exp(i*(-ix)) -> cos(ix)-i*sin(ix) 
      expr = mapexpression (expr, exp2sincos, filter, level)

    elif rule[k] == "trigo2trigh" :  # cos(x) -> cosh(ix), ...
      expr = mapexpression (expr, trigo2trigh, filter, level)
    elif rule[k] == "trigh2trigo" :  # cosh(x) -> cos(i*x), ...
      expr = mapexpression (expr, trigh2trigo, filter, level)

    elif rule[k]== "trigo2sincos" :  # tan, cot, sec, csc -> sin, cos
      expr = mapexpression (expr, trigo2sincos, filter, level)
    elif rule[k]== "trigh2sinhcosh" :# tanh, coth, sech, csch -> sinh, cosh
      expr = mapexpression (expr, trigh2sinhcosh, filter, level)

    elif rule[k]== "exp2trig" : #exp(a+i*b)->(cosh(a)+sinh(a))*(cos(b)+i*sin(b))
      expr = mapexpression (expr, exp2trig, filter, level)
    elif rule[k]== "lessIinExp" :    # exp(a+i*b) -> exp(a)*(cos(b)+i*sin(b))
      expr = mapexpression (expr, lessIinExp, filter, level)
    elif rule[k]== "lessIinTrig" :   # cos(i*x) -> cosh(x), ...
      expr = mapexpression (expr, lessIinTrig,filter,level)
    
    elif rule[k]== "trigo2exp" : rule.extend(["sincos2exp", "trigo2sincos"])
    elif rule[k]== "trigh2exp" : rule.extend(["sinhcosh2exp", "trigh2sinhcosh"])
    elif rule[k]== "trig2exp" : rule.extend(["trigo2exp", "trigh2exp"])
    
    elif rule[k]== "cos22sin" :
      expr = \
        mapexpression (expr, squareInPow,[cos, filter, positiveCos, \
                                      lambda ex:1-positiveSin(ex)^2], level)
    elif rule[k]== "sin22cos" :
      expr = \
        mapexpression (expr, \
          squareInPow, [sin, filter, positiveSin, lambda ex:1-positiveCos(ex)^2], level)
    elif rule[k]== "cosh22sinh" :
      expr = \
        mapexpression (expr, \
          squareInPow, [cosh, filter, positiveCosh, lambda ex:1+positiveSinh(ex)^2], level)
    elif rule[k]== "sinh22cosh" :
      expr = \
        mapexpression (expr, \
          squareInPow, [sinh, filter, positiveSinh, lambda ex:positiveCosh(ex)^2-1], level)
    elif rule[k]== "tan22cos" :
      expr = \
        mapexpression (expr,\
          squareInPow, [tan, filter, positiveTan, lambda ex:1/positiveCos(ex)^2-1], level)
    elif rule[k]== "cot22sin" :
      expr = \
        mapexpression (expr,\
          squareInPow, [cot, filter, positiveCot, lambda ex:1/positiveSin(ex)^2-1], level)
    elif rule[k]== "tanh22cosh" :
      expr = \
        mapexpression (expr, \
          squareInPow, [tanh,filter,positiveTanh,lambda ex:1-1/positiveCosh(ex)^2], level)
    elif rule[k]== "coth22sinh" :
      expr = \
        mapexpression (expr, \
          squareInPow, [coth,filter,positiveCoth,lambda ex:1/positiveSinh(ex)^2-1], level)
    elif rule[k]== "cos22tan" :
      expr = mapexpression (expr, squareInPow, \
       [cos, filter, positiveCos, lambda ex:1/(positiveTan(ex)^2+1)], level)
    elif rule[k]== "tancot22sincos" : rule.extend(["tan22cos", "cot22sin"])
    elif rule[k]== "tanhcoth22sinhcosh" : rule.extend(["tanh22cosh", "coth22sinh"])

    elif rule[k]== "sin2tancos" :
      expr = mapexpression (expr, sin2tancos, filter, level)
    elif rule[k] == "sincos2tan" :
      expr = mapexpression (expr, sin2tancos, filter, level)
      expr = expr.rational_simplify()
      expr = mapexpression (expr, squareInPow, \
       [cos, filter, positiveCos, lambda ex:1/(positiveTan(ex)^2+1)], level)
    elif rule[k]== "sinh2tanhcosh" :
      expr = mapexpression (expr, sinh2tanhcosh, filter, level)
    
    elif rule[k]== "sincos2tanHalf" :
      expr = mapexpression (expr, sincos2tanHalf, filter, level)
    elif rule[k]== "sinhcosh2tanhHalf" :
      expr = mapexpression (expr, sinhcosh2tanhHalf, filter, level)

    elif rule[k]== "exp2pow" :
      expr = mapexpression (expr, exp2pow, filter, level)
    elif rule[k]== "pow2exp" :
      expr = mapexpression (expr, pow2exp, filter, level)


    elif rule[k]== "asin2acos" :
      expr = mapexpression (expr, asin2acos, filter, level)
    elif rule[k]== "acos2asin" :
      expr = mapexpression (expr, acos2asin, filter, level)
    elif rule[k]== "atrigo2log" :
      expr = mapexpression (expr, atrigo2log, filter, level)
    elif rule[k]== "atrigh2log" :
      expr = mapexpression (expr, atrigh2log, filter, level)
    elif rule[k]== "factorial2gamma" :
      expr = mapexpression (expr, factorial2gamma, filter, level)
    elif rule[k]== "gamma2factorial" :
      expr = mapexpression (expr, gamma2factorial, filter, level)
#    elif rule[k]== "binomial2factorial" :
#      expr = mapexpression (expr, binomial2factorial, filter, level)

    elif rule[k]== "pseudoParity" :
      expr = mapexpression (expr, pseudoParity, filter, level)

    elif rule[k]== "logMainBranch" :
      expr = mapexpression (expr, logMainBranch, filter, level)
    elif rule[k]== "atrigoMainBranch" :
      expr = mapexpression (expr, atrigoMainBranch, filter, level)


    else : return "unknown rule"
    k=k+1
  return expr

def positiveSin (expr) : 
  if pseudoPositive (expr) : return sin (expr)
  else : return -sin(-expr)
def positiveCos (expr) : 
  if pseudoPositive (expr) : return cos (expr)
  else : return cos(-expr)

def positiveTan (expr) : 
  if pseudoPositive (expr) : return tan (expr)
  else : return -tan(-expr)
def positiveCot (expr) : 
  if pseudoPositive (expr) : return cot (expr)
  else : return -cot(-expr)

def positiveCsc (expr) : 
  if pseudoPositive (expr) : return csc (expr)
  else : return -csc(-expr)
def positiveSec (expr) : 
  if pseudoPositive (expr) : return sec (expr)
  else : return sec(-expr)

def positiveSinh (expr) : 
  if pseudoPositive (expr) : return sinh (expr)
  else : return -sinh(-expr)
def positiveCosh (expr) : 
  if pseudoPositive (expr) : return cosh (expr)
  else : return cosh(-expr)

def positiveTanh (expr) : 
  if pseudoPositive (expr) : return tanh (expr)
  else : return -tanh(-expr)
def positiveCoth (expr) : 
  if pseudoPositive (expr) : return coth (expr)
  else : return -coth(-expr)

def positiveCsch (expr) : 
  if pseudoPositive (expr) : return csch (expr)
  else : return -csch(-expr)
def positiveSech (expr) : 
  if pseudoPositive (expr) : return sech (expr)
  else : return sech(-expr)

def positiveAsin (expr) : 
  if pseudoPositive (expr) : return asin (expr)
  else : return -asin(-expr)
def positiveAtan (expr) : 
  if pseudoPositive (expr) : return atan (expr)
  else : return -atan(-expr)
def positiveAcot (expr) : 
  if pseudoPositive (expr) : return acot (expr)
  else : return -acot(-expr)
def positiveAcsc (expr) : 
  if pseudoPositive (expr) : return acsc (expr)
  else : return -acsc(-expr)
def positiveAsinh (expr) : 
  if pseudoPositive (expr) : return asinh (expr)
  else : return -asinh(-expr)
def positiveAtanh (expr) : 
  if pseudoPositive (expr) : return atanh (expr)
  else : return -atanh(-expr)
def positiveAcoth (expr) : 
  if pseudoPositive (expr) : return acoth (expr)
  else : return -acoth(-expr)
def positiveAcsch (expr) : 
  if pseudoPositive (expr) : return acsch (expr)
  else : return -acsch(-expr)

def exp2sinhcosh (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  if opor == exp :
    if not filter(opands[0]) : return opor (*opands)
    if pseudoPositive (opands[0]) :
      return (cosh (opands[0]) + sinh (opands[0]))
    else : 
       return (cosh (-opands[0]) - sinh (-opands[0]))
  return opor (*opands)

def exp2sincos (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  if opor == exp :
    if not filter(opands[0]) : return opor (*opands)
    co = I*opands[0] 
    if pseudoPositive (co) : return cos(co) - I * sin(co)
    else : return cos(-co) + I * sin(-co)
  return opor (*opands)

def sinhcosh2exp (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  if opor == sinh :
    if not filter(opands[0]) : return opor (*opands)
    return (exp (opands[0]) - exp (-opands[0]))/2
  elif opor == cosh :
    if not filter(opands[0]) : return opor (*opands)
    return (exp (opands[0]) + exp (-opands[0]))/2
  return opor (*opands)

def sincos2exp (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  if opor == sin :
    if not filter(opands[0]) : return opor (*opands)
    return -I/2 * (exp (I*opands[0]) - exp (-I*opands[0]))
  elif opor == cos :
    if not filter(opands[0]) : return opor (*opands)
    return (exp (I*opands[0]) + exp (-I*opands[0]))/2
  return opor (*opands)

def trigo2sincos (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  if opor == tan :
    if not filter(opands[0]) : return opor (*opands)
    return sin (opands[0]) / cos (opands[0])
  elif opor == cot :
    if not filter(opands[0]) : return opor (*opands)
    return cos (opands[0]) / sin (opands[0])
  elif opor == csc :
    if not filter(opands[0]) : return opor (*opands)
    return 1 / sin (opands[0])
  elif opor == sec : 
    if not filter(opands[0]) : return opor (*opands)
    return 1 / cos (opands[0])
  return opor (*opands)

def trigh2sinhcosh (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  if opor == tanh :
    if not filter(opands[0]) : return opor (*opands)
    return sinh (opands[0]) / cosh (opands[0])
  elif opor == coth :
    if not filter(opands[0]) : return opor (*opands)
    return cosh (opands[0]) / sinh (opands[0])
  elif opor == csch :
    if not filter(opands[0]) : return opor (*opands)
    return 1 / sinh (opands[0])
  elif opor == sech :
    if not filter(opands[0]) : return opor (*opands)
    return 1 / cosh (opands[0])
  return opor (*opands)

def squareInPow(opor, opands, filter) :
  if (opor != operator.pow) : return(opor (*opands))
  if not filter[1](opands[0]) : return opor (*opands)
  expo = opands[1]
  if not (expo._is_real()) : return(opor (*opands))
  opo = opands[0].operator()
  if not opo : return(opor (*opands))
  if opo != filter[0] : return(opor (*opands))
  opa = opands[0].operands()[0]
  expo1 = floor(expo/2)
  expo2 = expo - 2*expo1
  return filter[2](opa)^(expo2) * filter[3](opa)^(expo1)

def lessIinExp (opor, opands, filter) :
  if opor == exp :
    if not filter(opands[0]) : return opor (*opands)
    res = pseudoRealAndImag (opands[0]) 
    return exp(res[0]) * (cos(res[1]) + I*sin(res[1]))
  return opor (*opands)

def exp2trig (opor, opands, filter) :
  if opor == exp :
    if not filter(opands[0]) : return opor (*opands)
    res = pseudoRealAndImag (opands[0])
    if pseudoPositive (res[0]) : pr = cosh(res[0])+sinh(res[0])
    else : pr = cosh(-res[0])-sinh(-res[0])
    if pseudoPositive (res[1]) : pi = cos(res[1])+I*sin(res[1]) 
    else : pi = cos(-res[1])-I*sin(-res[1])
    return  pr * pi
  return opor (*opands)

def lessIinExp (opor, opands, filter) :
  if (opor == exp) and (opands[0].has(i))  :
    if not filter(opands[0]) : return opor (*opands)
    res = pseudoRealAndImag (opands[0])
    if pseudoPositive (res[1]) :
      return exp(res[0]) * (cos(res[1]) + I*sin(res[1]))
    else :
      return exp(res[0]) * (cos(-res[1]) - I*sin(-res[1]))
  return (opor(*opands))

def lessIinTrig (opor, opands, filter) :
  t1 = opands[0].has(i)
  if not t1 :   return (opor(*opands))
  if opor in [sin,cos,tan,cot,csc,sec,sinh,cosh,tanh,coth,csch,sech] :
    if not filter(opands[0]) : return opor (*opands)
    res = pseudoRealAndImag (opands[0]) 
    if res[0] != 0 : return (opor(*opands))
  if opor == sin : return i*positiveSin(res[1])
  elif opor == cos : return positiveCosh(res[1])
  elif opor == tan : return i*positiveTanh(res[1])
  elif opor == cot : return -i*positiveCoth(res[1])
  elif opor == sec : return positiveSech(res[1])
  elif opor == csc : return -i/positiveCsch(res[1])
  elif opor == sinh : return i*positiveSin(res[1])
  elif opor == cosh : return positiveCos(res[1])
  elif opor == tanh : return i*positiveTan(res[1])
  elif opor == coth : return -i*positiveCot(res[1])
  elif opor == sech : return positiveSech(res[1])
  elif opor == csch : return -i/positiveCsc(res[1])
  return (opor(*opands))

def sin2tancos (opor, opands, filter)  : 
  if opor == sin :
    if not filter(opands[0]) : return opor (*opands)
    co = opands[0] 
    if pseudoPositive (co) : return cos(co) * tan(co)
    else : return - cos(-co) * tan(-co)
  return opor (*opands)

def sinh2tanhcosh (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  if opor == sinh :
    if not filter(opands[0]) : return opor (*opands)
    co = opands[0] 
    if pseudoPositive (co) : return cosh(co) * tanh(co)
    else : return - cosh(-co) * tanh(-co)
  return opor (*opands)

def sincos2tanHalf (opor, opands, filter)  : 
  co = opands[0]/2 
  if opor == sin :
    if not filter(opands[0]) : return opor (*opands)
    if pseudoPositive (co/2) : return 2*tan(co)/(1+tan(co)^2)
    else : return 2*tan(-co)/(1+tan(-c)^2)
  if opor == cos :
    if pseudoPositive (co/2) : return (1-tan(co)^2)/(1+tan(co)^2)
    else : return (1-tan(-co)^2)/(1+tan(-c)^2)
  return opor (*opands)

def sinhcosh2tanhHalf (opor, opands, filter)  : # exp(x) => sinh(x) + cosh(x)
  co = opands[0]/2 
  if opor == sinh :
    if not filter(opands[0]) : return opor (*opands)
    if pseudoPositive (co/2) : return 2*tanh(co)/(1-tanh(co)^2)
    else : return 2*tanh(-co)/(1-tanh(-c)^2)
  if opor == cosh :
    if not filter(opands[0]) : return opor (*opands)
    if pseudoPositive (co/2) : return (1+tanh(co)^2)/(1-tanh(co)^2)
    else : return (1+tanh(-co)^2)/(1-tanh(-c)^2)
  return opor (*opands)

def pseudoParity (opor, opands, filter) :
  if opor == sin : 
    if not filter(opands[0]) : return opor (*opands)
    return positiveSin (opands[0])
  elif opor == cos :
    if not filter(opands[0]) : return opor (*opands)
    return positiveCos (opands[0])
  elif opor == tan :
    if not filter(opands[0]) : return opor (*opands)
    return positiveTan (opands[0])  
  elif opor == cot :
    if not filter(opands[0]) : return opor (*opands)
    return positiveCot (opands[0])  
  elif opor == sec :
    if not filter(opands[0]) : return opor (*opands)
    return positiveSec (opands[0])  
  elif opor == csc :
    if not filter(opands[0]) : return opor (*opands)
    return positiveCsc (opands[0])

  elif opor == sinh :
    if not filter(opands[0]) : return opor (*opands)
    return positiveSinh (opands[0])
  elif opor == cosh :
    if not filter(opands[0]) : return opor (*opands)
    return positiveCosh (opands[0])
  elif opor == tanh :
    if not filter(opands[0]) : return opor (*opands)
    return positiveTanh (opands[0])  
  elif opor == coth :
    if not filter(opands[0]) : return opor (*opands)
    return positiveCoth (opands[0])  
  elif opor == sech :
    if not filter(opands[0]) : return opor (*opands)
    return positiveSech (opands[0])  
  elif opor == csch :
    if not filter(opands[0]) : return opor (*opands)
    return positiveCsch (opands[0])

  elif opor == asin :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAsin (opands[0])
  elif opor == atan :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAtan (opands[0])  
  elif opor == acot :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAcot (opands[0])  
  elif opor == acsc :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAcsc (opands[0])  

  elif opor == asinh :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAsinh (opands[0])
  elif opor == atanh :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAtanh (opands[0])  
  elif opor == acoth :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAcoth (opands[0])  
  elif opor == acsch :
    if not filter(opands[0]) : return opor (*opands)
    return positiveAcsch (opands[0])  

  else : return opor(*opands)

def pow2exp (opor, opands, filter) :
  if opor == operator.pow : 
    if not filter(opands[0], opands[1]) : return opor (*opands)
    return (exp (log(opands[0]) * opands[1]))
  else : return opor(*opands)

def exp2pow (opor, opands, filter) :
  if opor == exp : 
    if not filter(opands[0]) : return opor (*opands)
    res = opands[0].match(SR.wild(0)*log(SR.wild(1)))
    if res : return res[SR.wild(1)]^res[SR.wild(0)]
  return opor(*opands)

def asin2acos (opor, opands, filter) :
  if opor == asin : 
    if not filter(opands[0]) : return opor (*opands)
    return pi/2-acos(opands[0])
  return opor(*opands)

def acos2asin (opor, opands, filter) :
  if opor == acos : 
    if not filter(opands[0]) : return opor (*opands)
    return pi/2-asin(opands[0])
  return opor(*opands)

def atrigh2log (opor, opands, filter) :
  if opor == asinh : 
    if not filter(opands[0]) : return opor (*opands)
    return log(opands[0]+sqrt(opands[0]^2+1))
  elif opor == acosh : 
    if not filter(opands[0]) : return opor (*opands)
    return log(opands[0]+sqrt(opands[0]^2-1))
  elif opor == atanh :
    if not filter(opands[0]) : return opor (*opands)
    return 1/2*(log(1+opands[0])-log(1-opands[0]))
  elif opor == acoth :
    if not filter(opands[0]) : return opor (*opands)
    return 1/2*(log(1+1/opands[0])-log(1-1/opands[0]))
  elif opor == acsch : 
    if not filter(opands[0]) : return opor (*opands)
    return log(1/opands[0]+sqrt(1/opands[0]^2+1)) 
  elif opor == asech : 
    if not filter(opands[0]) : return opor (*opands)
    return log(1/opands[0]+sqrt(1/opands[0]^2-1))
  return opor(*opands)

def atrigo2log (opor, opands, filter) :
  if opor == asin : 
    if not filter(opands[0]) : return opor (*opands)
    return -i*log(i*opands[0]+sqrt(1-opands[0]^2))
  elif opor == acos : 
    if not filter(opands[0]) : return opor (*opands)
    return -i*log(opands[0]+i*sqrt(1-opands[0]^2))
  elif opor == atan : 
    if not filter(opands[0]) : return opor (*opands)
    return i/2*log((1-i*opands[0])-log(1+i*opands[0]))
  elif opor == acot : 
    if not filter(opands[0]) : return opor (*opands)
    return i/2*log((1-i/opands[0])-(1+i/opands[0]))
  elif opor == acsc : 
    if not filter(opands[0]) : return opor (*opands)
    return -i*log(i/opands[0]+sqrt(1-1/opands[0]^2))
  elif opor == asec : 
    if not filter(opands[0]) : return opor (*opands)
    return -i*log(1/opands[0]+i*sqrt(1-1/opands[0]^2))

def factorial2gamma (opor, opands, filter) :
  if opor == factorial : 
    if not filter(opands[0]) : return opor (*opands)
    return gamma(opands[0]+1)
  return opor(*opands)
def gamma2factorial (opor, opands, filter) :
  if opor == gamma : 
    if not filter(opands[0]) : return opor (*opands)
    return factorial(opands[0]-1)
  return opor(*opands)

#def binomial2factorial (opor, opands, filter) :
#  if opor == binomial : 
#    return    factorial (opand[0]) \
#           / (factorial (operands[1]) * factorial (operands[0]-operands[1]))
#  return opor(*opands)

def logMainBranch (opor, opands, filter) :
#  if opor != log : return(opor (*opands))
  if opor != ln : return(opor (*opands))
  opo = opands[0].operator()
  opa = opands[0].operands()
  if opo != exp : return(opor (*opands))
  if not filter(opa[0]) : return opor (*opands)
  else : return opa[0]
  return(opor (*opands))

# atrigBranchCut : [acos|asin] o [+|-] [sin|cos] = 8 cas
#                  [atan|acot] o [+|-] o [id|inverse] [tan|cot] = 16 cas

def atrigoMainBranch (opor, opands, filter) :
  if opor == acos :
    opo = opands[0].operator()
    opa = opands[0].operands()
    if opo == cos : 
      if filter(opa[0]) : return opa[0]
    if opo == sin : 
      if filter(opa[0]) : return pi/2-opa[0] 
    opands2 = - opands[0]
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == cos : 
      if filter(opa[0]) : return pi - opa[0]
    if opo == sin : 
      if filter(opa[0]) : return pi/2 - opa[0]
    return opor (*opands)

  if opor == asin :
    opo = opands[0].operator()
    opa = opands[0].operands()
    if opo == sin : 
      if filter(opa[0]) : return opa[0]
    if opo == cos : 
      if filter(opa[0]) : return pi/2 - opa[0] 
    opands2 = - opands[0]
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == sin : 
      if filter(opa[0]) : return - opa[0]
    if opo == cos : 
      if filter(opa[0]) : return opa[0] - pi/2
    return opor (*opands)

  if opor == atan :
    opo = opands[0].operator()
    opa = opands[0].operands()
    if opo == tan : 
      if filter(opa[0]) : return opa[0]
    if opo == cot : 
      if filter(opa[0]) : return pi/2-opa[0] 
    opands2 = - opands[0]
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == tan : 
      if filter(opa[0]) : return - opa[0]
    if opo == cot : 
      if filter(opa[0]) : return opa[0] - pi/2 
    opands2 = 1/opands[0]
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == cot : 
      if filter(opa[0]) : return  opa[0]
    if opo == tan : 
      if filter(opa[0]) : return pi/2-opa[0] 
    opands2 = -opands2
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == cot : 
      if filter(opa[0]) : return  -opa[0]
    if opo == tan : 
      if filter(opa[0]) : return opa[2]-pi/2
    return opor (*opands)

  if opor == acot :
    opo = opands[0].operator()
    opa = opands[0].operands()
    if opo == cot : 
      if filter(opa[0]) : return opa[0]
    if opo == tan : 
      if filter(opa[0]) : return pi/2-opa[0] 
    opands2 = - opands[0]
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == cot : 
      if filter(opa[0]) : return - opa[0]
    if opo == tan : 
      if filter(opa[0]) : return opa[0] - pi/2 
    opands2 = 1/opands[0]
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == tan : 
      if filter(opa[0]) : return  opa[0]
    if opo == cot : 
      if filter(opa[0]) : return pi/2-opa[0] 
    opands2 = -opands2
    opo = opands2.operator()
    opa = opands2.operands()
    if opo == tan : 
      if filter(opa[0]) : return  -opa[0]
    if opo == cot : 
      if filter(opa[0]) : return opa[2]-pi/2
    return opor (*opands)

  return opor (*opands)
