= Einführung in die Bedienung von Sage =
== Prinzipien ==
Sage folgt der Tradition aller CAS (Computer-Algebra-System) der zweiten Generation. Das heißt, dass es ein interaktives Frage-Antwort Spiel zur Eingabe von Rechenbefehlen gibt. Es werden Objekte im Speicher erzeugt über die mittels Variablennamen zugegriffen wird. Diese Objekte können dann für Berechnungen verwendet werden.

Eingaben werden im Notebook mit <Shift>-<Return> ausgeführt, in der Kommandozeile reicht ein <Return>.

Beispiel:

 1. {{{
x = 5 
}}}
weist der Variablen x den Wert 5 zu }}}
 1. {{{ x = 2*x
}}}
 multipliziert 2 mit x und speichert dies wieder in x (dies ist also keine Gleichung (!) )
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
Hier eine Übersicht besonders häufig benötigter Befehle.
