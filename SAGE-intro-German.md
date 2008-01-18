== Eine kurze Einleitung in SAGE: Software für Algebra- und Geometrie-Experimente ==

["SAGE"] ist eine mathematische Software für Zahlentheorie sowie Algebra- und Geometrieberechnungen. Die Implementierung geht im Wesentlichen auf William Stein und etwa 30 weitere Mitwirkende aus der ganzen Welt zurück. SAGE ist freie Software und ist unter den Bedingungen der GNU General Public License (GPL) verfügbar. SAGE ist 

 * eine Distribution freier Mathematiksoftware, die ohne besondere Software-Kenntnisse aus den Quellen übersetzt werden kann, 
 * eine neue Python-Library für mathematische Berechnungen mit einer graphischen und einer zeilenbasierten Schnittstelle sowie
 * eine Schnittstelle zu bestehenden Computer Algebra Systemen.

SAGE wird in Python, C++ und C (über ["Pyrex"]) geschrieben. Python ist eine quelloffene, objektorientierte, interpretierte Sprache, mit vielen Bibliotheken z.B. für numerische Mathematik, die für SAGE Benutzer ebenfalls zugänglich sind. Python kann ebenso als Library von C/C++ Programmen verwendet werden.

SAGE beinhaltet einige wichtige Open-Source Bibliotheken und bietet eine vereinheitlichte Schnittstelle zu ihnen an: ["Singular"] (für kommutative Algebra), ["GAP"] (für Gruppentheorie), John Cremona's ["MWRANK"] Bibliothek (für elliptische Kurven), die ["PARI"] Bibliothek für Zahlentheorie, Shoup's Zahlentheorie Bibliothek ["NTL"] und ["Maxima"] (für symbolische Berechnungen). SAGE bietet ebenso Schnittstellen zu vielen kommerziellen, proprietären oder anderen quelloffenen mathematischen Softwarepaketen an, wie MAPLE, MATLAB, Mathematica, KASH/KANT, MAGMA, Axiom sowie viele anderen. Zur Darstellung von Graphiken nutzt SAGE [:matplotlib:Matplotlib] (für 2D und 3D Graphiken) sowie [:Tachyon_ray_tracer:Tachyon] (ein 3D Renderer).

Die langfristigen Hauptziele und Prinzipien von SAGE sind:

 * Open-Source: Der Quellcode muss frei einsehbar sein, so dass jeder Benutzer verstehen kann, was das System wirklich tut sowie die Möglichkeit hat, das System zu verändern. So wie Mathematiker ein tieferes Verständnis eines Theorems erlangen, indem sie einen Beweis sorgfältig lesen oder zumindest überfliegen, sollten Programmbenutzer verstehen können, wie Berechnungen zustande kommen, indem sie die kommentierten Quellen lesen. Alle Software, die im Kern von SAGE mit SAGE verbreitet wird, muss freie Software sein und Änderungen sowie die Weiterverbreitung des Codes muss erlaubt sein.

 * Ein gutes Programmierumfeld: SAGE soll eine stabile Umgebung für neue mathematische Softwareprojekte bieten. SAGE ist ein Software Entwicklungsmodell für die mathematische Gemeinschaft mit einer starken Betonung auf Offenheit und Zusammenarbeit.

 * Erweiterbar: Die Möglichkeit, neue Datentypen zu entwerfen, von bestehenden Datentypen zu erben und Code in anderen Programmiersprachen (z.B. C/C++), zum Teil des Systems machen zu können. 

 * Benutzerfreundlich: Nutzern soll ein hohes Maß an Unterstützung geboten werden.

 * Einfach zu kompilieren: SAGE soll verhältnismäßig einfach aus den Quellen - unter Linux, Mac OSX und MS Windows - übersetzbar sein. Dieses bietet mehr Flexibilität, wenn das System verändert werden soll.

 * Plattformübergreifend: SAGE läuft unter Linux, Mac OS X und Windows. 

 * Komplett: Das Angebot von Algorithmen aus allen Bereichen der computerbasierten Mathematik sowie die Vereinheitlichung aller wichtigen bereits bestehenden quelloffener mathematischer Programme. SAGE soll ein vollständiges und qualitativ hochwertiges Mainstream Computer Algebra System sein.

 * Effizient: SAGE soll sehr schnell sein - vergleichbar mit oder schneller als alles andere. Dies ist sehr schwierig, da viele Systeme keine offenen Quellen bieten, Algorithmen manchmal nicht veröffentlicht sind und das Finden schneller Algorithmen häufig extrem schwierig (gemessen in Arbeitsjahren, Doktorarbeiten, Glück, etc.) ist.

 * Werkzeuge: SAGE soll eine robuste Schnittstelle zur Funktionalität von PARI, GAP, GMP, Maxima, Singular, MWRANK und NTL zur Verfügung stellen. Diese stehen alle unter der GPL und SAGE liefert vereinheitlichte Schnittstellen für sie an. 

 * Dokumentation: Handbuch, Tutorial, API-Referenz mit Beispielen für jede Funktion sowie ein umfangreiches "wie kann ... in SAGE konstruiert werden?" Dokument.

