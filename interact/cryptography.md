= Sage Interactions - Cryptography - Under Construction =



This page was be created at Sage Days, 7-10 August 2019 by Sarah Arpin, Catalina Camacho-Navarro, Holly Paige Chaos, Amy Feaver, Eva Goedhart, Rebecca Lauren Miller, Alexis Newton, and Nandita Sahajpal.

If you have cryptography related interactions that you are interested in adding to this page, please do so. You can also contact Amy Feaver at firstname.lastname@kingsu.ca (insert my name in 'firstname' and 'lastname') if you have interactions that you are interested in having us add to the page during Sage Days. We will consider them and add them in if we can! 

goto [[interact|interact main page]]

<<TableOfContents>>



== Shift Cipher ==
by Sarah Arpin, Alexis Newton

A classical cryptosystem that takes your text and shifts it through the alphabet by a given number of letters.  -EG

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

== Affine Cipher ==
by Sarah Arpin, Alexis Newton


{{{#!sagecell

}}}

== Substitution Cipher ==
by Catalina Camacho-Navarro

A simple cipher to encrypt messages in which each letter is assigned to another letter. Brute force or frequency analysis can be used to decrypt. -EG

{{{#!sagecell

}}}

== Vigenère Cipher ==
by Holly Paige Chaos and Rebecca Lauren Miller

Using a secret key word, encrypt each letter by shifting it the corresponding letter in the key word. -EG

{{{#!sagecell

}}}
