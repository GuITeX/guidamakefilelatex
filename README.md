guidamakefilelatex
==================

Contiene i sorgenti LaTeX della Guida tematica all'uso di makefile per LaTeX.

Quest'opera è rilasciata con licenza Creative Commons Attribuzione 3.0 Unported.
Un riassunto in linguaggio accessibile a tutti della Licenza in versione 3.0 è
reperibile all'indirizzo http://creativecommons.org/licenses/by/3.0/deed.it.

Per compilare il documento in formato DVI, dopo aver scompattato l'archivio e 
aver aperto un terminale in questa cartella, si può dare il comando
````
$ make dvi
````
Per compilare in formato PDF dare il comando
````
$ make pdf
````
Per cancellare i file temporanei usare
````
$ make clean
````
Per cancellare tutti i file, compresi i file di output DVI e PDF, usare
````
$ make distclean
````
Per creare un archivio .tar.gz per distribuire il documento usare
````
$ make dist
````
