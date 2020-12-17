#!/usr/bin/env bash

set -e

prodvers="8.0"
shortprod='pxb'
prodname='percona-xtrabackup'

basepxb="pxb-8.0"
disk="/Volumes/LaCie"

if [ -z "$1" ];
 then
    echo "Key is empty or null."
    exit 1
fi

echo "You have supplied the following" $1

newJira=$shortprod-$prodvers-$1
base=$disk/$basepxb

cd $disk
pwd

echo "You are working on " $newJira
echo "You are writing from " $base

sleep 35s


rm -rf $newJira

mkdir $newJira


git clone $disk/$basepxb/$prodname \
$disk/$newJira/$prodname

cd $disk/$newJira/percona-xtrabackup/storage/innobase/xtrabackup/doc

git checkout -b $newJira

git remote rm origin
git remote add origin git@github.com:percona/percona-xtrabackup.git
git config master.remote origin
git config master.merge refs/heads/master
git remote add pb_remote git@github.com:patrickbirch/percona-xtrabackup.git

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




pwd

