Introduzione ai Makefile per compilare documenti LaTeX
======================================================

Qui è contenuto il codice sorgente LaTeX della guida
[*Introduzione ai Makefile per compilare documenti LaTeX*](http://www.guitex.org/home/images/doc/GuideGuIT/guidamake.pdf).
Questa fa parte del progetto
[*Guide tematiche*](http://www.guitex.org/home/it/guide-tematiche) per la
diffusione di documentazione di alta qualità centrata su argomenti specifici sul
sistema TeX, condotto dal Gruppo Italiano di utilizzatori di TeX
[www.guitex.org](http://www.guitex.org).

Licenza e collaborazione
------------------------

Quest'opera è rilasciata con licenza Creative Commons Attribuzione 3.0 Unported.
Un riassunto in linguaggio accessibile a tutti della Licenza in versione 3.0 è
reperibile all'indirizzo http://creativecommons.org/licenses/by/3.0/deed.it.

È possibile contribuire a questa guida clonando il repository Git con il comando
````
git clone https://github.com/GuITeX/guidamakefilelatex.git
````
oppure inviando critiche, commenti e consigli all'autore all'indirizzo e-mail
indicato nella guida.

Compilazione della guida
------------------------

Per compilare il documento è necessaria la classe `guidatematica.cls`
disponibile all'indirizzo https://github.com/GuITeX/guidetematiche.  Per
compilare il documento in formato DVI si può dare il comando
````
$ make dvi
````
Per compilare in formato PDF dare il comando
````
$ make pdf
````
Per creare un archivio .tar.gz da distribuire eseguire
````
$ make dist
````
