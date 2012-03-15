MAIN			= make
MAIN_TEX		= $(MAIN).tex
MAIN_DVI		= $(MAIN).dvi
MAIN_PDF		= $(MAIN).pdf
BIBLIO			= bibliografia
BIBLIO_BIB		= $(BIBLIO).bib
CAPITOLI_TEX		= $(wildcard Capitoli/*.tex)
CAPITOLI_TEMP		= $(addsuffix ~, $(CAPITOLI_TEX))
INIZIALEFINALE_TEX	= $(wildcard MaterialeInizialeFinale/*.tex)
INIZIALEFINALE_TEMP	= $(addsuffix ~, $(INIZIALEFINALE_FILE))
SHELL			= /bin/sh
ALL_TEX			= $(MAIN_TEX) $(CAPITOLI_TEX) $(INIZIALEFINALE_TEX) \
			  $(BIBLIO_BIB)
CLEAN_FILES		= *.aux *.bbl *.bcf *.blg *-blx.bib *.brf *.fdb_latexmk \
			  *.idx *.ilg *.ind *.log *.out *.run.xml *.toc *~ \
			  $(INTRO_TEMP) $(REALIZZARE_TEMP)
DISTCLEAN_FILES		= $(MAIN_PDF) $(MAIN_DVI)
TODAY			= $(shell date +%Y%m%d.%H%M%S)

.PHONY: pdf dvi clean distclean dist

pdf: $(MAIN_PDF)

dvi: $(MAIN_DVI)

$(MAIN_PDF): $(ALL_TEX)
	latexmk -pdf $(MAIN)

$(MAIN_DVI): $(ALL_TEX)
	latexmk $(MAIN)

dist: distclean
	cd ..; tar cvfzps $(MAIN)-$(TODAY).tar.gz $(MAIN)/

clean:
	rm -f $(CLEAN_FILES)

distclean: clean
	rm -f $(DISTCLEAN_FILES)
