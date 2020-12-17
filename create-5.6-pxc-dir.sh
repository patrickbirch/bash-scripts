#!/usr/bin/env bash
set -e 

pxc='pxc'
pxcvers="5.6"
pxcname='percona-xtradb-cluster'
basepxc="pxc-5.6"
disk="/Volumes/LaCie"

githubPath='git@github.com:percona/percona-xtradb-cluster.git'
localGHPath='git@github.com:patrickbirch/percona-xtradb-cluster.git'

if [ -z "$1" ] ;
    then
    echo "Key is empty or null."
    exit 1
fi

echo "You have supplied the following" $1

newJira=$pxc-$pxcvers-$1
base=$disk/$basepxc

cd $disk

pwd

echo "You are working on " $newJira
echo "You are writing from " $base
sleep 35s

rm -rf $newJira

git clone $base/$pxcname \
$disk/$newJira/$pxcname

cd $newJira/$pxcname/doc

git remote rm origin
git remote add origin $githubPath
git config master.remote origin
git config master.merge refs/heads/master
git remote add pb_remote $localGHPath

git checkout -b $newJira

pwd
