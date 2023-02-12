
See also <a class="http" href="http://modular.math.washington.edu//home/wdj/expository/sage-intro-es.html">http://modular.math.washington.edu//home/wdj/expository/sage-intro-es.html</a> 


## Introducción corta a SAGE

SAGE un programa matematico para la teoría del número, el álgebra, y el cómputo de la geometría. Su implementacion se debe a William Stein y mas de 50 contribuidores alrededor del mundo. Es fuente abierta y libremente disponible en conformidad con la licencia pública general del projecto GNU (GLP). SAGE es: 

   * Una distribucion unificada de programas matematicos libres que simples mortales pueden construir desde su fuente. 
   * Una libreria en Python para la computacion matematica con interfaces graficos e intérprete.  
   * Una interface para actuales programas matematicos. 
Esta escrito en Python, C++, y C (vía Pyrex). Python es un lenguaje de programacion fuente abierta orientada a la programacion orientada a objetos, con una gran cantidad de librerias, e.g., para el análisis numérico, que están disponibles para los usuarios de SAGE. Python puede también ser alcanzado en modo de la librerias de programas escritos en C/C++.  

SAGE proporcionará un interfaz unificada a varias importantes librerias fuente abiertas, incluyendo SINGULAR (para el álgebra conmutativa) y GAP (para la teoría del grupo), a la libreria MWRANK de Juan Crémona (para las curvas elípticas), a la libreria PARI para la biblioteca NTL, máximos de la teoría de la teoría del número, y del número de Shoup (para la manipulación simbólica). Hay también interfaces a mucha fuente comercial o cerrada CAS tales como arce, KASH/KANT, MAGMA, Mathematica, axioma, y muchos otros. Para los gráficos, SAGE incluye Matplotlib (para los 2.os y algunos tridimensionales gráficos) y el Tachyon (un trazalíneas tridimensional del rayo).  

Las principales metas y principios de guía a largo plazo para SAGE son:  

* Liberar y abrir la fuente: El código de fuente debe ser libremente disponible y legible, de mode que los usuarios puedan entender lo que está haciendo el sistema realmente y ampliarlos más fácilmente. Apenas pues los matemáticos ganan una comprensión más profunda de un teorema cuidadosamente leyendo o por lo menos desnatando la prueba, la gente que hace cómputos debe poder entender cómo los cálculos trabajan por código de fuente documentado de lectura. Todo el software incluido en la distribución de SAGE debe ser fuente libre y abierta, y las modificaciones y la redistribución arbitrarias de cada sola línea deben ser permitidas.  
* Buen ambiente de programación: Se espera que el SAGE formará un ambiente estable para comenzar a programar nuevos proyectos de programas matemáticos. Debemos proporcionar un modelo para la comunidad de desarrollo de programas de matemática con un énfasis fuerte en franqueza, la comunidad, la cooperación, y la colaboración.  
* Extensible: Poder definir nuevos tipos de datos o derivar de tipos incorporados, y hacer el código escrito en una pieza preferida de la lengua (C/C++ incluyendo) del sistema.  
* De uso fácil: La esperanza es lograr eventual un de alto nivel de la ayuda del usuario. (“La lista del email del foro de GAP” es un ejemplo ideal de la ayuda que se espera que el SAGE puede lograr.)  
* Fácil compilar: SAGE debe ser relativamente fácil de compilar de la fuente para Linux y los usuarios del OS X. Esto proporciona más flexibilidad en la modificación del sistema.  
* Plataforma Independiente: SAGE funciona debajo de Linux, OS X, Windows (cygwin y colinux binarios).  
* Comprensivo: Poner bastantes algoritmos en ejecución para ser realmente útil. Unificar libremente el software abierto de las matemáticas de la fuente. Ser un sistema de software libre de las matemáticas de la fuente abierta de corriente comprensiva de la alta calidad.  
* Eficiente: Estar muy rápidamente---comparable a o más rápidamente que todo lo demás disponibles. Esto es muy difícil, puesto que muchos sistemas son fuente cerrada, los algoritmos no se publica a veces, y encontrar algoritmos rápidos es a menudo extremadamente difícil (los años del trabajo, de las tesis de Ph.D., de la suerte, del etc.).  
* Herramientas: Proporcionar los interfaces robustos a algo de la funcionalidad de PARI, de GAP, de GMP, de máximos, del SINGULAR, de MWRANK, y de NTL. Éstos son todos GPL'd y SAGE proporciona (o proporcionará) una interfaz unificada para usarlos.  
* Bien documentado: ¿Manual de referencia, alguna clase en particular, referencia al API con los ejemplos para cada función, y un extenso "cómo puede… ser construido en SAGE? “ documento. 
Descarga SAGE, una guía de la instalación y una clase particular en <a href="http://sage.scipy.org/">http://sage.scipy.org/</a>.  

