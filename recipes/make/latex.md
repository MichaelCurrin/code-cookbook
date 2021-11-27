# LaTeX

## Sample

I'm not interested in [LaTeX](https://en.wikipedia.org/wiki/LaTeX) itself so much as the code here.

- for loop
- shell choice
- help text
- all

[source](https://tex.stackexchange.com/questions/399330/how-to-write-a-makefile-in-windows-to-compile-a-latex-document-using-a-loop)

- `Makefile`
    ```make
    SHELL   = /bin/sh

    all:
        make tex
        make clean

    tex:
        for number in 1 2 3; do \
            echo $$number ; \
            pdflatex -no-pdf --jobname=Mydocument-No-$$number "\newcommand\x{$$number} \input{main.tex}"  ; \
            pdflatex --jobname=Mydocument-No-$$number "\newcommand\x{$$number} \input{main.tex}"  ; \
        done;\

    help:
        echo "USAGE: make [all/tex/clean]"

    clean:
        rm -f *.aux *.dvi *.idx *.ilg *.ind *.log *.nav *.out *.snm *.xdv *.toc *~
    ```
