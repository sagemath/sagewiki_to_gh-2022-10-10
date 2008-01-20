= Einführung in die Bedienung von Sage =
== Prinzipien ==
Sage folgt der Tradition aller CAS (Computer-Algebra-System) der zweiten Generation. Das heißt, dass es ein interaktives Frage-Antwort Spiel zur Eingabe von Rechenbefehlen gibt. Es werden Objekte im Speicher erzeugt über die mittels Variablennamen zugegriffen wird. Diese Objekte können dann für Berechnungen verwendet werden.

Eingaben werden im Notebook mit <Shift>-<Return> ausgeführt, in der Kommandozeile reicht ein <Return>.

Im Notebook wird eine neue Zelle erstellt, indem vor oder nach bestehenden Zellen auf den blauen Balken geklickt wird. Eine Zelle wird gelöscht, indem der Inhalt gelöscht wird und dann die Rückwärtslöschen Taste betätigt wird.

Beispiel:

 1. x = 5 ... weist der Variablen x den Wert 5 zu
 1. x = 2*x ... multipliziert 2 mit x und speichert dies wieder in x (dies ist also keine Gleichung (!) )
 1. x gibt nun den Wert 10 aus.
=== Objekte ===
Nachdem ein Objekt konstruiert wurde und in einer Variablen gespeichert ist, kann auf dieses und dessen assoziierten Funktionen mittels eines anschließenden Punktes zugegriffen werden.

Beispiel:

 1.  V = RR^3 erzeugt einen dreidimension Vektorraum
 1.  V.dimensions() ruft die Funktion "dimensions" von V auf und gibt "3" zurück.
=== Hilfe ===
Jedem Befehl kann ein "?" hinten angefügt werden, welches Informationen über Funktionsweise und Bedienung ausgibt.

Beispiel:

 * factor? erklärt, wie der Befehl zum Faktorisieren benützt werden soll.
=== automatische Vervollständigung ===
Die Eingabe von Berechnungen wird vereinfacht, indem:

 * bei teilweise eingegebene Befehle wird nach dem drücken der <Tab>-Taste eine Liste von möglichen Kandidaten mit diesen Anfangsbuchstaben ausgegeben, oder
 * bei Variablen oder Objekten wird nach dem <Variablenname>.<Tab> eine Liste von möglichen Funktionen ausgegeben, oder
 * beide Möglichkeiten können kombiniert werden.
== Befehlsreferenz ==
Eine Übersicht besonders häufig benötigter Befehle:

=== Zahlentypen ===
* ZZ = $\mathbb{Z}$
* QQ = $\mathbb{Q}$
* symbolische Variable: x = var('x')


=== Konstanten ===
* pi = $\pi$
* e = $\e$
* oo = $\infty$

=== Ausdrücke ===
* Operanden: +, -, *, /, sin, cos, tan, exp, sqrt, ...

=== grundlegende Strukturen ===
* Listen: [ a, b, ... ]
* Reihen (Python: "sequence"): (a,b,c...) ... diese sind im Gegensatz zu Listen unveränderlich, mit zwei Elementen sind es "Tupel"
* Mengen: {a, b, c, ...}
* eine assoziative Liste: { 0: [1,2], 1: [2,1], 2: [0,1,3]}, 3: [1] } ... wobei dies hier bedeutet, dass das Element 0 mit 1 und 2 verbunden ist, 1 mit 2 und 1, usw. - diese wird zum Beispiel bei der Konstruktion von Graphen benötigt.

=== grundlegende Funktionen ===
* numerische Approximation: pi.n(digits=15) = 3.141592...
* verallgemeinerte Funktion: lambda x: f(x)
* Lösen von Gleichungen: solve(f(x)==0,x)
* Grenzwert: limit(f(x),x=oo)
* Differenzieren: diff(f(x),x)
* Integrieren: integral(f(x),x) bzw. bestimmt von a bis b: integral(f(x),x,a,b)

Diese Funktionen können generell auch auf Ausdrücke in Form von Variablen wirken:
Beispiel: wenn f eine Funktion ist, dann ist f.diff(x) exakt gleich wie diff(f,x)