Aunque SAGE utiliza Python y PARI y otros paquetes, tener presente que no es necesario tener este software instalado previamente en la computadora. La instalación de SAGE realmente se diseña para ser relativamente sin dolor, pero si hay algunos problemas, pide por favor (el Web page tiene acoplamientos a las listas del email para la ayuda SABIA). Hay instrucciones de instalación en <a href="http://sage.scipy.org/sage/doc/html/inst/index.html">http://sage.scipy.org/sage/doc/html/inst/index.html</a>. Por otra parte, si SAGE está instalado una vez, el aumento a la más nueva versión es especialmente fácil con la opción del comando de la “mejora” (esto se describe en el Web site dado arriba y asume que wget está instalado y una conexión  al Internet esta presente).  

Una vez que SAGE esté instalado en un directorio tal como sage-x.y.z. en Linux, cd a este directorio y ejecute el comando "./sage" para comenzar SAGE y para exhibir el “sabio pronto SAGE: ”. Esto es unidireccional utilizar SAGE. Otra manera es ejecturar después en el “notebook(open_viewer=True)” en el aviso SAGE, que  (a) comienza el funcionamiento del servidor SAGE (que carga la hoja de trabajo previamente usada, si cualquiera) y  (b) abre el browser del firefox (o el comienzo una nueva lengüeta si está ya abierta) y exhibe el Web page SAGE del cuaderno.  

En el aviso SAGE, el tipo “factor (100)” (vuelta del golpe) y entonces incorpora Ctrl-d (llevar a cabo el key de Ctrl y la d al mismo tiempo) o factor (de vuelta) “parado” 100 de la voluntad del SAGE el primer y después sale. Para hacer esto en el cuaderno, incorporar el “factor (100)” en una “célula” (una ventana blanca vacía en el browser de WWW) y después entrar cambiar de puesto-insertan. El SAGE exhibirá la facturización en el espacio apenas debajo de la célula. A salir, la versión del cuaderno del SAGE, primero va de nuevo a la línea de comando, y entra en Ctrl-c. Después, salir del browser. Esto para el cuaderno del SAGE.  

Hay más ejemplos, en la clase particular, construcciones, y los manuales de referencia, disponibles en el Web page SAGE. ¡Intentarlos por favor hacia fuera!  

SAGE es en un primero tiempo del desarrollo, pero está creciendo activamente, y es ya usable. Hay un tablero de la discusión, un insecto-perseguidor, y una lista SAGES del deseo. Por favor visita  

<a href="http://sage.scipy.org/">http://sage.scipy.org/</a>  

o  

<a href="http://sage.math.washington.edu/sage/">http://sage.math.washington.edu/sage/</a>  

o  

<a href="http://echidna.maths.usyd.edu.au/sage/">http://echidna.maths.usyd.edu.au/sage/</a>  

o  

email William Stein en <a href="mailto:wstein@gmail.com">wstein@gmail.com</a>  

para más información. ¡Sobretodo, tener diversión con SAGE! 



---

 

David Joyner <a href="mailto:wdjoyner@gmail.com">wdjoyner@gmail.com</a> 

William Stein <a href="mailto:wstein@gmail.com">wstein@gmail.com</a> 

11-19-2006 actualizado pasado. 
