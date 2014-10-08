#!/bin/sh

if [ $1 ]; then
    if [ $2 ]; then
        git clone gitolite@git.emencia.net:$1 $2
    else
        git clone gitolite@git.emencia.net:$1
    fi
else
    echo "Usage : mygit [GitRepo] [CloneName]"
fi