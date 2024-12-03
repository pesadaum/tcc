all: 
	pdflatex -shell-escape main-article.tex 
	bibtex main-article.aux 
	pdflatex -shell-escape main-article.tex 
	pdflatex -shell-escape main-article.tex 

clean:
	rm -f *~ *.dvi *.ps *.backup *.aux *.log *.fls *.loa *.fdb_latexmk *.log
	rm -f *.lof *.lot *.bbl *.blg *.brf *.toc *.idx *.nav *.snm
	latexmk -c