## page was renamed from SymbolicBenchmarks
||<-2 rowstyle="background-color: #FFFFE0;">Problem Key                                 ||
|| $\rightarrow$ || simplify                       ||
|| $A(...)$      || assume ...                     ||
|| $S(...,x)$    || solve ... for $x$              ||
|| $T(...,x=b)$  || Taylor series of ... based at b||
|| (p.v.)        || principal value                ||
|| (div)         || divergent                      ||

||<-2 rowstyle="background-color: #FFFFE0;">Performance Key                                           ||
|| $\times$                || wrong answer/cannot do the problem ||
|| $s\ sec/ms/\mu s$       || performs correctly in time $s$     ||
|| $> s\ sec/ms/\mu s$     || does not finish in time $s$        ||
|| >.<,$s$ or >.<,$\times$ || very difficult to convince system to do what you want (regardless of performance) ||

||<rowstyle="background-color: #FFFFE0;">Problem                                                      || Maple || Mathematica || GiNaC || Maxima || Sage || Symbolics || Notes (such as code used/version etc.) ||
|| $\sqrt{2\sqrt{3} + 4} \rightarrow 1 + \sqrt{3}$              ||       ||             ||       ||        ||  $\times$    ||           || ||
|| $2\infty - 3 \rightarrow \infty$                             ||       ||             ||       ||        || s 47.2 µs    ||           || ||
|| $\frac{e^x-1}{e^{x/2}+1} \rightarrow e^{x/2} - 1$            ||       ||             ||       ||        || s 2.59 ms   ||           || ||
|| $A(x \geq y, y \geq z, z \geq x); x = z?$                    ||       ||             ||       ||        || s  1.57 ms    ||           || ||
|| $A(x > y, y > 0); 2x^2 > 2y^2?$                              ||       ||             ||       ||        ||      ||           || ||
|| $\frac{\cos(3x)}{\cos x} \rightarrow \cos^2 x - 3\sin^2 x$   ||       ||             ||       ||        ||      ||           || ||
|| $\frac{\cos(3x)}{\cos x} \rightarrow 2\cos(2x) - 1$          ||       ||             ||       ||        ||      ||           || ||
|| $A(x,y > 0); x^{1/n}y^{1/n} - (xy)^{1/n} \rightarrow 0$      ||       ||             ||       ||        ||      ||           || ||
|| $\log(\tan(\frac{1}{2}x + \frac{\pi}{4})) - \sinh^{-1}(\tan(x)) \rightarrow 0$ || || ||       ||        ||      ||           || ||
|| $\log\frac{2\sqrt{r} + 1}{\sqrt{4r + 4\sqrt{r} + 1}} \rightarrow 0$ || ||            ||       ||        ||      ||           || ||
|| $\frac{\sqrt{xy|z|^2}}{\sqrt{x}|z|} \rightarrow \frac{\sqrt{xy}}{\sqrt{x}} \not\rightarrow \sqrt{y}$ || || || || || ||       || Note $\sqrt{x} = \pm\sqrt{x}$ ||
|| $\frac{x=0}{2}+1 \rightarrow \frac{x}{2}+1=1$                ||       ||             ||       ||        ||      ||           || ||
|| $S(e^{2x} + 2e^x + 1 = z,x)$                                 ||       ||             ||       ||        || s 4.85 ms    ||           || ||
|| $S((x+1)(\sin^2x + 1)^2\cos^3(3x)=0,x)$                      ||       ||             ||       ||        ||      ||           || ||
|| $M^{-1}$, where $M = [[x,1],[y,e^z]]$                        ||       ||             ||       ||        || s  3.93 ms   ||           || ||
|| $\sum_{k=1}^n k^3 \rightarrow \frac{n^2(n+1)^2}{4}$          ||       ||             ||       ||        ||  s  24.6 ms  ||           || ||
|| $\sum_{k=1}^\infty(\frac{1}{k^2} + \frac{1}{k^3}) \rightarrow \frac{\pi^2}{6} + \zeta(3)$ || || || || || || || ||
|| $\prod_{k=1}^nk \rightarrow n!$                              ||       ||             ||       ||        ||  s 5.82 ms   ||           || ||
|| $\lim_{n\rightarrow\infty}(1 + \frac{1}{n})^n \rightarrow e$ ||       ||             ||       ||        ||   s 6.93 ms   ||           || ||
|| $\lim_{x\rightarrow 0}\frac{\sin x}{x} \rightarrow 1$        ||       ||             ||       ||        ||      ||           || ||
|| $\lim_{x\rightarrow 0}\frac{1-\cos x}{x^2} \rightarrow \frac{1}{2}$ || ||            ||       ||        ||      ||           || ||
|| $\frac{d^2}{dx^2}y(x(t)) \rightarrow \frac{d^2y}{dx^2}(\frac{dx}{dt})^2 + \frac{dy}{dx}\frac{d^2x}{dt^2}$ || || || || || ||  || ||
|| $\frac{d}{dx}(\int\frac{1}{x^3+2}dx) \rightarrow \frac{1}{x^3+2}$ ||  ||             ||       ||        ||      ||           || ||
|| $\int\frac{1}{a+b\cos x}dx (a < b)$                          ||       ||             ||       ||        ||      ||           || ||
|| $\frac{d}{dx}\int\frac{1}{a+b\cos x}dx = \frac{1}{a+b\cos x}$||       ||             ||       ||        ||      ||           || ||
|| $\frac{d}{dx}|x| \rightarrow \frac{x}{|x|}$                  ||       ||             ||       ||        ||      ||           || ||
|| $\int|x|dx \rightarrow \frac{x|x|}{2}$                       ||       ||             ||       ||        ||      ||           || ||
|| $\int\frac{x}{\sqrt{1+x}+\sqrt{1-x}}dx \rightarrow \frac{(1+x)^{3/2}+(1-x)^{3/2}}{3}$ || || || ||       ||      ||           || ||
|| $\int\frac{\sqrt{1+x}+\sqrt{1-x}}{2}dx \rightarrow \frac{(1+x)^{3/2}+(1-x)^{3/2}}{3}$ || || || ||       ||      ||           || ||
|| $\int_{-1}^1\frac{1}{x}dx \rightarrow 0$ (p.v.)              ||       ||             ||       ||        ||      ||           || ||
|| $\int_{-1}^1\frac{1}{x^2}dx \rightarrow$ (div)               ||       ||             ||       ||        ||      ||           || ||
|| $\int_0^1\sqrt{x + \frac1x - 2}dx \rightarrow \frac43$       ||       ||             ||       ||        ||      ||           || ||
|| $\int_1^2\sqrt{x + \frac1x - 2}dx \rightarrow \frac{4-\sqrt8}3$||     ||             ||       ||        ||      ||           || ||
|| $\int_0^2\sqrt{x + \frac1x - 2}dx \rightarrow \frac{8-\sqrt8}3$||     ||             ||       ||        ||      ||           || ||
|| $A(a>0); \int_{-\infty}^\infty\frac{\cos x}{x^2+a^2}dx \rightarrow \frac\pi ae^{-a}$|| || ||  ||        ||      ||           || ||
|| $A(0 < a < 1); \int_0^\infty\frac{t^{a-1}}{t+1}dt \rightarrow \frac{\pi}{\sin(\pi a)}$|| || || ||       ||      ||           || ||
|| $T(\frac1{\sqrt{1-(x/c)^2}},x=0)$                              ||       ||             ||       ||        ||      ||           || ||
|| $T((\log x)^ae^{-bx},x=1)$                                   ||       ||             ||       ||        ||      ||           || ||
|| $T(\log(\sinh z) + \log(\cosh(z + w)))$                      ||       ||             ||       ||        ||      ||           || ||
|| $T(\log(\frac{\sin x}{x}), x=0)$                             ||       ||             ||       ||        ||  s 5.19 ms    ||           || at order 20 ||
