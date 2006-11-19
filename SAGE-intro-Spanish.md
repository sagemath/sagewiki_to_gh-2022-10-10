See also [http://modular.math.washington.edu//home/wdj/expository/sage-intro-es.html]

== Introducción corta al SAGE: Software para la experimentación de la álgebra y de la geometría ==

El SAGE es un marco para la teoría del número, la álgebra, y el cómputo de la geometría. La puesta en práctica actual es sobre todo debido a Guillermo Stein. Es fuente abierta y libremente disponible de conformidad con la licencia el público en general del GNU (GLP). 

El SAGE es una biblioteca del Python con un intérprete modificado para requisitos particulares. Se escribe en Python, C++, y C (vía Pyrex). El Python es una fuente abierta orientada al objeto interpretó lengua, con una gran cantidad de bibliotecas, e.g., para el análisis numérico, que están disponibles para los usuarios del SAGE. El Python puede también ser alcanzado en modo de la biblioteca de programas de C/C++. 

El SAGE proporcionará un interfaz unificado a varias bibliotecas fuente abiertas importantes, incluyendo SINGULAR (para la álgebra comutativa) y GAP (para la teoría del grupo), a la biblioteca de MWRANK de Juan Crémona (para las curvas elípticas), a la biblioteca de PARI para la biblioteca NTL, máximos de la teoría de la teoría del número, y del número de Shoup (para la manipulación simbólica). Hay también interfaces a mucha fuente comercial o cerrada CAS tales como arce, KASH/KANT, MAGMA, Mathematica, axioma, y muchos otros. Para los gráficos, el SAGE incluye Matplotlib (para los 2.os y algunos tridimensionales gráficos) y el tachyon (un trazalíneas tridimensional del rayo). 

El diseño del SAGE está por pensó pesadamente cuidadosamente hacia fuera y estructura de clase madura del MAGMA cerrado del programa de la álgebra de la computadora de fuente. Sin embargo, el SAGE no se significa para ser una copia del MAGMA y otros paquetes (tales como GAP y Mathematica) también han desempeñado un papel influencial.

Las metas y los principios de guía a largo plazo principales para el SAGE: 

* Liberar y abrir la fuente: El código de fuente debe ser libremente disponible y legible, así que los usuarios pueden entender lo que está haciendo el sistema realmente y ampliarlos más fácilmente. Apenas pues los matemáticos ganan una comprensión más profunda de un teorema cuidadosamente leyendo o por lo menos desnatando la prueba, la gente que hace cómputos debe poder entender cómo los cálculos trabajan por código de fuente documentado de lectura. Todo el software incluido en la distribución SABIA de la base debe ser fuente libre y abierta, y las modificaciones y la redistribución arbitrarias de cada sola línea deben ser permitidas. 

 * Buen ambiente de programación: Se espera que el SAGE formará un ambiente estable para comenzar a programar nuevos proyectos matemáticos del software. Debemos proporcionar un modelo para la comunidad matemática del desarrollo del software de un énfasis fuerte en franqueza, la comunidad, la cooperación, y la colaboración. 

 * Extensible: Poder definir nuevos tipos de datos o derivar de tipos incorporados, y hacer el código escrito en una pieza preferida de la lengua (C/C++ incluyendo) del sistema. 

 * De uso fácil: La esperanza es lograr eventual un de alto nivel de la ayuda del usuario. (“La lista del email del foro de GAP” es un ejemplo ideal de la ayuda que se espera que el SAGE puede lograr.) 

 * Fácil compilar: El SAGE debe ser relativamente fácil de compilar de la fuente para Linux y los usuarios del OS X. Esto proporciona más flexibilidad en la modificación del sistema. 

 * Cruz-plataforma: El SAGE funciona debajo de Linux, OS X, Windows (cygwin y colinux binarios). 

 * Comprensivo: Poner bastantes algoritmos en ejecución para ser realmente útil. Unificar libremente el software abierto de las matemáticas de la fuente. Ser un sistema de software libre de las matemáticas de la fuente abierta de corriente comprensiva de la alta calidad. 

 * Eficiente: Estar muy rápidamente---comparable a o más rápidamente que todo lo demás disponibles. Esto es muy difícil, puesto que muchos sistemas son fuente cerrada, los algoritmos no se publica a veces, y encontrar algoritmos rápidos es a menudo extremadamente difícil (los años del trabajo, de las tesis de Ph.D., de la suerte, del etc.). 

 * Herramientas: Proporcionar los interfaces robustos a algo de la funcionalidad de PARI, de GAP, de GMP, de máximos, del SINGULAR, de MWRANK, y de NTL. Éstos son todos son GPL'd y el SAGE proporciona (o proporcionará) un interfaz unificado para usarlos. 

 * Bien documentado: ¿Manual de referencia, clase particular, referencia del API con los ejemplos para cada función, y un extenso "cómo puede… ser construido en SAGE? “ documento.

Descargar el SAGE, una guía de la instalación y una clase particular, de tu Web page 
http://sage.scipy.org/. 
Aunque el SAGE utiliza el Python y PARI y otros paquetes, tener presente que no es necesario tener este software instalado previamente en la computadora. La instalación del SAGE realmente se diseña para ser relativamente sin dolor, pero si hay algunos problemas, pide por favor (el Web page tiene acoplamientos a las listas del email para la ayuda SABIA). Hay instrucciones de instalación en http://sage.scipy.org/sage/doc/html/inst/index.html. Por otra parte, si el SAGE está instalado una vez, el aumento a la más nueva versión es especialmente fácil con la opción del comando de la “mejora” (esto se describe en el Web site dado arriba y asume que el wget está instalado y una conexión del Internet). 

Una vez que el SAGE esté instalado en un directorio tal como sage-x.y.z, habrá un subdirectory llamado “compartimiento”. En Linux, el Cd a este subdirectory del “compartimiento” y mecanografía el `del comando "./sage" para comenzar el SAGE y para exhibir el “sabio pronto SAGE: ”. Esto es unidireccional utilizar el SAGE. Otra manera es mecanografiar después en el “notebook(open_viewer=True)” en el aviso SAGE, que 
(a) comienza el funcionamiento SAGE del servidor (que carga la hoja de trabajo previamente usada, si cualquiera) y 
(b) abre el browser del firefox (o el comienzo una nueva lengüeta si está ya abierta) y exhibe el Web page SAGE del cuaderno. 

En el aviso SAGE, el tipo “factor (100)” (vuelta del golpe) y entonces incorpora Ctrl-d (llevar a cabo el ket de Ctrl y la d al mismo tiempo) o factor (de vuelta) “parado” 100 de la voluntad del SAGE el primer y después sale. Para hacer esto en el cuaderno, incorporar el “factor (100)” en una “célula” (una ventana blanca vacía en el browser de WWW) y después entrar cambiar de puesto-insertan. El SAGE exhibirá la facturización en el espacio apenas debajo de la célula. A salir, la versión del cuaderno del SAGE, primero va de nuevo a la línea de comando, y entra en Ctrl-c. Después, salir del browser. Esto para el cuaderno del SAGE. 

Hay más ejemplos, en la clase particular, construcciones, y los manuales de referencia, disponibles en el Web page SAGE. ¡Intentarlos por favor hacia fuera! 

El SAGE es en un primero tiempo del desarrollo, pero está creciendo activamente, y es ya usable. Hay un tablero de la discusión, un insecto-perseguidor, y una lista SAGES del deseo. Por favor visita 
http://sage.scipy.org/ 

o 

http://sage.math.washington.edu/sage/ 

o 

http://echidna.maths.usyd.edu.au/sage/ 

o 

email Guillermo Stein en wstein@gmail.com 

para más información. ¡Sobretodo, tener diversión con SAGE!


David Joyner
wdjoyner@gmail.com

Guillermo Stein
wstein@gmail.com

11-19-2006 actualizado pasado.
