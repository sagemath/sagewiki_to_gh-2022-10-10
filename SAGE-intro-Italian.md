== Introduzione corta a SAGE: Software per esperimento della geometria e di algebra ==

La SAGE è una struttura per la teoria di numero, l'algebra ed il calcolo della geometria. L'esecuzione corrente è soprattutto dovuto William Stein. È fonte aperta e liberamente disponibile sotto i termini dell'autorizzazione del grande pubblico di GNU (GPL). 

La SAGE è una biblioteca del Python con un interpretatore su misura. È scritto in Python, in C++ ed in C (via Pyrex). Il Python è una fonte aperta orientata oggettivamente ha interpretato la lingua, con tantissime biblioteche, per esempio, per analisi numerica, che sono a disposizione di gli utenti di SAGE. Il Python può anche essere raggiunto nel modo delle biblioteche dai programmi di C/C++. 

La SAGE fornirà un'interfaccia unificata a parecchie biblioteche di fonte aperte importanti, compreso il SINGOLARE (per algebra commutativa) e GAP (per la teoria del gruppo), alla biblioteca di MWRANK del John Cremona (per le curve ellittiche), alla biblioteca di PARI per la biblioteca NTL, massimi di teoria di teoria di numero e di numero dello Shoup (per manipolazione simbolica). Ci sono inoltre interfacce a molta fonte commerciale o chiusa CAS come l'acero, KASH/KANT, MAGMA, Mathematica, l'assioma e molti altri. Per i grafici, la SAGE include Matplotlib (per 2 d e circa grafici di 3 d) e il tachyon (un elemento tracciante del raggio di 3 d). 

Il disegno di SAGE è pesante dal con attenzione ha pensato fuori e struttura di codice categoria matura del MAGMA chiuso di programma di algebra del calcolatore di fonte. Tuttavia, la SAGE non è significata per essere un clone di MAGMA ed altri pacchetti (quali GAP e Mathematica) inoltre hanno svolto un ruolo influencial.

Gli obiettivi di lunga durata principali ed i principi informatori per SAGE:

 * Liberare ed aprire la fonte: Il codice sorgente deve essere liberamente disponibile e leggibile, in modo da gli utenti possono capire che cosa il sistema realmente sta facendo ed estenderli più facilmente. Appena poichè i matematici guadagnano una comprensione più profonda di un teorema con attenzione leggendo o almeno scremando la prova, la gente che fa i calcoli dovrebbe potere capire come i calcoli funzionano dal codice sorgente documentato leggente. Tutto il software incluso nella distribuzione PRUDENTE di nucleo deve essere fonte libera ed aperta e le modifiche e la ridistribuzione arbitrarie di ogni a linea singola devono essere permesse.

 * Buon ambiente di programmazione: Si spera che la SAGE formi un ambiente stabile per cominciare a programmare i nuovi progetti matematici del software. Dovremmo fornire un modello per la Comunità matematica di sviluppo del software un'enfasi forte su apertura, la Comunità, la cooperazione e la collaborazione.

 * Estendibile: Potere definire i nuovi tipi di dati o derivare dai tipi incorporati e fare il codice scritto in una parte favorita di lingua (C/C++ compreso) del sistema.

 * Facile da usare: La speranza è finalmente di raggiungere un ad alto livello dell'assistenza agli utilizzatori. (“La lista del email della tribuna di GAP„ è un esempio ideale del supporto che si spera che la SAGE possa raggiungere.)

 * Facile compilare: La SAGE dovrebbe essere relativamente facile da compilare dalla fonte per Linux e gli utenti di OS X. Ciò fornisce più flessibilità nella modificazione del sistema.

 * Traversa-piattaforma: La SAGE funziona sotto Linux, OS X, Windows (cygwin e colinux binari).

 * Completo: Effettuare abbastanza procedure per essere realmente utile. Unificare liberamente il software aperto di matematica di fonte. Essere un sistema di software libero di matematica di fonte aperta tradizionale completa di alta qualità.

 * Efficiente: Essere molto velocemente---paragonabile a o più velocemente di niente altro disponibili. Ciò è molto difficile, poiché molti sistemi sono fonte chiusa, procedure a volte non è pubblicata e trovare le procedure veloci è spesso estremamente difficile (anni di lavoro, delle tesi di Ph.D., della fortuna, ecc.).

 * Attrezzi: Fornire le interfacce robuste ad alcuna della funzionalità di PARI, di GAP, di GMP, dei massimi, del SINGOLARE, di MWRANK e di NTL. Questi sono tutti sono GPL'd e la SAGE fornisce (o fornirà) un'interfaccia unificata per usando.

 * Ben documentato: Manuale di riferimento, lezione privata, riferimento di api con gli esempi per ogni funzione e un vasto ``come può… essere costruito in SAGE? “documento.

