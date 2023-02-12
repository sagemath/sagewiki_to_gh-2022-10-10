
Things to improve: 

   * pattern matching 
   * subexpression substitution 
   * unifying and especially simplify the way to check the type of an 
         * expression. Now you need to do this ugly switch: 
def _is(e, what): 

      * import operator if what == "Mul": 
                  * return isinstance(e, sage.calculus.calculus.<a href="/SymbolicArithmetic">SymbolicArithmetic</a>) and \ 
                              * e._operator == operator.mul if what == "Add": 
                  * return isinstance(e, sage.calculus.calculus.<a href="/SymbolicArithmetic">SymbolicArithmetic</a>) and \ 
                              * e._operator == operator.add if what == "Pow": 
                  * return isinstance(e, sage.calculus.calculus.<a href="/SymbolicArithmetic">SymbolicArithmetic</a>) and \ 
                              * e._operator == operator.pow if what == "Div": 
                  * return isinstance(e, sage.calculus.calculus.<a href="/SymbolicArithmetic">SymbolicArithmetic</a>) and \ 
                              * e._operator == operator.div if what == "log": 
                  * return isinstance(e, sage.calculus.calculus.<a href="/SymbolicComposition">SymbolicComposition</a>) and \ 
                              * bool(e._operands[0] == sage.all.log) if what == "exp": 
                  * return isinstance(e, sage.calculus.calculus.<a href="/SymbolicComposition">SymbolicComposition</a>) and \ 
                              * bool(e._operands[0] == sage.all.exp) if what == "Function": 
                  * return isinstance(e, sage.calculus.calculus.<a href="/SymbolicComposition">SymbolicComposition</a>) elif what == "Rational": 
                  * return isinstance(e, sage.rings.rational.Rational) elif what == "Real": 
                  * return isinstance(e, sage.rings.real_mpfr.<a href="/RealNumber">RealNumber</a>) else: 
                  * raise "Sorry, unknown 'class': %s" % what 
Those are just things I discovered when trying to port the limits from <a href="/SymPy">SymPy</a> to SAGE. Then there are other things, for example: 

   * working with unknown functions, expanding them in series, etc. 
(there is some trac ticket for that already) 
