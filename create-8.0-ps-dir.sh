#!/bin/sh
#  create-8-0-dir.sh
#
#  Created by Patrick Birch on 04-14-2020.
#
#!/usr/bin/env bash
set -e

prodvers='8.0'
shortprod='ps'
basePS="ps-8.0"
disk="LaCie"

if [ -z "$1" ];
    then
      echo "Key is empty or null"
      exit 1
fi

newJira=$shortprod-$prodvers-$1
base=/Volumes/$disk/$basePS

cd /Volumes/$disk

sleep 35s

rm -rf $newJira

mkdir $newJira

git clone /Volumes/$disk/$basePS/percona-server \
/Volumes/$disk/$newJira/percona-server

cd $newJira/percona-server

git checkout $prodvers; git pull origin $prodvers
git checkout -b $newJira

git remote rm origin
git remote add origin git@github.com:percona/percona-server.git
git config master.remote origin
git config master.merge refs/heads/master
git remote add pb_remote git@github.com:patrickbirch/percona-server.git

pwd
