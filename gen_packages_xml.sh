#!/bin/bash

INFILE_SUFFIX="_packages.txt"
TMPFILE="packlist.txt"
OUTFILE="./packages.xml"

cat /dev/null > /tmp/"$TMPFILE"

for packlist in ./*"$INFILE_SUFFIX"; do cat "$packlist" | sed '/^#.*$/d' >> /tmp/"$TMPFILE"; done

cp /tmp/"$TMPFILE" /tmp/tmp_"$TMPFILE" && awk '!seen[$0]++' /tmp/tmp_"$TMPFILE" > /tmp/"$TMPFILE" && rm /tmp/tmp_"$TMPFILE"

cat /dev/null > "$OUTFILE"

echo -n '<packages type="image">' >> "$OUTFILE"
cat /tmp/"$TMPFILE" | sed 's/\(^.*$\)/<package name="\1"\/>/' | tr -d '\n' >> "$OUTFILE"
echo -n '</packages>' >> "$OUTFILE"

rm /tmp/"$TMPFILE"
