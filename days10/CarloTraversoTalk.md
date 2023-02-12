
In this talk we investigate three different topics: Groebner bases, integer lattices and cryptography, in their mutual interrelations. 

Groebner bases and cryptography: polynomial system solving through Groebner basis is used for cryptoanalysis, but the problem is NP-hard, and it is tempting to use it to build public key cryptosystems; however, the paper of Boo Barkee, Deh Cac Can, Julia Ecks, Theo Moriarty, and R.~F. Ree, "Why you cannot even hope to use Groebner Bases in Public Key cryptography: an open letter to a scientist who failed and a challenge to those who have not yet failed", (JSC, 18(6):497--501, 1994) explains why this is doomed to fail.  A recent survey has shown that the assertion is still valid, with one possible exception that will be shown later. These cryptosystems are currently named "Polly Cracker". 

Lattices and cryptography: integer lattices are used to attack cryptosystems via LLL lattice reduction; not only lattice-bases cryptosystems, but also others, for example RSA. 

Lattice cryptosystems can be attacked via lattice reduction; the first victim has been the Merkle-Hellman cryptosystem, many more followed, and it is tempting to paraphrase Barkee's assertion for lattices. Currently, the only surviving lattice cryptosystem (NTRU) is not a lattice cryptosystem at all: it is a polynomial algebra cryptosystem that allows a lattice description. 

Groebner bases and lattices: one can define a binomial ideal associated to a lattice (a lattice ideal), and conversely. Such ideals are widely studied, and have a large range of application: not only in algebraic geometry (toric varieties), but also in integer programming, statistics, biology, etc. Algorithms to deal with them need special implementations, not only because of the special structure of the data, but also because of the special tuning needed for the Buchberger algorithm. In particular, both F4 and F5 are hopeless with such ideals. An efficient, specialized package, with GPL licence exists (<a href="http://www.4ti2.de/">http://www.4ti2.de/</a>). 

All together now: binomial ideals escape the cryptanalisis that cracked all the Pollies. We have hence built a public key cryptosystem using lattice ideals, and called it Lattice Polly Cracker (LPC). It is similar to the Goldreich-Goldwasser-Halevi cryptosystem, (GGH), but much more efficient and (we hope) secure. 

We will discuss some of the issues that have led to the current version, that seems to be reasonably secure for a range of parameters that can make it useful. In particular, we show the pitfalls in which we fell in previous versions, how we escaped them, and how cracking the LPC private key of the current version implies solving several optimization problems that are NP-hard 
