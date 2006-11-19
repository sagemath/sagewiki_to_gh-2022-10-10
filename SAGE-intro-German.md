== Kurze Einleitung in einen SAGE: Software für Algebra-und Geometrie-Experimentieren ==

SAGE ist ein Rahmen für Zahltheorie, Algebra und Geometrieberechnung. Die gegenwärtige Implementierung liegt an William Stein hauptsächlich. Es ist geöffnete Quelle und frei vorhanden unter den Bezeichnungen der GNU öffentlichkeit Lizenz (GPL). 

SAGE ist eine Pythonschlangebibliothek mit einem kundengebundenen Interpreten. Es wird in Pythonschlange, in C++ und in C geschrieben (über Pyrex). Pythonschlange ist eine geöffnete objektorientierte Quelle deutete Sprache, mit vielen Bibliotheken z.B. für Ziffernwertung, die für Benutzer des SAGES vorhanden sind. Pythonschlange kann im Bibliothekmodus von den C/C++ Programmen auch erreicht werden. 

SAGE stellt eine vereinheitlichte Schnittstelle zu einigen wichtigen geöffneten Quelbibliotheken, einschließlich EIGENHEIT (für auswechselbare Algebra) und GAP (für Gruppe Theorie), zur John Cremonas MWRANK Bibliothek (für elliptische Kurven), zur PARI Bibliothek für Zahltheorie- und Zahltheoriebibliothek NTL, Maxima Shoups zur Verfügung (für symbolische Handhabung). Es gibt auch Schnittstellen zu vieler kommerzieller oder geschlossener Quelle CAS wie Ahornholz, KASH/KANT, MAGMA, Mathematica, Axiom und viele andere. Für Graphiken schließt SAGE Matplotlib (für 2 d und ca. 3 d Graphiken) und tachyon ein (einen 3 d Strahlindikator). 

Das Design des SAGES ist schwer durch dachte sorgfältig heraus und fällige Kategorie Struktur des geschlossenen Kompilierungsanlage-Algebraprogramm MAGMAS. Jedoch wird SAGE nicht bedeutet, um ein Klon des MAGMAS zu sein und andere Pakete (wie GAP und Mathematica) haben auch eine influencial Rolle gespielt.


Die langfristigen hauptsächlichziele und die Führungsprinzipien für SAGE: 

 * Quelle freigeben und öffnen: Das Quellenprogramm muß vorhanden und lesbar frei sein, also können Benutzer verstehen was das System wirklich tut und es leicht verlängern. Gerade da Mathematiker ein tieferes Verständnis eines Theorems gewinnen, indem sie sorgfältig lesen oder mindestens den Beweis gleiten, sollten Leute, die Berechnung tun, verstehen, wie die Berechnungen durch lesendokumentiertes Quellenprogramm arbeiten. Alle Software, die in der SAGE Kernverteilung eingeschlossen ist, muß freie und geöffnete Quelle sein, und willkürliche änderungen und Wiederverteilung von jedem einspurigen müssen erlaubt werden.

 * Gutes Programmierung Klima: Es wird gehofft, daß SAGE ein beständiges Klima bildet, um neue, mathematische Software-Projekte zu programmieren anzufangen. Wir sollten ein Modell für die mathematische Gemeinschaft der Software-Entwicklung mit einem starken Hauptgewicht auf Offenheit versehen, Gemeinschaft, Mitarbeit und Zusammenarbeit.

 * Ausdehnbar: Definieren neue Datenarten oder leiten von eingebauten Arten und bilden den Code ab, der in ein Lieblingssprachen geschrieben wird (einschließlich C/C++) Teil des Systems.

 * Benutzerfreundlich: Die Hoffnung ist, ein hochqualifiziertes der Benutzerunterstützung schließlich zu erreichen. (Die „GAP Forum“ email Liste ist ein ideales Beispiel der Unterstützung, die es gehofft wird, daß SAGE erreichen kann.)

 * Einfach zu kompilieren: SAGE sollte verhältnismäßig einfach sein, von der Quelle für Linux und OS X Benutzer zu kompilieren. Dieses liefert mehr Flexibilität, wenn es das System ändert.

 * Kreuz-Plattform: SAGE läuft unter Linux, OS X, Windows (das cygwin und colinux binär).

 * Komplett: Genügende Algorithmen einführen, um wirklich nützlich zu sein. Geöffnete Quellmathematik-Software frei vereinheitlichen. Ein komplettes Hauptströmungsqualität geöffnetes Quellfreies Mathematik-Software-System sein.

 * Leistungsfähig: Sehr schnell sein---vergleichbar mit oder schneller als noch etwas vorhanden. Dieses ist, da viele Systeme geschlossene Quelle sind, Algorithmen werden manchmal veröffentlicht nicht sehr schwierig, und schnelle Algorithmen zu finden ist häufig extrem schwierig (Jahre der Arbeit, der Ph.D. Thesen, des Glücks, des etc.).

 * Werkzeuge: Robuste Schnittstellen zu etwas von der Funktionalität von PARI, von GAP, von GMP, von Maxima, von EIGENHEIT, von MWRANK und von NTL zur Verfügung stellen. Alle diese sind sind GPL'd und SAGE stellt (oder stellt) zur Verfügung, eine vereinheitlichte Schnittstelle für das Verwenden sie zur Verfügung.

 * Gut dokumentiert: Handbuch, Tutorial, API Hinweis mit Beispielen für jede Funktion und ein umfangreiches ``wie kann… im SAGE konstruiert werden? „Dokument.

