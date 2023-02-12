
* _Goal_ -- Design a specialized p-adic extension type for cyclotomic extensions of Qp and Zp. Design element classes for unramified extensions that take advantage of a Gauss normal basis for faster arithmetic.   
* _Type_ -- speed improvements, coherence with number fields 
* _Priority_ -- Medium 
* _Difficulty_ -- Medium-Hard 
* _Prerequisites_ -- Cyclotomic fields in general will need to wait on <a href="/padics/PolynomialFactoring">polynomial factoring</a> 
* _Background_ -- Look at <a class="http" href="http://perso.univ-rennes1.fr/reynald.lercier/file/talkL10a.pdf">Lercier's talk</a> from Counting Points: Theory, Algorithms and Practice 
* _Contributors_ -- David Roe, David Lubicz 
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion


## Tasks

1. Implement Gauss normal basis for finite fields. 
1. Implement Gauss normal basis for unramified extensions of Zp and Qp. 
1. Implement elliptic normal basis for finite fields. 
1. Implement elliptic normal basis for unramified extensions of Zp and Qp. 
1. Implement a special parent for cyclotomic extensions.  For totally ramified and unramified cyclotomic extensions this can be done now; in general it will need to wait on <a href="/padics/PolynomialFactoring">polynomial factoring</a>. 