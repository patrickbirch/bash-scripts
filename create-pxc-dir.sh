
#!/usr/bin/env bash
set -e

# sample
# create-pxc-dir.sh 5.7 9999

pxc='pxc'
# pxcvers="5.7"

pxcname='percona-xtradb-cluster'
basepxc="pxc-"$1
disk="/Volumes/LaCie"
basedisk="/Volumes/KESU"

githubPath='git@github.com:percona/percona-xtradb-cluster.git'
localGHPath='git@github.com:patrickbirch/percona-xtradb-cluster.git'

if [ -z "$2" ] ;
    then
    echo "Key is empty or null."
    exit 1
fi

newJira=$pxc-$1-$2
base=$basedisk/$basepxc
newdir=$disk/$newJira

echo $newdir

 [ -d $newdir ] && rm -rf $newdir

mkdir $newdir

if [ ! -d $newdir ];
    then
       echo "Directory was not created"
       exit 1
fi

git clone $base/$pxcname \
$disk/$newJira/$pxcname

cd $disk/$newJira/$pxcname/doc

git checkout -b $newJira

git remote rm origin
git remote add origin $githubPath
git config master.remote origin
git config master.merge refs/heads/master
git remote add pb_remote $localGHPath

echo "cd" && pwd
