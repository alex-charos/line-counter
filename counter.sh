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


varc=$(wc -m $1/* | awk '{print $1}')
varl=$(wc -l $1/* | awk '{print $1}')
varavg=$((varc/varl))


echo "Total characters: $varc"
echo "Total lines: $varl"
echo "Average: $varavg"