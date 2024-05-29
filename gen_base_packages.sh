#!/bin/bash

OUTFILE="./base_packages.txt"

cat /dev/null > "$OUTFILE"

aptitude search \~prequired \~pimportant \~pstandard -F"%p" >> "$OUTFILE"
