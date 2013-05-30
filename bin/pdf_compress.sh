#!/bin/bash
gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -r150 -sOutputFile=$1_komprimiert $1
