#!/usr/bin/env bash

set -e

# sample
# create-ps-dir.sh 8.0 7777

shortprod='ps-'$1
prodname='percona-server'
basePS="ps-"$1
disk="LaCie"
baseDisk="KESU"

if [ -z "$2" ];
 then
    echo "Key is empty or null."
    exit 1
fi

echo "You have supplied the following" $2

CURRENTTIME=`date +"%R"`

echo 'Current Time is:' $CURRENTTIME

newJira=$shortprod-$2
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

pwd
