

## Una breve introduzione a SAGE

Sage è un software matematico per la teoria dei numeri, l'algebra e la geometria. La sua implementazione è dovuta a <a href="/William_Stein">William_Stein</a> e ad oltre 180 collaboratori <a class="http" href="http://www.sagemath.org/development-map.html">da tutto il mondo</a>. E' open source ed è liberamente fruibile con licenza GNU General Pubblic License (GPL). Sage è: 

* Una distribuzione unificata dei software matematici liberi che i comuni mortali possono compilare da sorgente; 

* Una nuova libreria Python per il calcolo matematico con interfaccia grafica e da riga di comando; e 

* Un'interfaccia con gli altri software matematici esistenti.  

E' scritto in <a href="/Python">Python</a>, C++, e C (attraverso <a href="/Pyrex%22%20/%20%22Cython">Pyrex" / "Cython</a> <a href="http://www.cython.org/">http://www.cython.org/</a>). Python è un linguaggio ad alto livello orientato agli oggetti open source, con un gran numero di librerie, per esempio per l'analisi numerica, che sono disponibili agli utenti di Sage. Python può anche essere utilizzato come libreria da programmi in C/C++. 

Sage offre una interfaccia unificata a diverse importanti librerie open source, compreso <a href="/Singular">SINGULAR</a> (algebra commutativa), <a href="/scipy">SciPy</a> (matematica applicata), <a href="/GAP">GAP</a> (teoria dei gruppi), la libreria <a href="/MWRANK">MWRANK</a> di John Cremona (curve ellittiche), la libreria <a href="/PARI">PARI</a> per la teoria dei numeri, <a href="/linbox">LinBox</a> (algebra lineare), la libreria <a href="/NTL">NTL</a> per la teoria dei numeri di Victor Shoup, e <a href="/Maxima">Maxima</a> (manipolazione simbolica). Sono presenti anche le interfacce a numerosi software matematici commerciali o closed source compresi Maple, MATLAB, Mathematica, KASH/KANT, MAGMA, Axiom, e molti altri. Per i grafici, Sage include Matplotlib (per grafici 2-D e alcuni grafici 3-D), jmol (grafici 3-D) e tachyon (ray tracer 3-D). 

I principali vantaggi e i principi guida di Sage sono: 

* Libero e open source: Il codice e' liberamente disponibile e consultabile, così gli utenti possono capire che cosa il sistema sta effettivamente facendo e possono migliorarlo più' facilmente. Proprio come i matematici possono acquisire una più profonda comprensione di un teorema leggendone con attenzione la dimostrazione, le persone che fanno uso del software matematico dovrebbero essere in grado di capire come funziona il calcolo attraverso la lettura del codice sorgente documentato. Tutti i software inclusi nel nucleo di Sage devono essere liberi, open source, e liberamente modificabili e redistribuibili in ogni singola riga. 

* Un buon ambiente di programmazione: La speranza è che Sage arrivi ad essere un ambiente stabile per iniziare a programmare nuovi pacchetti. Sage fornisce un modello per la comunità matematica dello sviluppo software con una forte enfasi sull'apertura, comunità, cooperazione e collaborazione. 

* Ampliabile: Essere in grado di definire nuove funzioni o derivarle da quelle built-in, e rendere il codice scritto nel proprio linguaggio preferito (tra cui C / C + +) parte del sistema. 

* Usabilità: La speranza è di raggiungere un elevato livello di supporto agli utenti. 

* Semplicità di compilazione: Sage dovrebbe essere relativamente semplice da compilare da sorgente per utenti di Linux e Mac OS X. Questo comporta una maggior flessibilità nel modificare il sistema. 

* Multipiattaforma: Sage gira su Linux, Mac OS X, Windows. 

* Completo: implementa un buon numero di algoritmi in modo da essere davvero utilizzabile. Unifica i software matematici liberi e open source.  

*  Efficente: Essere davvero veloce/comparabile o più veloce di qualsiasi altro sistema disponibile. Questo è veramente difficile, poichè molti sistemi sono chiusi, gli algoritmi talvolta non sono pubblicati, e trovare algoritmi veloci è spesso estremamente difficile (anni di lavoro, tesi di dottorato, fortuna, etc.). 

