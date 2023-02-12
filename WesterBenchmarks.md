Problem Key                                 ||
 $\rightarrow$  |  simplify                       
 $A(...)$       |  assume ...                     
 $S(...,x)$     |  solve ... for $x$              
 $T(...,x=b)$   |  Taylor series of ... based at b
 (p.v.)         |  principal value                
 (div)          |  divergent                      
Performance Key                                           ||
 $\times$                 |  wrong answer/cannot do the problem 
 $s\ sec/ms/\mu s$        |  performs correctly in time $s$     
 $> s\ sec/ms/\mu s$      |  does not finish in time $s$        
 >.<,$s$ or >.<,$\times$  |  very difficult to convince system to do what you want (regardless of performance) 
Problem                                                       |  Maple  |  Mathematica  |  GiNaC  |  Maxima  |  Sage  |  Symbolics  |  Notes (such as code used/version etc.) 
 $\sqrt{2\sqrt{3} + 4} \rightarrow 1 + \sqrt{3}$               |         |               |         |          |  $\times$  |             |  
 $2\infty - 3 \rightarrow \infty$                              |         |               |         |          |  s 47.2 µs  |             |  
 $\frac{e<sup>x-1}{e</sup>{x/2}+1} \rightarrow e^{x/2} - 1$             |         |               |         |          |  s 2.59 ms  |             |  
 $A(x \geq y, y \geq z, z \geq x); x = z?$                     |         |               |         |          |  s 1.57 ms  |             |  
 $A(x > y, y > 0); 2x<sup>2 > 2y</sup>2?$                               |         |               |         |          |        |             |  
 $\frac{\cos(3x)}{\cos x} \rightarrow \cos<sup>2 x - 3\sin</sup>2 x$    |         |               |         |          |        |             |  
 $\frac{\cos(3x)}{\cos x} \rightarrow 2\cos(2x) - 1$           |         |               |         |          |        |             |  
 $A(x,y > 0); x<sup>{1/n}y</sup>{1/n} - (xy)^{1/n} \rightarrow 0$       |         |               |         |          |        |             |  
 $\log(\tan(\frac{1}{2}x + \frac{\pi}{4})) - \sinh^{-1}(\tan(x)) \rightarrow 0$  |   |   |         |          |        |             |  
 $\log\frac{2\sqrt{r} + 1}{\sqrt{4r + 4\sqrt{r} + 1}} \rightarrow 0$  |   |              |         |          |        |             |  
 $\frac{\sqrt{xy|z|^2}}{\sqrt{x}|z|} \rightarrow \frac{\sqrt{xy}}{\sqrt{x}} \not\rightarrow \sqrt{y}$  |   |   |   |   |  s 2.11 ms  |         |  Note $\sqrt{x} = \pm\sqrt{x}$ 
 $\frac{x=0}{2}+1 \rightarrow \frac{x}{2}+1=1$                 |         |               |         |          |        |             |  
 $S(e<sup>{2x} + 2e</sup>x + 1 = z,x)$                                  |         |               |         |          |  s 4.85 ms  |             |  
 $S((x+1)(\sin<sup>2x + 1)</sup>2\cos^3(3x)=0,x)$                       |         |               |         |          |        |             |  
 $M<sup>{-1}$, where $M = [[x,1],[y,e</sup>z]]$                         |         |               |         |          |  s 3.93 ms  |             |  
 $\sum_{k=1}<sup>n k</sup>3 \rightarrow \frac{n<sup>2(n+1)</sup>2}{4}$           |         |               |         |          |  s 24.6 ms  |             |  
 $\sum_{k=1}<sup>\infty(\frac{1}{k</sup>2} + \frac{1}{k<sup>3}) \rightarrow \frac{\pi</sup>2}{6} + \zeta(3)$  |   |   |   |   |   |   |  
 $\prod_{k=1}^nk \rightarrow n!$                               |         |               |         |          |  s 5.82 ms  |             |  
 $\lim_{n\rightarrow\infty}(1 + \frac{1}{n})^n \rightarrow e$  |         |               |         |          |  s 6.93 ms  |             |  
 $\lim_{x\rightarrow 0}\frac{\sin x}{x} \rightarrow 1$         |         |               |         |          |  s 5.95 ms  |             |  
 $\lim_{x\rightarrow 0}\frac{1-\cos x}{x^2} \rightarrow \frac{1}{2}$  |   |              |         |          |        |             |  
 $\frac{d<sup>2}{dx</sup>2}y(x(t)) \rightarrow \frac{d<sup>2y}{dx</sup>2}(\frac{dx}{dt})<sup>2 + \frac{dy}{dx}\frac{d</sup>2x}{dt^2}$  |   |   |   |   |   |    |  
 $\frac{d}{dx}(\int\frac{1}{x<sup>3+2}dx) \rightarrow \frac{1}{x</sup>3+2}$  |    |               |         |          |        |             |  
 $\int\frac{1}{a+b\cos x}dx (a < b)$                           |         |               |         |          |        |             |  
 $\frac{d}{dx}\int\frac{1}{a+b\cos x}dx = \frac{1}{a+b\cos x}$ |         |               |         |          |        |             |  
 $\frac{d}{dx}|x| \rightarrow \frac{x}{|x|}$                   |         |               |         |          |        |             |  
 $\int|x|dx \rightarrow \frac{x|x|}{2}$                        |         |               |         |          |        |             |  
 $\int\frac{x}{\sqrt{1+x}+\sqrt{1-x}}dx \rightarrow \frac{(1+x)<sup>{3/2}+(1-x)</sup>{3/2}}{3}$  |   |   |   |         |        |             |  
 $\int\frac{\sqrt{1+x}+\sqrt{1-x}}{2}dx \rightarrow \frac{(1+x)<sup>{3/2}+(1-x)</sup>{3/2}}{3}$  |   |   |   |         |        |             |  
 $\int_{-1}^1\frac{1}{x}dx \rightarrow 0$ (p.v.)               |         |               |         |          |        |             |  
 $\int_{-1}<sup>1\frac{1}{x</sup>2}dx \rightarrow$ (div)                |         |               |         |          |        |             |  
 $\int_0^1\sqrt{x + \frac1x - 2}dx \rightarrow \frac43$        |         |               |         |          |        |             |  
 $\int_1^2\sqrt{x + \frac1x - 2}dx \rightarrow \frac{4-\sqrt8}3$ |       |               |         |          |        |             |  
 $\int_0^2\sqrt{x + \frac1x - 2}dx \rightarrow \frac{8-\sqrt8}3$ |       |               |         |          |        |             |  
 $A(a>0); \int_{-\infty}<sup>\infty\frac{\cos x}{x</sup>2+a<sup>2}dx \rightarrow \frac\pi ae</sup>{-a}$ |   |   |    |          |        |             |  
 $A(0 < a < 1); \int_0<sup>\infty\frac{t</sup>{a-1}}{t+1}dt \rightarrow \frac{\pi}{\sin(\pi a)}$ |   |   |   |         |        |             |  
 $T(\frac1{\sqrt{1-(x/c)^2}},x=0)$                               |         |               |         |          |        |             |  
 $T((\log x)<sup>ae</sup>{-bx},x=1)$                                    |         |               |         |          |        |             |  
 $T(\log(\sinh z) + \log(\cosh(z + w)))$                       |         |               |         |          |        |             |  
 $T(\log(\frac{\sin x}{x}), x=0)$                              |         |               |         |          |  s 5.19 ms  |             |  at order 20 
