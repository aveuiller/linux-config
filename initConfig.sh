#!/bin/bash

if [ -z $1 ]; then
    dir_prefix="."
else
    dir_prefix="$1"
fi

softDir="$dir_prefix/Software"
customBinDir="$dir_prefix/.env/bin"

function execInFolder {
    export OLDPWD=`pwd`
    dir=$1
    script=$2
    cd $dir;
    echo `pwd`
    sh ./$script;
    cd -
}

execInFolder $softDir "doClone"
execInFolder $customBinDir "doLink"
