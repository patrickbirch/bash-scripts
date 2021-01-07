#!/usr/bin/env bash

set -e
echo date +%R

pxbvers="2.4"
shortpxb='pxb'
pxbname='percona-xtrabackup'

# basepxb="pxb-2.4-docs"
disk="/Volumes/LaCie"

if [ -z "$1" ];
 then
    echo "Key is empty or null."
    exit 1
fi

echo "You have supplied the following" $1

newJira=$shortpxb-$pxbvers-$1

echo $newJira 
docJira="${newJira}-docs"
echo $docJira

# base=$disk/$basepxb

cd $disk
pwd

echo "You are working on " $newJira
# echo "You are writing from " $base

sleep 35s

rm -rf $newJira

mkdir $newJira

cd $newJira
git init 

git clone git@github.com:patrickbirch/pxb-2.4-docs.git

# cd $newJira/percona-xtrabackup/storage/innobase/xtrabackup/doc

# git remote rm origin
# git remote add origin git@github.com:percona/percona-xtrabackup.git
# git config master.remote origin
# git config master.merge refs/heads/master
# git remote add pb_remote git@github.com:patrickbirch/percona-xtrabackup.git

git checkout -b $newJira

pwd


