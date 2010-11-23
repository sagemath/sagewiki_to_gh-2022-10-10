= Sage Interactions - Chemistry =
goto [[interact|interact main page]]


<<TableOfContents>>

== Molar Mass Calculator ==
by Eviatar Bach

{{{
import re, urllib, decimal
def molarmass(compound):
    '''Parses formulas and calculates molar mass using atomic weights at http://www.chem.qmul.ac.uk/iupac/AtWt/'''
    elementfinder=re.compile('([()]?)([A-Z]?[a-z]*)([()]?)(\d*)([()]?)'*len(compound))
    element=re.search(elementfinder, compound)
    elementlist=[]
    for a in range(1, len(compound)*5+1):
        try:
            elementlist.append(int(element.group(a)))
        except ValueError:
            elementlist.append(element.group(a))

    for item in range(len(elementlist)):
        try: elementlist.remove('')
        except ValueError:
            break

    var(reduce(lambda x, y: str(x)+' '+str(y), elementlist))

    #Adds multiplication for subscripts
    for index, i in enumerate(elementlist):
        try:
            eval(i)
            if isinstance(elementlist[index+1], int):
                elementlist.insert(index+1, '*')
        except:
            pass

    #Adds multiplication after brackets
    for index, a in enumerate(elementlist):
        if a==')' and isinstance(elementlist[index+1], int):
            elementlist.insert(index+1, '*')
            
    #Adds addition before brackets
    for index, a in enumerate(elementlist):
        try:
            if isinstance(a, int) and elementlist[index+1]=='(':
                elementlist.insert(index+1, '+')
        except IndexError:
            break
            
    #Adds addition
    for index, a in enumerate(elementlist):
        try:
            eval(a); eval(elementlist[index+1])
            elementlist.insert(index+1, '+')
        except:
            pass
            
    for index, a in enumerate(elementlist):
        try:
            eval(elementlist[index+1])
            if isinstance(a, int):
                elementlist.insert(index+1, '+')
        except:
            pass
            
    #Convert to ints
    for index, a in enumerate(elementlist):
        try:
            int(a) 
            elementlist[index]='int(%s)' %a
        except: pass

    elementpage=urllib.urlopen('http://www.chem.qmul.ac.uk/iupac/AtWt/').read()

    for index, atom in enumerate(elementlist):
        try:
            massfinder=re.compile('%s</td><td>\w+\s*</td><td>\[?(\d*\.?\d*)[](]+' %atom)
            found=re.search(massfinder, elementpage)
            elementlist[index]='decimal.Decimal("%s")' %found.group(int(1))
        except: pass
        
    print 'Calculation:',
        
    for a in elementlist:
        try: print str(eval(a)),
        except: print a,
            
    elementlist=reduce(lambda x, y: str(x)+str(y), elementlist)

    print '\n\n', 'Molar mass:', eval(elementlist), 'g/mol'

@interact
def _(compound=input_box(label='Compound', default='H2O', type=str)):
    molarmass(compound)
}}}

{{attachment:molarmass.png}}
