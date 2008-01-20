= Einführung in die Bedienung von Sage =

== Prinzipien ==

Sage folgt der Tradition aller CAS (Computer-Algebra-System) der zweiten Generation. Das heißt, dass es eine interaktive Eingabe von Befehlen gibt, die Objekte im Speicher erzeugen. Diese Objekte können dann für Berechnungen verwendet werden.

Beispiel:
 1. x = 5 weist der Variablen x den Wert 5 zu
 1. x = 2*x multipliziert 2 mit x und speichert dies wieder in x (diest ist also keine Gleichung (!) )
 1. x gibt nun den Wert 10 aus.


Wenn man nach dem Sage-Prompt "faktor(100)" (Enter) schreibt, gibt Sage die Primfaktorzerlegung von 100 aus. Gibt man "factor??" (Enter) ein, wird der Quellcode der Funktion factor angegezeigt. Wird Strg-d gedrückt (die "Strg" Taste und das "d" gleichzeitig halten) oder "quit" (Enter) eingegeben, wird Sage beeendet. Um die gleiche Berechnung im Notebook zu machen, schreibt man "factor(100)" in eine "Zelle" (ein leeres weißes Fenster im Webbrowser) und drückt dann Shift-Enter. Sage wird die Faktorisierung im Bereich unter der Eingabezelle anzeigen. Um das Notebook zu beenden, muss auf der der Kommandozeile Strg-C eingegeben werden. Wenn dann der Browser beendet wird, ist das Sage Notebook vollständig geschlossen.
