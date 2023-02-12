

# Kurzreferenz der wichtigsten Befehle

Eine Übersicht besonders häufig benötigter Befehle: 


### Typen

* ZZ = $\mathbb{Z}$ 
* QQ = $\mathbb{Q}$ 
* symbolische Variable: x = var('x') 

### Ringe, Gruppen und Körper

Da Sage eine Betonung auf algebraische Objekte hat, sind diese ähnlich wie in Magma vertreten: 

* GF(p) = endlicher (Galois) Körper über p 
* <a href="/PolynomialRing">PolynomialRing</a>: Ring der Polynome - zum Beispiel definiert R.<x,y> = <a href="/PolynomialRing">PolynomialRing</a>(QQ,2) implizit die Variablen x und y, aus denen sich nun Polynome über $\mathbb{Q}$ konstruieren lassen. 

### Konstanten

* pi = $\pi$ 
* e = $\mathbb{e}$ 
* oo = $\infty$ 

### Ausdrücke

* Operanden: +, -, 
* , /, sin, cos, tan, exp, sqrt, ... 

### grundlegende Strukturen

* Listen: [ a, b, ... ] 
* Reihen (Python: "sequence"): (a,b,c...) ... diese sind im Gegensatz zu Listen unveränderlich, mit zwei Elementen sind es "Tupel" 
* Mengen: {a, b, c, ...} 
* eine assoziative Liste: { 0: [1,2], 1: [2,1], 2: [0,1,3]}, 3: [1] } ... wobei dies hier bedeutet, dass das Element 0 mit 1 und 2 verbunden ist, 1 mit 2 und 1, usw. - diese wird zum Beispiel bei der Konstruktion von Graphen benötigt. 
* Vektor: vector([a,b,c,...]) 
* Matrix: matrix([a,b,c,...]) 

### grundlegende Funktionen

* numerische Approximation: pi.n(digits=15) = 3.141592... 
* verallgemeinerte Funktion: lambda x: f(x) 
* Lösen von Gleichungen: solve(f(x)==0,x) 
* Grenzwert: limit(f(x),x=oo) 
* Differenzieren: diff(f(x),x) 
* Integrieren: integral(f(x),x) bzw. bestimmt von a bis b: integral(f(x),x,a,b) 
Diese Funktionen können generell auch auf Ausdrücke in Form von Variablen wirken: Beispiel: wenn f eine Funktion ist, dann ist f.diff(x) exakt gleich wie diff(f,x) 

* Nullstellen: find_root(f(x), a, b) 

### Plotten

Es gibt einen Unterschied zwischen Plot-Objekt und Darstellung: 

* 2D: P = plot(f(x),-4,4) ... ist der Plot 
* P.show() ... ist die Darstellung 
* 3D Plot: plot3d(f(x,y),[-2,2],[-3,3]) 