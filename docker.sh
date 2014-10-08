#!/bin/sh

case $1 in
    'images')   docker rmi `docker images --no-trunc -q` ;;
    'cont')     docker rm `docker ps --no-trunc -a -q` ;;
    *)          echo "Usage :
mydocker [option]

Options :
    images : delete all images
    cont : delete all containers"
esac