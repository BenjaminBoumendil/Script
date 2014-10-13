#!/bin/sh

if [ $1 ] && [ $2 ]; then
    sudo ln -s $HOME/.script/$1 /bin/$2
    chmod 777 $HOME/.script/$1
else
    echo "Usage : [ScriptName] [LinkName]"
fi