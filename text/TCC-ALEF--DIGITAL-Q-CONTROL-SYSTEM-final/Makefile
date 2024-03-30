all: 
	pdflatex -shell-escape main.tex 
	bibtex main.aux 
	pdflatex -shell-escape main.tex 
	pdflatex -shell-escape main.tex 
	
clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log *.fls *.loa *.fdb_latexmk *.log
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx
	rm -f *.pdf
