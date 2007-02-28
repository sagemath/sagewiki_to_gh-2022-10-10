== Eine kurze Einleitung in SAGE: Software für Algebra und Geometrie Experimente ==

["SAGE"] ist eine mathematische Software für die Zahlentheorie, sowie Algebra- und Geometrieberechnungen. Die Implementierung geht im wesentlichen auf William Stein und weitere 30 anderen Mitwirkende aus der ganzen Welt zurück. SAGE ist freie Software und verfügbar unter den Bedingungen der GNU General Public License (GPL). SAGE ist 

 * eine Distribution freier Mathematiksoftware, die von gewöhnlichen Sterblichen aus den Quellen übersetzt werden kann, 
 * Eine neue Pythonlibrary für mathematische Berechnungen mit einer graphischen und einer zeilenbasierten Schnittstelle sowie
 * Eine Schnittstelle zu bestehenden Computer Algebra Systemen.

SAGE wird in Python, C++ und C (über ["Pyrex"]) geschrieben. Python ist eine quelloffene, objektorientierte, interpretierte Sprache, mit vielen Bibliotheken z.B. für numerische Mathematik, die für SAGE Benutzer ebenfalls zugänglich sind. Python kann ebenso als Library von C/C++ Programmen verwendet werden.

SAGE beinhaltet einige wichtige Open-Source Bibliotheken und bietet eine vereinheitlichte Schnittstelle zu ihnen an: ["Singluar"] (für kommutative Algebra), ["GAP"] (für Gruppentheorie), John Cremona's ["MWRANK"] Bibliothek (für elliptische Kurven), die ["PARI"] Bibliothek für Zahlentheorie, Shoup's Zahlentheorie Bibliothek ["NTL"] und ["Maxima"] (für symbolische Berechnungen). SAGE bietet ebenso Schnittstellen zu vielen kommerziellen, propritären oder anderen quelloffenen mathematischen Softwarepaketen an, wie MAPLE, MATLAB, Mathematica, KASH/KANT, MAGMA, Axiom sowie viele anderen. Zur Darstellung von Graphiken nutzt SAGE [:matplotlib:Matplotlib] (für 2D und 3D Graphiken) sowie [:Tachyon_ray_tracer:Tachyon] (ein 3D Renderer).

Die langfristigen Hauptziele und Prinzipien von SAGE sind:

 * Open-Source: Der Quellcode muss frei vorhanden und einsehbar sein, so dass jeder Benutzer verstehen kann, was das System wirklich tut sowie die Möglichkeit hat, das System zu verändern. So wie Mathematiker ein tieferes Verständnis eines Theorems erlangen, indem sie einen Beweis sorgfältig lesen oder zumindest überfliegen, sollten Programmbenutzer verstehen können, wie Berechnungen zustande kommen, indem sie die kommentierten Quellen lesen. Alle Software die im Kern von SAGE mit SAGE verbreitet wird, muss freie Software sein, und willkürliche Änderungen sowie die Weiterverbreitung jeder einzelnen Zeile muss erlaubt sein.

 * Ein gutes Programmierumfeld: SAGE soll eine stabile Umgebung für neue mathematische Softwareprojekte bieten. SAGE ist ein Software Entwicklungsmodell für die mathematische Gemeinschaft mit einer starken Betonung auf Offenheit und Zusammenarbeit.

 * Erweiterbar: Die Möglichkeit neue Datentypen zu entwerfen, von bestehenden Datentypen zu erben und Code, der in der jeweiligen Lieblingssprache geschrieben ist (z.B. C/C++), zum Teil des Systems machen zu können. 

 * Benutzerfreundlich: Es wird gehofft, Nutzern ein hohes Maß an Unterstützung anbieten zu können.

 * Einfach zu kompilieren: SAGE soll verhältnismäßig einfach aus den Quellen - unter Linux, Mac OSX und MS Windows - übersetzbar sein. Dieses bietet mehr Flexibilität, wenn das System verändert werden soll.

 * Plattformübergreifend: SAGE läuft unter Linux, Mac OS X und Windows. 

 * Komplett: Das Angebot von genügend Algorithmen, um wirklich nützlich zu sein, sowie die Vereinheitlichung bestehender wichtiger quelloffener mathematischer Programme. SAGE soll ein vollständiges und qualitativ hochwertiges Mainstream Computer Algebra System sein.

 * Effizient: SAGE soll sehr schnell sein - vergleichbar mit oder schneller als alles andere. Dies ist sehr schwierig, da viele Systeme keine offenen Quellen bieten, Algorithmen manchmal nicht veröffentlicht sind und das Finden schneller Algorithmen häufig extrem schwierig (Jahre der Arbeit, Doktorarbeiten, Glück, etc.) ist.

 * Werkzeuge: SAGE soll eine robuste Schnittstelle zu einigem der Funktionalität von PARI, GAP, GMP, Maxima, Singular, MWRANK und NTL zur Verfügung stellen. Diese stehen alle unter der GPL und SAGE liefert a vereinheitlichte Schnittstelle für sie an. 

 * Dokumentation: Handbuch, Tutorial, API-Referenz mit Beispielen für jede Funktion sowie ein umfangreiches "wie kann ... in SAGE konstruiert werden?" Dokument.

