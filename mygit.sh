#!/bin/sh

if [ $1 ]; then
    git clone gitolite@git.emencia.net:$1
fi