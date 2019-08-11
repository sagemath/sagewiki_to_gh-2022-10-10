= Sage Interactions - Cryptography =



This page was first created at Sage Days 103, 7-9 August 2019 by Sarah Arpin, Catalina Camacho-Navarro, Holly Paige Chaos, Amy Feaver, Eva Goedhart, Sara Lapan, Rebecca Lauren Miller, Alexis Newton, and Nandita Sahajpal. Text edited by Holly Paige Chaos, Amy Feaver, Eva Goedhart, and Alexis Newton. This project was led by Amy Feaver and Eva Goedhart.

We acknowledge Katherine Stange, who allowed us to use code from her cryptography course as a starting point for many of these interacts. Dr. Stange's original code and course page can be found at http://crypto.katestange.net/

If you have cryptography-related interactions that you are interested in adding to this page, please do so. You can also contact Amy Feaver at firstname.lastname@kingsu.ca  

goto [[interact|interact main page]]

<<TableOfContents>>



== Shift Cipher ==

The shift cipher is a classical cryptosystem that takes plaintext and shifts it through the alphabet by a given number of letters. For example, a shift of 2 would replace all A's with C's, all B's with D's, etc. When the end of the alphabet is reached, the letters are shifted cyclically back to the beginning. Thus, a shift of 2 would replace Y's with A's and Z's with B's.

=== Shift Cipher Encryption ===
by Sarah Arpin, Alexis Newton

You can use this interact to encrypt a message with a shift cipher.

{{{#!sagecell
#Last edited 8/7/19 2:45pm
pretty_print(html("<h1>Shift Cipher Encryptor</h1>"))
pretty_print(html("<h>Put your message inside the provided quotes (with no additional quotes or apostrophes!), and select your desired shift:<h>"))
@interact
def shift_cipher(message = input_box(default='"secrets"', label="Message:"), shift=slider(0,25,1,3, label="Shift by:")):
    A = AlphabeticStrings()
    S = ShiftCryptosystem(A)
    message = S.encoding(message)
    C = S.enciphering(shift, message)
    print "This is your encrypted text shifted by",shift,":"
    print C
}}}


=== Shift Cipher Decryption ===
by Sarah Arpin, Alexis Newton

If you know that your message was encrypted using a shift cipher, you can use the known shift value to decrypt. If this is not known, brute force can be used to get 26 possible decrypted messages. The chi-squared function ranks the brute force results by likelihood according to letter frequency.

{{{#!sagecell
#Last edited 8/7/19 2:56pm

pretty_print(html("<h1>Shift Cipher Decryptor</h1>"))
pretty_print(html("<h>Enter the encrypted text in quotes, and enter a guess for the shift amount:<h>"))
@interact
def shift_decrypt(text = input_box(default='"KL"',label="Message:"), shift_by = input_box(default = 0, label="Shift by:")):
    S = ShiftCryptosystem(AlphabeticStrings())
    ciphertext = S.encoding(text)
    decrypt = S.deciphering(shift_by%26,ciphertext)
    print "If the shift was by", shift_by,", then the original message was:"
    print decrypt
    decrypt = S.brute_force(ciphertext)
    print "\nThese are the possibilities for the plaintext:"
    print decrypt
    decrypt = S.brute_force(ciphertext,ranking = "chisquare")
    print "\nThese are the possibilities ranked by likelihood with the chi-squared function:"
    print decrypt
}}}

== Affine Cipher ==


An affine cipher combines the idea of a shift cipher with a multiplicative cipher. In this particular example, we map consecutive letters of the alphabet to consecutive numbers, starting with A=0 (you can also do this cipher differently, and starting with A=1). The user selects two values, a and b. The value a is the multiplier and must be relatively prime to 26 in order to guarantee that each letter is encoded uniquely. The value b is the addend. Each letter's value is multiplied by a, and the product is added to b. This is then replaced with a new letter, corresponding to the result modulo 26. 

=== Affine Cipher Encryption ===
by Sarah Arpin, Alexis Newton

You can use this interact to encrypt a message with the affine cipher. Notice that the only choices for a can be numbers that are relatively prime to 26. This cipher will encipher a letter m of your message as a*m + b.

{{{#!sagecell
# Last edited 8/7/2019 2:01pm

pretty_print(html("<h1>Affine Cipher Encryptor</h1>"))
pretty_print(html("<h>Put your message in between the provided quotes (with no additional quotes or apostrophes!), and select your desired a and b:<h>"))
@interact
def affine_cipher(message = input_box(default='"secrets"', label="Message:"), a=[1,3,5,7,9,11,15,17,19,21,23], b =[0..25]):
    A = AlphabeticStrings()
    S = AffineCryptosystem(A)
    message = S.encoding(message)
    C = S.enciphering(a,b, message)
    print "This is your encrypted text:"
    print C
}}}


=== Affine Cipher Decryption ===
by Sarah Arpin, Alexis Newton

If you know that your message was encrypted using an affine cipher, you can use the known a and b values to decrypt. If these are not known, brute force can be used to get a list of possible decrypted messages. The chi-squared function ranks these results by likelihood according to letter frequency.

{{{#!sagecell
#Last edited 8/7/2019 3:01pm
pretty_print(html("<h1>Affine Cipher Decryptor</h1>"))
pretty_print(html("<h>Enter the encrypted text in quotes, and enter a guess for the a and b:<h>"))
@interact
def shift_decrypt(text = input_box('"XNSILPCVA"', label="Message:"), a=[1,3,5,7,9,11,15,17,19,21,23,25], b =[0..25]):
    S = AffineCryptosystem(AlphabeticStrings())
    ciphertext = S.encoding(text)
    decrypt = S.deciphering(a,b,ciphertext)
    print "If the a =", a, "and the b =",b, ", then the original message was:"
    print decrypt
    decrypt = S.brute_force(ciphertext,ranking="none")
    print "\nThese are the possibilities for the plaintext:"
    print decrypt
    decrypt = S.brute_force(ciphertext,ranking = "chisquare")[:10]
    print "\nThese are the top 10 possibilities ranked by likelihood with the chi-squared function:"
    print decrypt
}}}


== Substitution Cipher ==
by Catalina Camacho-Navarro

A substitution cipher encrypts messages by assigning each letter of the alphabet to another letter. For instance, if A is assigned to F, then all A's in the original message will be substituted with F's in the encrypted message. Brute force or frequency analysis can be used to decrypt a message encrypted with a substitution cipher.