SAGE, eine Installationsanleitung und das Tutorial können von der SAGE Webseite unter http://sage.scipy.org/ heruntergeladen werden.

Obgleich SAGE Python, PARI und andere Pakete verwendet, sei darauf hingewiesen, dass es nicht notwendig ist, diese Software auf dem eigenen Computer vorinstalliert zu haben. Der Installationsprozess von SAGE ist mit dem Ziel entworfen worden, verhältnismäßig schmerzlos sein. Dennoch, sollte es Probleme geben, können Fragen an die SAGE Entwickler gestellt werden (au der Webseite befinden sich Links auf die Mailingliste für den SAGE Support). Eine Installationsanleitung ist unter http://sage.scipy.org/sage/doc/html/inst/index.html zu finden. Außerdem, sobald SAGE einmal installiert ist, ist ein Upgrade zur jeweils neuesten Version besonders einfach mit dem "upgrade" Befehl möglich. 

Sobald SAGE in ein Verzeichnis wie z.B. sage-x.y.z installiert ist: Unter Linux "cd" in dieses Verzeichnis und schreibe den Befehl "./sage" um SAGE zu starten. SAGE zeigt daraufhin den Prompt "sage: ". Dies ist ein Weg SAGE zu verwenden.. Eine andere Möglichkeit ist, in  den Befehl "notebook(open_viewer=True)" auf der SAGE Eingabeaufforderung zu schreiben. Dies startet (a) den SAGE Server und lädt mögliche frühere Worksheets und (b) öffnet Firefox (oder öffnet einen neuen Tab, wenn dieser schon läuft) um die SAGE Notebook Webseite anzuzeigen.

Wenn man auf der SAGE Eingabeaufforderung "faktor(100)" (Enter) schreibt, gibt SAGE die Primfaktorzerlegung von 100 aus. Gibt man "factor??" (Enter) ein, wird der Quellcode der Funktion factor angegezeigt. Wird Strg-d gedrückt (die "Strg" Taste und das "d" gleichzeitig halten) oder "quit" (Enter) eigegeben, wird SAGE beeendet. Um die gleiche Berechnung im Notebook zu machen, schreibt man "factor(100)" in eine "Zelle" (ein leeres weißes Fenster im Webbrowser) und drückt dann Shift-Enter.. SAGE wird die Faktorisierung im Bereich unter der Eingabezelle anzeigen. Um das Notebook zu beenden, muss auf der der Kommandozeile Strg-C eingegeben werden. Wenn dann der Browser beendet wird, ist das SAGE Notebook vollständig geschlosse

Mehr Beispiele, sowie eine Einführung, finden Sie im Tutorial, das Sie auf der SAGE Webseite finden. Viel Spass!

SAGE ist stark am wachsen, jedoch bereits jetzt verwendbar. Es gibt ein SAGE Diskussionsforum, einen Bug-Tracker sowie eine Feature Request Liste. Unter folgenden Websites kann man SAGE erreichen

 http://sage.scipy.org/ 

oder 

 http://sage.math.washington.edu/sage/

oder 

 http://echidna.maths.usyd.edu.au/sage/ 

. Für mehr Informationen kann sich an William Stein ( wstein@gmail.com ) gewendet werden. Viel Spass mit SAGE.

David Joyner wdjoyner@gmail.com 

William Stein wstein@gmail.com
