FICHIER = devoir

$(FICHIER).pdf : $(FICHIER).tex
	latex $(FICHIER).tex
	sage $(FICHIER).sage
	latex $(FICHIER).tex
	dvipdf $(FICHIER).dvi
	#gnome-open $(FICHIER).pdf

.PHONY : clean
clean :
	rm $(FICHIER).aux $(FICHIER).dvi $(FICHIER).log $(FICHIER).pdf\
           $(FICHIER).sage $(FICHIER).sout $(FICHIER).py 
	rm -r sage-plots-for-$(FICHIER).tex 

