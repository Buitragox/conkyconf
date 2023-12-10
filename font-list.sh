#!/usr/bin/env bash

#Script taken from:
#https://unix.stackexchange.com/questions/595756/how-to-list-all-supported-glyphs-of-a-given-font

#Usage: ./font-list.sh /path/to/fontfile

# This script lists all of the implemented characters of a font file.
# You can the copy the output and paste it on something like LibreOffice Writer
# to look for the icons/letters you want.

# Remember to select the pasted text and change the font to the one 
# you want to check on LibreOffice Writer)

# I only tested .ttf and .otf files



Usage() { 
  echo "Usage: $0 /path/to/fontfile"
  exit 1 
}

SayError() {  
  echo "$0: $1"
  exit 2
}

[ "$#" -ne 1 ] && Usage

fontfile="$1"
[ -f "$fontfile" ] || SayError 'File not found'

list=$(fc-query --format='%{charset}\n' "$fontfile")
for range in $list
do 
  IFS=- read start end <<<"$range"
  if [ "$end" ]
  then
    start=$((16#$start))
    end=$((16#$end))
    for ((i=start;i<=end;i++)) 
    do
      printf -v char '\\U%x' "$i"
      printf '%b' "$char"
    done
  else
    printf '%b' "\\U$start"
  fi
done

printf "\n"