SAGE, einen Installation Führer und einen Tutorial, von seiner Webseite downloaden 

http://sage.scipy.org/. 

Obgleich SAGE Pythonschlange und PARI und andere Pakete benutzt, im Verstand halten, daß es nicht notwendig ist, diese Software zu haben, die auf dem Computer preinstalled ist. Die Installation des SAGES ist wirklich entworfen, um verhältnismäßig schmerzlos zu sein, aber, wenn es irgendwelche Probleme gibt, bittet bitte (die Webseite hat Verbindungen zu den email Listen für SAGE Unterstützung). Es gibt Montagevorschriften bei http://sage.scipy.org/sage/doc/html/inst/index.html. Außerdem wenn SAGE einmal angebracht wird, ist die Höhereinstufung zur neuesten Version mit der „Aufsteigen“ Befehl Wahl besonders einfach (dieses wird auf der Web site beschrieben, die oben gegeben wird und annimmt, daß wget und ein Internet-Anschluß angebracht wird). 

Sobald SAGE in ein Verzeichnis wie sage-x.y.z angebracht wird, gibt es ein Unterverzeichnis, das „Sortierfach“ genannt wird. In Linux schreiben Cd zu diesem „Sortierfach“ Unterverzeichnis und das Befehl "./sage", zum des SAGES zu beginnen und des SAGE sofortigen „Salbeis anzuzeigen: “. Dieses ist Einweg, SAGE zu benutzen. Eine andere Weise ist, in SAGE „notebook(open_viewer=True)“ an der SAGE Aufforderung zunächst zu schreiben, die 
(a) beginnt den SAGE Bedienerbetrieb (den vorher benutzten Bogen ladend, wenn irgendein) und 
(b) öffnet die firefox Datenbanksuchroutine (oder die Anfänge ein neuer Vorsprung, wenn er bereits geöffnet ist) und zeigt die SAGE Notizbuchwebseite an. 

An der SAGE Aufforderung tragen Art „factor (100)“ (Erfolg Rückkehr) und dann Ctrl-d (das Ctrl ket und das d gleichzeitig halten) oder „beendigten“ (Rückhol) SAGE-Willensersten Faktor 100 ein und nehmen dann heraus. Um dies im Notizbuch zu tun, „factor (100)“ in eine „Zelle“ eintragen (ein leeres weißes Fenster in der WWW Datenbanksuchroutine) und dann hereinkommen verschieben-eingeben. SAGE zeigt die Faktorisierung im Raum gerade unterhalb der Zelle an. Um herauszunehmen, gehen die Notizbuchversion des SAGES, zuerst zurück zu der Befehl Linie und kommen Ctrl-c. Zunächst die Datenbanksuchroutine herausnehmen. Dieses beendigt Notizbuch des SAGES. 

Es gibt mehr Beispiele, im Tutorial, Aufbauten und die Handbücher, die auf der SAGE Webseite vorhanden sind. Sie bitte heraus versuchen!

SAGE ist in einem frühen Stadium der Entwicklung, aber wächst aktiv, und ist bereits verwendbar. Es gibt ein SAGE Diskussion Brett, einen Wanzeverfolger und eine Wunschliste. Bitte Besuch 

http://sage.scipy.org/ 

oder 

http://sage.math.washington.edu/sage/ 

oder 

http://echidna.maths.usyd.edu.au/sage/ 

oder 

email William Stein an wstein@gmail.com 

zu mehr Information. Vor allem Spaß mit SAGE haben!

----

David Joyner
wdjoyner@gmail.com

William Stein
wstein@gmail.com

Letztes aktualisiertes 11-19-2006
