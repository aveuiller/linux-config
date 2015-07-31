#!/bin/bash

if [ -z $1 ]; then
    dir_prefix="."
else
    dir_prefix="$1"
fi

softDir="$dir_prefix/Software"
customBinDir="$dir_prefix/.env/bin"

function execInFolder {
    dir=$1; script=$2
    cd $dir; echo Accessing `pwd`
    sh ./$script;
    cd -; echo Back to `pwd`
}

execInFolder $softDir "doClone"
execInFolder $customBinDir "doLink"
