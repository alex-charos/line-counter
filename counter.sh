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


varc=$(cat $1/* | wc -m | awk '{print $1}')
varl=$(cat $1/* | wc -l | awk '{print $1}')
varavg=$((varc/varl))


echo "Total characters: $varc"
echo "Total lines: $varl"
echo "Average: $varavg"



for f in $1/*
do
  echo "File: $f"
  varc=$(wc -m  $f | awk '{print $1}')
	varl=$(wc -l $f| awk '{print $1}')
	varavg=$((varc/varl))
 
 	echo "Total characters: $varc"
	echo "Total lines: $varl"
	echo "Average: $varavg"
done




