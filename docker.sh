#!/bin/sh

if [ $1 = 'images' ]; then
    docker rmi `docker images --no-trunc -q`
elif [ $1 = 'cont' ]; then
    docker rm `docker ps --no-trunc -a -q`
else
    echo "Usage :
mydocker [option]

Options :
    images : delete all images
    cont : delete all containers"
fi