{{{#!sagecell
pretty_print(html('<h1> Substitution Cipher'))
pretty_print(html("<h>Select your letter substitutions and enter your message inside the quotes.<h>"))
from string import ascii_uppercase
left_over_letters=[0] +[let for let in ascii_uppercase]
@interact
def _(A =selector(left_over_letters, default=0)):
    if A!=0:
        left_over_letters.remove(A)
 #       print left_over_letters
    
        @interact
        def _(B =selector(left_over_letters, default=0)):
            if B!=0:
                left_over_letters.remove(B)
 #               print left_over_letters
        
                @interact
                def _(C =selector(left_over_letters, default=0)):
                    if C!=0:
                        left_over_letters.remove(C)
                        @interact
                        def _(D =selector(left_over_letters, default=0)):
                            if D!=0:
                                left_over_letters.remove(D)
                                @interact
                                def _(E =selector(left_over_letters, default=0)):
                                    if E!=0:
                                        left_over_letters.remove(E)

                                        @interact
                                        def _(F =selector(left_over_letters, default=0)):
                                            if F!=0:
                                                left_over_letters.remove(F)

                                                @interact
                                                def _(G =selector(left_over_letters, default=0)):
                                                    if G!=0:
                                                        left_over_letters.remove(G)

                                                        @interact
                                                        def _(H =selector(left_over_letters, default=0)):
                                                            if H!=0:
                                                                left_over_letters.remove(H)

                                                                @interact
                                                                def _(I =selector(left_over_letters, default=0)):
                                                                    if I!=0:
                                                                        left_over_letters.remove(I)

                                                                        @interact
                                                                        def _(J =selector(left_over_letters, default=0)):
                                                                            if J!=0:
                                                                                left_over_letters.remove(J)

                                                                                @interact
                                                                                def _(K =selector(left_over_letters, default=0)):
                                                                                    if K!=0:
                                                                                        left_over_letters.remove(K)
                                                                                        @interact
                                                                                        def _(L =selector(left_over_letters, default=0)):
                                                                                            if L!=0:
                                                                                                left_over_letters.remove(L)

                                                                                                @interact
                                                                                                def _(M =selector(left_over_letters, default=0)):
                                                                                                    if M!=0:
                                                                                                        left_over_letters.remove(M)

                                                                                                        @interact
                                                                                                        def _(N =selector(left_over_letters, default=0)):
                                                                                                            if N!=0:
                                                                                                                left_over_letters.remove(N)

                                                                                                                @interact
                                                                                                                def _(O =selector(left_over_letters, default=0)):
                                                                                                                    if O!=0:
                                                                                                                        left_over_letters.remove(O)

                                                                                                                        @interact
                                                                                                                        def _(P =selector(left_over_letters, default=0)):
                                                                                                                            if P!=0:
                                                                                                                                left_over_letters.remove(P)

                                                                                                                                @interact
                                                                                                                                def _(Q =selector(left_over_letters, default=0)):
                                                                                                                                    if Q!=0:
                                                                                                                                        left_over_letters.remove(Q)


                                                                                                                                        @interact
                                                                                                                                        def _(R =selector(left_over_letters, default=0)):
                                                                                                                                            if R!=0:
                                                                                                                                                left_over_letters.remove(R)

                                                                                                                                                @interact
                                                                                                                                                def _(S =selector(left_over_letters, default=0)):
                                                                                                                                                    if S!=0:
                                                                                                                                                        left_over_letters.remove(S)

                                                                                                                                                        @interact
                                                                                                                                                        def _(T =selector(left_over_letters, default=0)):
                                                                                                                                                            if T!=0:
                                                                                                                                                                left_over_letters.remove(T)

                                                                                                                                                                @interact
                                                                                                                                                                def _(U =selector(left_over_letters, default=0)):
                                                                                                                                                                    if U!=0:
                                                                                                                                                                        left_over_letters.remove(U)

                                                                                                                                                                        @interact
                                                                                                                                                                        def _(V =selector(left_over_letters, default=0)):
                                                                                                                                                                            if V!=0:
                                                                                                                                                                                left_over_letters.remove(V)

                                                                                                                                                                                @interact
                                                                                                                                                                                def _(W =selector(left_over_letters, default=0)):
                                                                                                                                                                                    if W!=0:
                                                                                                                                                                                        left_over_letters.remove(W)

                                                                                                                                                                                        @interact
                                                                                                                                                                                        def _(X =selector(left_over_letters, default=0)):
                                                                                                                                                                                            if X!=0:
                                                                                                                                                                                                left_over_letters.remove(X)

                                                                                                                                                                                                @interact
                                                                                                                                                                                                def _(Y =selector(left_over_letters, default=0)):
                                                                                                                                                                                                    if Y!=0:
                                                                                                                                                                                                        left_over_letters.remove(Y)

                                                                                                                                                                                                        @interact
                                                                                                                                                                                                        def _(Z =selector(left_over_letters, default=0)):
                                                                                                                                                                                                            if Z!=0:
                                                                                                                                                                                                                left_over_letters.remove(Z)




                                                                                                                                                                                                                @interact 
                                                                                                                                                                                                                def _(text=input_box(default='"MESSAGE"',label="Message:")):
                                                                                                                                                                                                                    new_ordering=[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z];
                                                                                                                                                                                                                    new_key=[ord(new_ordering[i])-65 for i in range(26)]
                                                                                                                                                                                                                    alphabet=AlphabeticStrings()
                                                                                                                                                                                                                    Es=SubstitutionCryptosystem(alphabet)
                                                                                                                                                                                                                    Key = alphabet(new_key)
                                                                                                                                                                                                                    e = Es(Key)
                                                                                                                                                                                                                    TEXT0=text
                                                                                                                                                                                                                    TEXT=alphabet.encoding(TEXT0)
                                                                                                                                                                                                                    print "Ciphertext:", e(TEXT)
}}}

== Playfair Cipher ==
by Catalina Camacho-Navarro

Based on code from Alasdair McAndrew at trac.sagemath.org/ticket/8559.

A playfair cipher is a special type of substitution cipher in which the plaintext is broken up into two-letter digraphs with some restrictions. Those digraphs are encrypted using a Polybius square, (i.e. a 5x5 grid in which each letter of the alphabet is its own entry with the exception of ij which are placed together). The positions of the letters in the digraph determine how the digraph is encrypted.

=== Playfair Encryption ===

Use this interact to encrypt a message using the playfair cipher.

