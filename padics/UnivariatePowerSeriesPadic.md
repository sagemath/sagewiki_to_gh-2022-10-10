
* _Goal_ -- Separate precision from approximation for power series. Include precision types that give information about the valuations for ALL coefficients (not just the first n). Write functions for solving p-adic differential equations.  
* _Type_ -- speed improvements, precision handling, advanced functionality 
* _Priority_ -- Medium-Low 
* _Difficulty_ -- Medium-Hard 
* _Prerequisites_ -- <a href="/padics/PolynomialPrecision">polynomial precision</a> 
* _Background_ -- Take a look at this book: Kedlaya, Kiran.  p-adic Differential Equations, Cambridge Studies in Advanced Mathematics 125, Cambridge Univ. Press, 2010. 
* _Contributors_ --  
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion


## Tasks

1. Write precision classes for power series, analogous to those for polynomials.  
1. Write a subclass of `PowerSeries_poly` to take advantage of these precision structures.  Implement nontrivial power series functionality using an approximation and the precision object. 
1. Implement cool stuff for p-adic differential equations.  :-) 