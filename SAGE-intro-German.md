== Eine kurze Einleitung in SAGE: Software für Algebra und Geometrie Experimente ==

SAGE ist eine mathematische Software für die Zahlentheorie, sowie Algebra- und Geometrieberechnungen. Die Implementierung geht im wesentlichen auf an William Stein und weitere 30 anderen Mitwirkende aus der ganzen Welt zurück. SAGE ist freie Software und verfügbar unter den Bedingungen der GNU General Public Lizens (GPL). SAGE ist 

 * eine Distribution freier Mathematiksoftware, die von gewöhnlichen Sterblichen aus den Quellen übersetzt werden, 
 * Eine neue Pythonbibliothek für mathematische Berechnungen mit einer graphischen und einer zeilenbasierten Schnittstelle sowie
 * Eine Schnittstelle zu bestehenden Computer Algebra Systemen.

SAGE wird in Python, C++ und C (über Pyrex) geschrieben. Python ist eine Open-Source, objektorientierte, intepretierte Sprache, mit viele Bibliotheken z.B. für numerische Mathematik, die für SAGE Benutzer ebenfalls zugänglich sind. Python kann auch als Bibliothek von C/C++ Programmen verwendet werden. 

SAGE beinhaltet einige wichtige Open-Source Bibliotheken und bietet einen vereinheitlichte Schnittstelle zu ihnen an: Singular (für kommutative Algebra), GAP (für Gruppentheorie), John Cremona's MWRANK Bibliothek (für elliptische Kurven), die PARI Bibliothek für Zahlentheorie, Shoup's Zahlentheorie Bibliothek NTL und Maxima (für symbolische Berechnungen). SAGE bietet ebenso Schnittstellen zu vielen kommerziellen, propritären oder anderen quelloffenen mathematischen Softwarepaketen an, wie MAPLE, MATLAB, Mathematica, KASH/KANT, MAGMA, Axiom und viele anderen. Zur Darstellung von Graphiken nutzt SAGE Matplotlib (für 2D und 3D Graphiken) sowie Tachyon (ein 3D Renderer).

Die langfristigen Hauptziele und Prinzipien von SAGE sind:

 * Open-Source: Der Quellecode muß frei vorhanden und lesbar sein, so dass jeder Benutzer verstehen kann, was das System wirklich tut sowie das System verändern kann. Genau wie Mathematiker ein tieferes Verständnis eines Theorems erlangen indem sie einen Beweis sorgfältig lesen oder zumindest überfliegen, sollte Programmbenutzer verstehen können, wie die Berechnungen zustande kommen, indem sie die kommentierten Quellen lesen. Alle Software die im Kern von SAGE mit SAGE verbreitet wird, muss freie Software sein, und willkürliche Änderungen sowie die Wiederverteilung jeder einzelnen Zeile muss erlaubt sein.

 * Ein gutes Programmierumfeld: Es wird gehofft dieser SALBEI bildet ein beständiges Klima zu anfangen, neue mathematische Software zu programmieren Projekte. SALBEI stellt ein Modell für zur Verfügung mathematische Gemeinschaft von Software Entwicklung mit einem starken Hauptgewicht an Offenheit, Gemeinschaft, Mitarbeit und Zusammenarbeit. 

 * Erweiterbar: Definieren neue Daten Arten oder leiten von eingebauten Arten ab und den Code bilden, der in eine Lieblingssprache geschrieben wird (einschließlich C/C++) Teil des Systems. 
 * Benutzerfreundlich: Die Hoffnung ist zu schließlich ein hochqualifiziertes der Benutzerunterstützung erreichen. 

 * Einfach zu kompilieren: SALBEI sollte verhältnismäßig sein einfach, von der Quelle für Linux, OS zu kompilieren X und MS Windows Benutzer. Dieses liefert mehr Flexibilität, wenn das System geändert wird. 

 * Plattformübergreifend: SALBEI-Durchläufe unter Linux, OS X, Windows. Komplett: Genügende Algorithmen einführen wirklich nützlich sein. Geöffnete Quelle frei vereinheitlichen Mathematik-Software. Ein komplettes sein Hauptströmungsqualität geöffnete Quelle frei Mathematik-Software-System. 

 * Effizient: Sehr schnell sein---vergleichbar mit oder schneller als noch etwas vorhanden. Dieses ist sehr schwierig, da viele Systeme sind geschlossene Quelle, Algorithmen sind manchmal nicht veröffentlicht und schnelle Algorithmen zu finden ist häufig extrem schwierig (Jahre der Arbeit, Ph.D. Thesen, Glück, etc.).   

 * Werkzeuge: Robuste Schnittstellen zu einigem von zur Verfügung stellen die Funktionalität von PARI, GAP, GMP, Maxima, EIGENHEIT, MWRANK und NTL. Diese sind alle sind GPL'd und SALBEI liefert a vereinheitlichte Schnittstelle für das Verwenden sie. 
 * Gut dokumentiert: Handbuch, Tutorial, API Hinweis mit Beispielen für jede Funktion und ein umfangreiches „wie kann… im SALBEI konstruiert werden? „Dokument. 

