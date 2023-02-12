

```txt
==============
Un breve tour di Sage
==============

Questo è un tour di Sage che segue da vicino il tour di Mathematica reperibile all'inizio del libro Mathematica.


Sage come Calcolatore
====================

L'interfaccia a riga di comando si riconosce per la presenza della stringa ``sage:``. Dopo di essa possono essere inseriti direttamente i comandi. 
Se si usa invece l'interfaccia notebook, allora basterà inserire i comandi in una input-cell e premere la combinazione di tasti Shift+Enter per ottenere l'output del comando.

::

    sage: 3 + 5
    8

Il simbolo apice (^) indica una operazione di elevamento a potenza.

::

    sage: 57.1 ^ 100
    4.60904368661396e175

Calcoliamo l'investo di una matrice :math:`2 \times 2` con Sage.

::

    sage: matrix([[1,2], [3,4]])^(-1)
    [  -2    1]
    [ 3/2 -1/2]

Effettuiamo l'integrazione indefinita di una semplice funzione.

::

    sage: x = var('x')   # create a symbolic variable
    sage: integrate(sqrt(x)*sqrt(1+x), x)
    1/4*((x + 1)^(3/2)/x^(3/2) + sqrt(x + 1)/sqrt(x))/((x + 1)^2/x^2 - 2*(x + 1)/x + 1) + 1/8*log(sqrt(x + 1)/sqrt(x) - 1) - 1/8*log(sqrt(x + 1)/sqrt(x) + 1)

Risolviamo una equazione di II grado. I simbolo ``==`` rappresenta l'uguaglianza.

::

    sage: a = var('a')
    sage: S = solve(x^2 + x == a, x); S
    [x == -1/2*sqrt(4*a + 1) - 1/2, x == 1/2*sqrt(4*a + 1) - 1/2]

L'output fornito da Sage sarà una lista di uguaglianze.

.. link

::

    sage: S[0].rhs()
    -1/2*sqrt(4*a + 1) - 1/2
    sage: show(plot(sin(x) + sin(1.6*x), 0, 40))

.. image:: sin_plot.*


Power Computing con Sage
=========================

Innanzitutto si crea una matrice :math:`500 \times 500` composta da numeri casuali.

::

    sage: m = random_matrix(RDF,500)

Se ne calcolano gli autovalori che vengono poi rappresentati in un grafico. L'intero procedimento impiega solo alcuni secondi.

.. link

::

    sage: e = m.eigenvalues()  #about 2 seconds
    sage: w = [(i, abs(e[i])) for i in range(len(e))]
    sage: show(points(w))

.. image:: eigen_plot.*


Grazie alla libreria GNU Multiprecision Library (GMP), Sage può gestire numeri molto grandi, composti anche da milioni o miliardi di cifre.

::

    sage: factorial(100)
    93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000
    sage: n = factorial(1000000)  #about 2.5 seconds

Il codice riportato calcola le prime 100 cifre del :math:`\pi`.

::

    sage: N(pi, digits=100)
    3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117068

Questo codice, invece, chiede a Sage di fattorizzare un polinomio in due variabili.

::

    sage: R.<x,y> = QQ[]
    sage: F = factor(x^99 + y^99)
    sage: F
    (x + y) * (x^2 - x*y + y^2) * (x^6 - x^3*y^3 + y^6) * 
    (x^10 - x^9*y + x^8*y^2 - x^7*y^3 + x^6*y^4 - x^5*y^5 +
     x^4*y^6 - x^3*y^7 + x^2*y^8 - x*y^9 + y^10) * 
    (x^20 + x^19*y - x^17*y^3 - x^16*y^4 + x^14*y^6 + x^13*y^7 -
     x^11*y^9 - x^10*y^10 - x^9*y^11 + x^7*y^13 + x^6*y^14 - 
     x^4*y^16 - x^3*y^17 + x*y^19 + y^20) * (x^60 + x^57*y^3 -
     x^51*y^9 - x^48*y^12 + x^42*y^18 + x^39*y^21 - x^33*y^27 - 
     x^30*y^30 - x^27*y^33 + x^21*y^39 + x^18*y^42 - x^12*y^48 -
     x^9*y^51 + x^3*y^57 + y^60)
    sage: F.expand()
    x^99 + y^99

Sage impiega poco meno di 5 secondi per calcolare il numero di modi per partizione cento milioni come una somma di numeri interi positivi.

::

    sage: z = Partitions(10^8).cardinality() #about 4.5 seconds
    sage: str(z)[:40]
    '1760517045946249141360373894679135204009'

Algoritmi di calcolo in Sage
============================

Ogni volta che si utilizza Sage si ha accesso a una delle più grandi collezioni open-source di algoritmi di calcolo.
```