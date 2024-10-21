all: 
	pdflatex -shell-escape modelo_tcc_ict.tex 
	bibtex bibliografia.bib 
	pdflatex -shell-escape modelo_tcc_ict.tex 
	pdflatex -shell-escape modelo_tcc_ict.tex 
	
clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log *.fls *.loa *.fdb_latexmk *.log
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx *.nav *.snm
	latexmk -c