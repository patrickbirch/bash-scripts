
#!/usr/bin/env bash
set -e

pxc='pxc'
pxcvers="5.7"
pxcname='percona-xtradb-cluster'
basepxc="pxc-5.7"
disk="/Volumes/LaCie"

githubPath='git@github.com:percona/percona-xtradb-cluster.git'
localGHPath='git@github.com:patrickbirch/percona-xtradb-cluster.git'

if [ -z "$1" ] ;
    then
    echo "Key is empty or null."
    exit 1
fi

newJira=$pxc-$pxcvers-$1
base=$disk/$basepxc
newdir=$disk/$newJira

echo $newdir

 [ -d $newdir ] && rm -rf $newdir
   
mkdir $newdir

git clone $base/$pxcname \
$disk/$newJira/$pxcname

if [ ! -d $newdir ];
    then
       echo "Directory was not created"
       exit 1
fi

cd $disk/$newJira/$pxcname/doc

git checkout -b $newJira

git remote rm origin
git remote add origin $githubPath
git config master.remote origin
git config master.merge refs/heads/master
git remote add pb_remote $localGHPath




git fetch pb_remote

echo "cd" && pwd
