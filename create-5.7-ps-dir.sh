#!/usr/bin/env bash

set -e

# prodvers="5.7"
shortprod='ps'
prodname='percona-server'

basePS="ps-"$2
disk="LaCie"
baseDisk="KESU"

if [ -z "$1" ];
 then
    echo "Key is empty or null."
    exit 1
fi

echo "You have supplied the following" $1

CURRENTTIME=`date +"%R"`
echo 'Current Time is:' $CURRENTTIME

newJira=$shortprod-$prodvers-$1
base=/Volumes/$baseDisk/$basePS

echo "You are working on " /Volumes/$disk/$newJira
echo "You are writing from " $base

sleep 35s

rm -rf /Volumes/$disk/$newJira
mkdir /Volumes/$disk/$newJira

git clone /Volumes/$baseDisk/$basePS/$prodname \
/Volumes/$disk/$newJira/$prodname

cd /Volumes/$disk/$newJira/$prodname/doc

git remote rm origin
git remote add origin git@github.com:percona/percona-server.git
git config master.remote origin
git config master.merge refs/heads/master
git remote add pb_remote git@github.com:patrickbirch/percona-server.git

git checkout -b $newJira

#git checkout -b $newJira $(git rev-parse $(git rev-list --topo-order --first-parent origin/5.7 ^e12228ecb12 | tail -1)^)

pwd
