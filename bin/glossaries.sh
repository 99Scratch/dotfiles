#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: " $0 nameOfTexFileWithoutFileEnding
	exit 1
fi

rm $1.glg $1.gls $1.glo $1.alg $1.acr $1.acn
pdflatex $1.tex
makeglossaries $1
pdflatex $1.tex
pdflatex $1.tex

