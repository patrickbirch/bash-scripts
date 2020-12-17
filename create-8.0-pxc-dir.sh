#!/bin/sh

#  create-8-0-dir.sh
#
#
#  Created by Patrick Birch on 09-9-2020.
#
#!/usr/bin/env bash

set -e

pxcvers="8.0"
shortpxc="pxc"

basepxc="pxc-8.0"
disk="LaCie"
prodname="percona-xtradb-cluster"

if [ -z "$1" ];
    then
        echo "Key is empty or null."
        exit 1
fi

newJira=$shortprod-$pxcvers-$1
base=/Volumes/$disk/$basepxc
basedir=/Volumes/$disk

cd $basedir

echo "You are working on " $newJira
echo "You are writing from " $base


sleep 35s

rm -rf $newJira
mkdir $newJira

git clone /Volumes/$disk/$basepxc/$prodname \
/Volumes/$disk/$newJira/$prodname

cd $newJira/$prodname/doc

git remote rm origin
git remote add origin git@github.com:percona/percona-xtradb-cluster.git
git config master.remote origin
git config master.merge refs/heads/master

git checkout 8.0; git pull origin 8.0;
git checkout -b $newJira

git remote add pb_remote git@github.com:patrickbirch/percona-xtradb-cluster.git

pwd