* Tools: Fornire una robusta interfaccia ad alcune delle funzionalità di PARI, GAP, GMP, Maxima, SINGULAR, MWRANK, e NTL. Questi sono tutti sotto licenza GPL e Sage fornisce una interfaccia unificata. 

* Ampia documentazione: Manuali di riferimento, Tutorial, API reference con esempi per ogni funzione, e un ampio "How can ... be constructed in Sage?". 

Scarica adesso Sage, una guida per l'installazione e un tutorial, dalla seguente pagina web: 

<a class="http" href="http://www.sagemath.org">http://www.sagemath.org</a>. 

Nonostante Sage usi Python, PARI e altri pacchetti, ricordate che non è necessario averli preinstallati nel vostro computer. L'installazione di Sage è studiata per essere relativamente semplice, nel caso ci fossero dei problemi, chiedete pure (in fondo ci sono i link delle mail per il supporto). Trovate le istruzioni per l'installazione all'indirizzo <a class="http" href="http://www.sagemath.org/doc/html/inst/index.html">http://www.sagemath.org/doc/html/inst/index.html</a>. Inoltre, una volta installato Sage, fare l'upgrade all'ultima versione disponibile è particolarmente semplice grazie al comando "upgrade". 

Una volta installato Sage in una cartella tipo "`sage-x.y.z`" in Linux, entrate nella cartella stessa e digitate il comando "`./sage`" per avviare Sage. Un altro modo per utilizzare Sage si ha digitando "`notebook()`" nel prompt di Sage. Questo vi permetterà di utilizzare una comoda interfaccia grafica direttamente sul vostro browser preferito. 

Digitando "`factor(100)`" nel prompt di Sage vi verrà restituita la fattorizzazione prima di 100. Se volete conoscere il codice sorgente del comando basterà digitare "`factor??`". La combinatzione di tasti CTRL+D e i comandi "`quit`" o "`exit`" vi permetteranno di uscire dal programma. Puoi svolgere le stesse operazioni in un notebook sul tuo browser preferito. Una volta scritto il comando basta cliccare sul tasto "Evaluate" che si trova in basso a sinistra oppure con la combiazione di tasti SHIFT+ENTER. 

Puoi anche provare Sage online, previa registrazione, sul sito <a class="http" href="http://www.sagenb.org/">http://www.sagenb.org/</a> oppure sfogliare i notebook pubblicati su <a class="http" href="http://www.sagenb.org/pub">http://www.sagenb.org/pub</a>. 

Sono presenti migliaia di ulteriori esempi nei tutorial e nei manuali disponibili nella pagina web <a class="http" href="http://www.sagemath.org">http://www.sagemath.org</a>. Dategli uno sguardo. 

Sage è in fase di forte crescita, ed è gia ampiamente utilizzabile. Troverai diverse discussioni su Sage nei seguenti siti <a class="http" href="http://trac.sagemath.org/sage_trac">bug-tracker</a>, <a class="http" href="http://wiki.sagemath.org">wiki</a>, e <a class="http" href="http://www.sagemath.org/hg/sage-main?cmd=manifest;manifest=-1;path=/sage/">code browser</a>. 

Per qualsiasi altra informazione o dubbio visita: <a class="http" href="http://www.sagemath.org/help-groups.html">http://www.sagemath.org/help-groups.html</a>. 

Se vuoi puoi seguire gli ultimi aggiornamenti su <a class="http" href="http://twitter.com/sagemath">Twitter</a> o <a class="http" href="http://www.facebook.com/pages/Sage-Math/26593144945">Facebook</a>. 

Ma sopratutto, divertiti con Sage! 



---

 

David Joyner <a href="mailto:wdjoyner@gmail.com">wdjoyner@gmail.com</a> 

William Stein <a href="mailto:wstein@gmail.com">wstein@gmail.com</a> 

Ultimo aggiornamento 16-10-2010. 