SAGE, einen Installation Führer und a downloaden Tutorial, von seiner Webseite http://sage.scipy.org/. 

Obgleich SAGE Pythonschlange und PARI verwendet und andere Pakete, halten im Verstand, daß er nicht ist notwendig, diese Software zu haben preinstalled auf dem Computer. Installation des SAGE ist wirklich zu entworfen verhältnismäßig schmerzlos sein, aber, wenn es gibt alle mögliche Probleme, bitten bitte (die Webseite hat Verbindungen zu den email Listen für SAGE Unterstützung). Es gibt Montagevorschriften an http://sage.scipy.org/sage/doc/html/inst/index.html. Außerdem wenn SAGE einmal angebracht wird, die Höhereinstufung zur neuesten Version ist besonders einfach mit dem „Aufsteigen“ Befehl Wahl. 

Sobald SAGE in ein Verzeichnis angebracht wird wie sage-x.y.z. In Linux Cd zu diesem Verzeichnis und schreiben den Befehl „. /sage“ zu SALBEI beginnen und den SALBEI anzeigen Aufforderung „sage: “. Dieses ist Einweg zu verwenden SALBEI. Eine andere Weise ist, in zunächst zu schreiben SAGE „Notizbuch (open_viewer=True)“ an SAGE Aufforderung, der (a) den SALBEI beginnt Bedienerbetrieb (ladendes vorher verwendet Bogen, wenn irgendein) und (b) öffnet firefox Datenbanksuchroutine (oder Anfänge ein neuer Vorsprung wenn es ist bereits) geöffnet und zeigt den SAGE an Notizbuchwebseite. 

An der SAGE Aufforderung „Faktor (100)“ schreiben (Erfolg Rückkehr); SAGE gibt die höchste Vollkommenheit aus Faktorisierung von 100. „Faktor schreiben?? (Rückkehr) und das Quellenprogramm von Funktion Faktor wird gezeigt. Ctrl-d betreten (den Ctrl Schlüssel und das d gleichzeitig halten) oder Art „beendigte“ (Rückhol), und SALBEI wird Ausgang. Diese Berechnung in tun Notizbuch, tragen „Faktor (100)“ in eine „Zelle“ ein (ein leeres weißes Fenster im web browser) und dann betätigen verschieben-eingeben. SALBEI wird die Faktorisierung im Raum gerade anzeigen unterhalb der Zelle. Um das Notizbuch herauszunehmen, gehen zurück zu der Befehl Linie und der Presse Ctrl-c. Zunächst die Datenbanksuchroutine herausnehmen. Dieses beendigt des SAGE Notizbuch. 

Es gibt Tausenden der zusätzlichen Beispiele im Tutorial Aufbauten und Handbücher, die an vorhanden sind die SAGE Webseite. Sie bitte heraus versuchen! 

Aktiv wachsendes SALBEI-IS-IS und ist bereits verwendbar. Es gibt ein SAGE Diskussion Brett, Wanzeverfolger und Wunschliste. Bitte Besuch 
 http://sage.scipy.org/ 
oder 
 http://sage.math.washington.edu/sage/
oder 
 http://echidna.maths.usyd.edu.au/sage/ 
oder 
email William Stein an wstein@gmail.com zu mehr Information. Vor allem Spaß haben mit SALBEI! 

David Joyner wdjoyner@gmail.com 

William Stein wstein@gmail.com
