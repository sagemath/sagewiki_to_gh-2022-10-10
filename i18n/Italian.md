
[[_TOC_ 2]] 
# SAGE Italian Translation

This page is intended as a coordination page for the Italian translation of Sage documentation.  
 [IT] Questa pagina è volta al coordinamento per la traduzione della documentazione di **Sagemath** in Italiano. 

Following paragraphs are in Italian language only :) 


# Partecipanti

Di seguito viene costruita una lista degli utenti interessati a contribuire alla traduzione della documentazione di **Sagemath** in Italiano. Per poter aggiungere il proprio nome è necessario creare un account nel Wi``Ki di **Sagemath**. 

* <a href="/MarcoRofei">MarcoRofei</a> 
* ~~<a href="/CristianConsonni">CristianConsonni</a> AKA <a href="/CristianCantoro">CristianCantoro</a>~~ 
* ~~<a href="/MatteoCasati">MatteoCasati</a> AKA Cassa~~ 
* ~~<a href="/AlessandroPezzoni">AlessandroPezzoni</a>~~ 
* ~~<a href="/RobertoPanai">RobertoPanai</a>~~ 
* dberti 
Gli utenti barrati hanno partecipato all'iniziativa in passato ma non sono più coinvolti attivamente. 


<div>
**Per chi fosse interessato a partecipare.** 

Siete invitati a spedire una e-mail all'utente <a href="/MarcoRofei">MarcoRofei</a> per avere indicazioni su come e da dove iniziare. 
</div>

# Traduzioni / Translations

Qui verranno man mano aggiunte le traduzione portate a compimento. I file tradotti sono relativi all'archivio `sage-4.7.tar`. 

* [EN] Here we will paste all translated files included in **Sagemath** vers. `4.7`. 

## a_tour_of_sage

      * **Lista dei files** / **Files list** |||||
 (./) Tradotto / Translated  /!\ Da revisionare / to revise  {X} Non tradotto / Not yet translated|||||
Stato | _Nome del File_ / _File name_  | Traduttore / Translator | Editore / Editor  | Traduzione / Translation
 (./)  | index.rst  | <a href="/MarcoRofei">MarcoRofei</a> | <a href="/MarcoRofei">MarcoRofei</a>  | <a href="/i18n/Italian/a_tour_of_sage/index">i18n/Italian/a_tour_of_sage/index</a>



---

 
# Old


## ToDo - Lista delle cose da fare


### Questions? Ideas? Proposals?

If you have any question or idea about this project, or about the way we should make the translation, please put a message in the **"Questions and Discussion"** section at the bottom of this page. You can write either in english or italian. Please, put long discussions on dedicated subpages. 

If you have suggestion about the translation/revision of specific files, please, put your comments on the page where the translation/revision file is attached . 

Below this line you can write either in english or italian. 



---

 
#### Tutorial

I file tradotti verrano nominati nel seguente modo filename.rst => filename_it.rst. I file saranno inseriti come "Allegati" in una nuova pagina collegata alla casella corrispondente della tabella. Per favore, non fare copia-incolla del testo visualizzato nella pagina o del codice sorgente del medesimo (ci possono essere delle differenze inserite per adattare la pagina alla sintassi di <a href="/MoinMoin">MoinMoin</a>), usare il file allegato. 

Here there is a list of the .rst to be tanslated: 
**File list** |||
_file name_  |  _translated_  |  _reviewed_ 
tour.rst  |   |  
tour_rings.rst  |   |  
tour_polynomial.rst  |   |  
tour_plotting.rst  |   |  
tour_numtheory.rst  |   |  
tour_linalg.rst  |   |  
tour_help.rst  |   |  
tour_groups.rst  |   |  
tour_assignment.rst  |   |  
tour_algebra.rst  |  <a href="/i18n/Italian/tour_algebrait">done</a>  |  
tour_advanced.rst  |   |  
programming.rst  |   |  
introduction.rst  |  <a href="/i18n/Italian/IntroductionIt">done</a>  |  
interfaces.rst  |   |  
interactive_shell.rst  |   |  
index.rst  |  <a href="/i18n/Italian/IndexIt">done</a>  |  <bgcolor="#8080ff">[reviewed] 
distributed.rst  |   |  
conf.py  |   |  
bibliography.rst  |   |  
appendix.rst  |   |  
afterword.rst  |   |  


## Some conventions (it)

LISTA DI CONVENZIONI E BREVE GLOSSARIO PER LA TRADUZIONE ITALIANA DEL TUTORIAL DI SAGE. Conventions list and short glossary for Sage tutorial italian translation. 

Di seguito riportiamo una lista della convenzioni che verranno adottate per la traduzione italiana del tutorial di SAGE, lo scopo di questa lista è di uniformare il più possibile le traduzioni della documentazione compiute da diverse traduttori. Per ogni questione non definita nel seguente documento si raccomanda di attenersi ai suggerimenti proposti nei seguenti siti: 

* <a href="/%5Bhttp%3A//digilander.libero.it/elleuca/linee-guida/linee-guida.xhtml">[http://digilander.libero.it/elleuca/linee-guida/linee-guida.xhtml</a>] 
* <a href="/%5Bhttp%3A//tp.linux.it/buona_traduzione.html">[http://tp.linux.it/buona_traduzione.html</a>] 
* Ulteriori suggerimenti possono essere trovati facendo riferimento alla pagina del <a href="/%5Bhttp%3A//wiki.ubuntu-it.org/GruppoTraduzione/Strumenti">[http://wiki.ubuntu-it.org/GruppoTraduzione/Strumenti</a>] 
Nota: Ovviamente l'introduzione di nuovi termini in questa lista è gradita. 


### Convenzioni di traduzione

Conformemente all'uso italiano, nella traduzione del tutorial di Sage verrà utilizzata la forma impersonale. 

Verranno marcati i collegamenti ipertestuali contenuti nel test con la seguente notazione: 

* (en) - per collegamenti in lingua inglese 
* (fr) - per collegamenti in lingua francese 
* (de) - per collegamenti in lingua tedesca 
* (es) - per collegamenti in lingua spagnola 
* ... 

### Convenzioni sui collegamenti ipertestuali e sulla sintassi dei file rst

Nel tradurre i file rst bisgona porre la massima attenzione, soprattutto da parte dei revisori, al fatto che la formattazione originale dei file .rst venga mantenuta. In particolare bisogna fare attenzione a tutti gli elementi caratteristici della formattazione dei file rst (un brevissimo elenco <a class="http" href="http://it.wikipedia.org/wiki/ReStructuredText">qui</a>), in particolare: 

* intestazioni 
* uso particolare degli spazi 
* elenchi puntati e numerati 
e alla presenza di sintassi specifiche, (per esempio, collegamenti ipertestuali e riferimenti ad altre parti del tutorial stesso). Dovranno essere tradotti tutti i collegamenti che si riferiscono a parti del tutorial stesso (sintassi **:ref:**) in quanto rimandano a parti del testo che verranno tradotte nel seguito.  I collegamenti esterni al tutorial (siti esterni, documentazione di Sage, reference manual, ecc.) per i quali non è ancora stato avviato un progetto di traduzione vanno lasciati invariati. 


### Glossario

(per favore, cercare di mettere i termine in ordine alfabetico) 
 en  |  it 
 Computer Algebra System (CAS)  |  Sistema di algebra computazionale (CAS) 
 to (double) click  |  fare (doppio) clic 
 how-to  |  how to 
 online  |  on line, in linea 


## Domande e discussione - Questions and Discussion
