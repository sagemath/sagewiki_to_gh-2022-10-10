= Sage Interactions - Cryptography - Under Construction =



This page was be created at Sage Days 103, 7-10 August 2019 by Sarah Arpin, Catalina Camacho-Navarro, Holly Paige Chaos, Amy Feaver, Eva Goedhart, Rebecca Lauren Miller, Alexis Newton, and Nandita Sahajpal.

We would also like to acknowledge Katherine Stange, who allowed us to use some of the code from her cryptography course as a starting point for many of these interacts. Dr. Stange's original code can be found at http://crypto.katestange.net/

If you have cryptography-related interactions that you are interested in adding to this page, please do so. You can also contact Amy Feaver at firstname.lastname@kingsu.ca  

goto [[interact|interact main page]]

<<TableOfContents>>



== Shift Cipher ==
by Sarah Arpin, Alexis Newton

The shift cipher is a classical cryptosystem that takes plaintext and shifts it through the alphabet by a given number of letters.  -EG 

For example, a shift of 2 would replace all A's with C's, all B's with D's, etc. When you reach the end of the alphabet, the letters are shifted cyclically back to the beginning. Thus, a shift of 2 would replace Y's with A's and Z's with B's. -AF

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

If you know that your message was encrypted using a shift cipher, you can use the known shift value to decrypt. If this is not known, brute force can be used to get 26 possible decrypted messages. 

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

An affine cipher combines the idea of a shift cipher with a multiplicative cipher. In this particular example, we map consecutive letters of the alphabet to consecutive numbers, starting with A=0 (you can also do this cipher differently, and starting with A=1). The user selects two values, a and b. The value a is the multiplier and must be relatively prime to 26 in order to guarantee that each letter is encoded uniquely. The value b is the addend. Each letter's value is multiplied by a, and the product is added to b. This is then replaced with a new letter, corresponding to the result modulo 26. -AF

{{{#!sagecell
# Last edited 8/7/2019 2:01pm
print "Put your message in between the provided quotes (with no additional quotes or apostrophes!), and select your desired a,b: "
print "Notice that the only choices for a can be numbers that are relatively prime to 26"
print "This cipher will encipher the letters m of your message as a*m + b"
@interact
def affine_cipher(message = input_box(default='"secrets"', width = 50), a=[1,3,5,7,9,11,15,17,19,21,23], b =[0..25]):
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


== Frequency Analysis Decryption Tool ==

by Rebecca LaurenMiller and Kate Stange. Created as part of Sage Days 103.

#Text From Amy Feaver. 

{{{#!sagecell
#Last Edited 8/8/19 at 2:36pm


print "This interact prints a bar graph of the distribution of the letters in the input text. Warning: the smaller the input text the less accurate the distribution will be. Letters that do not occur will not appear in the graph."
# Initial text is "Greetiiiings my name is Weeegbert Deuce the True Eater of the Toupee. Hear ye, hear ye! Dee dee dee. A head of these liger cubs carrying the trippy tomahawks are coming fo' thee. Take shelters in the tombs. Tammy ran to the other townspeople and aardvarks. What is her ETA? Her ETA please! Toil, bring your food cups and oil and be swift. The women and the child Occotion CIII should pick bamboo at Atitisoting. See? Nanna Wu Shacah's inner noodle cups: not nuutty sesame notions."
@interact
def frequencyAnalysis(text = input_box('"Nyllappppunz tf uhtl pz Dlllnilya Klbjl aol Aybl Lhaly vm aol Avbwll. Olhy fl, olhy fl! Kll kll kll. H olhk vm aolzl spnly jbiz jhyyfpun aol aypwwf avthohdrz hyl jvtpun mv aoll. Ahrl zolsalyz pu aol avtiz. Ahttf yhu av aol vaoly avduzwlvwsl huk hhykchyrz. Doha pz oly LAH? Oly LAH wslhzl! Avps, iypun fvby mvvk jbwz huk vps huk il zdpma. Aol dvtlu huk aol jopsk Vjjvapvu JPPP zovbsk wpjr ihtivv ha Hapapzvapun. Zll.Uhuuh Db Zohjho z puuly uvvksl jbwz: uva ubbaaf zlzhtl uvapvuz."', width = 150)):
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
    plt.savefig('netscore.png')

}}}

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


== Diffe-Hellman Key Exchange ==

== One-time Pad ==
