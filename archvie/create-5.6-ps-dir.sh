#!/usr/bin/env bash
# updated 9 Oct 2020 - PB

set -e
CURRENTTIME=date +%R
echo Current Time is: $CURRENTTIME

prodvers="5.6"

shortprod='ps'
prodname='percona-server'
basePS="ps-5.6"
disk=LaCie
baseDisk=KESU

if [ -z "$1" ];
 then
    echo "Key is empty or null."
    exit 1
fi

echo "You have supplied the following" $1


newJira=$shortprod-$prodvers-$1
base=/Volumes/$baseDisk/$basePS

cd /Volumes/$baseDisk
pwd

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
