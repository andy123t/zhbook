#!/bin/bash

#-> Get source FileName
find . -maxdepth 1 -type f -name "*.tex" | while read FileName; do 
#--- Process file.tex ---
echo "$FileName"
echo "${FileName%.tex}"
#-> makeindex the main file
makeindex "${FileName%.tex}"
zhmakeindex "${FileName%.tex}"
done
