CARTELLA		= $(shell basename $$(pwd))
MAIN			= guidamake
MAIN_TEX		= $(MAIN).tex
MAIN_DVI		= $(MAIN).dvi
MAIN_PDF		= $(MAIN).pdf
BIBLIO			= bibliografia
BIBLIO_BIB		= $(BIBLIO).bib
CAPITOLI_TEX		= $(wildcard Capitoli/*.tex)
CARTELLA_IMG		= figure
IMMAGINI_PNG		= $(wildcard $(CARTELLA_IMG)/*.png)
IMMAGINI_EPS		= $(patsubst $(CARTELLA_IMG)/%.png, $(CARTELLA_IMG)/%.eps, $(IMMAGINI_PNG))
SHELL			= /bin/sh
ALL_TEX			= $(MAIN_TEX) $(CAPITOLI_TEX) $(BIBLIO_BIB)
CLEAN_FILES		= *.aux *.bbl *.bcf *.blg *-blx.bib *.brf *.fdb_latexmk \
			  *.fls *.idx *.ilg *.ind *.log *.out *.run.xml *.toc *~
DISTCLEAN_FILES		= $(MAIN_PDF) $(MAIN_DVI) $(IMMAGINI_EPS) ChangeLog
TODAY			= $(shell date "+%Y%m%d.%H%M%S")

.PHONY: pdf dvi clean distclean dist

pdf: $(MAIN_PDF)

dvi: $(MAIN_DVI)

$(MAIN_PDF): $(ALL_TEX)
	latexmk -pdf $(MAIN)

$(MAIN_DVI): $(ALL_TEX) $(IMMAGINI_EPS)
	latexmk $(MAIN)

$(CARTELLA_IMG)/%.eps: $(CARTELLA_IMG)/%.png
	convert $^ $@

dist: distclean
	git log --first-parent --format="%ai %aN [%h]%d%n%n%x09* %s%n" > ChangeLog
	cd ..; tar cvzpf $(MAIN)-$(TODAY).tar.gz --exclude-vcs --exclude $(CARTELLA)/auto $(CARTELLA)/

clean:
	rm -f $(CLEAN_FILES)

distclean: clean
	rm -f $(DISTCLEAN_FILES)
