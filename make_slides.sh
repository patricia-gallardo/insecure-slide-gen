#!/usr/bin/env bash

DIRNAME=`dirname "$0"`
echo $DIRNAME
find -name "* *" -type f | rename 's/ /_/g'
LIST=$(ls | sort)
pdfunite $LIST all-files.pdf
pdftk all-files.pdf stamp $DIRNAME/watermark.pdf output final.pdf
gs -sOutputFile=final_bw.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH final.pdf
