#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: -o out.csv -r ../repo1 -r ../repo2"
   exit 1
}

while getopts o:r: opt; do
    case "$opt" in
        r) repos+=("$OPTARG");;
        o) out=$OPTARG;;
        ?) helpFunction
           break;;
    esac
done

if [ -z "$repos" ] || [ -z "$out" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

SCRIPT="$PWD/metrics.awk"

echo "month|service|merges|reverts|inserts|deletes" > $out
for repo in "${repos[@]}"; do
  (cd $repo; git log --pretty="@%cs,%s,"  --shortstat |  tr "\n\  " " "  | tr "@" "\n" | gawk -v service="$repo" -f $SCRIPT | sort -r ) >> $out
done