SAGE, eine Installationsanleitung und das Tutorial können von der SAGE Webseite unter http://sage.scipy.org/ heruntergeladen werden.

Obgleich SAGE Python, PARI und andere Pakete verwendet, sei darauf hingewiesen, dass es nicht notwendig ist, diese Software auf dem eigenen Computer vorinstalliert zu haben: Sie sind alle in der SAGE-Distribution enthalten. Der Installationsprozess von SAGE ist mit dem Ziel entworfen worden, verhältnismäßig einfach sein. Sollte es dennoch Probleme geben, können Fragen an die SAGE-Entwickler gestellt werden (auf der Webseite befinden sich Links auf die Mailingliste für den SAGE-Support). Eine Installationsanleitung ist unter http://sage.scipy.org/sage/doc/html/inst/index.html zu finden. Sobald SAGE einmal installiert ist, ist ein Upgrade zur jeweils neuesten Version besonders einfach mit dem "upgrade" Befehl möglich. 

Wie kann man SAGE verwenden? Unter Linux wechselt man mit "cd" in das Verzeichnis, in dem SAGE installiert ist, und schreibt den Befehl "./sage". SAGE zeigt daraufhin den Prompt "sage: ". Dies ist ein Weg SAGE zu verwenden. Eine andere Möglichkeit ist, den Befehl "notebook(open_viewer=True)" nach dem SAGE-Prompt zu schreiben. Dies startet (a) den SAGE-Server und lädt mögliche frühere Worksheets und (b) öffnet Firefox (oder öffnet einen neuen Tab, wenn dieser schon läuft), um die SAGE Notebook Webseite anzuzeigen.

Wenn man nach dem SAGE-Prompt "faktor(100)" (Enter) schreibt, gibt SAGE die Primfaktorzerlegung von 100 aus. Gibt man "factor??" (Enter) ein, wird der Quellcode der Funktion factor angegezeigt. Wird Strg-d gedrückt (die "Strg" Taste und das "d" gleichzeitig halten) oder "quit" (Enter) eingegeben, wird SAGE beeendet. Um die gleiche Berechnung im Notebook zu machen, schreibt man "factor(100)" in eine "Zelle" (ein leeres weißes Fenster im Webbrowser) und drückt dann Shift-Enter. SAGE wird die Faktorisierung im Bereich unter der Eingabezelle anzeigen. Um das Notebook zu beenden, muss auf der der Kommandozeile Strg-C eingegeben werden. Wenn dann der Browser beendet wird, ist das SAGE Notebook vollständig geschlossen.

Mehr Beispiele, sowie eine Einführung, finden Sie im Tutorial, das Sie auf der SAGE Webseite finden. Viel Spaß!

SAGE ist ein ständig wachsendes, jedoch schon lange stabiles System. Es gibt ein SAGE Diskussionsforum, einen Bug-Tracker sowie eine Feature Request Liste. Unter folgenden Websites kann man SAGE erreichen

 http://sage.scipy.org/ 

oder 

 http://sage.math.washington.edu/sage/

oder 

 http://echidna.maths.usyd.edu.au/sage/ 

Für mehr Informationen können Sie sich an William Stein ( wstein@gmail.com ) gewendet werden. Viel Spass mit SAGE.

David Joyner wdjoyner@gmail.com 

William Stein wstein@gmail.com