{{{#!sagecell
##PLAYFAIR CIPHER

def change_to_plain_text(pl):
    plaintext=''
    for ch in pl:
        if ch.isalpha():
            plaintext+=ch.upper()
    return plaintext

def makePF(word1): #creates 5 x 5 Playfair array beginning with "word"
    word=change_to_plain_text(word1)
    alph='ABCDEFGHIKLMNOPQRSTUVWXYZ'
    pf=''
    for ch in word:
        if (ch<>"J") & (pf.find(ch)==-1):  # ensures no letter is repeated
            pf+=ch
    for ch in alph:
        if pf.find(ch)==-1:  #only uses unused letters from alph
            pf+=ch
    PF=[[pf[5*i+j] for j in range(5)] for i in range(5)]
    return PF

def pf_encrypt(di,PF): # encrypts a digraph di with a Playfair array PF
    for i in range(5):
        for j in range(5):
            if PF[i][j]==di[0]:
                i0=i
                j0=j
            if PF[i][j]==di[1]:
                i1=i
                j1=j
    if (i0<>i1) & (j0<>j1):
        return PF[i0][j1]+PF[i1][j0]
    if (i0==i1) & (j0<>j1):
        return PF[i0][(j0+1)%5]+PF[i1][(j1+1)%5]
    if (i0<>i1) & (j0==j1):
        return PF[(i0+1)%5][j0]+PF[(i1+1)%5][j1]

def insert(ch,str,j):  # a helper function: inserts a character "ch" into
    tmp=''             # a string "str" at position j
    for i in range(j):
        tmp+=str[i]
    tmp+=ch
    for i in range(len(str)-j):
        tmp+=str[i+j]
    return tmp


def playfair(pl1,word): # encrypts a plaintext "pl" with a Playfair cipher 
    pl=change_to_plain_text(pl1)
    PF=makePF(word)    # using a keyword "word"
    pl2=makeDG(pl)
    tmp=''
    for i in range(len(pl2)//2):
        tmp+=pf_encrypt(pl2[2*i]+pl2[2*i+1],PF)
    return tmp

def makeDG(str): # creates digraphs with different values from a string "str"
    tmp=str.replace('J','I')  # replace all 'J's with 'I's
    c=len(tmp)
    i=0
    while (c>0) & (2*i+1<len(tmp)):
        if tmp[2*i]==tmp[2*i+1]:
            tmp=insert("X",tmp,2*i+1)
            c-=1
            i+=1
        else:
            c-=2
            i+=1
    if len(tmp)%2==1:
        tmp+='X'
    return tmp

pretty_print(html("<h1>Playfair Cipher Encryptor</h1>"))
pretty_print(html("<h>Enter your message and the key to construct you polybius square. Warning: both the message and the key must be in quotes.<h>"))
@interact
def _(Message=input_box(default='"message"', label="Message:"),Key=input_box(default='"key"', label="Key:"),showmatrix=checkbox(True, label='Show polybius square:')):
    
    if showmatrix:
        poly=makePF(Key)
        for i in range(5):
            print(poly[i])
    
    print '\nCiphertext:',playfair(Message,Key)
}}}

=== Playfair Decryption ===

##Playfair decryption
##PLAYFAIR CIPHER 
## CATALINA CAMACHO-NAVARRO
##Based on code from Alasdair McAndrew  at //trac.sagemath.org/ticket/8559
##Last edited 8/9/19 at 1:55pm

{{{#!sagecell
def change_to_plain_text(pl):
    plaintext=''
    for ch in pl:
        if ch.isalpha():
            plaintext+=ch.upper()
    return plaintext

def makePF(word1): #creates 5 x 5 Playfair array beginning with "word"
    word=change_to_plain_text(word1)
    alph='ABCDEFGHIKLMNOPQRSTUVWXYZ'
    pf=''
    for ch in word:
        if (ch<>"J") & (pf.find(ch)==-1):  # ensures no letter is repeated
            pf+=ch
    for ch in alph:
        if pf.find(ch)==-1:  #only uses unused letters from alph
            pf+=ch
    PF=[[pf[5*i+j] for j in range(5)] for i in range(5)]
    return PF

def pf_decrypt(di,PF): # encrypts a digraph di with a Playfair array PF
    for i in range(5):
        for j in range(5):
            if PF[i][j]==di[0]:#locate the first letter of di in PF
                i0=i
                j0=j
            if PF[i][j]==di[1]:
                i1=i
                j1=j
    if (i0<>i1) & (j0<>j1):## if di[0] and di[1] are not in the same column or row, switch to corners in the same row
        return PF[i0][j1]+PF[i1][j0]
    if (i0==i1) & (j0<>j1):## if di[0] and di[1] are in the same row, then switch left  
        return PF[i0][(j0-1)%5]+PF[i1][(j1-1)%5]
    if (i0<>i1) & (j0==j1):## if di[0] and di[1] are in the same column, then switch up 
        return PF[(i0-1)%5][j0]+PF[(i1-1)%5][j1]

def insert(ch,str,j):  # a helper function: inserts a character "ch" into
    tmp=''             # a string "str" at position j
    for i in range(j):
        tmp+=str[i]
    tmp+=ch
    for i in range(len(str)-j):
        tmp+=str[i+j]
    return tmp


def playfair_decrypt(pl1,word): # decrypts a plaintext "pl" with a Playfair cipher 
    pl=change_to_plain_text(pl1)
    if len(pl1)%2<>0:
        raise TypeError('The lenght of the ciphertext is not even')
    pl2=makeDG(pl)
    if pl2<>pl:
        if 'J' in pl: 
            raise TypeError('The ciphertext contains a J')
        if len(pl2)<>len(pl):
            raise TypeError('The ciphertext contains digraphs with repeated letters')
            
    PF=makePF(word)    # using a keyword "word"
    
    tmp=''
    for i in range(len(pl2)//2):
        tmp+=pf_decrypt(pl2[2*i]+pl2[2*i+1],PF)
    return tmp

def makeDG(str): # creates digraphs with different values from a string "str"
    tmp=str.replace('J','I')  # replace all 'J's with 'I's
    c=len(tmp)
    i=0
    while (c>0) & (2*i+1<len(tmp)):
        if tmp[2*i]==tmp[2*i+1]:
            tmp=insert("X",tmp,2*i+1)
            c-=1
            i+=1
        else:
            c-=2
            i+=1
    if len(tmp)%2==1:
        tmp+='X'
    return tmp

def playfair_decrypt_options(pl): ##Modifies the output of the playfair_decrypt by erasing replacing I's or deleting X
    pl_noI=pl.replace('I','J')
    if pl.endswith('X'): 
        pl_no_last_X=pl[:-1]
    else: pl_no_last_X=pl
    pl_noX=pl
    for ch in pl_noX:
        if (ch=='X') & (pl.find(ch)<>0):
            if  pl_noX[pl_noX.find(ch)-1]==pl_noX[pl_noX.find(ch)+1]:
                pl_noX=pl_noX.replace('X','')
    return([pl,pl_noI,pl_noX,pl_no_last_X])    

pretty_print(html("<h1>Playfair Cipher Decryptor</h1>"))
pretty_print(html("<h>Enter your ciphertext and a guess for the key to construct you polybius square. Warning: both the message and the key must be in quotes.<h>"))
@interact
def _(Ciphertext=input_box(default='"LYXAXGDA"', label="Message:"),Key=input_box(default='"key"', label='Guess key:'),showmatrix=checkbox(True, label='Show polybius square:')):
    print 'These are some of the possibilities for the plaintext:'
    print playfair_decrypt_options(playfair_decrypt(Ciphertext,Key))
    if showmatrix:
        poly=makePF(Key)
        print '----------------------'
        for i in range(5):
            print(poly[i])
}}}

== Frequency Analysis Tools ==

Frequency analysis is a technique for breaking a substitution cipher that utilizes the frequencies of letters appearing in the English language. For example, E is the most common letter in the English language, so if a piece of encrypted text had many instances of the letter Q, you would guess that Q had been substituted in for E. The next two interacts create a couple of basic tools that could be useful in cracking a substitution cipher. 


=== Letter Frequency Counter ===
by Rebecca Lauren Miller, Katherine Stange

This tool looks at the percentage of appearances of each letter in the input text and plots these percentages. The encrypted input text is a bit strange, but was constructed by Amy Feaver to give a short block of text that matched the frequencies of letters in the English language relatively well, to make this message easier to decrypt.

{{{#!sagecell
#Last Edited 8/8/19 at 2:36pm

pretty_print(html("<h1>Letter Frequency Counter</h1>"))
pretty_print(html("<h>This interact prints a bar graph showing the distribution of letters in the input text. Warning: the smaller the input text the less accurate the distribution will be. Letters that do not occur will not appear in the graph.<h>"))
# Initial text is "Greetiiiings my name is Weeegbert Deuce the True Eater of the Toupee. Hear ye, hear ye! Dee dee dee. A head of these liger cubs carrying the trippy tomahawks are coming fo' thee. Take shelters in the tombs. Tammy ran to the other townspeople and aardvarks. What is her ETA? Her ETA please! Toil, bring your food cups and oil and be swift. The women and the child Occotion CIII should pick bamboo at Atitisoting. See? Nanna Wu Shacah's inner noodle cups: not nuutty sesame notions."

@interact
def frequencyAnalysis(text = input_box('"Nyllappppunz tf uhtl pz Dlllnilya Klbjl aol Aybl Lhaly vm aol Avbwll. Olhy fl, olhy fl! Kll kll kll. H olhk vm aolzl spnly jbiz jhyyfpun aol aypwwf avthohdrz hyl jvtpun mv aoll. Ahrl zolsalyz pu aol avtiz. Ahttf yhu av aol vaoly avduzwlvwsl huk hhykchyrz. Doha pz oly LAH? Oly LAH wslhzl! Avps, iypun fvby mvvk jbwz huk vps huk il zdpma. Aol dvtlu huk aol jopsk Vjjvapvu JPPP zovbsk wpjr ihtivv ha Hapapzvapun. Zll.Uhuuh Db Zohjho z puuly uvvksl jbwz: uva ubbaaf zlzhtl uvapvuz."',label = "Message:",width=150)):
    alphabet = AlphabeticStrings()
    englishText = alphabet.encoding(text)
    distribution = englishText.frequency_distribution()
    L1 = englishText.frequency_distribution().function()
    L1=[x for x in L1.items()]
    L1.sort(key=lambda x:x[0])
    labels, ys = zip(*L1)
    import numpy as np
    import math 
    from matplotlib import pyplot as plt
    xs = np.arange(len(labels)) 
    plt.bar(xs, ys,  align='center')
    plt.xticks(xs, labels) #Replace default x-ticks with xs, then replace xs with labels
    plt.ylim(0,.2)
    plt.yticks(ys)
    plt.xlabel('Letters (Some may be missing)')
    plt.ylabel('Frequency')
    plt.show()

}}}


=== Frequency Analysis Decryption Guesser ===
by Rebecca Lauren Miller, Katherine Stange

This interact prints a suggested translation of the input text by matching frequencies of letters in the input to frequencies of letters in the English language. With the output you will see that some letters were substituted incorrectly, and others were not. Usually frequency analysis requires additional work and some trial and error to discover the original message, especially if the input text is not long enough.

{{{#!sagecell
#Last edited 8/8/19 at 2:54pm

pretty_print(html("<h1>Frequency Analysis Decryption Guesser</h1>"))
pretty_print(html("<h>Warning: the shorter the input text is, the less accurate the distribution will be.<h>"))
@interact 
# Initial text is "Greetiiiings my name is Weeegbert Deuce the True Eater of the Toupee. Hear ye, hear ye! Dee dee dee. A head of these liger cubs carrying the trippy tomahawks are coming fo' thee. Take shelters in the tombs. Tammy ran to the other townspeople and aardvarks. What is her ETA? Her ETA please! Toil, bring your food cups and oil and be swift. The women and the child Occotion CIII should pick bamboo at Atitisoting. See? Nanna Wu Shacah's inner noodle cups: not nuutty sesame notions."
def frequencyAnalysis(text = input_box('"Nyllappppunz tf uhtl pz Dlllnilya Klbjl aol Aybl Lhaly vm aol Avbwll. Olhy fl, olhy fl! Kll kll kll. H olhk vm aolzl spnly jbiz jhyyfpun aol aypwwf avthohdrz hyl jvtpun mv aoll. Ahrl zolsalyz pu aol avtiz. Ahttf yhu av aol vaoly avduzwlvwsl huk hhykchyrz. Doha pz oly LAH? Oly LAH wslhzl! Avps, iypun fvby mvvk jbwz huk vps huk il zdpma. Aol dvtlu huk aol jopsk Vjjvapvu JPPP zovbsk wpjr ihtivv ha Hapapzvapun. Zll.Uhuuh Db Zohjho z puuly uvvksl jbwz: uva ubbaaf zlzhtl uvapvuz."', label = "Message:",width = 150)):
    alphabet= AlphabeticStrings()
    englishText =alphabet.encoding(text)
    L1 = englishText.frequency_distribution().function()
    L1=[x for x in L1.items()] 
    L1.sort(key=lambda x:x[1],reverse=True)
    alphafreq = ['E','T','A','O','I','N','S','H','R','D','L','U','C','M','F','W','Y','P','V','B','G','K','J','Q','X','Z']
    translator={}
    for i in range(0, len(L1)):
        translator.update({str(L1[i][0]):alphafreq[i]})
        answer=""
    print "\nThe suggested substitutions, based on letter frequency are:"
    print translator
    for char in englishText:
        answer+= translator[str(char)]
    print "\nThe suggested translation is:\n", answer
}}}

== Vigenère Cipher ==

A Vigenère cipher is an example of a polyalphabetic cipher. Using a secret codeword as the key, the Vigenère encrypts each letter of a message by shifting it according to the corresponding letter in the key. For example, we will use the key "CAT" to encrypt our default text "secrets hi". To do this the message is first broken up into three-letter chunks, because the key is three letters long, to be "SEC RET SHI". Next each letter of the chunk is shifted by the value of the corresponding letter in the key. The standard shifts are A=0, B=1, C=2, etc. So in our example, S shifts by C=2 letters to U, E shifts by A=0 letters and remains at E, and C shifts by T=19 letters to V. Thus "SECRETSHI" becomes UEVTEMUHB when encrypted. To decrypt the message, simply use the keyword to undo the encryption process. Cryptography by Simon Rubinstein-Salzedo was used as reference for this interact.

=== Vigenère Cipher Encryption ===
by Holly Paige Chaos, Rebecca Lauren Miller, Katherine Stange

Use this interact to encrypt a message using the Vigenère Cipher.

{{{#!sagecell
#This encrypts your message: Final 8/7/19. Written by Rebecca Lauren Miller, Holly Paige Chaos, Katherine Stange.


pretty_print(html("<h1>Vigenère Cipher Encryptor</h1>"))
pretty_print(html("<h>Put your message and codeword inside the quotes:<h>"))
@interact 
def vigenere_cipher(message = input_box(default ='"secrets hi"',label="Message:"), code_word = input_box(default='"cat"',label="Key:")):
    A = AlphabeticStrings()
    message2 = A.encoding(message) 
    code_word2 = A.encoding(code_word) 
    system = VigenereCryptosystem(A,len(code_word2)) 
    ciphertext = system.enciphering(code_word2,message2) 
    print "Enciphered message:"
    print ciphertext
}}}

=== Vigenère Cipher Decryption ===
by Holly Paige Chaos, Rebecca Lauren Miller, Katherine Stange

If you used the Vigenère Cipher to encrypt a message, you can use this interact to decrypt by inputting your key and encrypted text.

{{{#!sagecell
#Last edited 8/7/19 at 12:00pm

pretty_print(html("<h1>Vigenère Cipher Decryptor</h1>"))
pretty_print(html("<h>Put your encrypted message and codeword inside the quotes:<h>"))
@interact 
def vigenere_cipher(message = input_box(default ='"UEVTEMUHB"',label = "Message:"), code_word = input_box(default='"cat"', label = "Key:")):
    A = AlphabeticStrings()
    message2 = A.encoding(message) 
    code_word2 = A.encoding(code_word) 
    system = VigenereCryptosystem(A,len(code_word2)) 
    ciphertext = system.deciphering(code_word2,message2) 
    print "Deciphered message:"
    print ciphertext
}}}


== One-Time Pad ==

by Sarah Arpin, Alexis Newton

One-time pad is an encryption method that cannot be cracked. It requires a single-use shared key (known as a one-time pad) the length of the message or longer. In this method, every letter is first converted to numbers using the standard A=0, B=1, C=2, etc. Then each character in the message is multiplied modulo 26 by the number in the corresponding position in the key. This is then converted back to letters to produce the encrypted text.

{{{#!sagecell
#Last edited 8/7/2019 5:12pm
from random import randrange
dictt = {'a':0,'b':1,'c':2,'d':3,'e':4,'f':5,'g':6,'h':7,
    'i':8,'j':9,'k':10,'l':11,'m':12,'n':13,'o':14,'p':15,'q':16,
    'r':17,'s':18,'t':19,'u':20,'v':21,'w':22,'x':23,'y':24,'z':25
    }
pretty_print(html("<h1>One-Time Pad Encryptor</h1>"))
pretty_print(html("<h>Enter your message to be encrypted via one-time pad in the message box below:<h>"))
@interact
def one_time_pad(plain_text = input_box('"message"',label="Message:")):
    #This code takes in a plain text, converts all of the letters to numbers, and then creates a one-time pad for encryption
    message = []
    for char in plain_text:
        if char.isalpha():
            message.append(char.lower())
    size = len(message)
    one_time_pad = []
    for i in range(size):
        one_time_pad.append(randrange(26))
    cipher_text = []
    for i in range(size):
        cipher_text.append((dictt[message[i]] + one_time_pad[i]).mod(26))
    letter_cipher_text=""
    for i in cipher_text:
        letter_cipher_text += (chr(i+97))
    print "Your one-time pad is:"
    print one_time_pad
    print ""
    print "Your encrypted message is:"
    print letter_cipher_text
}}}

== Hill Cipher ==

The Hill cipher requires some basic knowledge of Linear Algebra. In this encryption method, an invertible n x n matrix of integers modulo 26 is used as the key. The message is first converted to numbers and spit into chunks size n. These chunks are then converted to n x 1 vectors and multiplied by the key modulo 26 to produce 1 x n vectors. The integers from these vectors are converted back letters to produce the encrypted text.

=== Hill Cipher Encryption ===
by Holly Paige Chaos, Alexis Newton

Use this interact to encrypt a message with the Hill cipher. If your message is not a multiple of n, then it will be padded with z's. Be sure to use an invertible matrix so that your message can be decrypted!

{{{#!sagecell
#Last edited 8/8/19 at 1:47pm
pretty_print(html("<h1>Hill Cipher Encryptor</h1>"))
pretty_print(html("<h>Please select the size of your key:<h>"))
@interact
def hill_cipher(Size=['2','3','4']):
    if Size=='2':
        print "Please input your message (in quotes) and numbers for your key:"
        @interact
        def two_matrix(message=input_box(default='"Alexis smells"',label = "Message:"), a=input_box(default=1), b=input_box(default=3), c=input_box(default=3), d=input_box(default=4)):
            S = AlphabeticStrings()
            E = HillCryptosystem(S,Size)
            R = IntegerModRing(26)
            M = MatrixSpace(R,Size,Size)
            A = M([[a,b],[c,d]])
            print "This is your key:"
            print A
            invertible = A.is_invertible()
            if invertible==false:
                print "WARNING! You will not be able to decrypt this message because your matrix is not invertible."
            e = E(A)
            newmessage = ""
            for char in message:
                if char.isalpha():
                    newmessage+=char.lower()
            if len(newmessage) % 2 == 1:
                newmessage+="z"
            message=E.encoding(newmessage)
            print "This is your encrypted message:"
            print e(S(message))
    if Size=='3':
        pretty_print(html("<h>Please input your message (in quotes) and the numbers in your square matrix key:<h>"))
        @interact
        def three_matrix(message=input_box(default='"Alexis smells"',label = "Message:"), a=input_box(default=1), b=input_box(default=2), c=input_box(default=3), d=input_box(default=5), e=input_box(default=2), f=input_box(default=6), g=input_box(default=7), h=input_box(default=9), i=input_box(default=9)):
            S = AlphabeticStrings()
            E = HillCryptosystem(S,3)
            R = IntegerModRing(26)
            M = MatrixSpace(R,3,3)
            A = M([[a,b,c],[d,e,f],[g,h,i]])
            print "This is your key:"
            print A
            invertible = A.is_invertible()
            if invertible==false:
                print "WARNING! You will not be able to decrypt this message because your matrix is not invertible."
            e = E(A)
            newmessage = ""
            for char in message:
                if char.isalpha():
                    newmessage+=char.lower()
            if len(newmessage) % 3 == 2:
                newmessage+="z"
            elif len(newmessage) % 3 == 1:
                newmessage+="zz"
            message=E.encoding(newmessage)
            print "This is your encrypted message:"
            print e(S(message))
    if Size=='4':
        pretty_print(html("<h>Please input your message (in quotes) and the numbers in your square matrix key:<h>"))
        @interact
        def four_matrix(message=input_box(default='"Alexis smells"',label="Message:"), a=input_box(default=17), b=input_box(default=8), c=input_box(default=7), d=input_box(default=10), e=input_box(default=0), f=input_box(default=17), g=input_box(default=5), h=input_box(default=8), i=input_box(default=18), j=input_box(default=12), k=input_box(default=6), l=input_box(default=17), m=input_box(default=0), n=input_box(default=15), o=input_box(default=0), p=input_box(default=17)):
            S = AlphabeticStrings()
            E = HillCryptosystem(S,4)
            R = IntegerModRing(26)
            M = MatrixSpace(R,4,4)
            A = M([[a,b,c,d],[e,f,g,h],[i,j,k,l],[m,n,o,p]])
            print "This is your key:"
            print A
            invertible = A.is_invertible()
            if invertible==false:
                print "WARNING! You will not be able to decrypt this message because your matrix is not invertible."
            e = E(A)
            newmessage = ""
            for char in message:
                if char.isalpha():
                    newmessage+=char.lower()
            if len(newmessage) % 4 == 3:
                newmessage+="z"
            elif len(newmessage) % 4 == 2:
                newmessage+="zz"
            elif len(newmessage) % 4 == 1:
                newmessage+="zzz"
            message=E.encoding(newmessage)
            print "This is your encrypted message:"
            print e(S(message))
}}}


=== Hill Cipher Decryption ===
by Holly Paige Chaos, Alexis Newton

Use this interact to decrypt messages encrypted by the Hill cipher. Remember that this only works if the message was encrypted using an invertible matrix as the key!

{{{#!sagecell
#Last edited 8/8/19 at 1:47pm
dictt = {'a':1,'b':2,'c':3,'d':4,'e':5,'f':6,'g':7,'h':8,
    'i':9,'j':10,'k':11,'l':12,'m':13,'n':14,'o':15,'p':16,'q':17,
    'r':18,'s':19,'t':20,'u':21,'v':22,'w':23,'x':24,'y':25,'z':26
    }
pretty_print(html("<h>Please select the size of your key:<h>"))
@interact
def decrypt_hill(size=['2','3','4']):
    if size=='2':
        print "Please input your encrypted message and your key:"
        @interact
        def two_decrypt(coded_text=input_box(default='"HSVAKSCYLENB"',label="Message:"), a=input_box(default=1), b=input_box(default=3), c=input_box(default=3), d=input_box(default=4)):
            R = IntegerModRing(26)
            M = MatrixSpace(R,2,2)
            a = M([[a,b],[c,d]])
            print "The key:"
            print a
            message = []
            for char in coded_text:
                if char.isalpha():
                    message.append(char.lower())
            cipher_text = []
            for i in range(len(message)):
                cipher_text.append(dictt[message[i]]-1)
            new_text = []
            for i in range(len(cipher_text)-1):
                b = matrix(Integers(26),1,2,[cipher_text[i],cipher_text[i+1]])
                if i%2 ==0:
                    x = b*a.inverse()
                    x.column(0)
                    for i in x[:][0]:
                        new_text.append(i)
            final_text = ""
            for i in range(len(new_text)):
                new_text[i]=Integer(new_text[i])
                final_text += chr(97+new_text[i])
            print "The decrypted text:"
            print final_text
    if size=='3':
        pretty_print(html("<h>Please input your encrypted message and your key:<h>"))
        @interact
        def three_decrypt(coded_text=input_box(default='"FGYHQTCSGKYB"',label = "Message:"), a=input_box(default=1), b=input_box(default=2), c=input_box(default=3), d=input_box(default=5), e=input_box(default=2), f=input_box(default=6), g=input_box(default=7), h=input_box(default=9), i=input_box(default=9)):
            R = IntegerModRing(26)
            M = MatrixSpace(R,3,3)
            a = M([[a,b,c],[d,e,f],[g,h,i]])
            print "The key:"
            print a
            message = []
            for char in coded_text:
                if char.isalpha():
                    message.append(char.lower())
            cipher_text = []
            for i in range(len(message)):
                cipher_text.append(dictt[message[i]]-1)
            new_text = []
            for i in range(len(cipher_text)-2):
                b = matrix(Integers(26),1,3,[cipher_text[i],cipher_text[i+1],cipher_text[i+2]])
                if i%3 ==0:
                    x = b*a.inverse()
                    x.column(0)
                    for i in x[:][0]:
                        new_text.append(i)
            final_text = ""
            for i in range(len(new_text)):
                new_text[i]=Integer(new_text[i])
                final_text += chr(97+new_text[i])
            print "The decrypted text:"
            print final_text
    if size=='4':
            pretty_print(html("<h>Please input your encrypted message (In quotes) and your key:<h>"))
            @interact
            def four_decrypt(coded_text=input_box(default='UIBBSMUGGXTX',type=str,label="Message:"), a=input_box(default=17), b=input_box(default=8), c=input_box(default=7), d=input_box(default=10), e=input_box(default=0), f=input_box(default=17), g=input_box(default=5), h=input_box(default=8), i=input_box(default=18), j=input_box(default=12), k=input_box(default=6), l=input_box(default=17), m=input_box(default=0), n=input_box(default=15), o=input_box(default=0), p=input_box(default=17)):
                R = IntegerModRing(26)
                M = MatrixSpace(R,4,4)
                a = M([[a,b,c,d],[e,f,g,h],[i,j,k,l],[m,n,o,p]])
                print "The key:"
                print a
                message = []
                for char in coded_text:
                    if char.isalpha():
                        message.append(char.lower())
                cipher_text = []
                for i in range(len(message)):
                    cipher_text.append(dictt[message[i]]-1)
                new_text = []
                for i in range(len(cipher_text)-3):
                    b = matrix(Integers(26),1,4,[cipher_text[i],cipher_text[i+1],cipher_text[i+2],cipher_text[i+3]])
                    if i%4 ==0:
                        x = b*a.inverse()
                        x.column(0)
                        for i in x[:][0]:
                            new_text.append(i)
                final_text = ""
                for i in range(len(new_text)):
                    new_text[i]=Integer(new_text[i])
                    final_text += chr(97+new_text[i])
                print "The decrypted text:"
                print final_text
}}}


== Modular Arithmetic (Preliminaries for RSA, Diffie-Hellman, El Gamal) ==

This section gives visual representations of the modular arithmetic necessary for RSA, Diffie-Hellman, and El Gamal. 


=== Modular Arithmetic Multiplication Table ===

by Rebecca Lauren Miller, Kate Stange

Given a positive integer n, this prints the multiplication mod n. Each entry in this table corresponds to the product of the row number by the column number, modulo n.

{{{#!sagecell
#Last edited 8/9/19 at 12:30pm
pretty_print(html("<h1>Multiplication Table modulo n</h1>"))
pretty_print(html("<h>This tool creates a multiplication table modulo 𝑛.<h>"))
@interact
def modular_multiplication_tables(n = input_box(default = 7, width = 25)):
    R = IntegerModRing(n)
    rows = [['*']+[str(r) for r in R]]+[[i]+[i*r for r in R] for i in R]
    print table(rows, frame=True)
}}}


=== Modular Exponentiation ===

by Rebecca Lauren Miller, Kate Stange

Given a modulus n and a nonnegative exponent a, this displays a graph where each integer between 0 and n-1 is mapped to its a-th power, mod n.

{{{#!sagecell
#Last edited 8/9/19 at 2:46pm
pretty_print(html("<h1>Arrow Diagram modulo n</h1>"))
pretty_print(html("<h>Input your modulus, 𝑛, and an integer, 𝑎. The output will be an arrow diagram picture of 𝑥↦𝑎𝑥 on the ring ℤ/𝑛ℤ, i.e. the elements modulo 𝑛.<h>"))
@interact
def modular_multiplication_graph(n = input_box(default = 7, width = 25), a = input_box(default = 2, width = 25)):
    R = IntegerModRing(n)
    left=[' '+str(r)+' ' for r in R]
    right=['  '+str(r)+'  ' for r in R]
    pre_pos=graphs.CompleteBipartiteGraph(len(left),len(right)).get_pos()
    G = DiGraph()
    pos={}
    for (i,v) in enumerate(left+right):
        G.add_vertex(v)
        pos[v]=pre_pos[i]
    for l in range(n):
        G.add_edge(left[l],right[lift(R(a*l))])
    show(G.plot(pos=pos))
}}}


=== Discrete Log Problem ===
by Sara Lapan

The discrete logarithm, log(x) with base a, is an integer b such that a^b^ = x. Computing logarithms is computationally difficult, and there are no efficient algorithms known for the worst case scenarios. However, the discrete exponentiation is comparatively simple (for instance, it can be done efficiently using squaring). This asymmetry in complexity has been exploited in constructing cryptographic systems. Typically, it is much easier to solve for x in x = a^b^ (mod m) when a, b, and m are known, than it is to solve for b when x, a, and m are known. 

==== Solving for x ====

Interact to find x when a, b, and m are known:

{{{#!sagecell
pretty_print(html("<h1>Solving for x</h1>"))
pretty_print(html("<h>This will evaluate x=a^b (mod m). Choose your base (a), exponent (b), and modulus (m). These should all be positive integers.<h>"))
@interact
def DLP_solve(a=input_box(default=5),b=input_box(default=25),m=input_box(default=47)):
    if (not a in ZZ) or (not b in ZZ) or (not m in ZZ) or (a<=0) or (b<=0) or (m<=0):
        print "*********** ERROR: a,b,m should all be positive integers. ***********"
        print
    else:
        a=Integer(a)
        b=Integer(b)
        m=Integer(m)
        print('This is the evaluation process using squares:')
        print('')
        C=b.str(base=2)
        L=len(C)
        S=[]
        T=[]   
        ans=str(a)
        ans_num=a
        for i in range(L):
            pow=L-i-1
            S+=[(2^pow)]
            print "Step",i+1,":",str(a)+"^"+str(2^i),"=",ans,"=",ans_num,"mod",m
            ans=str(ans_num)+"^"+str(2)
            ans_num= (ans_num)^2%m
            if C[pow]=="1":
                T+=[2^i]
            else:
                T
        expansion = ""
        STR=""
        STR_eval=""
        STR_eval_num=1
        while len(T)>1:
            expansion += str(T[-1])+"+"
            STR += "("+str(a)+"^"+str(T[-1])+")"
            STR_eval += "("+str(a^(T[-1])%47)+")"
            STR_eval_num = STR_eval_num*(a^(T[-1])%47)
            T.remove(T[-1])
        expansion+=str(T[0])
        STR += "("+str(a)+"^"+str(T[0])+")"
        STR_eval += "("+str(a^(T[0])%47)+")"
        STR_eval_num = STR_eval_num*(a^(T[0])%47)
        STR_eval_num = STR_eval_num%47
        print "Step",L+1,":",str(a)+"^"+str(b),"=",STR,"=",STR_eval,"=",STR_eval_num,"mod",m
        print
        print "  Since, as a sum of powers of 2,",str(b)+" is "+expansion+"."
        print
        print "CONCLUSION: "+str(STR_eval_num)+" = "+str(a)+"^"+str(b)+" mod",m,". It takes",L+1,"steps to calculate x with this method."

}}}

==== Solving for b ====

Interact to find b when a, x, and m are known:

{{{#!sagecell
pretty_print(html("<h1>Solving for b</h1>"))
pretty_print(html("<h>This will solve for the exponent, b, in x=a^b (mod m) assuming an integer solution exists. Choose your base (a), modulus (m), and solution (x). These should all be positive integers.<h>"))
@interact
def DLP_break(a=input_box(default=5),x=input_box(default=22),m=input_box(default=47)):
    if (not a in ZZ) or (not x in ZZ) or (not m in ZZ) or (a<=0) or (x<0) or (m<=0):
        print "*********** ERROR: a,m,x should all be integers with a,m>0. ***********"
        print
    elif x==1:
        print "b=0"
    else:
        a=Integer(a)
        x=Integer(x)
        m=Integer(m)
        ind=0
        for i in [1..m]: 
            temp = a^i %m
            if temp==x:
                ind=1
                print "This process took",i+1,"steps to determine that b="+str(i),"by evaluating",str(a)+"^i for i=0,...,"+str(i)+"."
                print
                print "NOTE: Without restricting the size of b, there is not a unique solution for b. However, the solution above is the smallest possible solution."
            else:
                temp
        if ind==0:
            print "*********** ERROR: This process took",m,"steps to determine that there is no integer solution for b.***********"

}}}

== RSA ==

Named for the authors Rivest, Shamir, and Aldeman, RSA uses exponentiation and modular arithmetic to encrypt and decrypt messages between two parties. Each of those parties has their own secret and public key. To see how it works, following along while Alice and Babette share a message.

=== RSA, From Alice's Perspective ===
by Sarah Arpin, Eva Goedhart

Babette sent Alice an encrypted message. You, as Alice, will provide information so that you can read Babette's message.  

{{{#!sagecell
#Last edited 8/9/19 at 1:53pm
pretty_print(html("<h1>RSA, From Alice's Perspective</h1>"))
print "Hi, Alice! Let's set up RSA together."
print ""
print "1. Input two PRIVATE distinct primes, p and q, that are each greater than 10."
print "   The size of the primes depends on the size of Babette's message. Her message requires p,q > 10. A longer and stronger encrypted" 
print "   message requires larger primes."
print ""
print "2. Input a PUBLIC integer, e, which needs to be relatively prime to the the Euler phi function of the product pq, φ(pq)."
print "   If e is not relatively prime to φ(pq), then we can not decrypt the message."
@interact
def rsa(p = input_box(default = 11,label = "p: "), q = input_box(default = 23,label = "q: "),e = input_box(default = 7,label = "e:")):
    p = ZZ(p)
    q = ZZ(q)
    e = ZZ(e)
    if p == q:
        print "*********** Make sure p and q are different.***********"
    if p < 10:
        print "*********** Make p larger. ***********"
    if q < 10:
        print "*********** Make q larger. ***********"
    if not p.is_prime():
        print "*********** p needs to be prime. ***********"
    if not q.is_prime():
        print "*********** q needs to be prime. ***********"
    phi = (p-1)*(q-1)
    if not gcd(e,phi) == 1:
        print "*********** e must be relatively prime to φ(pq) - see factorization below. ***********"
    print ""
    print "φ(pq) = ",phi.factor()
    print ""
    N = p*q
    R = IntegerModRing(phi)
    d = (e^(R(e).multiplicative_order()-1)).mod(phi)
    print "Alice's PUBLIC key is: N =",N,", e =",e," where N = pq and the factorization of N is kept secret."
    print ""
    print "Alice's PRIVATE key is: p =",p,", q = ",q,", d = ",d,", where the decryption key d is the inverse of e modulo φ(N), i.e., de = 1 (mod N)."
    secret_message_from_babette = "Hi Dr. Strange!"
    ascii_secret = []
    for char in secret_message_from_babette:
        ascii_secret.append(ord(char))
    encrypted_ascii = []
    for ascii in ascii_secret:
        encrypted_ascii.append(power_mod(ascii,e,N))
    decrypted_ascii = []
    for ascii in encrypted_ascii:
        decrypted_ascii.append(power_mod(ascii,d,N))
    print ""
    print "3. Babette took her plaintext message and converted into integers using ASCII. Then she encrypted it by raising each integer to the e-th power modulo N and sent the result to Alice:"
    print ""
    print "   ", encrypted_ascii
    print ""
    print "4. To decrypt, we raise each integer of the lisy above to the d =",d,", modulo N =",N,":"
    print ""
    print "   ",decrypted_ascii
    print ""
    decrypted_secret = ""
    for ascii in decrypted_ascii:
        decrypted_secret += chr(ascii)
    print "5. Going from the integers in ASCII to the plaintext in letters, we figure out the secret is: "
    print ""
    print "   ",decrypted_secret
    print ""
    print "************************************************************************************************"
    print "REMARK: Babette encrypted her message one character at a time."
    print "Usual protocal dictates that the entire message is concatenated with leading zeros removed."
    print "This will require that N = pq is larger than the integer value of the full message."
    print "************************************************************************************************"
   

}}}



=== RSA, From Babette's Perspective ===
by Sarah Arpin, Eva Goedhart

{{{#!sagecell
#Last edited 8/9/19 2:40pm
pretty_print(html("<h1>RSA, From Babette's Perspective</h1>"))
print "Hi, Babette! Let's send a message to Alice using her PUBLIC key (N, e) with RSA."
print ""
print "1. Input Babette's secret message for Alice below."
print "   Make sure that there are no apostrophes or extra quotation marks in your message."
@interact
def rsa(message = input_box(default = 'Secrets for Alice', type=str,label="Message:")):
    p = next_prime(100)
    q = next_prime(p)
    phi = (p-1)*(q-1)
    e = 13
    N = p*q
    R = IntegerModRing(phi)
    d = (e^(R(e).multiplicative_order()-1)).mod(phi)
    ascii_secret = []
    for char in message:
        ascii_secret.append(ord(char))
    print "2. Using ASCII, we take the characters in our message and convert each of them into integers."
    print ""
    print "   ",ascii_secret
    print ""
    print "Alice's PUBLIC key is given to be (N, e) = (",N,",",e,")."
    print ""
    print "4. We encode the list of numbers by raising each integer to the e-th power modulo N. Recall that e is called the encryption key. This is what get's sent to Alice:"
    encrypted_ascii = []
    for ascii in ascii_secret:
        encrypted_ascii.append(power_mod(ascii,e,N))
    print ""    
    print "   ",encrypted_ascii
    print ""
    print "5. To decrypt, Alice raises each integer to the d-th power modulo N, where d is Alice's PRIVATE decryption key."
    decrypted_ascii = []
    for ascii in encrypted_ascii:
        decrypted_ascii.append(power_mod(ascii,d,N))
    print ""    
    print "   ", decrypted_ascii
    print ""
    decrypted_secret = ""
    for ascii in decrypted_ascii:
        decrypted_secret += chr(ascii)
    print "6. Going from the integers to letters using ASCII, we find that Babette's message was "
    print ""
    print "   ",decrypted_secret

}}}


=== RSA With Digital Signatures ===
by Sarah Arpin, Eva Goedhart

{{{#!sagecell

#Last edited 8/9/19 at 3:52pm
print "Hi, Alice! Let's send a message to Babette with your digital signature so that Babette knows that it is really Alice."
print ""
print "1. Make Alice's PRIVATE key: Input two distinct primes, p and q, that are each greater than 10, and an integer, e, that is relatively prime to the the Euler φ-function of the product pq."
@interact
def rsa(message_to_babette = input_box(default = 'Hi',type=str,label="message:"),p_a = input_box(default = 503,label = "p: "), q_a = input_box(default = 499,label = "q: "),e_a = input_box(default = 5,label = "e:")):
    p_a = ZZ(p_a)
    q_a = ZZ(q_a)
    e_a = ZZ(e_a)
    p_b = 1123
    q_b = 4999
    e_b = 5
    if p_a < 10:
        print "*********** Make p larger. ***********"
        return " "
    if q_a < 10:
        print "*********** Make q larger. ***********"
        return " "
    if not p_a.is_prime():
        print "*********** p needs to be prime. ***********"
        return " "
    if not q_a.is_prime():
        print "*********** q needs to be prime. ***********"
        return " "
    phi_a = (p_a-1)*(q_a-1)
    phi_b = (p_b-1)*(q_b-1)
    if not gcd(e_a,phi_a) == 1:
        print "*********** e must be replatively prime to φ(pq) - see factorization below. ***********"
        print ""
        print "φ(pq) = ",phi_a.factor()
        return " "
    print ""
    print "φ(pq) = ",phi_a.factor()
    print ""
    N_a = p_a*q_a
    N_b = p_b*q_b
    if N_b < N_a:
        print "Choose primes for p or q so that their product",N_a ,"is smaller than ",N_b,"."
        print "   This is not needed for general digital signatures, but is necessary for this program to decrypt the message correctly."
        return " "
    R = IntegerModRing(phi_a)
    d_a = (e_a^(R(e_a).multiplicative_order()-1)).mod(phi_a)
    S = IntegerModRing(phi_b)
    d_b = (e_b^(S(e_b).multiplicative_order()-1)).mod(phi_b)
    print "2. Alice's PRIVATE key is (p,q,d) =(",p_a,",",q_a,",",d_a,"), where the decryption key d is the inverse of e modulo φ(N)."
    print ""
    print "   Alice's PUBLIC key is (N,e) =(",N_a,",",e_a,")."
    print ""
    print "We are given Babette's PUBLIC key of (N_b,e_b) = (",N_b,",",e_b,")."
    print ""
    ascii_secret = []
    for char in message_to_babette:
        ascii_secret.append(ord(char))
    encrypted_ascii = []
    for ascii in ascii_secret:
        ascii = ZZ(ascii)
        signed = (ascii^d_a).mod(N_a)
        encrypted_ascii.append((signed^e_b).mod(N_b))
    decrypted_ascii = []
    for ascii in encrypted_ascii:
        ascii = ZZ(ascii)
        unencrypt = (ascii^d_b).mod(N_b)
        unsign = (unencrypt^e_a).mod(N_a)
        decrypted_ascii.append(unsign)
    print "3. Use ASCII to convert the plaintext message to integers."
    print ""
    print "   ",ascii
    print ""
    print "4. Sign the message using Alice's PRIVATE key by raising each integer in the list to the d-th power modulo N."
    print ""
    print "   ",signed
    print ""
    print "5. Finally, to encrypt the signed message, use Babette's PUBLIC key by raising every integer to the e_b-th power modulo N_b."
    print ""
    print "   ",encrypted_ascii
    print ""
    print "6. To decrypt the signed encrypted message, Babette will use Alice's PUBLIC key (",N_a,",",e_a,") AND Babette's PRIVATE key (",p_b,",",q_b,",", d_b,"), as given here by the program."
    print ""
    print "   ",decrypted_ascii
    print ""
    decrypted_secret = ""
    for ascii in decrypted_ascii:
        decrypted_secret += chr(ascii)
    print "7. Using the ASCII code to convert the intgers back to letters, we find out the signed secret message was from Alice and read "
    print "   ",decrypted_secret
}}}
