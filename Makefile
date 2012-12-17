CARTELLA		= $(shell basename $$(pwd))
MAIN			= make
MAIN_TEX		= $(MAIN).tex
MAIN_DVI		= $(MAIN).dvi
MAIN_PDF		= $(MAIN).pdf
BIBLIO			= bibliografia
BIBLIO_BIB		= $(BIBLIO).bib
CAPITOLI_TEX		= $(wildcard Capitoli/*.tex)
SHELL			= /bin/sh
ALL_TEX			= $(MAIN_TEX) $(CAPITOLI_TEX) $(BIBLIO_BIB) copertina.tex
CLEAN_FILES		= *.aux *.bbl *.bcf *.blg *-blx.bib *.brf *.fdb_latexmk \
			  *.fls *.idx *.ilg *.ind *.log *.out *.run.xml *.toc *~
DISTCLEAN_FILES		= $(MAIN_PDF) $(MAIN_DVI) copertina.pdf copertina.eps
TODAY			= $(shell date "+%Y%m%d.%H%M%S")

.PHONY: pdf dvi clean distclean dist

pdf: $(MAIN_PDF)

dvi: $(MAIN_DVI)

$(MAIN_PDF): $(ALL_TEX) copertina.pdf
	latexmk -pdf $(MAIN)

$(MAIN_DVI): $(ALL_TEX) copertina.eps
	latexmk $(MAIN)

copertina.pdf: copertina.tex
	pdflatex $^
	pdfcrop $@ $@

copertina.eps: copertina.pdf
	pdf2ps $^ $@

dist: distclean
	cd ..; tar cvzpf $(MAIN)-$(TODAY).tar.gz --exclude-vcs --exclude $(CARTELLA)/auto $(CARTELLA)/

clean:
	rm -f $(CLEAN_FILES)

distclean: clean
	rm -f $(DISTCLEAN_FILES)