Trasferire la SAGE, una guida dell'installazione e una lezione privata dal sistema centrale verso i satelliti, dal relativo Web page 

http://sage.scipy.org/. 

Anche se la SAGE usa il Python e PARI ed altri pacchetti, tenere presente che non è necessario avere questo software preinstallato sul calcolatore. L'installazione di SAGE realmente è destinata per essere relativamente non dolorosa, ma se ci sono dei problemi, prego chiede (il Web page ha collegamenti alle liste del email per supporto PRUDENTE). Ci sono istruzioni di installazione a http://sage.scipy.org/sage/doc/html/inst/index.html. Inoltre, se la SAGE è installata una volta, aggiornare alla più nuova versione è particolarmente facile con l'opzione di ordine “di aggiornamento„ (questo è descritto sul Web site dato sopra e che presuppone che il wget sia installato e un collegamento del Internet). 

Una volta che la SAGE è installata in un indice quale sage-x.y.z, ci sarà un subdirectory chiamato “scomparto„. In Linux, il Cd a questo subdirectory “dello scomparto„ e scrive il `a macchina di ordine '' di "./sage" per iniziare SAGE e visualizzare “la salvia rapida PRUDENTE: „. Ciò è unidirezionale usare la SAGE. Un altro senso è dopo scrivere “notebook(open_viewer=True)„ al richiamo PRUDENTE, che 
(a) inizia il funzionamento PRUDENTE dell'assistente (che carica il foglio di lavoro precedentemente usato, se c'è ne) e 
(b) apre il browser del firefox (o gli inizio una nuova linguetta se è già aperta) e visualizza il Web page PRUDENTE del taccuino. 

Al richiamo PRUDENTE, il tipo “il fattore (100)„ (ritorno di colpo) ed allora fornisce Ctrl-d (tenere il ket di Ctrl e la d allo stesso tempo) o fattore (di ritorno) “rinunciato„ 100 di volontà della SAGE il primo ed allora rimuove. Per fare questo nel taccuino, fornire “il fattore (100)„ “in una cellula„ (una finestra bianca vuota nel browser di WWW) ed allora entrare spost-entrano. La SAGE visualizzerà la scomposizione in fattori nello spazio appena sotto la cellula. Rimuovere, la versione del taccuino di SAGE, in primo luogo va di nuovo alla linea di ordine ed entra in Ctrl-c. Dopo, rimuovere il browser. Ciò rinuncia il taccuino della SAGE. 

Ci sono più esempi, nella lezione privata, costruzioni e manuali di riferimento, disponibili sul Web page PRUDENTE. Provarli prego fuori! 

La SAGE è in una fase iniziale di sviluppo, ma attivamente sta sviluppandosi ed è già utilizzabile. Ci è un bordo di discussione, un insetto-inseguitore e una lista PRUDENTI di desiderio. Prego chiamata 

http://sage.scipy.org/ 

o 

http://sage.math.washington.edu/sage/ 

o 

http://echidna.maths.usyd.edu.au/sage/ 

o 

email William Stein a wstein@gmail.com 

per le più informazioni. Soprattutto, avere divertimento con SAGE!

David Joyner
wdjoyner@gmail.com

William Stein
wstein@gmail.com

Ultimo 11-19-2006 aggiornato.
