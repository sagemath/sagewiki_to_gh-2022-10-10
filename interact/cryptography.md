= Sage Interactions - Cryptography - Under Construction =



This page will be created/preened at a Sage Days that will take place August 7th - 10th.

If you have cryptography related interactions that you are interested in adding to this page, please do. You can also contact Amy Feaver at firstname.lastname@kingsu.ca (insert my name in 'firstname' and 'lastname') if you have interactions that you are interested in having us add to the page during Sage Days. We will consider them and add them in if we can! 

goto [[interact|interact main page]]

<<TableOfContents>>



== Shift Cipher ==
by Sarah Arpin, Alexis Newton

{{{#!sagecell
print "Put your message in quotes, and your desired shift: "
@interact
def shift_cipher(message = input_box(default="'secrets hi'", width = 50), shift=slider(0,25,1,3)):
    
    A = AlphabeticStrings()
    S = ShiftCryptosystem(A)
    message = S.encoding(message)
    C = S.enciphering(shift, message)
    print "Enciphered message:"
    print C
}}}
