compile:
	latexmk -pdf main.tex
	latexmk -c
viewpdf:
	zathura main.pdf --fork
todo:
	rg '\\(todo|worry)\{.*\}' . -o -g '!todo.txt' --max-depth=1 > todo.txt
backup:
	mkdir -p "archive/"$(date +%Y%m%d)
	rsync -avh * "archive/"$(date +%Y%m%d) --exclude archive*
cleanup:
	latexmk -c
	rm *.fls || true
	rm *.log || true
