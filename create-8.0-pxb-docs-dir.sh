#!/usr/bin/env bash

set -e
echo date +%R

pxbvers="8.0"
shortpxb='pxb'
pxbname='percona-xtrabackup'

basepxb="pxb-8.0"
disk="/Volumes/LaCie"

if [ -z "$1" ];
 then
    echo "Key is empty or null."
    exit 1
fi

newJira=$shortpxb-$pxbvers-$1
base=$disk/$basepxb

echo $newJira
docJira="${newJira}-docs"
echo $docJira
cd $disk

rm -rf $docJira

mkdir $docJira
cd $docJira

git init

git clone git@github.com:patrickbirch/pxb-8.0-docs.git
git checkout -b $docJira
stream="cd $(pwd)/pxb-8.0-docs"
echo $stream
