= Sage Interactions - Cryptography - Under Construction =



This page was be created at Sage Days 103, 7-10 August 2019 by Sarah Arpin, Catalina Camacho-Navarro, Holly Paige Chaos, Amy Feaver, Eva Goedhart, Rebecca Lauren Miller, Alexis Newton, and Nandita Sahajpal.

If you have cryptography related interactions that you are interested in adding to this page, please do so. You can also contact Amy Feaver at firstname.lastname@kingsu.ca  if you have interactions that you are interested in having us add to the page during Sage Days. We will consider them and add them in if we can! 

goto [[interact|interact main page]]

<<TableOfContents>>



== Shift Cipher ==
by Sarah Arpin, Alexis Newton

A classical cryptosystem that takes your plaintext and shifts it through the alphabet by a given number of letters.  -EG

=== Shift Cipher Encryption ===

{{{#!sagecell
#Last edited 8/7/19 2:45pm
print "Put your message in between the provided quotes (with no additional quotes or apostrophes!), and select your desired shift: "
@interact
def shift_cipher(message = input_box(default='"secrets"', width = 50), shift=slider(0,25,1,3)):
    A = AlphabeticStrings()
    S = ShiftCryptosystem(A)
    message = S.encoding(message)
    C = S.enciphering(shift, message)
    print "This is your encrypted text shifted by ",shift,":"
    print C
}}}

=== Shift Cipher Decryption ===

If you know that your encrypted message is a shift cipher, you can use the known encryption to decrypt. If this is not known, brute force can be used to get possible decrypted messages. 

{{{#!sagecell
#Last edited 8/7/19 2:56pm

print "Enter the encrypted text in quotes, and enter a guess for the shift amount:"
@interact
def shift_decrypt(text = input_box('"KL"'), shift_by = input_box(0)):
    S = ShiftCryptosystem(AlphabeticStrings())
    ciphertext = S.encoding(text)
    decrypt = S.deciphering(shift_by,ciphertext)
    print "If the shift was by", shift_by,", then the original message was:"
    print decrypt
    decrypt = S.brute_force(ciphertext)
    print "These are the possibilities for the plaintext:"
    print decrypt
    decrypt = S.brute_force(ciphertext,ranking = "chisquare")
    print "These are the possibilities ranked by likelihood with the chi-squared function:"
    print decrypt
}}}

== Affine Cipher ==
by Sarah Arpin, Alexis Newton


{{{#!sagecell
# Last edited 8/7/2019 2:01pm
print "Put your message in between the provided quotes (with no additional quotes or apostrophes!), and select your desired a,b: "
print "This cipher will encipher the letters m of your message as a*m + b"
@interact
def affine_cipher(message = input_box(default='"secrets"', width = 50), a=[1,3,4..12,14,15..25], b =[0..25]):
    A = AlphabeticStrings()
    S = AffineCryptosystem(A)
    message = S.encoding(message)
    C = S.enciphering(a,b, message)
    print "This is your encrypted text:"
    print C
}}}

== Substitution Cipher ==
by Catalina Camacho-Navarro

A simple cipher to encrypt messages in which each letter is assigned to another letter. Brute force or frequency analysis can be used to decrypt. -EG

{{{#!sagecell

}}}

=== Playfair Cipher ===

A special type of substitution cipher in which the plaintext is broken up into two-letter digraphs with some restrictions. Those digraphs are encrypted using a Polybius square, (i.e. a 5x5 grid in which each letter of the alphabet is its own entry with the exception of ij which are placed together). The positions of the letters in the digraph determine how the digraph is encrypted.


{{{#!sagecell

}}}

== Frequency Analysis Decryption Tool ==

{{{#!sagecell

}}}

== Vigenère Cipher ==
by Holly Paige Chaos, Rebecca Lauren Miller, and Kate Stange

Using a secret code word, encrypt each letter by shifting it the corresponding letter in the code word. -EG

=== Vigenère Cipher Encryption ===

{{{#!sagecell
#This encrypts your message: Final 8/7/19. Written by Rebecca Lauren Miller, Holly Paige Chaos, Kate Strange.
print "Put your message and codeword in quotes: "
@interact 
def vigenere_cipher(message = input_box(default ="'secrets hi'", width = 50), code_word = input_box(default="'cat'", width = 50)):
    A = AlphabeticStrings()
    message2 = A.encoding(message) 
    code_word2 = A.encoding(code_word) 
    system = VigenereCryptosystem(A,len(code_word2)) 
    ciphertext = system.enciphering(code_word2,message2) 
    print "Enciphered message:"
    print ciphertext
}}}

=== Vigenère Cipher Decryption ===

{{{#!sagecell
#This decrypts your message: Final 8/7/19. Written by Rebecca Lauren Miller, Holly Paige Chaos, Kate Strange.
print "Put your message and codeword in quotes: "
@interact 
def vigenere_cipher(message = input_box(default ="'UEVTEMUHB'", width = 50), code_word = input_box(default="'cat'", width = 50)):
    A = AlphabeticStrings()
    message2 = A.encoding(message) 
    code_word2 = A.encoding(code_word) 
    system = VigenereCryptosystem(A,len(code_word2)) 
    ciphertext = system.deciphering(code_word2,message2) 
    print "Deciphered message:"
    print ciphertext
}}}

== Hill Cipher ==
by Holly Paige Chaos and Rebecca Lauren Miller



{{{#!sagecell

}}}

== RSA ==

Named for the authors Rivest, Shamir, Aldeman, RSA uses exponentiation and modular arithmetic to encrypt and decrypt messages between two parties. Each of those parties has their own secret and public key. To see how it works, following along while Alicia and Bernadette share a message. -EG

{{{#!sagecell

}}}

== One-time Pad ==
