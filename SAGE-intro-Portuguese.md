

## Introdução curta ao SAGE: Software para a experimentação da álgebra e da geometria

O SAGE é uma estrutura para a teoria do número, a álgebra, e a computação da geometria. A execução atual é primeiramente devido a William Stein. É fonte aberta e livremente disponível sob os termos da licença do general público do GNU (GPL).  

O SAGE é uma biblioteca do Python com um intérprete customized. Escreve-se no Python, no C++, e no C (através de Pyrex). O Python é uma fonte aberta object-oriented interpretou a língua, com um grande número bibliotecas, por exemplo, para a análise numérica, que estão disponíveis aos usuários do SAGE. O Python pode também ser alcançado na modalidade da biblioteca dos programas de C/C++.  

O SAGE fornecerá uma relação unified a diversas bibliotecas de fonte abertas importantes, including o SINGULAR (para a álgebra commutative) e o GAP (para a teoria do grupo), a biblioteca de MWRANK de John Cremona (para curvas elliptic), à biblioteca de PARI para a biblioteca NTL da teoria da teoria do número, e do número de Shoup, máximos (para a manipulação simbólica). Há também umas relações a muita fonte comercial ou closed CAS tais como o bordo, o KASH/KANT, o MAGMA, o Mathematica, o Axiom, e o muito outro. Para gráficos, o SAGE inclui Matplotlib (para 2 d e uns gráficos de 3 d) e tachyon (um tracer do raio de 3 d).  

Os objetivos a longo prazo principais e os princípios guiando para o SAGE:  

* Livrar e abrir a fonte: O código de fonte deve ser livremente disponível e readable, assim que os usuários podem compreender o que o sistema está fazendo realmente e mais fàcilmente estendê-los. Apenas porque os matemáticos ganham uma compreensão mais profunda de um theorem com cuidado lendo ou pelo menos skimming a prova, os povos que fazem computações devem compreendem como os cálculos trabalham pelo código de fonte documentado de leitura. Todo o software incluído na distribuição PRUDENTE do núcleo deve ser fonte livre e aberta, e as modificações e o redistribution arbitrários de cada única linha devem ser permitidos. 
* Ambiente de programação bom: Espera-se que o SAGE dê forma a um ambiente estável para começar a programar projetos matemáticos novos do software. Nós devemos fornecer um modelo para a comunidade matemática do desenvolvimento do software com uma ênfase forte no openness, a comunidade, a cooperação, e a colaboração. 
* Extensible: Definem tipos de dados novos ou derivam-se dos tipos internos, e fazem o código escrito em uma peça favorita da língua (C/C++ including) do sistema. 
* Usuário - amigável: A esperança é alcançar eventualmente uma elevação - em nível da sustentação do usuário. (De “a lista do email do Forum GAP” é um exemplo ideal da sustentação que se espera que o SAGE possa alcançar.) 
* Fácil de compilar: O SAGE deve ser relativamente fácil de compilar da fonte para Linux e usuários do ósmio X. Isto fornece mais flexibilidade em modificar o sistema. 
* Cruz-plataforma: O SAGE funciona sob Linux, ósmio X, Windows (cygwin e colinux binários). 
* Detalhado: Executar bastante algoritmos para ser realmente útil. Unify livre o software aberto da matemática da fonte. Ser um sistema de software livre da matemática da fonte aberta mainstream detalhada da alta qualidade. 
* Eficiente: Ser muito rapidamente---comparável a ou mais rapidamente do que qualquer outra coisa disponíveis. Isto é muito difícil, desde que muitos sistemas são fonte closed, algoritmos não é publicado às vezes, e encontrar algoritmos rápidos é frequentemente extremamente difícil (anos do trabalho, dos theses de Ph.D., da sorte, etc.). 
* Ferramentas: Fornecer relações robust a alguma da funcionalidade de PARI, de GAP, de GMP, de máximos, de SINGULAR, de MWRANK, e de NTL. Estes são todos são GPL'd e o SAGE fornece (ou fornecerá) uma relação unified usando os. 
* Poço documentado: Manual de referência, Tutorial, referência do API com exemplos para cada função, e um extensivo ``como pode… ser construído no SAGE? “original. 
Download o SAGE, uma guia da instalação e um tutorial, de seu Web page  

<a href="http://sage.scipy.org/">http://sage.scipy.org/</a>.  

Embora o SAGE use o Python e o PARI e os outros pacotes, manter na mente que não é necessário ter este software instalado no computador. A instalação do SAGE é projetada realmente ser relativamente painless, mas se houver algum problema, pede por favor (o Web page tem as ligações às listas do email para a sustentação PRUDENTE). Há umas instruções de instalação em <a href="http://sage.scipy.org/sage/doc/html/inst/index.html">http://sage.scipy.org/sage/doc/html/inst/index.html</a>. Além disso, se o SAGE for instalado uma vez, promover à versão a mais nova é especialmente fácil com a opção do comando do “melhoramento” (este é descrito no Web site dado acima e supõe que o wget está instalado e uma conexão do Internet).  

Uma vez que o SAGE é instalado em um diretório tal como sage-x.y.z. Em Linux, o Cd a este directory e datilografa o `do comando de "./sage" para começar o SAGE e indicar o “sábio alerta PRUDENTE: ”. Isto é de sentido único usar o SAGE. Uma outra maneira é datilografar em seguida no “notebook (open_viewer=True)” no alerta PRUDENTE, que  (a) começa o corredor PRUDENTE do usuário (que carrega a folha previamente usada, se algum) e  (b) abre o browser do firefox (ou começos uma aba nova se estiver já aberta) e indica o Web page PRUDENTE do caderno.  

No alerta PRUDENTE, o tipo “factor (100)” (retorno da batida) e incorpora então Ctrl-d (prender o ket de Ctrl e o d ao mesmo tempo) ou fator (do retorno) “parado” 100 da vontade do SAGE o primeiro e retira-os então. Para fazer isto no caderno, incorporar o “factor (100)” em uma “pilha” (uma janela branca vazia no browser de WWW) e entrá-lo então desloc-entram. O SAGE indicará o factorization no espaço apenas abaixo da pilha. Para retirar, a versão do caderno do SAGE, vai primeiramente para trás à linha de comando, e entra em Ctrl-c. Em seguida, retirar o browser. Isto para o caderno do SAGE.  

Há mais exemplos, no tutorial, construções, e manuais de referência, disponíveis no Web page PRUDENTE. Tentá-los por favor para fora! 

O SAGE é em um estágio adiantado do desenvolvimento, mas está crescendo ativamente, e é já usable. Há uma placa da discussão, um erro-tracker, e uma lista PRUDENTES do desejo. Por favor visita  

<a href="http://sage.scipy.org/">http://sage.scipy.org/</a>  

ou  

<a href="http://sage.math.washington.edu/sage/">http://sage.math.washington.edu/sage/</a>  

ou  

<a href="http://echidna.maths.usyd.edu.au/sage/">http://echidna.maths.usyd.edu.au/sage/</a>  

ou  

email William Stein em <a href="mailto:wstein@gmail.com">wstein@gmail.com</a>  

para mais informação. Sobretudo, ter o divertimento com SAGE! 



---

 

David Joyner <a href="mailto:wdjoyner@gmail.com">wdjoyner@gmail.com</a> 

William Stein <a href="mailto:wstein@gmail.com">wstein@gmail.com</a> 

Último 11-19-2006 Updated. 
