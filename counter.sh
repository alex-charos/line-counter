#!/bin/bash

if [ $# -ne 1 ]
then
    echo "give directory path"
    exit 1
fi

if [ ! -d "$1" ]
then

echo "directory does not exists"
    exit 1
fi

if [ ! -r "$1" ]
then
   echo "no permission"
 exit 1
fi

totalLines=0
totalCharacters=0

for f in $1/*
do
	if [ -f "$f" ]
		then
		  echo "File: $f"
		  varc=$(wc -m  $f | awk '{print $1}')
			varl=$(wc -l $f| awk '{print $1}')
			if [ "$varl" -gt 0 ]
				then
					varavg=$((varc/varl))
		 
		 			echo "Total characters: $varc"
					echo "Total lines: $varl"
					echo "Average: $varavg"
					totalLines=$((totalLines + varl))
					totalCharacters=$((totalCharacters + varc))
				else
					echo "Empty file"
			fi
	fi
	if [ -d "$f" ]
		then
		  echo "Found Directory: $f. Skipping..."
	fi
done

echo "Total Characters: $totalCharacters"
echo "Total Lines: $totalLines"
if [ "$totalLines" -gt 0 ]
	then
		echo "Total Average: $((totalCharacters/totalLines))"
	fi